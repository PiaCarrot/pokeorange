ReturnFromMapSetupScript:: ; b8000
	xor a
	ld [hBGMapMode], a
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetWorldMapLocation
	ld [wCurrentLandmark], a

	call GetMapPermission
	cp GATE
	jr nz, .not_gate

	ld a, -1
	ld [wCurrentLandmark], a

.not_gate
	ld hl, wEnteredMapFromContinue
	bit 1, [hl]
	res 1, [hl]
	jr nz, .dont_do_map_sign

	call .CheckMovingWithinLandmark
	jr z, .dont_do_map_sign
	ld a, [wCurrentLandmark]
	ld [wPreviousLandmark], a

	call .CheckSpecialMap
	jr z, .dont_do_map_sign

; Display for 60 frames
	ld a, 60
	ld [wLandmarkSignTimer], a
	call LoadMapNameSignGFX
	call InitMapNameFrame
	farcall HDMATransfer_OnlyTopFourRows
	ret

.dont_do_map_sign
	ld a, [wCurrentLandmark]
	ld [wPreviousLandmark], a
	ld a, $90
	ld [rWY], a
	ld [hWY], a
	xor a
	ld [hLCDCPointer], a
	ret
; b8064

.CheckMovingWithinLandmark: ; b8064
	ld a, [wCurrentLandmark]
	ld c, a
	ld a, [wPreviousLandmark]
	cp c
	ret z
	cp SPECIAL_MAP
	ret
; b8070

.CheckSpecialMap: ; b8070
	cp -1
	ret z
	cp SPECIAL_MAP
	ret z
	ld a, $1
	and a
	ret
; b8089

;.CheckNationalParkGate: ; b8089
;	ld a, [MapGroup]
;	cp GROUP_ROUTE_35_NATIONAL_PARK_GATE
;	ret nz
;	ld a, [MapNumber]
;	cp MAP_ROUTE_35_NATIONAL_PARK_GATE
;	ret z
;	cp MAP_ROUTE_36_NATIONAL_PARK_GATE
;	ret
; b8098


PlaceMapNameSign:: ; b8098 (2e:4098)
	ld hl, wLandmarkSignTimer
	ld a, [hl]
	and a
	jr z, .disappear
	dec [hl]
	cp 60
	ret z
	cp 59
	jr nz, .skip2
	call InitMapNameFrame
	call PlaceMapNameCenterAlign
	farcall HDMATransfer_OnlyTopFourRows
.skip2
	ld a, $70
	ld [rWY], a
	ld [hWY], a
	ret

.disappear
	ld a, $90
	ld [rWY], a
	ld [hWY], a
	xor a
	ld [hLCDCPointer], a
	ret

LoadMapNameSignGFX: ; b80c6
	ld de, MapEntryFrameGFX
	ld hl, VTiles1 tile $70
	lb bc, BANK(MapEntryFrameGFX), $e
	jp Get2bpp
; b80d3

InitMapNameFrame: ; b80d3
	call InitMapSignAttrMap
	jr PlaceMapNameFrame
; b80e1

InitMapSignAttrMap: ; b8115
	hlcoord 0, 0
	ld de, AttrMap - TileMap
	add hl, de
	lb bc, 4, SCREEN_WIDTH
	ld a, BEHIND_BG | PAL_BG_TEXT
.loop
	push bc
	push hl
.inner_loop
	ld [hli], a
	dec c
	jr nz, .inner_loop
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	pop bc
	dec b
	jr nz, .loop
	ret
; b812f

PlaceMapNameFrame: ; b812f
	hlcoord 0, 0
	; top left
	ld a, $f1
	ld [hli], a
	; top row
	inc a ; ld a, $f2
	call .FillTopBottom
	; top right
	ld a, $f4
	ld [hli], a
	; left, first line
	inc a ; ld a, $f5
	ld [hli], a
	; first line
	call .FillMiddle
	; right, first line
	ld a, $fb
	ld [hli], a
	; left, second line
	ld a, $f6
	ld [hli], a
	; second line
	call .FillMiddle
	; right, second line
	ld a, $fc
	ld [hli], a
	; bottom left
	ld a, $f7
	ld [hli], a
	; bottom
	inc a ; ld a, $f8
	call .FillTopBottom
	; bottom right
	ld a, $fa
	ld [hl], a
	ret
; b815b

.FillMiddle: ; b815b
	ld a, $fd
	ld c, SCREEN_WIDTH - 2
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ret
; b8164

.FillTopBottom: ; b8164
	ld c, 5
	jr .enterloop

.continueloop
	ld [hli], a
	ld [hli], a

.enterloop
	inc a
	ld [hli], a
	ld [hli], a
	dec a
	dec c
	jr nz, .continueloop
	ret
; b8172

