LoadSpecialMapPalette: ; 494ac
	ld a, [wTileset]

	ld hl, PokeComPalette
	cp TILESET_POKECOM_CENTER
	jp z, LoadEightBGPalettes

	ld hl, BattleTowerPalette
	cp TILESET_BATTLE_TOWER
	jp z, LoadEightBGPalettes

	ld hl, IcePathPalette
	cp TILESET_ICE_PATH
	jp z, .ice_path

	ld hl, CrystalCavePalette
	cp TILESET_CAVE
	jp z, .crystal_cave

	ld hl, UnderwaterPalette
	cp TILESET_UNDERWATER
	jp z, LoadEightBGPalettes

	ld hl, HousePalette
	cp TILESET_HOUSE_1
	jp z, LoadEightBGPalettes

	ld hl, RadioTowerPalette
	cp TILESET_RADIO_TOWER
	jp z, LoadEightBGPalettes

	ld hl, MansionPalette
	cp TILESET_CELADON_MANSION
	jp z, LoadEightBGPalettes

	ld hl, GoldenIslandPalette
	cp TILESET_GOLDEN_ISLAND
	jp z, LoadEightTimeOfDayBGPalettes

	ld hl, MandarinDesertPalette
	cp TILESET_DESERT
	jp z, LoadEightTimeOfDayBGPalettes

	ld hl, TrovitopolisSewerPalette
	cp TILESET_SEWER
	jp z, LoadEightBGPalettes
	
	ld hl, MayorsOfficePalette
	cp TILESET_POWER_PLANT
	jp z, LoadEightBGPalettes

	ld hl, PummeloStadiumPalette
	cp TILESET_GYM_1
	jp z, LoadEightBGPalettes
	
	ld hl, AirshipInteriorPalette
	cp TILESET_AIRSHIP_INSIDE
	jp z, LoadEightTimeOfDayBGPalettes
	
	ld hl, AirshipExteriorPalette
	cp TILESET_AIRSHIP_OUTSIDE
	jp z, LoadEightTimeOfDayBGPalettes

	ld hl, ShamoutiShrinePalette
	cp TILESET_SHAMOUTI_SHRINE
	jp z, LoadEightTimeOfDayBGPalettes
	
	ld hl, ShamoutiIslandPalette
	cp TILESET_SHAMOUTI_ISLAND
	jp z, .shamouti_island
	
	cp TILESET_ILEX_FOREST
	jp z, .outside
	
	ld a, [MapNumber]

	ld hl, NavelIslandPalette
	cp MAP_NAVEL_ISLAND
	jp z, .navel_island

	ld a, [wPermission]
	cp TOWN
	jr z, .outside
	cp ROUTE
	jr nz, .not_outside_dusk
.outside
	ld a, [hHours]
	cp DUSK_HOUR
	jr nz, .not_outside_dusk
	ld hl, OutsideDuskPalette
	jp LoadEightBGPalettes
.not_outside_dusk

.do_nothing
	and a
	ret

.ice_path
	ld a, [wPermission] ; permission
	and $7
	cp INDOOR ; Hall of Fame
	jp z, .do_nothing
	jp LoadEightBGPalettes
; 494f2




.navel_island
	ld a, [MapGroup]
	cp GROUP_NAVEL_ISLAND
	jr nz, .do_nothing
	ld a, [MapNumber]
	ld hl, NavelIslandPalette
	cp MAP_NAVEL_ISLAND
	jr z, LoadEightTimeOfDayBGPalettes
	jr .do_nothing

.shamouti_island
	ld a, [MapGroup]
	cp GROUP_SHAMOUTI_ISLAND
	jr nz, .do_nothing
	ld a, [MapNumber]
	ld hl, ShamoutiIslandPalette
	cp MAP_SHAMOUTI_ISLAND
	jr z, LoadEightTimeOfDayBGPalettes
	cp MAP_SHAMOUTI_BAY
	jr z, LoadEightTimeOfDayBGPalettes
	cp MAP_SHAMOUTI_NORTH_BEACH
	jr z, LoadEightTimeOfDayBGPalettes
	cp MAP_LIGHTNING_ISLAND
	jr z, LoadEightTimeOfDayBGPalettes
	cp MAP_FIRE_ISLAND
	jr z, LoadEightTimeOfDayBGPalettes
	ld a, [MapNumber]
	ld hl, IceIslandPalette
	cp MAP_ICE_ISLAND
	jr z, LoadEightTimeOfDayBGPalettes
	jr .do_nothing

