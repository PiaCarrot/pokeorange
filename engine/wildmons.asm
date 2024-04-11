LoadWildMonData: ; 29ff8
	call _GrassWildmonLookup
	jr c, .copy
	ld hl, wMornEncounterRate
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	jr .done_copy

.copy
	inc hl
	inc hl
	ld de, wMornEncounterRate
	ld bc, 3
	call CopyBytes
.done_copy
	call _WaterWildmonLookup
	ld a, 0
	jr nc, .no_copy
	inc hl
	inc hl
	ld a, [hl]
.no_copy
	ld [wWaterEncounterRate], a
	ret

FindNest: ; 2a01f
; Parameters:
; e: 0 = Johto, 1 = Kanto
; wNamedObjectIndexBuffer: species
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	call ByteFill
	ld a, e
	and a
	jr nz, .kanto
	decoord 0, 0
	ld hl, JohtoGrassWildMons
	call .FindGrass
	ld hl, JohtoWaterWildMons
	call .FindWater
	call .RoamMon1
	jp .RoamMon2

.kanto
	decoord 0, 0
	ld hl, KantoGrassWildMons
	call .FindGrass
	ld hl, KantoWaterWildMons
	jp .FindWater
; 2a052

.FindGrass: ; 2a052
	ld a, [hl]
	cp -1
	ret z
	push hl
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	inc hl
	inc hl
	inc hl
	ld a, NUM_WILDMONS_PER_AREA_TIME_OF_DAY * 3
	call .SearchMapForMon
	jr nc, .next_grass
	ld [de], a
	inc de

.next_grass
	pop hl
	ld bc, WILDMON_GRASS_STRUCTURE_LENGTH
	add hl, bc
	jr .FindGrass
; 2a06e

.FindWater: ; 2a06e
	ld a, [hl]
	cp -1
	ret z
	push hl
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	inc hl
	ld a, 3
	call .SearchMapForMon
	jr nc, .next_water
	ld [de], a
	inc de

.next_water
	pop hl
	ld bc, 3 * 3
	add hl, bc
	jr .FindWater
; 2a088

.SearchMapForMon: ; 2a088
	inc hl
.ScanMapLoop:
	push af
	ld a, [wNamedObjectIndexBuffer]
	cp [hl]
	jr z, .found
	inc hl
	inc hl
	pop af
	dec a
	jr nz, .ScanMapLoop
	and a
	ret

.found
	pop af
	; fallthrough

.AppendNest: ; 2a09c
	push de
	call GetWorldMapLocation
	ld c, a
	hlcoord 0, 0
	ld de, SCREEN_WIDTH * SCREEN_HEIGHT
.AppendNestLoop:
	ld a, [hli]
	cp c
	jr z, .found_nest
	dec de
	ld a, e
	or d
	jr nz, .AppendNestLoop
	ld a, c
	pop de
	scf
	ret

.found_nest
	pop de
	and a
	ret
; 2a0b7

.RoamMon1: ; 2a0b7
	ld a, [wRoamMon1Species]
	ld b, a
	ld a, [wNamedObjectIndexBuffer]
	cp b
	ret nz
	ld a, [wRoamMon1MapGroup]
	ld b, a
	ld a, [wRoamMon1MapNumber]
	ld c, a
	call .AppendNest
	ret nc
	ld [de], a
	inc de
	ret
; 2a0cf

.RoamMon2: ; 2a0cf
	ld a, [wRoamMon2Species]
	ld b, a
	ld a, [wNamedObjectIndexBuffer]
	cp b
	ret nz
	ld a, [wRoamMon2MapGroup]
	ld b, a
	ld a, [wRoamMon2MapNumber]
	ld c, a
	call .AppendNest
	ret nc
	ld [de], a
	inc de
	ret
; 2a0e7

TryWildEncounter:: ; 2a0e7
; Try to trigger a wild encounter.
	call .EncounterRate
	jr nc, .no_battle
	call ChooseWildEncounter
	jr nz, .no_battle
	call CheckRepelEffect
	jr nc, .no_battle
	xor a
	ret

