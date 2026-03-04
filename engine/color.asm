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

CheckPinkness:
; Check if a mon is pink by personality at bc.
; Return carry if pink.
	ld a, [bc]
	and PINK_MASK
	jr z, .NotPink
	scf
	ret

.NotPink:
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

GetBattlemonBackpicPalettePointer:
	push de
	farcall GetPartyMonPersonality
	ld c, l
	ld b, h

	ld a, [PlayerSubStatus5]
	bit SUBSTATUS_TRANSFORMED, a
	ld a, [TempBattleMonSpecies]
	jr z, .notTransformed
	ld a, [BattleMonSpecies]
.notTransformed
	call GetPlayerOrMonPalettePointer
	pop de
	ret

GetEnemyFrontpicPalettePointer:
	ld a, [TempEnemyMonSpecies]
	and a
	jp z, GetFrontpicPalettePointer_Trainer
	push de
	farcall GetEnemyMonPersonality
	ld c, l
	ld b, h
	
	ld a, [EnemySubStatus5]
	bit SUBSTATUS_TRANSFORMED, a
	ld a, [TempEnemyMonSpecies]
	jr z, .notTransformed
	ld a, [EnemyMonSpecies]
.notTransformed
	call GetFrontpicPalettePointer
	pop de
	ret

GetMonPalettePointer:
	cp ONIX
	jp z, .onix
	cp STEELIX
	jp z, .steelix
	cp POLIWRATH
	jp z, .poliwrath
	cp ARBOK
	jp z, .arbok
	cp VICTREEBEL
	jp z, .victreebel
	cp EXEGGUTOR
	jp z, .exeggutor
	cp GRIMER
	jp z, .grimer
	cp MUK
	jp z, .muk
	cp MEOWTH
	jp z, .meowth
	cp PERSIAN
	jp z, .persian
	cp VULPIX
	jp z, .vulpix
	cp NINETALES
	jp z, .ninetales
	cp SANDSHREW
	jp z, .sandshrew
	cp SANDSLASH
	jp z, .sandslash
	cp RATTATA
	jp z, .rattata
	cp RATICATE
	jp z, .raticate
	cp DIGLETT
	jp z, .diglett
	cp DUGTRIO
	jp z, .dugtrio
	cp GEODUDE
	jp z, .geodude
	cp GRAVELER
	jp z, .graveler
	cp GOLEM
	jp z, .golem
	cp RAICHU
	jp z, .raichu
	cp MAROWAK
	jp z, .marowak
	cp LYCANROC
	jp z, .lycanroc
.continue
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, PokemonPalettes
	add hl, bc
	ret

.lycanroc
	push af
	ld a, [bc]
	and FORM_MASK
	cp LYCANROC_MIDNIGHT_FORM
	ld hl, LycanrocMidnightPalettes
	jp z, .ok
	cp LYCANROC_DUSK_FORM
	ld hl, LycanrocDuskPalettes
	jp z, .ok
	pop af
	jp .continue

.poliwrath
	push af
	ld a, [bc]
	and FORM_MASK
	cp POLIWRATH_TAD_FORM
	ld hl, PoliwrathTadPalettes
	jp z, .ok
	pop af
	jp .continue

.arbok
	push af
	ld a, [bc]
	and FORM_MASK
	cp ARBOK_ROCKET_FORM
	ld hl, ArbokRocketPalettes
	jp z, .ok
	pop af
	jp .continue

.victreebel
	push af
	ld a, [bc]
	and FORM_MASK
	cp VICTREEBEL_ROCKET_FORM
	ld hl, VictreebelRocketPalettes
	jp z, .ok
	pop af
	jp .continue

.onix
	push af
	ld a, [bc]
	and FORM_MASK
	cp ONIX_CRYSTAL_FORM
	ld hl, OnixCrystalPalettes
	jp z, .ok
	pop af
	jp .continue
	
.steelix
	push af
	ld a, [bc]
	and FORM_MASK
	cp STEELIX_CRYSTAL_FORM
	ld hl, SteelixCrystalPalettes
	jp z, .ok
	pop af
	jp .continue
	
.exeggutor
	push af
	ld a, [bc]
	and FORM_MASK
	cp EXEGGUTOR_KANTONESE_FORM
	ld hl, ExeggutorKantonesePalettes
	jp z, .ok
	pop af
	jp .continue
	