PlaceMapNameCenterAlign: ; b80e1 (2e:40e1)
	ld a, [wCurrentLandmark]
	ld e, a
	farcall GetLandmarkName
	call .GetNameLength
	ld a, SCREEN_WIDTH
	sub c
	srl a
	ld b, $0
	ld c, a
	hlcoord 0, 2
	add hl, bc
	ld de, StringBuffer1
	jp PlaceString

.GetNameLength: ; b8101 (2e:4101)
	ld c, 0
	push hl
	ld hl, StringBuffer1
.loop
	ld a, [hli]
	cp "@"
	jr z, .stop
	cp "%"
	jr z, .loop
	inc c
	jr .loop
.stop
	pop hl
	ret


CheckForHiddenItems: ; b8172
; Checks to see if there are hidden items on the screen that have not yet been found.  If it finds one, returns carry.
	call GetMapScriptHeaderBank
	ld [Buffer1], a
; Get the coordinate of the bottom right corner of the screen, and load it in Buffer3/Buffer4.
	ld a, [XCoord]
	add SCREEN_WIDTH / 4
	ld [Buffer4], a
	ld a, [YCoord]
	add SCREEN_HEIGHT / 4
	ld [Buffer3], a
; Get the pointer for the first signpost header in the map...
	ld hl, wCurrentMapSignpostHeaderPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
; ... before even checking to see if there are any signposts on this map.
	ld a, [wCurrentMapSignpostCount]
	and a
	jr z, .nosignpostitems
; For i = 1:wCurrentMapSignpostCount...
.loop
; Store the counter in Buffer2, and store the signpost header pointer in the stack.
	ld [Buffer2], a
	push hl
; Get the Y coordinate of the signpost.
	call .GetFarByte
	ld e, a
; Is the Y coordinate of the signpost on the screen?  If not, go to the next signpost.
	ld a, [Buffer3]
	sub e
	jr c, .next
	cp SCREEN_HEIGHT / 2
	jr nc, .next
; Is the X coordinate of the signpost on the screen?  If not, go to the next signpost.
	call .GetFarByte
	ld d, a
	ld a, [Buffer4]
	sub d
	jr c, .next
	cp SCREEN_WIDTH / 2
	jr nc, .next
; Is this signpost a hidden item?  If not, go to the next signpost.
	call .GetFarByte
	cp SIGNPOST_ITEM
	jr nz, .next
; Has this item already been found?  If not, set off the Itemfinder.
	ld a, [Buffer1]
	call GetFarHalfword
	ld a, [Buffer1]
	call GetFarHalfword
	ld d, h
	ld e, l
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	jr z, .itemnearby

.next
; Restore the signpost header pointer and increment it by the length of a signpost header.
	pop hl
	ld bc, 5
	add hl, bc
; Restore the signpost counter and decrement it.  If it hits zero, there are no hidden items in range.
	ld a, [Buffer2]
	dec a
	jr nz, .loop

.nosignpostitems
	xor a
	ret

.itemnearby
	pop hl
	scf
	ret
; b81e2

.GetFarByte: ; b81e2
	ld a, [Buffer1]
	call GetFarByte
	inc hl
	ret
; b81ea


TreeMonEncounter: ; b81ea
	xor a
	ld [TempWildMonSpecies], a
	ld [CurPartyLevel], a

	ld hl, TreeMonMaps
	call GetTreeMonSet
	jr nc, .no_battle

	call GetTreeMons
	jr nc, .no_battle

	call GetTreeMon
	jr nc, .no_battle

	ld a, BATTLETYPE_TREE
	ld [BattleType], a
	ld a, 1
	ld [ScriptVar], a
	ret

.no_battle
	xor a
	ld [ScriptVar], a
	ret
; b8219

RockMonEncounter: ; b8219

	xor a
	ld [TempWildMonSpecies], a
	ld [CurPartyLevel], a

	ld hl, RockMonMaps
	call GetTreeMonSet
	jr nc, .no_battle

	call GetTreeMons
	jr nc, .no_battle

	ld a, 10
	call RandomRange
	cp 4
	jr nc, .no_battle

	call SelectTreeMon
	jr nc, .no_battle

	ret

.no_battle
	xor a
	ret
; b823e

	db $05 ; ????

GetTreeMonSet: ; b823f
; Return carry and treemon set in a
; if the current map is in table hl.
	ld a, [MapNumber]
	ld e, a
	ld a, [MapGroup]
	ld d, a
.loop
	ld a, [hli]
	cp -1
	jr z, .not_in_table

	cp d
	jr nz, .skip2

	ld a, [hli]
	cp e
	jr nz, .skip1

	jr .in_table

.skip2
	inc hl
.skip1
	inc hl
	jr .loop

.not_in_table
	xor a
	ret