.no_battle
	xor a ; BATTLETYPE_NORMAL
	ld [TempWildMonSpecies], a
	ld [BattleType], a
	ld a, 1
	and a
	ret
; 2a103

.EncounterRate: ; 2a103
	call GetMapEncounterRate
	call ApplyCleanseTagEffectOnEncounterRate
	call Random
	cp b
	ret
; 2a111

GetMapEncounterRate: ; 2a111
	ld hl, wMornEncounterRate
	call CheckOnWater
	ld a, 3
	jr z, .ok
	ld a, [TimeOfDay]
.ok
	ld c, a
	ld b, 0
	add hl, bc
	ld b, [hl]
	ret
; 2a124

ApplyCleanseTagEffectOnEncounterRate:: ; 2a138
; Cleanse Tag halves encounter rate.
	ld hl, PartyMon1Item
	ld de, PARTYMON_STRUCT_LENGTH
	ld a, [PartyCount]
	ld c, a
.loop
	ld a, [hl]
	cp CLEANSE_TAG
	jr z, .cleansetag
	add hl, de
	dec c
	jr nz, .loop
	ret

.cleansetag
	srl b
	ret
; 2a14f

ChooseWildEncounter: ; 2a14f
	call LoadWildMonDataPointer
	jp nc, .nowildbattle
	call CheckEncounterRoamMon
	jp c, .startwildbattle

	inc hl
	inc hl
	inc hl
	call CheckOnWater
	ld de, .WaterMonTable
	jr z, .watermon
	inc hl
	inc hl
	ld a, [TimeOfDay]
	ld bc, $e
	call AddNTimes
	ld de, .GrassMonTable

.watermon
; hl contains the pointer to the wild mon data, let's save that to the stack
	push hl
.randomloop
	call Random
	cp 100
	jr nc, .randomloop
	inc a ; 1 <= a <= 100
	ld b, a
	ld h, d
	ld l, e
; This next loop chooses which mon to load up.
.prob_bracket_loop
	ld a, [hli]
	cp b
	jr nc, .got_it
	inc hl
	jr .prob_bracket_loop

.got_it
	ld c, [hl]
	ld b, 0
	pop hl
	add hl, bc ; this selects our mon
	ld a, [hli]
	ld b, a
; If the Pokemon is encountered by surfing, we need to give the levels some variety.
	call CheckOnWater
	jr nz, .ok
; Check if we buff the wild mon, and by how much.
	call Random
	cp 35 percent
	jr c, .ok
	inc b
	cp 65 percent
	jr c, .ok
	inc b
	cp 85 percent
	jr c, .ok
	inc b
	cp 95 percent
	jr c, .ok
	inc b
; Store the level
.ok
	ld a, b
	ld [CurPartyLevel], a
	ld b, [hl]
	ld a, b
	call ValidateTempWildMonSpecies
	jr nc, .loadwildmon

.nowildbattle
	ld a, 1
	and a
	ret

.loadwildmon
	ld a, b
	ld [TempWildMonSpecies], a

.startwildbattle
	xor a
	ret
; 2a1cb

.GrassMonTable: ; 2a1cb
	db 30,  $0 ; 30% chance
	db 60,  $2 ; 30% chance
	db 80,  $4 ; 20% chance
	db 90,  $6 ; 10% chance
	db 95,  $8 ;  5% chance
	db 99,  $a ;  4% chance
	db 100, $c ;  1% chance
; 2a1d9

.WaterMonTable: ; 2a1d9
	db 60,  $0 ; 60% chance
	db 90,  $2 ; 30% chance
	db 100, $4 ; 10% chance
; 2a1df

CheckRepelEffect:: ; 2a1df
; If there is no active Repel, there's no need to be here.
	ld hl, wRepelEffect
	ld a, [hli]
	or [hl]
	jr z, .encounter
; Get the first Pokemon in your party that isn't fainted.
	ld hl, PartyMon1HP
	ld bc, PARTYMON_STRUCT_LENGTH - 1
.loop
	ld a, [hli]
	or [hl]
	jr nz, .ok
	add hl, bc
	jr .loop

