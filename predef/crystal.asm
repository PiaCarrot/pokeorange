LoadSpecialMapPalette: ; 494ac
	ld a, [wTileset]

	ld hl, PokeComPalette
	cp TILESET_POKECOM_CENTER
	jr z, LoadEightBGPalettes

	ld hl, BattleTowerPalette
	cp TILESET_BATTLE_TOWER
	jr z, LoadEightBGPalettes

	ld hl, IcePathPalette
	cp TILESET_ICE_PATH
	jr z, .ice_path

	ld hl, HousePalette
	cp TILESET_HOUSE_1
	jr z, LoadEightBGPalettes

	ld hl, RadioTowerPalette
	cp TILESET_RADIO_TOWER
	jr z, LoadEightBGPalettes

	ld hl, MansionPalette
	cp TILESET_CELADON_MANSION
	jr z, LoadEightBGPalettes

.do_nothing
	and a
	ret

.ice_path
	ld a, [wPermission] ; permission
	and $7
	cp INDOOR ; Hall of Fame
	jr z, .do_nothing
	jr LoadEightBGPalettes
; 494f2

LoadEightTimeOfDayBGPalettes:
	ld a, [TimeOfDayPal]
	and $3
	ld bc, 8 palettes
	call AddNTimes
LoadEightBGPalettes: ; 494f2
	ld a, $5
	ld de, UnknBGPals
	ld bc, 8 palettes
	call FarCopyWRAM
	scf
	ret
; 49501

PokeComPalette: ; 49501
INCLUDE "tilesets/pokecom.pal"
; 49541

BattleTowerPalette: ; 49550
INCLUDE "tilesets/battle_tower.pal"
; 49590

IcePathPalette: ; 4959f
INCLUDE "tilesets/ice_path.pal"
; 495df

HousePalette: ; 495ee
INCLUDE "tilesets/house.pal"
; 4962e

RadioTowerPalette: ; 4963d
INCLUDE "tilesets/radio_tower.pal"
; 4967d

MansionPalette: ; 496fe
INCLUDE "tilesets/mansion.pal"
; 49706



LoadOW_BGPal7:: ; 49409
	ld hl, Palette_TextBG7
	ld de, UnknBGPals + 8 * 7
	ld bc, 8
	ld a, $5
	jp FarCopyWRAM
; 49418

Palette_TextBG7: ; 49418
	RGB 31, 31, 31
	RGB 08, 19, 28
	RGB 05, 05, 16
	RGB 00, 00, 00
; 49420



LoadTradeRoomBGPals: ; 49811
	ld hl, TradeRoomBGPalette
	ld de, UnknBGPals + 2 palettes
	ld bc, 6 palettes
	ld a, $5
	call FarCopyWRAM
	farcall ApplyPals
	ret
; 49826

TradeRoomBGPalette: ; 49826
	RGB 04, 02, 15
	RGB 07, 09, 31
	RGB 31, 00, 00
	RGB 31, 31, 31

	RGB 04, 02, 15
	RGB 07, 09, 31
	RGB 15, 23, 30
	RGB 31, 31, 31

	RGB 04, 02, 15
	RGB 07, 09, 31
	RGB 16, 16, 16
	RGB 31, 31, 31

	RGB 04, 02, 15
	RGB 07, 09, 31
	RGB 25, 07, 04
	RGB 31, 31, 31

	RGB 04, 02, 15
	RGB 07, 09, 31
	RGB 03, 22, 08
	RGB 31, 31, 31

	RGB 04, 02, 15
	RGB 07, 09, 31
	RGB 29, 28, 09
	RGB 31, 31, 31
; 49856

InitLinkTradePalMap: ; 49856
	hlcoord 0, 0, AttrMap
	lb bc, 16, 2
	ld a, $4
	call LinkTradeLayoutFillBox
	ld a, $3
	ldcoord_a 0, 1, AttrMap
	ldcoord_a 0, 14, AttrMap
	hlcoord 2, 0, AttrMap
	lb bc, 8, 18
	ld a, $5
	call LinkTradeLayoutFillBox
	hlcoord 2, 8, AttrMap
	lb bc, 8, 18
	ld a, $6
	call LinkTradeLayoutFillBox
	hlcoord 0, 16, AttrMap
	lb bc, 2, SCREEN_WIDTH
	ld a, $4
	call LinkTradeLayoutFillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 6, 1, AttrMap
	call LinkTradeLayoutFillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 17, 1, AttrMap
	call LinkTradeLayoutFillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 6, 9, AttrMap
	call LinkTradeLayoutFillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 17, 9, AttrMap
	call LinkTradeLayoutFillBox
	ld a, $2
	hlcoord 2, 16, AttrMap
	ld [hli], a
	ld a, $7
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, $2
	ld [hl], a
	hlcoord 2, 17, AttrMap
	ld a, $3
	ld bc, 6
	jp ByteFill
; 49811

LinkTradeLayoutFillBox: ; 49336
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
; 49346