.grimer
	push af
	ld a, [bc]
	and FORM_MASK
	cp GRIMER_KANTONESE_FORM
	ld hl, GrimerKantonesePalettes
	jp z, .ok
	pop af
	jp .continue
	
.muk
	push af
	ld a, [bc]
	and FORM_MASK
	cp MUK_KANTONESE_FORM
	ld hl, MukKantonesePalettes
	jp z, .ok
	pop af
	jp .continue
	
.meowth
	push af
	ld a, [bc]
	and FORM_MASK
	cp MEOWTH_ALOLAN_FORM
	ld hl, MeowthAlolanPalettes
	jp z, .ok
	pop af
	jp .continue
	
.persian
	push af
	ld a, [bc]
	and FORM_MASK
	cp PERSIAN_ALOLAN_FORM
	ld hl, PersianAlolanPalettes
	jp z, .ok
	pop af
	jp .continue
	
.vulpix
	push af
	ld a, [bc]
	and FORM_MASK
	cp VULPIX_KANTONESE_FORM
	ld hl, VulpixKantonesePalettes
	jp z, .ok
	pop af
	jp .continue
	
.ninetales
	push af
	ld a, [bc]
	and FORM_MASK
	cp NINETALES_KANTONESE_FORM
	ld hl, NinetalesKantonesePalettes
	jp z, .ok
	pop af
	jp .continue
	
.sandshrew
	push af
	ld a, [bc]
	and FORM_MASK
	cp SANDSHREW_ALOLAN_FORM
	ld hl, SandshrewAlolanPalettes
	jp z, .ok
	pop af
	jp .continue
	
.sandslash
	push af
	ld a, [bc]
	and FORM_MASK
	cp SANDSLASH_ALOLAN_FORM
	ld hl, SandslashAlolanPalettes
	jp z, .ok
	pop af
	jp .continue
	
.rattata
	push af
	ld a, [bc]
	and FORM_MASK
	cp RATTATA_KANTONESE_FORM
	ld hl, RattataKantonesePalettes
	jp z, .ok
	pop af
	jp .continue
	
.raticate
	push af
	ld a, [bc]
	and FORM_MASK
	cp RATICATE_KANTONESE_FORM
	ld hl, RaticateKantonesePalettes
	jp z, .ok
	cp RATICATE_ROCKET_FORM
	ld hl, RaticateRocketPalettes
	jp z, .ok
	pop af
	jp .continue
	
.diglett
	push af
	ld a, [bc]
	and FORM_MASK
	cp DIGLETT_KANTONESE_FORM
	ld hl, DiglettKantonesePalettes
	jp z, .ok
	pop af
	jp .continue
	
.dugtrio
	push af
	ld a, [bc]
	and FORM_MASK
	cp DUGTRIO_KANTONESE_FORM
	ld hl, DugtrioKantonesePalettes
	jp z, .ok
	pop af
	jp .continue

.geodude
	push af
	ld a, [bc]
	and FORM_MASK
	cp GEODUDE_KANTONESE_FORM
	ld hl, GeodudeKantonesePalettes
	jp z, .ok
	pop af
	jp .continue
	
.graveler
	push af
	ld a, [bc]
	and FORM_MASK
	cp GRAVELER_KANTONESE_FORM
	ld hl, GravelerKantonesePalettes
	jp z, .ok
	pop af
	jp .continue
	
.golem
	push af
	ld a, [bc]
	and FORM_MASK
	cp GOLEM_KANTONESE_FORM
	ld hl, GolemKantonesePalettes
	jp z, .ok
	pop af
	jp .continue
	
.raichu
	push af
	ld a, [bc]
	and FORM_MASK
	cp RAICHU_KANTONESE_FORM
	ld hl, RaichuKantonesePalettes
	jp z, .ok
	pop af
	jp .continue
	
.marowak
	push af
	ld a, [bc]
	and FORM_MASK
	cp MAROWAK_KANTONESE_FORM
	ld hl, MarowakKantonesePalettes
	jp z, .ok
	pop af
	jp .continue

.ok
	pop af
	ret

GetMonNormalOrShinyOrPinkPalettePointer:
	push de
	ld d, a
	call CheckPinkness
	ld hl, PinkanPalette
	ld a, d
	pop de
	ret c
	push bc
	call GetMonPalettePointer
	pop bc
	push hl
	call CheckShininess
	pop hl
	ret nc