.ok
; to PartyMonLevel
rept 4
	dec hl
endr

	ld a, [CurPartyLevel]
	cp [hl]
	jr nc, .encounter
	and a
	ret

.encounter
	scf
	ret
; 2a200

LoadWildMonDataPointer: ; 2a200
	call CheckOnWater
	jr z, _WaterWildmonLookup

_GrassWildmonLookup: ; 2a205
	ld hl, SwarmGrassWildMons
	ld bc, GRASS_WILDDATA_LENGTH
	call _SwarmWildmonCheck
	ret c
	ld hl, JohtoGrassWildMons
	ld de, KantoGrassWildMons
	call _JohtoWildmonCheck
	ld bc, GRASS_WILDDATA_LENGTH
	jr _NormalWildmonOK

_WaterWildmonLookup: ; 2a21d
	ld hl, SwarmWaterWildMons
	ld bc, WATER_WILDDATA_LENGTH
	call _SwarmWildmonCheck
	ret c
	ld hl, JohtoWaterWildMons
	ld de, KantoWaterWildMons
	call _JohtoWildmonCheck
	ld bc, WATER_WILDDATA_LENGTH
	jr _NormalWildmonOK

_JohtoWildmonCheck:
	call IsInJohto
	and a
	ret z
	ld h, d
	ld l, e
	ret

_SwarmWildmonCheck:
	call CopyCurrMapDE
	push hl
	ld hl, SwarmFlags
	bit 2, [hl]
	pop hl
	jr z, _NoSwarmWildmon
	ld a, [wYanmaMapGroup]
	cp d
	jr nz, _NoSwarmWildmon
	ld a, [wYanmaMapNumber]
	cp e
	jr nz, _NoSwarmWildmon
	call LookUpWildmonsForMapDE
	jr nc, _NoSwarmWildmon
	scf
	ret

_NoSwarmWildmon:
	and a
	ret

_NormalWildmonOK:
	call CopyCurrMapDE
	jr LookUpWildmonsForMapDE
; 2a27f

CopyCurrMapDE: ; 2a27f
	ld a, [MapGroup]
	ld d, a
	ld a, [MapNumber]
	ld e, a
	ret
; 2a288

LookUpWildmonsForMapDE: ; 2a288
.loop
	push hl
	ld a, [hl]
	inc a
	jr z, .nope
	ld a, d
	cp [hl]
	jr nz, .next
	inc hl
	ld a, e
	cp [hl]
	jr z, .yup

.next
	pop hl
	add hl, bc
	jr .loop

.nope
	pop hl
	and a
	ret

.yup
	pop hl
	scf
	ret
; 2a2a0


InitRoamMons: ; 2a2a0
; initialize wRoamMon structs

; species
	ld a, LATIAS
	ld [wRoamMon1Species], a
	ld a, LATIOS
	ld [wRoamMon2Species], a

; level
	ld a, 60
	ld [wRoamMon1Level], a
	ld [wRoamMon2Level], a
;	ld [wRoamMon3Level], a

; latias starting map
	ld a, GROUP_ROUTE_49
	ld [wRoamMon1MapGroup], a
	ld a, MAP_ROUTE_49
	ld [wRoamMon1MapNumber], a

; latios starting map
	ld a, GROUP_ROUTE_69_SOUTH
	ld [wRoamMon2MapGroup], a
	ld a, MAP_ROUTE_69_SOUTH
	ld [wRoamMon2MapNumber], a
	
; hp
	xor a ; generate new stats
	ld [wRoamMon1HP], a
	ld [wRoamMon2HP], a
;	ld [wRoamMon3HP], a

	ret
; 2a2ce


CheckEncounterRoamMon: ; 2a2ce
	push hl
; Don't trigger an encounter if we're on water.
	;call CheckOnWater
	;jr z, .DontEncounterRoamMon
; Load the current map group and number to de
	call CopyCurrMapDE
; Randomly select a beast.
	call Random
	cp 100 ; 25/64 chance 39% chance to encounter the roammer if it lies in the same map
	jr nc, .DontEncounterRoamMon
	ld a, 1 ;check the rommer #2 first
	jr nz, .checkmap
	
