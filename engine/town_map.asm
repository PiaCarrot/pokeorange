LoadTownMapInterfaceGFX: ; 90c4e
	call ClearVBank1
	ld hl, TownMapGFX
	ld de, VTiles2
	ld a, BANK(TownMapGFX)
	call FarDecompress
	ld hl, TownMapCursorGFX
	ld de, VTiles0 + 4 tiles
	ld a, BANK(TownMapCursorGFX)
	call Decompress
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetWorldMapLocation
	cp FAST_SHIP
	jr z, .ssaqua
	farcall GetPlayerIcon
	push de
	ld h, d
	ld l, e
	ld a, b
	; standing sprite
	push af
	ld de, VTiles0 tile $10
	ld bc, 4 tiles
	call FarCopyBytes
	pop af
	pop hl
	; walking sprite
	ld de, 12 tiles
	add hl, de
	ld de, VTiles0 tile $14
	ld bc, 4 tiles
	jp FarCopyBytes

.ssaqua
	ld hl, FastShipGFX
	ld de, VTiles0 tile $10
	ld bc, 8 tiles
	jp CopyBytes

; 90cb2

TownMap_GetCurrentLandmark: ; 90d56
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetWorldMapLocation
	cp SPECIAL_MAP
	ret nz
	ld a, [BackupMapGroup]
	ld b, a
	ld a, [BackupMapNumber]
	ld c, a
	jp GetWorldMapLocation
; 90d70

TownMap_InitPlayerIcon: ; 9106a
	push af
	depixel 0, 0
	ld b, SPRITE_ANIM_INDEX_PURPLE_WALK
	ld a, [PlayerGender]
	bit 0, a
	jr z, .got_gender
	ld b, SPRITE_ANIM_INDEX_RED_WALK
.got_gender
	ld a, b
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $10
	pop af
	ld e, a
	push bc
	farcall GetLandmarkCoords
	pop bc
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], e
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], d
	ret

; 91098

TownMap_InitCursor: ; 91098
	push af
	depixel 0, 0
	ld a, SPRITE_ANIM_INDEX_0D
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $4
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_SEQ_NULL
	pop af
	push bc
	call TownMap_UpdateCursorPosition
	pop bc
	ret

; 910b4

TownMap_UpdateLandmarkName: ; 910b4
	ld e, a
TownMap_PrintLandmarkName:
	hlcoord 0, 0
	lb bc, 1, SCREEN_WIDTH
	call ClearBox
	farcall GetLandmarkName
	hlcoord 0, 0
	ld a, "<UPDN>"
	ld [hli], a
	ld de, StringBuffer1
	jp PlaceString

; 910d4

TownMap_UpdateCursorPosition: ; 910d4
	push bc
	ld e, a
	farcall GetLandmarkCoords
	pop bc
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], e
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], d
	ret

; 910e8

_TownMap: ; 9191c
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]

	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a

	ld a, [VramState]
	push af
	xor a
	ld [VramState], a

	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	call LoadTownMapInterfaceGFX
	farcall ClearSpriteAnims
	ld a, 8
	call SkipMusic
	ld a, $e3
	ld [rLCDC], a
	call TownMap_GetCurrentLandmark
	ld [wd002], a
	ld [wd003], a
	xor a
	ld [hBGMapMode], a
	call .InitTilemap
	call WaitBGMap2
	ld a, [wd002]
	call TownMap_InitPlayerIcon
	ld a, [wd003]
	call TownMap_InitCursor
	ld a, c
	ld [wd004], a
	ld a, b
	ld [wd005], a
	ld b, SCGB_TOWN_MAP_PALS
	call GetSGBLayout
	call SetPalettes
	ld a, %11100100
	call DmgToCgbObjPal0
	call DelayFrame
	lb de, RAINBOW_ISLAND, VERMILION_CITY
	ld a, [wd002]
	cp KANTO_LANDMARK
	jr nc, .resume
    lb de, LIGHTNING_ISLAND, VALENCIA_ISLAND
.resume
	call .loop
	pop af
	ld [VramState], a
	pop af
	ld [hInMenu], a
	pop af
	ld [wOptions], a
	jp ClearBGPalettes