rept 4
	inc hl
endr
	ret

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
	hlcoord 13, 1, AttrMap
	ld bc, 2 * SCREEN_WIDTH
	ld a, [wCurPartyMon]
.loop
	and a
	jr z, .done
	add hl, bc
	dec a
	jr .loop

.done
	lb bc, 2, 6
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
	hlcoord 13, 2, AttrMap
	ld bc, 2 * SCREEN_WIDTH
	ld a, [wSGBPals]
.loop
	and a
	jr z, .done
	add hl, bc
	dec a
	jr .loop
.done
	lb bc, 2, 6
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
	jp nz, GetMonNormalOrShinyOrPinkPalettePointer
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
	jp nz, GetMonNormalOrShinyOrPinkPalettePointer
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
	RGB 00, 23, 00
	RGB 00, 19, 00

	RGB 31, 25, 00
	RGB 27, 21, 00

	RGB 31, 00, 00
	RGB 23, 00, 00

ExpBarPalette:
	RGB 31, 22, 10
	RGB 31, 16, 04

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
	RGB 31, 31, 15
	RGB 00, 00, 00
; teal
	RGB 27, 31, 27
	RGB 31, 19, 10
	RGB 03, 23, 21
	RGB 00, 00, 00

UnusedBattleObjectPals: ; unreferenced
; gray
	RGB 31, 31, 31
	RGB 21, 21, 21
	RGB 13, 13, 13
	RGB 07, 07, 07
; yellow
	RGB 31, 31, 31
	RGB 31, 31, 07
	RGB 31, 16, 01
	RGB 07, 07, 07
; red
	RGB 31, 31, 31
	RGB 31, 19, 24
	RGB 30, 10, 06
	RGB 07, 07, 07
;green
	RGB 31, 31, 31
	RGB 12, 25, 01
	RGB 05, 14, 00
	RGB 07, 07, 07
; blue
	RGB 31, 31, 31
	RGB 08, 12, 31
	RGB 01, 04, 31
	RGB 07, 07, 07
; brown
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
	RGB 31, 25, 01
	RGB 10, 23, 23
	RGB 23, 10, 02

	RGB 28, 31, 20
	RGB 31, 25, 01
	RGB 23, 10, 02
	RGB 23, 10, 02

	;Town Icon
	RGB 28, 31, 20
	RGB 31, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 28, 31, 20
	RGB 31, 25, 01
	RGB 10, 23, 23
	RGB 23, 10, 02

	RGB 28, 31, 20
	RGB 31, 25, 01
	RGB 23, 10, 02
	RGB 31, 00, 00

	RGB 31, 25, 01
	RGB 23, 10, 02
	RGB 10, 23, 23
	RGB 23, 10, 02

FemaleTownMapPals:
	RGB 28, 31, 20
	RGB 21, 21, 21
	RGB 13, 13, 13
	RGB 00, 00, 00

	RGB 28, 31, 20
	RGB 31, 25, 01
	RGB 10, 23, 23
	RGB 23, 10, 02

	RGB 28, 31, 20
	RGB 31, 25, 01
	RGB 23, 10, 02
	RGB 23, 10, 02

	;Town Icon
	RGB 28, 31, 20
	RGB 31, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 28, 31, 20
	RGB 31, 25, 01
	RGB 10, 23, 23
	RGB 23, 10, 02

	RGB 28, 31, 20
	RGB 31, 25, 01
	RGB 23, 10, 02
	RGB 31, 00, 00

	RGB 31, 25, 01
	RGB 23, 10, 02
	RGB 10, 23, 23
	RGB 23, 10, 02

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

; Loads palette d (0-7) from PartyMenuOBPals to Palette OB0
FlyLoadOB0Pal:
    ld   a, d        ; A = index
    add  a, a        ; ×2
    add  a, a        ; ×4
    add  a, a        ; ×8
    ld   c, a
    ld   b, 0        ; BC = D * 8
	ld hl, PartyMenuOBPals
    add  hl, bc      ; HL = base + (index * 8)
	ld de, OBPals
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
; Request palette update
	ld a, 1
	ld [hCGBPalUpdate], a
	ld c, 4
	call DelayFrames
	ret