.nextroamer
	ld a, c
	cp 0
	jr z, .DontEncounterRoamMon
	dec a
	
.checkmap
; Compare its current location with yours
	ld hl, wRoamMon1MapGroup
	ld c, a
	ld b, 0
	ld a, 8 ; length of the RoamMon struct ;in orange the struct is 8 bytes long!
	call AddNTimes
	ld a, d
	cp [hl]
	jr nz, .nextroamer
	inc hl
	ld a, e
	cp [hl]
	jr nz, .DontEncounterRoamMon
; We've decided to take on a beast, so stage its information for battle.
	dec hl
	dec hl
	dec hl
	ld a, [hli]
	ld [TempWildMonSpecies], a
	ld a, [hl]
	ld [CurPartyLevel], a
	ld a, BATTLETYPE_ROAMING
	ld [BattleType], a

	pop hl
	scf
	ret

.DontEncounterRoamMon:
	pop hl
	and a
	ret
; 2a30d


UpdateRoamMons: ; 2a30d
	ld a, [wRoamMon1MapGroup]
	cp GROUP_N_A
	jr z, .SkipRaikou
	ld b, a
	ld a, [wRoamMon1MapNumber]
	ld c, a
	call .Update
	ld a, b
	ld [wRoamMon1MapGroup], a
	ld a, c
	ld [wRoamMon1MapNumber], a

.SkipRaikou:
	ld a, [wRoamMon2MapGroup]
	cp GROUP_N_A
	jr z, .SkipEntei
	ld b, a
	ld a, [wRoamMon2MapNumber]
	ld c, a
	call .Update
	ld a, b
	ld [wRoamMon2MapGroup], a
	ld a, c
	ld [wRoamMon2MapNumber], a

.SkipEntei:
	ld a, [wRoamMon3MapGroup]
	cp GROUP_N_A
	jr z, .SkipSuicune
	ld b, a
	ld a, [wRoamMon3MapNumber]
	ld c, a
	call .Update
	ld a, b
	ld [wRoamMon3MapGroup], a
	ld a, c
	ld [wRoamMon3MapNumber], a

.SkipSuicune:
	jp _BackUpMapIndices
; 2a355


.Update: ; 2a355
	ld hl, RoamMaps
.loop
; Are we at the end of the table?
	ld a, [hl]
	cp -1
	ret z
; Is this the correct entry?
	ld a, b
	cp [hl]
	jr nz, .next
	inc hl
	ld a, c
	cp [hl]
	jr z, .yes
; We don't have the correct entry yet, so let's continue.  A 0 terminates each entry.
.next
	ld a, [hli]
	and a
	jr nz, .next
	jr .loop

; We have the correct entry now, so let's choose a random map from it.
.yes
	inc hl
	ld d, h
	ld e, l
.update_loop
	ld h, d
	ld l, e
; Choose which map to warp to.
	call Random
	and $1f ; 1/8n chance it moves to a completely random map, where n is the number of roaming connections from the current map.
	jr z, JumpRoamMon
	and 3
	cp [hl]
	jr nc, .update_loop ; invalid index, try again
	inc hl
	ld c, a
	ld b, $0
	add hl, bc
	add hl, bc
	ld a, [wRoamMons_LastMapGroup]
	cp [hl]
	jr nz, .done
	inc hl
	ld a, [wRoamMons_LastMapNumber]
	cp [hl]
	jr z, .update_loop
	dec hl

.done
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ret

JumpRoamMons: ; 2a394
	ld a, [wRoamMon1MapGroup]
	cp GROUP_N_A
	jr z, .SkipRaikou
	call JumpRoamMon
	ld a, b
	ld [wRoamMon1MapGroup], a
	ld a, c
	ld [wRoamMon1MapNumber], a
.SkipRaikou:

	ld a, [wRoamMon2MapGroup]
	cp GROUP_N_A
	jr z, .SkipEntei
	call JumpRoamMon
	ld a, b
	ld [wRoamMon2MapGroup], a
	ld a, c
	ld [wRoamMon2MapNumber], a
