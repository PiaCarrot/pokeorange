INCLUDE "predef/cgb.asm"

CheckShininess:
; Check if a mon is shiny by personality at bc.
; Return carry if shiny.
	ld a, [bc]
	and SHINY_MASK
	jr z, .NotShiny
	scf
	ret

.NotShiny:
	and a
	ret

CheckContestMon:
; Check a mon's DVs at hl in the bug catching contest.
; Return carry if its DVs are good enough to place in the contest.

; Attack
	ld a, [hl]
	cp 10 << 4
	jr c, .Bad

; Defense
	ld a, [hli]
	and $f
	cp 10
	jr c, .Bad

; Speed
	ld a, [hl]
	cp 10 << 4
	jr c, .Bad

; Special
	ld a, [hl]
	and $f
	cp 10
	jr c, .Bad

	scf
	ret

.Bad:
	and a
	ret

CheckPink:
; given bc = MonPink from a party_struct or battle_struct
; return c(arry) if mon is pink

; check if bc == BattleMonDVs
	ld a, BattleMonPink % $100
	cp b
	jr nz, .bc_is_not_BattleMonPink
	ld a, BattleMonPink / $100
	cp c
	ret z

.bc_is_not_BattleMonPink:
; check if bc == EnemyMonPink
	ld a, EnemyMonPink % $100
	cp b
	jr nz, .bc_is_not_EnemyMonPink
	ld a, EnemyMonPink / $100
	cp c
	ret z

.bc_is_not_EnemyMonPink:
; bc is from a party_struct
; check if PINK_MASK fits
	ld a, [bc]
	and PINK_MASK
	jr z, .not_pink
	scf
	ret

.not_pink
	xor a
	ret


GetBattlemonBackpicPalettePointer:
	ld a, [TempBattleMonSpecies]
	and a
	jp z, GetPlayerPalettePointer
	farcall GetPartyMonPersonality
	ld c, l
	ld b, h
	ld hl, PartyMon1Pink
	ld a, [CurBattleMon]
	push bc
	call GetPartyLocation
	pop bc
	ld a, [hl]
	and PINK_MASK
	jr nz, GetNormalOrShinyPinkanPalettePointer
	ld a, [TempBattleMonSpecies]
	jr GetMonNormalOrShinyPalettePointer_NoPinkCheck


GetEnemyFrontpicPalettePointer:
	ld a, [TempEnemyMonSpecies]
	and a
	jp z, GetFrontpicPalettePointer_Trainer
	farcall GetEnemyMonPersonality
	ld c, l
	ld b, h
	ld a, [EnemyMonPink]
	and PINK_MASK
	jr nz, GetNormalOrShinyPinkanPalettePointer
	ld a, [TempEnemyMonSpecies]
	jr GetMonNormalOrShinyPalettePointer_NoPinkCheck


GetMonPalettePointer:
	cp LYCANROC
	jr z, .maybe_special
.continue
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, PokemonPalettes
	add hl, bc
	ret

.maybe_special
	push af
	ld a, [bc]
	and FORM_MASK
	cp LYCANROC_MIDNIGHT_FORM
	ld hl, LycanrocMidnightPalettes
	jr z, .ok
	cp LYCANROC_DUSK_FORM
	ld hl, LycanrocDuskPalettes
	jr z, .ok
	pop af
	jr .continue

.ok
	pop af
	ret

GetMonNormalOrShinyPalettePointer:
	push af
	call CheckPink
	jr c, GetMonNormalOrShinyPalettePointer_Pink
	pop af
GetMonNormalOrShinyPalettePointer_NoPinkCheck:
	push bc
	call GetMonPalettePointer
	pop bc
GetNormalOrShinyPalettePointer:
	push hl
	call CheckShininess
	pop hl
	ret nc
rept 4
	inc hl
endr
	ret

GetMonNormalOrShinyPalettePointer_Pink:
	pop af
GetNormalOrShinyPinkanPalettePointer:
	ld hl, PinkanPalette
	jr GetNormalOrShinyPalettePointer


