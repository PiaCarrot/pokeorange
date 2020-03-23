TrainerCard: ; 25105
	ld a, [VramState]
	push af
	xor a
	ld [VramState], a
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]

	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	call DisableLCD

	ld hl, ChrisCardPic
	ld a, [PlayerGender]
	bit 0, a
	jr z, .GotClass
	ld hl, KrisCardPic
.GotClass:
	ld de, VTiles2 tile $00
	ld bc, 35 tiles
	ld a, BANK(ChrisCardPic) ; BANK(KrisCardPic)
	call FarCopyBytes

	ld hl, CardGFX
	ld de, VTiles2 tile $23
	ld bc, 6 tiles
	ld a, BANK(CardGFX)
	call FarCopyBytes

	ld hl, LeaderGFX
	ld de, VTiles2 tile $29
	ld bc, 40 tiles
	ld a, BANK(LeaderGFX)
	call FarCopyBytes

	ld hl, BadgeGFX
	ld de, VTiles0 tile $0
	ld bc, 28 tiles
	ld a, BANK(BadgeGFX)
	call FarCopyBytes

	call EnableLCD
	call WaitBGMap

	call TrainerCard_InitBorder

	hlcoord 2, 2
	ld de, .Headings
	call PlaceString

	hlcoord 7, 2
	ld de, PlayerName
	call PlaceString

	hlcoord 1, 3
	ld de, .HorizontalDivider
.loop0
	ld a, [de]
	ld [hli], a
	inc de
	cp $28
	jr nz, .loop0

	hlcoord 5, 4
	ld de, PlayerID
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum

	hlcoord 7, 6
	ld de, Money
	lb bc, PRINTNUM_MONEY | 3, 6
	call PrintNum

	ld hl, PokedexCaught
	ld b, EndPokedexCaught - PokedexCaught
	call CountSetBits
	ld de, wd265
	hlcoord 11, 8
	lb bc, 1, 3
	call PrintNum

	ld a, [StatusFlags] ; pokedex
	bit 0, a
	jr nz, .keep_pokedex
	hlcoord 2, 8
	lb bc, 1, 12
	call ClearBox
.keep_pokedex

	call TrainerCard_PrintGameTime

	hlcoord 14, 1
	lb bc, 5, 7
	xor a
	ld [hGraphicStartTile], a
	predef PlaceGraphic

	hlcoord 2, 13
	ld a, $29
	ld c, 4
.loop1
	call TrainerCard_PlaceLeadersFace
rept 4
	inc hl
endr
	dec c
	jr nz, .loop1

	hlcoord 15, 8
	push hl
	ld de, EVENT_BEAT_ORANGE_LEAGUE
	ld b, CHECK_FLAG
	call EventFlagAction
	pop hl
	ld a, c
	and a
	jr z, .nostar1
	ld a, $26
	ld [hli], a
.nostar1
	push hl
	ld de, EVENT_BEAT_RED
	ld b, CHECK_FLAG
	call EventFlagAction
	pop hl
	ld a, c
	and a
	jr z, .nostar2
	ld a, $26
	ld [hli], a
.nostar2
	push hl
	ld hl, PokedexCaught
	ld b, EndPokedexCaught - PokedexCaught
	call CountSetBits
	pop hl
	cp NUM_POKEMON
	jr c, .nostar3
	ld [hl], $26
.nostar3

	hlcoord SCREEN_WIDTH - 2, 1
	ld [hl], $25

	hlcoord 1, SCREEN_HEIGHT - 2
	ld [hl], $24

	ld b, SCGB_TRAINER_CARD
	call GetSGBLayout
	call SetPalettes
	call WaitBGMap

	xor a
	ld [wcf64], a
	call TrainerCard_OAMUpdate

.loop2
	call UpdateTime
	call JoyTextDelay
	call TrainerCard_PrintGameTime
	ld hl, hJoyLast
	ld a, [hl]
	and A_BUTTON | B_BUTTON
	jr nz, .quit
	call TrainerCard_AnimateBadges
	call DelayFrame
	jr .loop2

.quit
	pop af
	ld [wOptions], a
	pop af
	ld [VramState], a
	ret

.Headings: ; 252ec
	db   "NAME/"
	next "<ID>№."
	next "MONEY"
	next "POKéDEX"
	next "TIME"
	next "BADGES@"

.HorizontalDivider: ; 252fc
	db $27, $27, $27, $27, $27, $27, $27, $27, $27, $27, $27, $27, $28
; 2530a

TrainerCard_InitBorder: ; 253b0 (9:53b0)
	hlcoord 0, 0
	ld b, SCREEN_WIDTH
	ld a, $23