.loop
	call JoyTextDelay
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	ret nz

	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .pressed_up

	ld a, [hl]
	and D_DOWN
	jr nz, .pressed_down
.loop2
	push de
	farcall PlaySpriteAnimations
	pop de
	call DelayFrame
	jr .loop

.pressed_up
	ld hl, wd003
	ld a, [hl]
	cp d
	jr c, .okay
	ld a, e
	dec a
	ld [hl], a

.okay
	inc [hl]
	jr .next

.pressed_down
	ld hl, wd003
	ld a, [hl]
	cp e
	jr nz, .okay2
	ld a, d
	inc a
	ld [hl], a

.okay2
	dec [hl]

.next
	push de
	ld a, [wd003]
	call TownMap_UpdateLandmarkName
	ld a, [wd004]
	ld c, a
	ld a, [wd005]
	ld b, a
	ld a, [wd003]
	call TownMap_UpdateCursorPosition
	pop de
	jr .loop2
; 91a04

.InitTilemap: ; 91a04
	ld a, [wd002]
	cp KANTO_LANDMARK
	; e = carry ? 0 (johto) : 1 (kanto)
	sbc a
	inc a
	ld e, a
	farcall DoTownMap
	ld a, $7
	ld bc, 6
	hlcoord 1, 0
	call ByteFill
	hlcoord 0, 0
	ld [hl], $6
	hlcoord 7, 0
	ld [hl], $17
	ld a, $7
	ld bc, NAME_LENGTH
	ld a, [wd003]
	call TownMap_UpdateLandmarkName
	farcall TownMapPals
	ret
; 91a53

DoTownMap: ; 91ae1
	ld a, e
	and a
	jr nz, .kanto
	call LoadTownMapGFX
	jp FillOrangeMap

.kanto
	call LoadTownMapGFX
	jp FillKantoMap
; 91af3


_FlyMap: ; 91af3
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	ld hl, hInMenu
	ld a, [hl]
	push af
	ld [hl], $1
	xor a
	ld [hBGMapMode], a
	farcall ClearSpriteAnims
	call LoadTownMapGFX
	call FlyMap
	ld b, SCGB_TOWN_MAP_PALS
	call GetSGBLayout
	call SetPalettes
.loop
	call JoyTextDelay
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .pressedB
	ld a, [hl]
	and A_BUTTON
	jr nz, .pressedA
	call FlyMapScroll
	call GetMapCursorCoordinates
	farcall PlaySpriteAnimations
	call DelayFrame
	jr .loop

.pressedB
	ld a, -1
	jr .exit

.pressedA
	ld a, [wd002]
	ld l, a
	ld h, 0
	add hl, hl
	ld de, Flypoints + 1
	add hl, de
	ld a, [hl]
.exit
	ld [wd002], a
	pop af
	ld [hInMenu], a
	call ClearBGPalettes
	ld a, $90
	ld [hWY], a
	xor a
	ld [hBGMapAddress], a
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a
	ld a, [wd002]
	ld e, a
	ret

; 91b73

FlyMapScroll: ; 91b73
	ld a, [StartFlypoint]
	ld e, a
	ld a, [EndFlypoint]
	ld d, a
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .ScrollNext
	ld a, [hl]
	and D_DOWN
	jr nz, .ScrollPrev
	ret

.ScrollNext:
	ld hl, wd002
	ld a, [hl]
	cp d
	jr nz, .NotAtEndYet
	ld a, e
	dec a
	ld [hl], a
.NotAtEndYet:
	inc [hl]
	call CheckIfVisitedFlypoint
	jr z, .ScrollNext
	jr .Finally

.ScrollPrev:
	ld hl, wd002
	ld a, [hl]
	cp e
	jr nz, .NotAtStartYet
	ld a, d
	inc a
	ld [hl], a
.NotAtStartYet:
	dec [hl]
	call CheckIfVisitedFlypoint
	jr z, .ScrollPrev
.Finally:
	call TownMap_UpdateFlypointName
	call WaitBGMap
	xor a
	ld [hBGMapMode], a
	ret