InitPartyMenuPalettes:
	ld hl, PalPacket_PartyMenu
	call CopyFourPalettes
	call InitPartyMenuOBPals
	jp WipeAttrMap

ApplyMonOrTrainerPals:
	ld a, e
	and a
	jr z, .get_trainer
	ld a, [CurPartySpecies]
	call GetMonPalettePointer
	jr .load_palettes

.get_trainer
	ld a, [TrainerClass]
	call GetTrainerPalettePointer

.load_palettes
	ld de, UnknBGPals
	call LoadPalette_White_Col1_Col2_Black
	call WipeAttrMap
	call ApplyAttrMap
	jp ApplyPals

ApplyHPBarPals:
	ld a, [wWhichHPBar]
	and a
	jr z, .Enemy
	cp $1
	jr z, .Player
	cp $2
	jr z, .PartyMenu
	ret

.Enemy:
	ld de, BGPals + 2 palettes + 2
	jr .okay

.Player:
	ld de, BGPals + 3 palettes + 2

.okay
	ld l, c
	ld h, $0
	add hl, hl
	add hl, hl
	ld bc, HPBarPals
	add hl, bc
	ld bc, 4
	ld a, $5
	call FarCopyWRAM
	ld a, $1
	ld [hCGBPalUpdate], a
	ret

.PartyMenu:
	ld e, c
	inc e
	hlcoord 11, 1, AttrMap
	ld bc, 2 * SCREEN_WIDTH
	ld a, [wCurPartyMon]
.loop
	and a
	jr z, .done
	add hl, bc
	dec a
	jr .loop

.done
	lb bc, 2, 8
	ld a, e
	jp FillBoxCGB

LoadStatsScreenPals:
	ld hl, StatsScreenPals
	ld b, 0
	dec c
	add hl, bc
	add hl, bc
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld a, [hli]
	ld [UnknBGPals], a
	ld [UnknBGPals + 8 * 2], a
	ld a, [hl]
	ld [UnknBGPals + 1], a
	ld [UnknBGPals + 8 * 2 + 1], a
	pop af
	ld [rSVBK], a
	call ApplyPals
	ld a, $1
	ret

LoadMailPalettes:
	ld l, e
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, .MailPals
	add hl, de
	ld de, UnknBGPals
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	call ApplyPals
	call WipeAttrMap
	jp ApplyAttrMap

.MailPals:
	RGB 20, 31, 11
	RGB 31, 19, 00
	RGB 31, 10, 09
	RGB 00, 00, 00

	RGB 15, 20, 31
	RGB 30, 26, 00
	RGB 31, 12, 00
	RGB 00, 00, 00

	RGB 24, 17, 31
	RGB 30, 26, 00
	RGB 08, 11, 31
	RGB 00, 00, 00

	RGB 31, 25, 17
	RGB 31, 18, 04
	RGB 28, 12, 05
	RGB 00, 00, 00

	RGB 19, 26, 31
	RGB 31, 05, 08
	RGB 31, 09, 31
	RGB 00, 00, 00

	RGB 31, 19, 28
	RGB 31, 21, 00
	RGB 12, 22, 00
	RGB 00, 00, 00

	RGB 19, 17, 23
	RGB 30, 26, 00
	RGB 31, 12, 00
	RGB 00, 00, 00

	RGB 07, 26, 31
	RGB 26, 26, 27
	RGB 31, 11, 11
	RGB 00, 00, 00

	RGB 21, 31, 21
	RGB 30, 26, 00
	RGB 31, 12, 00
	RGB 00, 00, 00

	RGB 07, 26, 31
	RGB 31, 31, 00
	RGB 00, 21, 00
	RGB 00, 00, 00

CopyFourPalettes:
	ld de, UnknBGPals
	ld c, $4

CopyPalettes:
.loop
	push bc
	ld a, [hli]
	push hl
	call GetPredefPal
	call LoadHLPaletteIntoDE
	pop hl
	inc hl
	pop bc
	dec c
	jr nz, .loop
	ret