.loop1
	ld [hli], a
	dec b
	jr nz, .loop1

	ld de, SCREEN_WIDTH - 2
	ld b, SCREEN_HEIGHT - 2
.loop2
	ld [hli], a
	add hl, de
	ld [hli], a
	dec b
	jr nz, .loop2

	ld b, SCREEN_WIDTH
	ld a, $23
.loop3
	ld [hli], a
	dec b
	jr nz, .loop3
	ret

TrainerCard_PlaceLeadersFace: ; 253f4 (9:53f4)
	push de
	push hl
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld de, SCREEN_WIDTH - 3
	add hl, de
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld de, SCREEN_WIDTH - 3
	add hl, de
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	pop hl
	pop de
	ret

TrainerCard_PrintGameTime: ; 25415 (9:5415)
	hlcoord 7, 10
	ld de, GameTimeHours
	lb bc, 2, 4
	call PrintNum
	inc hl
	ld de, GameTimeMinutes
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ld a, [hVBlankCounter]
	and $1f
	ret nz
	hlcoord 11, 10
	ld a, [hl]
	cp " "
	jr z, .colon
	ld a, " "
	jr .ok
.colon
	ld a, ":"
.ok
	ld [hl], a
	ret

TrainerCard_AnimateBadges: ; 25438 (9:5438)
	ld a, [hVBlankCounter]
	and $7
	ret nz
	ld a, [wcf64]
	inc a
	and $7
	ld [wcf64], a
TrainerCard_OAMUpdate: ; 25448 (9:5448)
	ld hl, .BadgesOAM
; get flag array
	ld a, [Badges]
	ld c, a
	ld de, Sprites
	ld b, NUM_BADGES
.loop
	srl c
	push bc
	jr nc, .skip_badge
	push hl
	ld a, [hli] ; y
	ld b, a
	ld a, [hli] ; x
	ld c, a
	ld a, [hli] ; pal
	ld [wcf66], a
	ld a, [wcf64]
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [hl]
	ld [wcf65], a
	call .PrepOAM
	pop hl
.skip_badge
	ld bc, $b ; 3 + 2 * 4
	add hl, bc
	pop bc
	dec b
	jr nz, .loop
	ret

.PrepOAM: ; 2547b (9:547b)
	ld a, [wcf65]
	and $80
	jr nz, .xflip
	ld hl, .facing1
	jr .loop2

.xflip
	ld hl, .facing2
.loop2
	ld a, [hli]
	cp $ff
	ret z
	add b
	ld [de], a
	inc de

	ld a, [hli]
	add c
	ld [de], a
	inc de

	ld a, [wcf65]
	and $7f
	add [hl]
	ld [de], a
	inc hl
	inc de

	ld a, [wcf66]
	add [hl]
	ld [de], a
	inc hl
	inc de
	jr .loop2

; 254a7 (9:54a7)

.facing1 ; 254a7
	; y, x, tile, OAM attributes
	db 0, 0, 0, 0
	db 0, 8, 1, 0
	db 8, 0, 2, 0
	db 8, 8, 3, 0
	db -1

.facing2 ; 254b8
	db 0, 0, 1, X_FLIP
	db 0, 8, 0, X_FLIP
	db 8, 0, 3, X_FLIP
	db 8, 8, 2, X_FLIP
	db -1

.BadgesOAM: ; 254c9
; Template OAM data for each badge on the trainer card.
; Format:
	; y, x, palette
	; cycle 1: face tile, in1 tile, in2 tile, in3 tile
	; cycle 2: face tile, in1 tile, in2 tile, in3 tile

	; Coral-Eye Badge
	db $80, $18, $0
	db $00, $10, $14, $10 | $80
	db $00, $10, $14, $10 | $80

	; Sea Ruby Badge
	db $80, $38, $1
	db $04, $10, $14, $10 | $80
	db $04, $10, $14, $10 | $80

	; Spike Shell Badge
	db $80, $58, $2
	db $08, $10, $14, $10 | $80
	db $08, $10, $14, $10 | $80

	; Jade Star Badge
	db $80, $78, $3
	db $0c, $10, $14, $10 | $80
	db $0c, $10, $14, $10 | $80
; 25523

ChrisCardPic: ; 88365
INCBIN "gfx/trainer_card/chris_card.5x7.2bpp"

KrisCardPic: ; 88595
INCBIN "gfx/trainer_card/kris_card.5x7.2bpp"

CardGFX:    INCBIN "gfx/trainer_card/trainer_card.2bpp"

LeaderGFX:  INCBIN "gfx/trainer_card/leaders.2bpp"
BadgeGFX:   INCBIN "gfx/trainer_card/badges.2bpp"
