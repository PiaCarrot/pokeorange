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
	ld a, 2
	call ByteFill


; Fill tile palettes:

; BG Map 1:

; line 0 (copyright)
	hlbgcoord 0, 0, VBGMap1
	ld bc, 1 bgrows
	ld a, 4
	call ByteFill


; BG Map 0:

; POKéMON
	hlbgcoord 0, 2
	ld bc, 7 bgrows
	ld a, 0
	call ByteFill

; ORANGE VERSION
	hlbgcoord 5, 8
	ld bc, 11
	ld a, 1
	call ByteFill

; top Dragonite rows + cloud top
	hlbgcoord 6, 11
	lb bc, 5, 8 ; 8, 5?
	ld a, 2 | VRAM_BANK_1
	ld de, BG_MAP_WIDTH
	call FillTitleBox

; cloud middle
	hlbgcoord 0, 16
	ld bc, 1 bgrows
	ld a, 3
	call ByteFill

; bottom Dragonite row
	hlbgcoord 6, 16
	ld bc, 8
	ld a, 3 | VRAM_BANK_1
	call ByteFill

; cloud bottom + copyright
	hlbgcoord 0, 17
	ld bc, 2 bgrows
	ld a, 4
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
	hlcoord 0, 2
	lb bc, 7, SCREEN_WIDTH
	lb de, $80, SCREEN_WIDTH
	call DrawTitleGraphic

; Draw cloud top + middle
	hlcoord 0, 15
	lb bc, 1, SCREEN_WIDTH * 2
	ld a, $0c
	ld de, SCREEN_WIDTH
	call FillTitleBox

; Draw cloud bottom
	hlcoord 0, 17
	lb bc, 1, SCREEN_WIDTH
	ld a, $0d
	ld de, SCREEN_WIDTH
	call FillTitleBox

; Draw copyright text
	hlbgcoord 6, 0, VBGMap1
	lb bc, 1, 9
	lb de, $0f, 0
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
	hlcoord 6, 11
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
	adc h
	sub l
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

FillTitleBox:
; input:
;   hl: draw location
;   a: tile to draw
;   b: height
;   c: width
;   de: canvas width
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	add hl, de
	pop bc
	dec b
	jr nz, .row
	ret

TitleDragoniteGFX: ; 10ef46
INCBIN "gfx/title/dragonite.w128.2bpp.lz"
; 10f326

TitleLogoGFX: ; 10f326
INCBIN "gfx/title/logo.w160.2bpp.lz"
; 10fcee

TitleScreenPalettes:
; BG
	; POKéMON
	RGB 11, 20, 27
	RGB 31, 24, 08
	RGB 12, 14, 12
	RGB 01, 02, 24
	; ORANGE VERSION
	RGB 11, 20, 27
	RGB 31, 31, 31
	RGB 31, 22, 15
	RGB 31, 11, 00
	; cloud top + Dragonite
	RGB 11, 20, 27
	RGB 18, 23, 31
	RGB 31, 31, 31
	RGB 07, 06, 03
	; cloud middle + Dragonite
	RGB 18, 23, 31
	RGB 23, 26, 31
	RGB 31, 31, 31
	RGB 07, 06, 03
	; cloud bottom + copyright
	RGB 31, 31, 31
	RGB 23, 26, 31
	RGB 11, 11, 19
	RGB 00, 00, 00
	; unused 5
	RGB 11, 20, 27
	RGB 23, 26, 31
	RGB 31, 31, 31
	RGB 00, 00, 00
	; unused 6
	RGB 11, 20, 27
	RGB 23, 26, 31
	RGB 31, 31, 31
	RGB 00, 00, 00
	; unused 7
	RGB 11, 20, 27
	RGB 23, 26, 31
	RGB 31, 31, 31
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