; 91bb5

TownMap_UpdateFlypointName: ; 91bb5
	ld a, [wd002]
	ld l, a
	ld h, 0
	add hl, hl ; two bytes per flypoint
	ld de, Flypoints
	add hl, de
	ld e, [hl]
	jp TownMap_PrintLandmarkName

; 91c17

GetMapCursorCoordinates: ; 91c17
	ld a, [wd002]
	ld l, a
	ld h, $0
	add hl, hl
	ld de, Flypoints
	add hl, de
	ld e, [hl]
	farcall GetLandmarkCoords
	ld a, [wd003]
	ld c, a
	ld a, [wd004]
	ld b, a
	ld hl, $4
	add hl, bc
	ld [hl], e
	ld hl, $5
	add hl, bc
	ld [hl], d
	ret

; 91c3c

CheckIfVisitedFlypoint: ; 91c3c
; Check if the flypoint loaded in [hl] has been visited yet.
	push bc
	push de
	push hl
	ld l, [hl]
	ld h, 0
	add hl, hl
	ld de, Flypoints + 1
	add hl, de
	ld c, [hl]
	call HasVisitedSpawn
	pop hl
	pop de
	pop bc
	and a
	ret

; 91c50

HasVisitedSpawn: ; 91c50
; Check if spawn point c has been visited.
	ld hl, VisitedSpawns
	ld b, CHECK_FLAG
	ld d, 0
	predef FlagPredef
	ld a, c
	ret

; 91c5e

Flypoints: ; 91c5e
; landmark, spawn point
	const_def
flypoint: MACRO
	const FLY_\1
	db \2, SPAWN_\1
ENDM
; Orange
	flypoint VALENCIA,       VALENCIA_ISLAND
	flypoint TANGELO,        TANGELO_ISLAND
	flypoint MIKAN,          MIKAN_ISLAND
	flypoint MANDARIN_NORTH, MANDARIN_NORTH
	flypoint SUNBURST,       SUNBURST_ISLAND
	flypoint KINNOW,         KINNOW_ISLAND
	flypoint NAVEL,          NAVEL_ISLAND
	flypoint MORO,			 MORO_ISLAND
	flypoint MURCOTT,		 MURCOTT_ISLAND
	flypoint TROVITOPOLIS,   TROVITOPOLIS
	flypoint TROVITA,		 TROVITA_ISLAND
	flypoint ASCORBIA,       ASCORBIA_ISLAND
    flypoint KUMQUAT,        KUMQUAT_ISLAND
	flypoint PUMMELO,        PUMMELO_ISLAND
    flypoint TARROCO,         TARROCO_ISLAND
    flypoint SHAMOUTI,       SHAMOUTI_ISLAND
; Kanto
	flypoint VERMILION, VERMILION_CITY

KANTO_FLYPOINT EQU const_value
	db -1

; 91c8f

FlyMap: ; 91c90
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetWorldMapLocation
; If we're not in a valid location, i.e. Pokecenter floor 2F,

; the backup map information is used
	cp SPECIAL_MAP
	jr nz, .CheckRegion
	ld a, [BackupMapGroup]
	ld b, a
	ld a, [BackupMapNumber]
	ld c, a
	call GetWorldMapLocation
.CheckRegion:
; The first 46 locations are part of Orange. The rest are in Kanto
	cp KANTO_LANDMARK
	jr nc, .KantoFlyMap
; Note that .NoKanto should be modified in tandem with this branch
	push af
; Start from Valencia
	ld a, FLY_VALENCIA
	ld [wd002], a
; Flypoints begin at Valencia..
	ld [StartFlypoint], a
; ..and end at ...
	ld a, FLY_SHAMOUTI
	ld [EndFlypoint], a
; Fill out the map
	call FillOrangeMap
	call .MapHud
	pop af
	jp TownMapPlayerIcon

.KantoFlyMap:
; The event that there are no flypoints enabled in a map is not

; accounted for. As a result, if you attempt to select a flypoint
; when there are none enabled, the game will crash. Additionally,