.SkipEntei:

	ld a, [wRoamMon3MapGroup]
	cp GROUP_N_A
	jr z, .SkipSuicune
	call JumpRoamMon
	ld a, b
	ld [wRoamMon3MapGroup], a
	ld a, c
	ld [wRoamMon3MapNumber], a
.SkipSuicune:

	jp _BackUpMapIndices

JumpRoamMon: ; 2a3cd
.loop
	ld hl, RoamMaps
.innerloop1 ; This loop is completely unnecessary.
	call Random ; Choose a random number
	and $f ; Take the lower nybble only.  This gives a number between 0 and 15.
	cp NUM_ROAMMON_MAPS ; If the number is greater than or equal to 16, loop back and try again.
	jr nc, .innerloop1 ; I'm sure you can guess why this check is bogus.
	inc a
	ld b, a
.innerloop2 ; Loop to get hl to the address of the chosen roam map.
	dec b
	jr z, .ok
.innerloop3 ; Loop to skip the current roam map, which is terminated by a 0.
	ld a, [hli]
	and a
	jr nz, .innerloop3
	jr .innerloop2
; Check to see if the selected map is the one the player is currently in.  If so, try again.
.ok
	ld a, [MapGroup]
	cp [hl]
	jr nz, .done
	inc hl
	ld a, [MapNumber]
	cp [hl]
	jr z, .loop
	dec hl
; Return the map group and number in bc.
.done
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ret
; 2a3f6

_BackUpMapIndices: ; 2a3f6
	ld a, [wRoamMons_CurrentMapNumber]
	ld [wRoamMons_LastMapNumber], a
	ld a, [wRoamMons_CurrentMapGroup]
	ld [wRoamMons_LastMapGroup], a
	ld a, [MapNumber]
	ld [wRoamMons_CurrentMapNumber], a
	ld a, [MapGroup]
	ld [wRoamMons_CurrentMapGroup], a
	ret
; 2a40f

RoamMaps: ; 2a40f
; Maps that roaming monsters can be on,
; and possible maps they can jump to.
; Notably missing are Route 40 and
; Route 41, which are water routes.

NUM_ROAMMON_MAPS EQU 5 ;total number of roam_map entries

	roam_map ROUTE_49, 3, ROUTE_50, ROUTE_51, ROUTE_52
	roam_map ROUTE_55, 3, ROUTE_53, ROUTE_54, ROUTE_56_WEST
	roam_map ROUTE_57, 4, UNNAMED_ISLAND_1,  ROUTE_58, SEVEN_GRAPEFRUITS, ROUTE_59
	roam_map ROUTE_60, 3, ROUTE_61, UNNAMED_ISLAND_2, ROUTE_62
	roam_map ROUTE_65, 4, ROUTE_64, ROUTE_63_EAST_WEST, BUTWAL_ISLAND_WEST, ROUTE_66_EAST_WEST
	roam_map UNNAMED_ISLAND_3, 3, ROUTE_67, ROUTE_68, ROUTE_69_SOUTH
	db -1
; 2a4a0

ValidateTempWildMonSpecies: ; 2a4a0
	and a
	jr z, .nowildmon ; = 0
	cp NUM_POKEMON + 1 ; 252
	jr nc, .nowildmon ; >= 252
	and a ; 1 <= Species <= 251
	ret

.nowildmon
	scf
	ret
; 2a4ab


JohtoGrassWildMons: ; 0x2a5e9
INCLUDE "data/wild/johto_grass.asm"

JohtoWaterWildMons: ; 0x2b11d
INCLUDE "data/wild/johto_water.asm"

KantoGrassWildMons: ; 0x2b274
INCLUDE "data/wild/kanto_grass.asm"

KantoWaterWildMons: ; 0x2b7f7
INCLUDE "data/wild/kanto_water.asm"

SwarmGrassWildMons: ; 0x2b8d0
INCLUDE "data/wild/swarm_grass.asm"

SwarmWaterWildMons: ; 0x2b92f
INCLUDE "data/wild/swarm_water.asm"