.in_table
	ld a, [hl]
	scf
	ret
; b825e

TreeMonMaps: ; b825e
treemon_map: macro
	map \1
	db  \2 ; treemon set
endm
	treemon_map VALENCIA_ISLAND, 1
	treemon_map ROUTE_49, 1
	treemon_map TANGELO_ISLAND, 1
	treemon_map ROUTE_50, 1
	treemon_map TANGELO_JUNGLE, 1
	treemon_map MIKAN_ISLAND, 1
	treemon_map MANDARIN_NORTH, 1
	treemon_map SUNBURST_ISLAND, 1
	treemon_map UNNAMED_ISLAND_1, 1
	treemon_map SEVEN_GRAPEFRUITS, 1
	treemon_map MORO_ISLAND, 1
	
	treemon_map MURCOTT_ISLAND, 2
	treemon_map UNNAMED_ISLAND_2, 2
	treemon_map TROVITA_ISLAND, 2
	treemon_map ROUTE_63_EAST_WEST, 2
	treemon_map ROUTE_63_NORTH_SOUTH, 2
	treemon_map ASCORBIA_ISLAND, 2
	
	treemon_map ROUTE_64, 3
	treemon_map BUTWAL_ISLAND_WEST, 3
	treemon_map BUTWAL_ISLAND_EAST, 3
	treemon_map ROUTE_66_EAST_WEST, 3
	treemon_map UNNAMED_ISLAND_3, 3
	treemon_map ROUTE_69_SOUTH, 3
	
	treemon_map PUMMELO_ISLAND, 4
	treemon_map TARROCO_ISLAND, 4
	db -1
; b82c5

RockMonMaps: ; b82c5
	treemon_map SEVEN_GRAPEFRUITS_UNDERWATER, 7
	treemon_map ROUTE_56_EAST, 6
	db -1
; b82d2

GetTreeMons: ; b82d2
; Return the address of TreeMon table a in hl.
; Return nc if table a doesn't exist.

	cp 8
	jr nc, .quit

	and a
	jr z, .quit

	ld e, a
	ld d, 0
	ld hl, TreeMons
	add hl, de
	add hl, de

	ld a, [hli]
	ld h, [hl]
	ld l, a

	scf
	ret

.quit
	xor a
	ret
; b82e8

TreeMons: ; b82e8
	dw TreeMons1
	dw TreeMons1
	dw TreeMons2
	dw TreeMons3
	dw TreeMons4
	dw TreeMons5
	dw RockMons1
	dw RockMons2
	dw TreeMons1

; Two tables each (normal, rare).
; Structure:
;	db  %, species, level

TreeMons1: ; b82fa
	db 50, KAKUNA,      20
	db 15, SPEAROW,     20
	db 15, PIKIPEK,      20
	db 10, BEEDRILL,    20
	db  5, MANKEY,      20
	db  5, LICKITUNG,   20
	db -1

	db 50, KAKUNA,      20
	db 15, SPEAROW,     20
	db 15, PIKIPEK,     20
	db 10, BEEDRILL,    20
	db  5, MANKEY,      20
	db  5, MUNCHLAX,    20
	db -1

TreeMons2: ; b8320
	db 50, VENONAT,     30
	db 15, SPEAROW,     30
	db 15, TRUMBEAK,    30
	db 10, EXEGGCUTE,   30
	db  5, MANKEY,      30
	db  5, LICKITUNG,   30
	db -1

	db 50, VENONAT,     30
	db 15, SPEAROW,     30
	db 15, TRUMBEAK,    30
	db 10, EXEGGCUTE,   30
	db  5, MANKEY,      30
	db  5, MUNCHLAX,    30
	db -1

TreeMons3: ; b8346
	db 50, VENOMOTH,    40
	db 15, FEAROW,      40
	db 15, TRUMBEAK,    40
	db 10, EXEGGCUTE,   40
	db  5, PRIMEAPE,    40
	db  5, LICKITUNG,   40
	db -1

	db 50, VENOMOTH,    40
	db 15, FEAROW,      40
	db 15, TRUMBEAK,    40
	db 10, EXEGGCUTE,   40
	db  5, PRIMEAPE,    40
	db  5, MUNCHLAX,    40
	db -1

TreeMons4: ; b836c
	db 50, VENOMOTH,    50
	db 15, TRUMBEAK,    50
	db 15, TOUCANNON,   50
	db 10, EXEGGCUTE,   50
	db  5, PRIMEAPE,    50
	db  5, LICKITUNG,   50
	db -1

	db 50, VENOMOTH,    50
	db 15, SPEAROW,     50
	db 15, FEAROW,      50
	db 10, EXEGGCUTE,   50
	db  5, PRIMEAPE,    50
	db  5, MUNCHLAX,    50
	db -1