GetPredefPal:
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, PredefPals
	add hl, bc
	ret

LoadHLPaletteIntoDE:
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld c, $8
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	pop af
	ld [rSVBK], a
	ret

LoadPalette_White_Col1_Col2_Black:
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a

	ld a, $7fff % $100
	ld [de], a
	inc de
	ld a, $7fff / $100
	ld [de], a
	inc de

	ld c, 2 * 2
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop

	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de

	pop af
	ld [rSVBK], a
	ret

FillBoxCGB:
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ret

ResetBGPals:
	push af
	push bc
	push de
	push hl

	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a

	ld hl, UnknBGPals
	ld c, 8
.loop
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	dec c
	jr nz, .loop

	pop af
	ld [rSVBK], a

	pop hl
	pop de
	pop bc
	pop af
	ret

WipeAttrMap:
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	jp ByteFill

ApplyPals:
	ld hl, UnknBGPals
	ld de, BGPals
	ld bc, 16 palettes
	ld a, $5
	jp FarCopyWRAM

ApplyAttrMap:
	ld a, [rLCDC]
	bit 7, a
	jr z, .UpdateVBank1
	ld a, [hBGMapMode]
	push af
	ld a, $2
	ld [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	call DelayFrame
	call DelayFrame
	pop af
	ld [hBGMapMode], a
	ret

.UpdateVBank1:
	hlcoord 0, 0, AttrMap
	debgcoord 0, 0
	ld b, SCREEN_HEIGHT
	ld a, $1
	ld [rVBK], a
.row
	ld c, SCREEN_WIDTH
.col
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .col
	ld a, BG_MAP_WIDTH - SCREEN_WIDTH
	add e
	jr nc, .okay
	inc d
.okay
	ld e, a
	dec b
	jr nz, .row
	ld a, $0
	ld [rVBK], a
	ret

CGB_ApplyPartyMenuHPPals: ; 96f3 CGB layout $fc
	ld hl, wHPPals
	ld a, [wSGBPals]
	ld e, a
	ld d, $0
	add hl, de
	ld e, l
	ld d, h
	ld a, [de]
	inc a
	ld e, a
	hlcoord 11, 2, AttrMap
	ld bc, 2 * SCREEN_WIDTH
	ld a, [wSGBPals]
.loop
	and a
	jr z, .done
	add hl, bc
	dec a
	jr .loop
.done
	lb bc, 2, 8
	ld a, e
	jp FillBoxCGB

InitPartyMenuOBPals:
	ld hl, PartyMenuOBPals
	ld de, UnknOBPals
	ld bc, 8 palettes
	ld a, $5
	jp FarCopyWRAM

GetPlayerOrMonPalettePointer:
	and a
	jp nz, GetMonNormalOrShinyPalettePointer
GetPlayerPalettePointer:
	ld a, [wPlayerSpriteSetupFlags]
	bit 2, a ; transformed to male
	jr nz, .male
	ld a, [PlayerGender]
	and a
	jr z, .male
	ld hl, KrisPalette
	ret

.male
	ld hl, PlayerPalette
	ret

GetFrontpicPalettePointer:
	and a
	jp nz, GetMonNormalOrShinyPalettePointer
GetFrontpicPalettePointer_Trainer:
	ld a, [TrainerClass]
GetTrainerPalettePointer:
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld bc, TrainerPalettes
	add hl, bc
	ret

InitCGBPals::
	ld a, $1
	ld [rVBK], a
	ld hl, VTiles0
	ld bc, $200 tiles
	xor a
	call ByteFill
	ld a, $0
	ld [rVBK], a
	ld a, $80
	ld [rBGPI], a
	ld c, 4 * 8
.bgpals_loop
	ld a, $7fff % $100
	ld [rBGPD], a
	ld a, $7fff / $100
	ld [rBGPD], a
	dec c
	jr nz, .bgpals_loop
	ld a, $80
	ld [rOBPI], a
	ld c, 4 * 8
.obpals_loop
	ld a, $7fff % $100
	ld [rOBPD], a
	ld a, $7fff / $100
	ld [rOBPD], a
	dec c
	jr nz, .obpals_loop
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, UnknBGPals
	call .LoadWhitePals
	ld hl, BGPals
	call .LoadWhitePals
	pop af
	ld [rSVBK], a
	ret

.LoadWhitePals:
	ld c, 4 * 16
.loop
	ld a, $7fff % $100
	ld [hli], a
	ld a, $7fff / $100
	ld [hli], a
	dec c
	jr nz, .loop
	ret

CopyData: ; 0x9a52
; copy bc bytes of data from hl to de
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret
; 0x9a5b

INCLUDE "gfx/pics/palette_pointers.asm"

INCLUDE "gfx/trainers/palette_pointers.asm"

LoadMapPals:
	farcall LoadSpecialMapPalette
	jr c, .got_pals

	; Which palette group is based on whether we're outside or inside
	ld a, [wPermission]
	and 7
	ld e, a
	ld d, 0
	ld hl, .TilesetColorsPointers
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	; Futher refine by time of day
	ld a, [TimeOfDayPal]
	and 3
	add a
	add a
	add a
	ld e, a
	ld d, 0
	add hl, de
	ld e, l
	ld d, h
	; Switch to palettes WRAM bank
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, UnknBGPals
	ld b, 8
.outer_loop
	ld a, [de] ; lookup index for TilesetBGPalette
	push de
	push hl
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, TilesetBGPalette
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld c, 1 palettes
.inner_loop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .inner_loop
	pop de
	inc de
	dec b
	jr nz, .outer_loop
	pop af
	ld [rSVBK], a

.got_pals
	ld a, [TimeOfDayPal]
	and 3
	ld bc, 8 palettes
	ld hl, MapObjectPals
	call AddNTimes
	ld de, UnknOBPals
	ld bc, 8 palettes
	ld a, $5 ; BANK(UnknOBPals)
	call FarCopyWRAM

	farcall LoadSpecialMapOBPalette

	ld a, [wPermission]
	cp TOWN
	jr z, .outside
	cp ROUTE
	ret nz
.outside
	ld a, [MapGroup]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, RoofPals
	add hl, de
	ld a, [TimeOfDayPal]
	and 3
	cp NITE
	jr c, .morn_day
rept 4
	inc hl
endr
.morn_day
	ld de, UnknBGPals + 6 palettes + 2
	ld bc, 4
	ld a, $5
	jp FarCopyWRAM

.TilesetColorsPointers:
	dw .OutdoorColors ; unused
	dw .OutdoorColors ; TOWN
	dw .OutdoorColors ; ROUTE
	dw .IndoorColors ; INDOOR
	dw .DungeonColors ; CAVE
	dw .Perm5Colors ; PERM_5
	dw .IndoorColors ; GATE
	dw .DungeonColors ; DUNGEON

; Valid indices: $00 - $29
.OutdoorColors:
	db $00, $01, $02, $28, $04, $05, $06, $07 ; morn
	db $08, $09, $0a, $28, $0c, $0d, $0e, $0f ; day
	db $10, $11, $12, $29, $14, $15, $16, $17 ; nite
	db $18, $19, $1a, $1b, $1c, $1d, $1e, $1f ; dark

.IndoorColors:
	db $20, $21, $22, $23, $24, $25, $26, $07 ; morn
	db $20, $21, $22, $23, $24, $25, $26, $07 ; day
	db $10, $11, $12, $13, $14, $15, $16, $07 ; nite
	db $18, $19, $1a, $1b, $1c, $1d, $1e, $07 ; dark

.DungeonColors:
	db $00, $01, $02, $03, $04, $05, $06, $07 ; morn
	db $08, $09, $0a, $0b, $0c, $0d, $0e, $0f ; day
	db $10, $11, $12, $13, $14, $15, $16, $17 ; nite
	db $18, $19, $1a, $1b, $1c, $1d, $1e, $1f ; dark

.Perm5Colors:
	db $00, $01, $02, $03, $04, $05, $06, $07 ; morn
	db $08, $09, $0a, $0b, $0c, $0d, $0e, $0f ; day
	db $10, $11, $12, $13, $14, $15, $16, $17 ; nite
	db $18, $19, $1a, $1b, $1c, $1d, $1e, $1f ; dark

TilesetBGPalette:
INCLUDE "tilesets/bg.pal"

MapObjectPals::
INCLUDE "tilesets/ob.pal"

RoofPals:
INCLUDE "tilesets/roof.pal"

PalPacket_PartyMenu: db $2e, $00, $2f, $00, $30, $00, $31, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_Grayscale: db $1a, $00, $1a, $00, $1a, $00, $1a, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_Diploma:   db $1b, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
PalPacket_TradeTube: db $1c, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

PredefPals:
	RGB 31, 31, 31
	RGB 22, 25, 19
	RGB 16, 21, 30
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 27, 28, 31
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 24, 28, 19
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 24, 24, 24
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 21, 23, 31
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 24, 21, 27
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 24, 16
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 25, 30, 26
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 25, 31
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 20, 19
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 26, 19
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 27, 28, 27
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 24, 30, 23
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 29, 24, 29
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 26, 23, 29
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 25, 23, 20
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 29, 26, 18
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 21, 18
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 26, 25, 31
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 22, 21, 31
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 22, 25, 21
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 21, 21, 22
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 20, 20
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 26, 26, 26
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 21, 14, 09
	RGB 15, 20, 20
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 12, 28, 22
	RGB 15, 20, 20
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 07, 07, 07
	RGB 02, 03, 03
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 30, 22, 17
	RGB 16, 14, 19
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 18, 20, 27
	RGB 11, 15, 23
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 20, 10
	RGB 26, 10, 06
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 21, 25, 29
	RGB 14, 19, 25
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 27, 22, 24
	RGB 21, 15, 23
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 28, 20, 15
	RGB 21, 14, 09
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 20, 26, 16
	RGB 09, 20, 11
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 30, 22, 24
	RGB 28, 15, 21
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 28, 14
	RGB 26, 20, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 26, 21, 22
	RGB 15, 15, 18
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 23, 19, 13
	RGB 14, 12, 17
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 16, 18, 21
	RGB 10, 12, 18
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 22, 15, 16
	RGB 17, 02, 05
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 15, 20, 20
	RGB 05, 16, 16
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 23, 15, 19
	RGB 14, 04, 12
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 20, 17, 18
	RGB 18, 13, 11
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 23, 21, 16
	RGB 12, 12, 10
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 21, 25, 29
	RGB 30, 22, 24
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 26, 23, 16
	RGB 29, 14, 09
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 18, 18, 18
	RGB 10, 10, 10
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 30, 26, 15
	RGB 00, 23, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 30, 26, 15
	RGB 31, 23, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 30, 26, 15
	RGB 31, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 29, 26, 19
	RGB 27, 20, 14
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 24, 20, 10
	RGB 21, 00, 04
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 20, 10
	RGB 21, 00, 04
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 30, 26, 16
	RGB 16, 12, 09
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 15, 28, 26
	RGB 12, 22, 26
	RGB 03, 16, 14

	RGB 31, 31, 31
	RGB 15, 28, 26
	RGB 23, 24, 24
	RGB 00, 00, 00

	RGB 31, 31, 24
	RGB 07, 27, 19
	RGB 26, 20, 10
	RGB 19, 12, 08

	RGB 31, 31, 31
	RGB 31, 28, 14
	RGB 31, 13, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 16, 18, 21
	RGB 10, 12, 18
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 23, 21, 16
	RGB 12, 12, 10
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 14, 00
	RGB 07, 11, 15
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 26, 21, 22
	RGB 26, 10, 06
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 30, 27, 04
	RGB 24, 20, 11
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 13, 25
	RGB 24, 20, 11
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 16, 19, 29
	RGB 24, 20, 11
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 30, 22, 24
	RGB 18, 18, 18
	RGB 16, 10, 07

	RGB 31, 31, 31
	RGB 21, 25, 29
	RGB 18, 18, 18
	RGB 16, 10, 07

	RGB 31, 31, 31
	RGB 20, 26, 16
	RGB 18, 18, 18
	RGB 16, 10, 07

	RGB 31, 31, 31
	RGB 31, 28, 14
	RGB 18, 18, 18
	RGB 16, 10, 07

	RGB 31, 31, 31
	RGB 18, 18, 18
	RGB 26, 10, 06
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 30, 22, 24
	RGB 28, 15, 21
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 26, 20, 00
	RGB 16, 19, 29
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 16, 02, 30
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 16, 13, 04
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 28, 04, 02
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 18, 23, 31
	RGB 15, 20, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 24, 20, 11
	RGB 18, 13, 11
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 25, 30, 00
	RGB 25, 30, 00

	RGB 00, 00, 00
	RGB 08, 11, 11
	RGB 21, 21, 21
	RGB 31, 31, 31

HPBarPals:
	RGB 30, 26, 15
	RGB 00, 23, 00

	RGB 30, 26, 15
	RGB 31, 21, 00

	RGB 30, 26, 15
	RGB 31, 00, 00

ExpBarPalette:
	RGB 30, 26, 15
	RGB 04, 17, 31

BattleObjectPals:
; gray
	RGB 31, 31, 31
	RGB 25, 25, 25
	RGB 13, 13, 13
	RGB 00, 00, 00
; yellow
	RGB 31, 31, 31
	RGB 31, 31, 07
	RGB 31, 16, 01
	RGB 00, 00, 00
; red
	RGB 31, 31, 31
	RGB 31, 19, 24
	RGB 30, 10, 06
	RGB 00, 00, 00
; green
	RGB 31, 31, 31
	RGB 12, 25, 01
	RGB 05, 14, 00
	RGB 00, 00, 00
; blue
	RGB 31, 31, 31
	RGB 08, 12, 31
	RGB 01, 04, 31
	RGB 00, 00, 00
; brown
	RGB 31, 31, 31
	RGB 24, 18, 07
	RGB 20, 15, 03
	RGB 00, 00, 00

PartyMenuBGPalette:
	RGB 31, 31, 31
	RGB 17, 19, 31
	RGB 14, 16, 31
	RGB 00, 00, 00

DiplomaPalettes:
	RGB 27, 31, 27
	RGB 21, 21, 21
	RGB 13, 13, 13
	RGB 00, 00, 00

	RGB 27, 31, 27
	RGB 31, 07, 06
	RGB 20, 02, 03
	RGB 00, 00, 00

	RGB 27, 31, 27
	RGB 10, 31, 09
	RGB 04, 14, 01
	RGB 00, 00, 00

	RGB 27, 31, 27
	RGB 08, 12, 31
	RGB 01, 04, 31
	RGB 00, 00, 00

	RGB 27, 31, 27
	RGB 31, 31, 07
	RGB 31, 16, 01
	RGB 00, 00, 00

	RGB 27, 31, 27
	RGB 22, 16, 08
	RGB 13, 07, 01
	RGB 00, 00, 00

	RGB 27, 31, 27
	RGB 15, 31, 31
	RGB 05, 17, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 11, 11, 19
	RGB 07, 07, 12
	RGB 00, 00, 00

PartyMenuOBPals:
; red
	RGB 27, 31, 27
	RGB 31, 19, 10
	RGB 31, 07, 01
	RGB 00, 00, 00
; blue
	RGB 27, 31, 27
	RGB 31, 19, 10
	RGB 10, 09, 31
	RGB 00, 00, 00
; green
	RGB 27, 31, 27
	RGB 31, 19, 10
	RGB 07, 23, 03
	RGB 00, 00, 00
; brown
	RGB 27, 31, 27
	RGB 31, 19, 10
	RGB 15, 10, 03
	RGB 00, 00, 00
; purple
	RGB 27, 31, 27
	RGB 31, 19, 10
	RGB 18, 04, 18
	RGB 00, 00, 00
; gray
	RGB 27, 31, 27
	RGB 31, 19, 10
	RGB 13, 13, 13
	RGB 00, 00, 00
; yellow
	RGB 27, 31, 27
	RGB 31, 19, 10
	RGB 31, 29, 00
	RGB 00, 00, 00
; teal
	RGB 27, 31, 27
	RGB 31, 19, 10
	RGB 03, 23, 21
	RGB 00, 00, 00

; ???
	RGB 31, 31, 31
	RGB 21, 21, 21
	RGB 13, 13, 13
	RGB 07, 07, 07

	RGB 31, 31, 31
	RGB 31, 31, 07
	RGB 31, 16, 01
	RGB 07, 07, 07

	RGB 31, 31, 31
	RGB 31, 19, 24
	RGB 30, 10, 06
	RGB 07, 07, 07

	RGB 31, 31, 31
	RGB 12, 25, 01
	RGB 05, 14, 00
	RGB 07, 07, 07

	RGB 31, 31, 31
	RGB 08, 12, 31
	RGB 01, 04, 31
	RGB 07, 07, 07

	RGB 31, 31, 31
	RGB 24, 18, 07
	RGB 20, 15, 03
	RGB 07, 07, 07

MaleTownMapPals:
	RGB 28, 31, 20
	RGB 21, 21, 21
	RGB 13, 13, 13
	RGB 00, 00, 00

	RGB 28, 31, 20
	RGB 00, 31, 00
	RGB 00, 00, 31
	RGB 00, 00, 00

	RGB 28, 31, 20
	RGB 00, 31, 00
	RGB 15, 07, 00
	RGB 00, 00, 00

	;Town Icon
	RGB 28, 31, 20
	RGB 31, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 28, 31, 20
	RGB 00, 31, 00
	RGB 00, 00, 31
	RGB 31, 00, 00

	RGB 28, 31, 20
	RGB 00, 31, 00
	RGB 15, 07, 00
	RGB 31, 00, 00

	RGB 00, 31, 00
	RGB 15, 07, 00
	RGB 00, 00, 31
	RGB 00, 00, 00

FemaleTownMapPals:
	RGB 28, 31, 20
	RGB 21, 21, 21
	RGB 13, 13, 13
	RGB 00, 00, 00

	RGB 28, 31, 20
	RGB 00, 31, 00
	RGB 00, 00, 31
	RGB 00, 00, 00

	RGB 28, 31, 20
	RGB 00, 31, 00
	RGB 15, 07, 00
	RGB 00, 00, 00

	;Town Icon
	RGB 28, 31, 20
	RGB 31, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 28, 31, 20
	RGB 00, 31, 00
	RGB 00, 00, 31
	RGB 31, 00, 00

	RGB 28, 31, 20
	RGB 00, 31, 00
	RGB 15, 07, 00
	RGB 31, 00, 00

	RGB 00, 31, 00
	RGB 15, 07, 00
	RGB 00, 00, 31
	RGB 00, 00, 00

SlotMachinePals:
	RGB 31, 31, 31
	RGB 26, 16, 00
	RGB 31, 24, 09
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 30, 10, 06
	RGB 31, 24, 09
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 15, 31, 00
	RGB 31, 24, 09
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 15, 31
	RGB 31, 24, 09
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 15, 21, 31
	RGB 31, 24, 09
	RGB 00, 00, 00

	RGB 31, 31, 11
	RGB 31, 31, 06
	RGB 31, 24, 09
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 16, 19, 29
	RGB 25, 22, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 21, 21, 21
	RGB 13, 13, 13
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 30, 10, 06
	RGB 31, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 12, 25, 01
	RGB 05, 14, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 12, 25, 01
	RGB 30, 10, 06
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 06
	RGB 20, 15, 03
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 06
	RGB 15, 21, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 06
	RGB 20, 15, 03
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 24, 21
	RGB 31, 13, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00

PinkanPalette:
	RGB 30, 21, 31
	RGB 28, 09, 18
PinkanShinyPalette:
	RGB 31, 16, 20
	RGB 31, 05, 01
