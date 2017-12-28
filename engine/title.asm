_TitleScreen: ; 10ed67

	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap

; Turn BG Map update off
	xor a
	ld [hBGMapMode], a

; Reset timing variables
	ld hl, wJumptableIndex
	ld [hli], a ; wJumptableIndex
	ld [hli], a ; wIntroSceneFrameCounter
	ld [hli], a ; wTitleScreenTimerLo
	ld [hl], a  ; wTitleScreenTimerHi

; Turn LCD off
	call DisableLCD


; VRAM bank 1
	ld a, 1
	ld [rVBK], a


; Decompress flying Dragonite gfx
	ld hl, TitleDragoniteGFX
	ld de, VTiles1
	call Decompress


; Clear screen palettes
	hlbgcoord 0, 0
	ld bc, SCREEN_WIDTH bgrows
	xor a
	call ByteFill


; Fill tile palettes:

; BG Map 1:

; line 0 (copyright)
	hlbgcoord 0, 0, VBGMap1
	ld bc, 1 bgrows
	ld a, 7 ; palette
	call ByteFill


; BG Map 0:

; Apply logo gradient:

; lines 3-4
	hlbgcoord 0, 1
	ld bc, 2 bgrows
	ld a, 2
	call ByteFill
; line 5
	hlbgcoord 0, 3
	ld bc, 1 bgrows
	ld a, 3
	call ByteFill
; line 6
	hlbgcoord 0, 4
	ld bc, 1 bgrows
	ld a, 4
	call ByteFill
; line 7
	hlbgcoord 0, 5
	ld bc, 1 bgrows
	ld a, 5
	call ByteFill
; lines 8-9
	hlbgcoord 0, 6
	ld bc, 2 bgrows
	ld a, 6
	call ByteFill


; 'CRYSTAL VERSION'
	hlbgcoord 5, 7
	ld bc, NAME_LENGTH ; length of version text
	ld a, 1
	call ByteFill

; Suicune gfx
	hlbgcoord 0, 12
	ld bc, 6 bgrows ; the rest of the screen
	ld a, 8
	call ByteFill


; Back to VRAM bank 0
	ld a, $0
	ld [rVBK], a


; Decompress logo
	ld hl, TitleLogoGFX
	ld de, VTiles1
	call Decompress

; Clear screen tiles
	hlbgcoord 0, 0
	ld bc, 64 bgrows
	ld a, " "
	call ByteFill

; Draw Pokemon logo
	hlcoord 0, 1
	lb bc, 7, SCREEN_WIDTH
	lb de, $80, SCREEN_WIDTH
	call DrawTitleGraphic

; Draw copyright text
	hlbgcoord 3, 0, VBGMap1
	lb bc, 1, 13
	lb de, $0c, 0
	call DrawTitleGraphic

; Initialize running Suicune?
	ld d, $0
	call LoadSuicuneFrame

; Save WRAM bank
	ld a, [rSVBK]
	push af
; WRAM bank 5
	ld a, 5
	ld [rSVBK], a

; Update palette colors
	ld hl, TitleScreenPalettes
	ld de, UnknBGPals
	ld bc, 16 palettes
	call CopyBytes

	ld hl, TitleScreenPalettes
	ld de, BGPals
	ld bc, 16 palettes
	call CopyBytes

; Restore WRAM bank
	pop af
	ld [rSVBK], a


; LY/SCX trickery starts here

	ld a, [rSVBK]
	push af
	ld a, 5 ; BANK(wLYOverrides)
	ld [rSVBK], a

; Make sure the wLYOverrides buffer is empty
	ld hl, wLYOverrides
	xor a
	ld bc, wLYOverridesEnd - wLYOverrides
	call ByteFill

; Let LCD Stat know we're messing around with SCX
	ld a, rSCX & $ff
	ld [hLCDCPointer], a

	pop af
	ld [rSVBK], a