; the flypoint selection has a default starting point that
; can be flown to even if none are enabled

; To prevent both of these things from happening when the player
; enters Kanto, fly access is restricted until Indigo Plateau is

; visited and its flypoint enabled
	push af
	ld c, SPAWN_VERMILION
	call HasVisitedSpawn
	and a
	jr z, .NoKanto
; Kanto's map is only loaded if we've visited Indigo Plateau

; Flypoints begin at Valencia...
	ld a, FLY_VERMILION
	ld [StartFlypoint], a
; ...and end at ...
	ld a, FLY_VERMILION
	ld [EndFlypoint], a
; Because Indigo Plateau is the first flypoint the player

; visits, it's made the default flypoint
	ld [wd002], a
; Fill out the map
	call FillKantoMap
	call .MapHud
	pop af
	jp TownMapPlayerIcon

.NoKanto:
; If Indigo Plateau hasn't been visited, we use Orange's map instead

; Start from Valencia
	ld a, FLY_VALENCIA
	ld [wd002], a
; Flypoints begin at Valencia...
	ld [StartFlypoint], a
; ..and end at ...
	ld a, FLY_SHAMOUTI
	ld [EndFlypoint], a
	call FillOrangeMap
	pop af
.MapHud:
	call TownMap_UpdateFlypointName
	call TownMapPals
	hlbgcoord 0, 0 ; BG Map 0
	call TownMapBGUpdate
	call TownMapMon
	ld a, c
	ld [wd003], a
	ld a, b
	ld [wd004], a
	ret

; 91d11

_Area: ; 91d11
; e: Current landmark
	ld a, [wd002]
	push af
	ld a, [wd003]
	push af
	ld a, e
	ld [wd002], a
	call ClearSprites
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [hInMenu], a
	ld de, DexMapNestIconGFX
	ld hl, VTiles0 tile $7f
	lb bc, BANK(DexMapNestIconGFX), 1
	call Request2bpp
	call .GetPlayerOrFastShipIcon
	ld hl, VTiles0 tile $78
	ld c, 4
	call Request2bpp
	call LoadTownMapGFX
	call FillKantoMap
	call .PlaceString_MonsNest
	call TownMapPals
	hlbgcoord 0, 0, VBGMap1
	call TownMapBGUpdate
	call FillOrangeMap
	call .PlaceString_MonsNest
	call TownMapPals
	hlbgcoord 0, 0
	call TownMapBGUpdate
	ld b, SCGB_TOWN_MAP_PALS
	call GetSGBLayout
	call SetPalettes
	xor a
	ld [hBGMapMode], a
	xor a ; Orange
	call .GetAndPlaceNest
.loop
	call JoyTextDelay
	ld hl, hJoyPressed
	ld a, [hl]
	and A_BUTTON | B_BUTTON
	jr nz, .a_b
	ld a, [hJoypadDown]
	and SELECT
	jr nz, .select
	call .LeftRightInput
	call .BlinkNestIcons
	jr .next

.select
	call .HideNestsShowPlayer
.next
	call DelayFrame
	jr .loop

.a_b
	call ClearSprites
	pop af
	ld [wd003], a
	pop af
	ld [wd002], a
	ret

; 91d9b

.LeftRightInput: ; 91d9b
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	ld a, [hl]
	and D_RIGHT
	jr nz, .right
	ret

.left
	ld a, [hWY]
	cp $90
	ret z
	call ClearSprites
	ld a, $90
	ld [hWY], a
	xor a ; Orange
	jp .GetAndPlaceNest

.right
	ld a, [StatusFlags]
	bit 6, a ; hall of fame
	ret z
	ld a, [hWY]
	and a
	ret z
	call ClearSprites
	xor a
	ld [hWY], a
	ld a, 1 ; Kanto
	jp .GetAndPlaceNest

; 91dcd

.BlinkNestIcons: ; 91dcd
	ld a, [hVBlankCounter]
	ld e, a
	and $f
	ret nz
	ld a, e
	and $10
	jp z, ClearSprites

	hlcoord 0, 0
	ld de, Sprites
	ld bc, SpritesEnd - Sprites
	jp CopyBytes