.crystal_cave
	ld a, [MapGroup]
	cp GROUP_CRYSTAL_CAVE_1F
	jr nz, .do_nothing
	ld a, [MapNumber]
	ld hl, CrystalCavePalette
	cp MAP_CRYSTAL_CAVE_1F
	jr z, LoadEightBGPalettes
	cp MAP_CRYSTAL_CAVE_B1
	jr z, LoadEightBGPalettes
	ld a, [MapNumber]
	ld hl, VictoryRoadPalette
	cp MAP_VICTORY_ROAD_F1
	jr z, LoadEightBGPalettes
	cp MAP_VICTORY_ROAD_F2
	jr z, LoadEightBGPalettes
	cp MAP_VICTORY_ROAD_F3
	jr z, LoadEightBGPalettes
	cp MAP_VICTORY_ROAD_EAST
	jr z, LoadEightBGPalettes
	cp MAP_VICTORY_ROAD_EXIT_ROOM
	jr z, LoadEightBGPalettes
	jr .do_nothing
	
	

	
LoadEightTimeOfDayBGPalettes:
	ld a, [hHours]
	cp DUSK_HOUR
	ld a, DARKNESS
	jr z, .dusk
	ld a, [TimeOfDayPal]
	and $3
.dusk
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

UnderwaterPalette:
INCLUDE "tilesets/underwater.pal"

GoldenIslandPalette:
INCLUDE "tilesets/golden_island.pal"

MandarinDesertPalette:
INCLUDE "tilesets/mandarin_desert.pal"

TrovitopolisSewerPalette:
INCLUDE "tilesets/trovitopolis_sewer.pal"

MayorsOfficePalette:
INCLUDE "tilesets/mayors_office.pal"

PummeloStadiumPalette:
INCLUDE "tilesets/pummelo_stadium.pal"

CrystalCavePalette:
INCLUDE "tilesets/crystal_cave.pal"

VictoryRoadPalette:
INCLUDE "tilesets/victory_road.pal"

NavelIslandPalette:
INCLUDE "tilesets/navel_island.pal"

ShamoutiShrinePalette:
INCLUDE "tilesets/shamoutishrine.pal"

ShamoutiIslandPalette:
INCLUDE "tilesets/shamoutiisland.pal"

IceIslandPalette:
INCLUDE "tilesets/iceisland.pal"

AirshipInteriorPalette:
INCLUDE "tilesets/airship_inside.pal"

AirshipExteriorPalette:
INCLUDE "tilesets/airship_outside.pal"

OutsideDuskPalette:
INCLUDE "tilesets/dusk.pal"

LoadSpecialMapOBPalette:
    ld a, [MapGroup]
	cp GROUP_SHAMOUTI_ISLAND
    jr nz, .not_shamouti
    ld a, [MapNumber]
    cp MAP_SHAMOUTI_BAY
    ld hl, KumquatOBPalette
	jr z, LoadEightTimeOfDayOBPalettes
.not_shamouti
    cp GROUP_KUMQUAT_ISLAND_WEST
    jr nz, .not_kumquat
    ld a, [MapNumber]
    cp MAP_KUMQUAT_ISLAND_WEST
    ld hl, KumquatOBPalette
	jr z, LoadEightTimeOfDayOBPalettes
    cp MAP_KUMQUAT_ISLAND_EAST
    ld hl, KumquatOBPalette
	jr z, LoadEightTimeOfDayOBPalettes
.not_kumquat
	ld a, [wTileset]

	ld hl, UnderwaterOBPalette
	cp TILESET_UNDERWATER
	jr z, LoadEightOBPalettes

	ld a, [wPermission]
	cp TOWN
	jr z, .outside
	cp ROUTE
	jr nz, .not_outside_dusk
.outside
	ld a, [hHours]
	cp DUSK_HOUR
	jr nz, .not_outside_dusk
	ld a, $5
	ld hl, UnknBGPals + PAL_BG_GREEN palettes
	ld de, UnknOBPals + PAL_OW_TREE palettes
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, $5
	ld hl, UnknBGPals + PAL_BG_BROWN palettes
	ld de, UnknOBPals + PAL_OW_ROCK palettes
	ld bc, 1 palettes
	call FarCopyWRAM
	scf
	ret
.not_outside_dusk

.do_nothing
	and a
	ret
	
LoadEightTimeOfDayOBPalettes:
	ld a, [hHours]
	cp DUSK_HOUR
	ld a, DARKNESS
	jr z, .dusk
	ld a, [TimeOfDayPal]
	and $3
.dusk
	ld bc, 8 palettes
	call AddNTimes
LoadEightOBPalettes:
	ld a, $5
	ld de, UnknOBPals
	ld bc, 8 palettes
	call FarCopyWRAM
	scf
	ret

UnderwaterOBPalette:
INCLUDE "tilesets/ob_underwater.pal"

KumquatOBPalette:
INCLUDE "tilesets/ob_kumquat.pal"


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