TreeMons5: ; b8392
	db 50, PIDGEOTTO,   55
	db 15, FEAROW,      55
	db 15, BEEDRILL,    55
	db 10, BUTTERFREE,  55
	db  5, PRIMEAPE,    55
	db  5, PIDGEOT,     55
	db -1

	db 50, PIDGEOTTO,   55
	db 15, FEAROW,      55
	db 15, BEEDRILL,    55
	db 10, BUTTERFREE,  55
	db  5, PRIMEAPE,    55
	db  5, PIDGEOT,     55
	db -1

RockMons1: ; b83b8
	db 90, KRABBY,     30
	db 10, SHUCKLE,    30
	db -1

RockMons2: ; b83de
	db 90, KRABBY,     30
	db 10, STUNFISK,   30
	db -1
; b83e5

GetTreeMon: ; b83e5
	push hl
	call GetTreeScore
	pop hl
	and a
	jr z, .bad
	cp 1
	jr z, .good
	cp 2
	jr z, .rare
	ret

.bad
	ld a, 10
	call RandomRange
	and a
	jr nz, NoTreeMon
	jr SelectTreeMon

.good
	ld a, 10
	call RandomRange
	cp 5
	jr nc, NoTreeMon
	jr SelectTreeMon

.rare
	ld a, 10
	call RandomRange
	cp 8
	jr nc, NoTreeMon

.skip
	ld a, [hli]
	cp -1
	jr nz, .skip
	; fallthrough
; b841f

SelectTreeMon: ; b841f
; Read a TreeMons table and pick one monster at random.

	ld a, 100
	call RandomRange
.loop
	sub [hl]
	jr c, .ok
	inc hl
	inc hl
	inc hl
	jr .loop

.ok
	ld a, [hli]
	cp $ff
	jr z, NoTreeMon

	ld a, [hli]
	ld [TempWildMonSpecies], a
	ld a, [hl]
	ld [CurPartyLevel], a
	scf
	ret

NoTreeMon: ; b843b
	xor a
	ld [TempWildMonSpecies], a
	ld [CurPartyLevel], a
	ret
; b8443

GetTreeScore: ; b8443
	call .CoordScore
	ld [Buffer1], a
	call .OTIDScore
	ld [Buffer2], a
	ld c, a
	ld a, [Buffer1]
	sub c
	jr z, .rare
	jr nc, .ok
	add 10
.ok
	cp 5
	jr c, .good

.bad
	xor a
	ret

.good
	ld a, 1
	ret

.rare
	ld a, 2
	ret
; b8466

.CoordScore: ; b8466
	call GetFacingTileCoord
	ld hl, 0
	ld c, e
	ld b, 0
	ld a, d

	and a
	jr z, .next
.loop
	add hl, bc
	dec a
	jr nz, .loop
.next

	add hl, bc
	ld c, d
	add hl, bc

	ld a, h
	ld [hDividend], a
	ld a, l
	ld [hDividend + 1], a
	ld a, 5
	ld [hDivisor], a
	ld b, 2
	call Divide

	ld a, [hQuotient + 1]
	ld [hDividend], a
	ld a, [hQuotient + 2]
	ld [hDividend + 1], a
	ld a, 10
	ld [hDivisor], a
	ld b, 2
	call Divide

	ld a, [hQuotient + 3]
	ret
; b849d

.OTIDScore: ; b849d
	ld a, [PlayerID]
	ld [hDividend], a
	ld a, [PlayerID + 1]
	ld [hDividend + 1], a
	ld a, 10
	ld [hDivisor], a
	ld b, 2
	call Divide
	ld a, [hQuotient + 3]
	ret
; b84b3

LoadFishingGFX: ; b84b3
	ld a, [rVBK]
	push af
	ld a, $1
	ld [rVBK], a

	ld de, FishingGFX
	ld a, [PlayerGender]
	bit 0, a
	jr z, .got_gender
	ld de, KrisFishingGFX
.got_gender

	ld hl, VTiles0 tile $02
	call .LoadGFX
	ld hl, VTiles0 tile $06
	call .LoadGFX
	ld hl, VTiles0 tile $0a
	call .LoadGFX
	ld hl, VTiles1 tile $7c
	call .LoadGFX

	pop af
	ld [rVBK], a
	ret
; b84e3

.LoadGFX: ; b84e3
	lb bc, BANK(FishingGFX), 2
	push de
	call Get2bpp
	pop de
	ld hl, 2 tiles
	add hl, de
	ld d, h
	ld e, l
	ret
; b84f2

FishingGFX: ; b84f2
INCBIN "gfx/overworld/chris_fish.2bpp"
; b8582

KrisFishingGFX: ; b8582
INCBIN "gfx/overworld/kris_fish.2bpp"
; b8612