; 91de9

.PlaceString_MonsNest: ; 91de9
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH
	ld a, " "
	call ByteFill
	call GetPokemonName
	hlcoord 1, 0
	call PlaceString
	ld h, b
	ld l, c
	ld de, .String_SNest
	jp PlaceString

; 91e16

.String_SNest:
	db "'S NEST@"
; 91e1e

.GetAndPlaceNest: ; 91e1e
	ld [wd003], a
	ld e, a
	farcall FindNest ; load nest landmarks into TileMap[0,0]
	decoord 0, 0
	ld hl, Sprites
.nestloop
	ld a, [de]
	and a
	jr z, .done_nest
	push de
	ld e, a
	push hl
	farcall GetLandmarkCoords
	pop hl
	; load into OAM
	ld a, d
	sub 4
	ld [hli], a
	ld a, e
	sub 4
	ld [hli], a
	ld a, $7f ; nest icon in this context
	ld [hli], a
	xor a
	ld [hli], a
	; next
	pop de
	inc de
	jr .nestloop

.done_nest
	ld hl, Sprites
	decoord 0, 0
	ld bc, SpritesEnd - Sprites
	jp CopyBytes

; 91e5a

.HideNestsShowPlayer: ; 91e5a
	call .CheckPlayerLocation
	ret c
	ld a, [wd002]
	ld e, a
	farcall GetLandmarkCoords
	ld c, e
	ld b, d
	ld de, .PlayerOAM
	ld hl, Sprites
.ShowPlayerLoop:
	ld a, [de]
	cp $80
	jr z, .clear_oam
	add b
	ld [hli], a
	inc de
	ld a, [de]
	add c
	ld [hli], a
	inc de
	ld a, [de]
	add $78 ; where the player's sprite is loaded
	ld [hli], a
	inc de
	push bc
	ld c, 4 ; PURPS
	ld a, [PlayerGender]
	bit 0, a
	jr z, .got_gender
	ld c, 0  ; RED
.got_gender
	ld a, c
	ld [hli], a
	pop bc
	jr .ShowPlayerLoop

.clear_oam
	ld hl, Sprites + 4 * 4
	ld bc, SpritesEnd - (Sprites + 4 * 4)
	xor a
	jp ByteFill

; 91e9c

.PlayerOAM: ; 91e9c
	db -1 * 8, -1 * 8,  0 ; top left
	db -1 * 8,  0 * 8,  1 ; top right
	db  0 * 8, -1 * 8,  2 ; bottom left
	db  0 * 8,  0 * 8,  3 ; bottom right
	db $80 ; terminator
; 91ea9

.CheckPlayerLocation: ; 91ea9
; Don't show the player's sprite if you're

; not in the same region as what's currently
; on the screen.
	ld a, [wd002]
	cp FAST_SHIP
	jr z, .orange
	cp KANTO_LANDMARK
	jr c, .orange
.kanto
	ld a, [wd003]
	and a
	jr z, .clear
	jr .ok

.orange
	ld a, [wd003]
	and a
	jr nz, .clear
.ok
	and a
	ret

.clear
	ld hl, Sprites
	ld bc, SpritesEnd - Sprites
	xor a
	call ByteFill
	scf
	ret

; 91ed0

.GetPlayerOrFastShipIcon: ; 91ed0
	ld a, [wd002]
	cp FAST_SHIP
	jr z, .FastShip
	farcall GetPlayerIcon
	ret

.FastShip:
	ld de, FastShipGFX
	ld b, BANK(FastShipGFX)
	ret
; 91ee4

TownMapBGUpdate: ; 91ee4
; Update BG Map tiles and attributes

; BG Map address
	ld a, l
	ld [hBGMapAddress], a
	ld a, h
	ld [hBGMapAddress + 1], a
; BG Map mode 2 (palettes)
	ld a, 2
	ld [hBGMapMode], a
; The BG Map is updated in thirds, so we wait
; 3 frames to update the whole screen's palettes.
	ld c, 3
	call DelayFrames
; Update BG Map tiles
	call WaitBGMap