; Reset audio
	call ChannelsOff
	call EnableLCD

; Set sprite size to 8x16
	ld a, [rLCDC]
	set 2, a
	ld [rLCDC], a

	ld a, +112
	ld [hSCX], a
	ld a, 8
	ld [hSCY], a
	ld a, 7
	ld [hWX], a
	ld a, -112
	ld [hWY], a

	ld a, $1
	ld [hCGBPalUpdate], a

; Update BG Map 0 (bank 0)
	ld [hBGMapMode], a

	xor a
	ld [UnknBGPals + 2], a

; Play starting sound effect
	call SFXChannelsOff
	ld de, SFX_TITLE_SCREEN_ENTRANCE
	jp PlaySFX
; 10eea7

SuicuneFrameIterator: ; 10eea7
	ld hl, UnknBGPals + 2
	ld a, [hl]
	ld c, a
	inc [hl]

; Only do this once every eight frames
	and (1 << 3) - 1
	ret nz

	ld a, c
	and 3 << 3
	sla a
	swap a
	ld e, a
	ld d, $0
	ld hl, .Frames
	add hl, de
	ld d, [hl]
	xor a
	ld [hBGMapMode], a
	call LoadSuicuneFrame
	ld a, $1
	ld [hBGMapMode], a
	ld [hBGMapHalf], a
	ret
; 10eece

.Frames: ; 10eece
	db $80 ; VTiles4 tile $00
	db $88 ; VTiles4 tile $08
	db $00 ; VTiles5 tile $00
	db $08 ; VTiles5 tile $08
; 10eed2


LoadSuicuneFrame: ; 10eed2
	hlcoord 6, 12
	ld b, 6
.bgrows
	ld c, 8
.col
	ld a, d
	ld [hli], a
	inc d
	dec c
	jr nz, .col
	ld a, SCREEN_WIDTH - 8
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	ld a, 8
	add d
	ld d, a
	dec b
	jr nz, .bgrows
	ret
; 10eeef

DrawTitleGraphic: ; 10eeef
; input:
;   hl: draw location
;   b: height
;   c: width
;   d: tile to start drawing from
;   e: number of tiles to advance for each bgrows
.bgrows
	push de
	push bc
	push hl
.col
	ld a, d
	ld [hli], a
	inc d
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	pop de
	ld a, e
	add d
	ld d, a
	dec b
	jr nz, .bgrows
	ret
; 10ef06

TitleDragoniteGFX: ; 10ef46
INCBIN "gfx/title/dragonite.w128.2bpp.lz"
; 10f326

TitleLogoGFX: ; 10f326
INCBIN "gfx/title/logo.w160.t4.2bpp.lz"
; 10fcee

TitleScreenPalettes:
; BG
	RGB 11, 20, 27
	RGB 31, 31, 31
	RGB 07, 06, 03
	RGB 07, 06, 03

	RGB 11, 20, 27
	RGB 31, 31, 31
	RGB 31, 22, 15
	RGB 31, 11, 00

	RGB 11, 20, 27
	RGB 06, 14, 11
	RGB 31, 31, 31
	RGB 02, 03, 30

	RGB 11, 20, 27
	RGB 06, 14, 11
	RGB 31, 31, 18
	RGB 02, 03, 30

	RGB 11, 20, 27
	RGB 06, 14, 11
	RGB 29, 28, 12
	RGB 02, 03, 30

	RGB 11, 20, 27
	RGB 08, 16, 13
	RGB 28, 25, 06
	RGB 02, 03, 30

	RGB 11, 20, 27
	RGB 08, 16, 13
	RGB 26, 21, 00
	RGB 02, 03, 30

	RGB 11, 20, 27
	RGB 11, 11, 19
	RGB 00, 00, 00
	RGB 00, 00, 00

; OBJ
	RGB 00, 00, 00
	RGB 10, 00, 15
	RGB 17, 05, 22
	RGB 19, 09, 31

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
