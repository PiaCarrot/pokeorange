Copyright_GFPresents: ; e4579
	ld de, MUSIC_NONE
	call PlayMusic
	call ClearBGPalettes
	call ClearTileMap
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a
	xor a
	ld [hBGMapAddress], a
	ld [hJoyDown], a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $90
	ld [hWY], a
	call WaitBGMap
	ld b, SCGB_GAMEFREAK_LOGO
	call GetSGBLayout
	call SetPalettes
	ld c, 10
	call DelayFrames
	farcall OpeningLines
	call WaitBGMap
	ld c, 100
	call DelayFrames
	call ClearTileMap
	farcall GBCOnlyScreen
	call .GetGFLogoGFX
.joy_loop
	call JoyTextDelay
	ld a, [hJoyLast]
	and BUTTONS
	jr nz, .pressed_button
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .finish
	call PlaceGameFreakPresents
	farcall PlaySpriteAnimations
	call DelayFrame
	jr .joy_loop

.pressed_button
	call .StopGamefreakAnim
	scf
	ret

.finish
	call .StopGamefreakAnim
	and a
	ret
; e45e8

.GetGFLogoGFX: ; e45e8
	ld de, GameFreakLogo
	ld hl, VTiles2
	lb bc, BANK(GameFreakLogo), $1c
	call Get1bpp

	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a

	ld hl, IntroLogoGFX
	ld de, wDecompressScratch
	ld a, BANK(IntroLogoGFX)
	call FarDecompress

	ld hl, VTiles0
	ld de, wDecompressScratch
	lb bc, 1, 8 tiles
	call Request2bpp

	ld hl, VTiles1
	ld de, wDecompressScratch + $80 tiles
	lb bc, 1, 8 tiles
	call Request2bpp

	pop af
	ld [rSVBK], a

	farcall ClearSpriteAnims
	depixel 10, 11, 4, 0
	ld a, SPRITE_ANIM_INDEX_GAMEFREAK_LOGO
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], $a0
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $60
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $30
	xor a
	ld [wJumptableIndex], a
	ld [wIntroSceneFrameCounter], a
	ld [wcf65], a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $1
	ld [hBGMapMode], a
	ld a, $90
	ld [hWY], a
	lb de, %11100100, %11100100
	jp DmgToCgbObjPals
; e465e

.StopGamefreakAnim: ; e465e
	farcall ClearSpriteAnims
	call ClearTileMap
	call ClearSprites
	ld c, 16
	jp DelayFrames
; e4670

PlaceGameFreakPresents: ; e4670
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, .dw
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
; e467f

.dw ; e467f
	dw PlaceGameFreakPresents_0
	dw PlaceGameFreakPresents_1
	dw PlaceGameFreakPresents_2
	dw PlaceGameFreakPresents_3
; e4687

PlaceGameFreakPresents_AdvanceIndex: ; e4687
	ld hl, wJumptableIndex
	inc [hl]
PlaceGameFreakPresents_0: ; no-optimize stub function
	ret
; e468c

PlaceGameFreakPresents_1: ; e468d
	ld hl, wcf65
	ld a, [hl]
	cp $20
	jr nc, .PlaceGameFreak
	inc [hl]
	ret

.PlaceGameFreak:
	ld [hl], 0
	ld hl, .GAME_FREAK
	decoord 5, 10
	ld bc, .end - .GAME_FREAK
	call CopyBytes
	call PlaceGameFreakPresents_AdvanceIndex
	ld de, SFX_GAME_FREAK_PRESENTS
	jp PlaySFX
; e46af

.GAME_FREAK:
	;  P  I  A  _    C  A  R  R  O  T
	db 0, 1, 2, 13,  3, 2, 4, 4, 5, 6
.end
	db "@"
; e46ba

PlaceGameFreakPresents_2: ; e46ba
	ld hl, wcf65
	ld a, [hl]
	cp $40
	jr nc, .place_presents
	inc [hl]
	ret

.place_presents
	ld [hl], 0
	ld hl, .presents
	decoord 7,11
	ld bc, .end - .presents
	call CopyBytes
	jp PlaceGameFreakPresents_AdvanceIndex
; e46d6

.presents
	db 7, 8, 9, 10, 11, 12
.end
	db "@"
; e46dd

PlaceGameFreakPresents_3: ; e46dd
	ld hl, wcf65
	ld a, [hl]
	cp $80
	jr nc, .finish
	inc [hl]
	ret

.finish
	ld hl, wJumptableIndex
	set 7, [hl]
	ret
; e46ed


GameFreakLogoJumper: ; e46ed (39:46ed)
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, GameFreakLogoScenes
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

GameFreakLogoScenes: ; e46fd (39:46fd)
	dw GameFreakLogoScene1
	dw GameFreakLogoScene2
	dw GameFreakLogoScene3
	dw GameFreakLogoScene4
	dw GameFreakLogoScene5

GameFreakLogoScene1: ; e4707 (39:4707)
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
GameFreakLogoScene5: ; no-optimize stub function
	ret

GameFreakLogoScene2: ; e470d (39:470d)
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_e4747
	ld d, a
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	and $3f
	cp $20
	jr nc, .asm_e4723
	add $20
.asm_e4723
	ld e, a
	farcall BattleAnim_Sine_e
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], e
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	dec [hl]
	and $1f
	ret nz
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	sub $30
	ld [hl], a
	ld de, SFX_DITTO_BOUNCE
	jp PlaySFX

.asm_e4747
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $0
	ld de, SFX_DITTO_POP_UP
	jp PlaySFX

GameFreakLogoScene3: ; e4759 (39:4759)
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	cp $20
	jr nc, .asm_e4764
	inc [hl]
	ret

.asm_e4764
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $0
	ld de, SFX_DITTO_TRANSFORM
	jp PlaySFX

GameFreakLogoScene4: ; e4776 (39:4776)
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	cp $40
	jr z, .asm_e47a3
	inc [hl]
	srl a
	srl a
	ld e, a
	ld d, $0
	ld hl, GameFreakLogoPalettes
	add hl, de
	add hl, de
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld a, [hli]
	ld [OBPals + 12], a
	ld a, [hli]
	ld [OBPals + 13], a
	pop af
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	ret

.asm_e47a3
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	jp PlaceGameFreakPresents_AdvanceIndex
; e47ac (39:47ac)

GameFreakLogoPalettes: ; e47ac
; Ditto's color as it turns into the Game Freak logo.
; Fade from pink to orange.
; One color per step.
	RGB 23, 12, 28
	RGB 23, 12, 27
	RGB 23, 13, 26
	RGB 23, 13, 24

	RGB 24, 14, 22
	RGB 24, 14, 20
	RGB 24, 15, 18
	RGB 24, 15, 16

	RGB 25, 16, 14
	RGB 25, 16, 12
	RGB 25, 17, 10
	RGB 25, 17, 08

	RGB 26, 18, 06
	RGB 26, 18, 04
	RGB 26, 19, 02
	RGB 26, 19, 00

; e47cc

GameFreakLogo: ; e47cc
INCBIN "gfx/splash/logo.1bpp"
; e48ac