; Turn off BG Map update
	xor a
	ld [hBGMapMode], a
	ret

; 91eff

FillOrangeMap: ; 91eff
	ld de, OrangeMap
	jr FillTownMap

FillKantoMap: ; 91f04
	ld de, KantoMap
FillTownMap: ; 91f07
	hlcoord 0, 0
.loop
	ld a, [de]
	cp -1
	ret z
	ld a, [de]
	ld [hli], a
	inc de
	jr .loop

; 91f13

TownMapPals: ; 91f13
; Assign palettes based on tile ids
	hlcoord 0, 0
	decoord 0, 0, AttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
.loop
; Current tile
	ld a, [hli]
	push hl
; HP/borders use palette 0
	cp $60
	jr nc, .pal0
; The palette data is condensed to nybbles,

; least-significant first.
	ld hl, .PalMap
	srl a
	jr c, .odd
; Even-numbered tile ids take the bottom nybble...
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [hl]
	and %111
	jr .update

.odd
; ...and odd ids take the top.
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [hl]
	swap a
	and %111
	jr .update

.pal0
	xor a
.update
	pop hl
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

.PalMap:
townmappals: MACRO
rept _NARG / 2
	dn \2, \1
	shift
	shift
endr
endm
	townmappals 1, 1, 1, 2, 2, 2, 6, 6, 6, 1, 1, 1, 1, 1, 1, 1
	townmappals 1, 1, 1, 2, 2, 2, 6, 3, 6, 1, 1, 5, 1, 1, 6, 6
	townmappals 1, 1, 1, 2, 2, 2, 6, 6, 6, 1, 1, 4, 1, 1, 6, 6
	townmappals 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 2, 2, 0, 0
; 91f7b

TownMapMon: ; 91f7b
; Draw the FlyMon icon at town map location in

; Get FlyMon species
	ld a, [wCurPartyMon]
	ld hl, PartySpecies
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	ld [wd265], a
; Get FlyMon icon
	ld e, 8 ; starting tile in VRAM
	farcall PokegearFlyMap_GetMonIcon
; Animation/palette
	depixel 0, 0
	ld a, SPRITE_ANIM_INDEX_00
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $8
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_SEQ_NULL
	ret

; 91fa6

TownMapPlayerIcon: ; 91fa6
; Draw the player icon at town map location in a
	push af
	farcall GetPlayerIcon
; Standing icon
	ld hl, VTiles0 tile $10
	ld c, 4 ; # tiles
	push de
	push bc
	call Request2bpp
; Walking icon
	pop bc
	pop de
	ld hl, 12 tiles
	add hl, de
	ld d, h
	ld e, l
	ld hl, VTiles0 tile $14
	call Request2bpp
; Animation/palette
	depixel 0, 0
	ld b, SPRITE_ANIM_INDEX_PURPLE_WALK ; Male
	ld a, [PlayerGender]
	bit 0, a
	jr z, .got_gender
	ld b, SPRITE_ANIM_INDEX_RED_WALK ; Female
.got_gender
	ld a, b
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $10
	pop af
	ld e, a
	push bc
	farcall GetLandmarkCoords
	pop bc
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], e
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], d
	ret

; 0x91ff2

LoadTownMapGFX: ; 91ff2
	ld hl, TownMapGFX
	ld de, VTiles2
	lb bc, BANK(TownMapGFX), $40
	jp DecompressRequest2bpp

; 91fff

TownMapGFX: ; f8ba0
INCBIN "gfx/town_map/town_map.w128.2bpp.lz"
; f8ea4

FastShipGFX: ; 90cb2
INCBIN "gfx/town_map/fast_ship.2bpp"
; 90d32

TownMapCursorGFX: ; 914dd
INCBIN "gfx/town_map/cursor.2bpp.lz"
; 9150d

OrangeMap: ; 91fff
INCBIN "gfx/town_map/orange.bin"
; 92168
KantoMap: ; 92168
INCBIN "gfx/town_map/kanto.bin"
; 922d1

DexMapNestIconGFX: ; 922d1
INCBIN "gfx/town_map/dexmap_nest_icon.2bpp"
