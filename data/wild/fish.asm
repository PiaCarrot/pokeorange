FishGroups: ; 92488
	dbwwww 50 percent + 1, .Shore_Old,          .Shore_Good,          .Shore_Super,          .Shore_Master
	dbwwww 50 percent + 1, .Ocean_Old,          .Ocean_Good,          .Ocean_Super,          .Ocean_Master
	dbwwww 50 percent + 1, .Sewer_Old,          .Sewer_Good,          .Sewer_Super,          .Sewer_Master
	dbwwww 50 percent + 1, .Pond_Old,           .Pond_Good,           .Pond_Super,           .Pond_Master
	dbwwww 50 percent + 1, .Contest_Old,        .Contest_Good,        .Contest_Super,        .Contest_Master
	dbwwww 50 percent + 1, .Rind_Old,           .Rind_Good,           .Rind_Super,           .Rind_Master

.Shore_Old: ; 924e3
	db  70 percent + 1, KRABBY,     10
	db  85 percent + 1, TENTACOOL,  10
	db 100 percent,     GOLDEEN,    10
.Shore_Good: ; 924ec
	db  35 percent,     TENTACOOL,  20
	db  70 percent,     KRABBY,     20
	db  90 percent + 1, KRABBY,     20
	db 100 percent,     USE_TIME,    0
.Shore_Super: ; 924f8
	db  40 percent,     KRABBY,     30
	db  70 percent,     USE_TIME,    1
	db  90 percent + 1, KRABBY,     30
	db 100 percent,     KINGLER,    30
.Shore_Master: ; 924f8
	db  40 percent,     KRABBY,     50
	db  70 percent,     USE_TIME,    2
	db  90 percent + 1, KINGLER,     50
	db 100 percent,     KINGLER,    50

.Ocean_Old: ; 92504
	db  70 percent + 1, KRABBY,     10
	db  85 percent + 1, SHELLDER,   10
	db 100 percent,     GOLDEEN,    10
.Ocean_Good: ; 9250d
	db  35 percent,     SHELLDER,   20
	db  70 percent,     TENTACOOL,  20
	db  90 percent + 1, CHINCHOU,   20
	db 100 percent,     USE_TIME,    3
.Ocean_Super: ; 92519
	db  40 percent,     CHINCHOU,   30
	db  70 percent,     USE_TIME,    4
	db  90 percent + 1, TENTACRUEL, 30
	db 100 percent,     LANTURN,    30
.Ocean_Master: ; 92519
	db  40 percent,     CHINCHOU,   50
	db  70 percent,     USE_TIME,    5
	db  90 percent + 1, TENTACRUEL, 50
	db 100 percent,     LANTURN,    50

.Sewer_Old: ; 92525
	db  70 percent + 1, GRIMER,     10
	db  85 percent + 1, POLIWAG,    10
	db 100 percent,     GOLDEEN,    10
.Sewer_Good: ; 9252e
	db  70 percent + 1, GRIMER,     20
	db  85 percent + 1, POLIWAG,    20
	db 100 percent,     GOLDEEN,    20
.Sewer_Super: ; 9253a
	db  70 percent + 1, MUK,        30
	db  85 percent + 1, POLIWHIRL,  30
	db 100 percent,     SEAKING,    30
.Sewer_Master: ; 9253a
	db  40 percent,     MUK,        50
	db  70 percent,     USE_TIME,   9
	db  90 percent + 1, GOLDEEN,    50
	db 100 percent,     SEAKING,    50

.Pond_Old: ; 92546
	db  70 percent + 1, GOLDEEN,    10
	db  85 percent + 1, POLIWAG,    10
	db 100 percent,     GOLDEEN,    10
.Pond_Good: ; 9254f
	db  35 percent,     MARILL,     20
	db  70 percent,     GOLDEEN,    20
	db 100 percent,     POLIWAG,    20
.Pond_Super: ; 9255b
	db  70 percent,     POLIWHIRL,  30
	db  90 percent + 1, SEAKING,    30
	db 100 percent,     MARILL,     30
.Pond_Master: ; 9255b
	db  70 percent,     AZUMARILL,  50
	db  90 percent + 1, POLITOED,   50
	db 100 percent,     POLIWRATH,  50
	
.Contest_Old: ; 92504
	db  70 percent + 1, FINNEON,    10
	db  85 percent + 1, GOLDEEN,    10
	db 100 percent,     REMORAID,   10
.Contest_Good: ; 9250d
	db  35 percent,     USE_TIME,   10
	db  70 percent,     FINNEON,    20
	db  90 percent + 1, GOLDEEN,    20
	db 100 percent,     CHINCHOU,   20
.Contest_Super: ; 92519
	db  40 percent,     USE_TIME,   11
	db  70 percent,     LANTURN,    30
	db  90 percent + 1, LUMINEON,   30
	db 100 percent,     SEAKING,    30
.Contest_Master: ; 92519
	db  40 percent,     USE_TIME,   12
	db  70 percent,     LANTURN,    50
	db  90 percent + 1, LUMINEON,   50
	db 100 percent,     SEAKING,    50
	
.Rind_Old: ; 92504
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     MAGIKARP,   10
.Rind_Good: ; 9250d
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     MAGIKARP,   20
	db  90 percent + 1, MAGIKARP,   20
	db 100 percent,     USE_TIME,    6
.Rind_Super: ; 92519
	db  40 percent,     MAGIKARP,   30
	db  70 percent,     USE_TIME,    7
	db  90 percent + 1, MAGIKARP,   30
	db 100 percent,     MAGIKARP,   30
.Rind_Master: ; 92519
	db  40 percent,     MAGIKARP,   50
	db  70 percent,     USE_TIME,    8
	db  90 percent + 1, MAGIKARP,   50
	db 100 percent,     MAGIKARP,   50

TimeFishGroups: ; 9266f
	;  day              nite
	db CORSOLA,    20,  STARYU,     20 ;Shore Good     0
	db CORSOLA,    30,  STARYU,     30 ;Shore Super    1
	db CORSOLA,    50,  STARMIE,    50 ;Shore Master   2
	db MANTINE,    20,  HORSEA,     20 ;Ocean Good     3
	db MANTINE,    30,  SEADRA,     30 ;Ocean Super    4
	db MANTINE,    50,  KINGDRA,    50 ;Ocean Master   5
	db GYARADOS,   20,  GYARADOS,   20 ;Rind Good      6
	db GYARADOS,   30,  GYARADOS,   30 ;Rind Super     7
	db GYARADOS,   50,  GYARADOS,   50 ;Rind Master    8
	db STUNFISK,   50,  STUNFISK,   50 ;Sewer Master   9
	db QWILFISH,   20,  QWILFISH,   20 ;Contest Good   10
	db QWILFISH,   30,  QWILFISH,   30 ;Contest Super  11
	db QWILFISH,   50,  QWILFISH,   50 ;Contest Master 12
; 926c7

; Goes trough all fishgroups and returns carry if the mon is fishable
; Input: b is fishgroup and c is rod (Old - 0, Good - 1, Super - 2, Master - 3)
IsFishableMon:

;Get fishgroup
	dec b
	ld e, b
	ld d, 0
	ld hl, FishGroups
rept 9
	add hl, de
endr
	inc hl

;Get rod (note: Pokémon Crystal indexes rods starting at 0, here we start at 1 since we going in a loop from master to old rod and using dec c to know we are done)
	ld e, c
	ld d, 0
	add hl, de
	add hl, de

	ld a, [hli]
	ld h, [hl]
	ld l, a

	;hl now points to the desired fishgroup for the rod

	ld a, [wNamedObjectIndexBuffer] ; current species
	ld b, a
.loop
	ld a, [hli] ; encounter rate (-1 for the last mon)
	cp -1
	ld a, [hli] ; species
	jr z, .lastFishMon
	cp b
	jr z, .fishable
	cp 0
	ld a, [hli] ; get level/timetable index. hl now points to next encounter rate
	jr nz, .loop ;if this wasn't a timetable encounter or a fishable mon, loop
	
	call _IsFishableMon_Timetable
	jr c, .fishable
	jr .loop

.lastFishMon
	cp b
	jr z, .fishable
	cp 0
	jr nz, .not_fishable
	ld a, [hli] ; get level/timetable index
	call _IsFishableMon_Timetable
	jr c, .fishable
.not_fishable
	xor a ;unsets carry flag
	ret

.fishable
	scf ;set carry flag
	ret

; Needs to be called from IsFishableMon
_IsFishableMon_Timetable:
	;check timetable
	push hl
	ld hl, TimeFishGroups
	ld e, a ;a still has the index in the table
	ld d, 0
rept 4
	add hl, de
endr
	;hl should now point at the correct index
	ld a, [hli] ; day species
	inc hl
	cp b
	jr z, .timefishable
	ld a, [hl] ; night species
	cp b
	jr z, .timefishable
	pop hl
	xor a
	ret

.timefishable
	pop hl
	scf
	ret

; Input:
;	b is fishgroup
;	c is rod ( 0, Good - 1, Super - 2, Master - 3).
;	hl points to the next empty landmark in the list
; 	Return: hl will hold the next empty landmark in the list
_CheckAddFishgroup:
	push hl
	push bc
	call IsFishableMon
	pop bc
	pop hl
	call c, _AddFishableLandmarks
	ret

; Input:
;	b is FISHGROUP
;	hl has the current empty landmark address
;	on return hl has the current empty landmark adress
;
; Note: there are 61 landmarks in the game we have to go trough, we can use KANTO_LANDMARK
_AddFishableLandmarks:
	ld e, 0
.loop
	inc e ; landmark 0 is SpecialMap so we don't care
	ld a, e
	cp KANTO_LANDMARK
	ret z ; if we hit Kanto, we are done
	push hl
	push bc
	push de
	farcall GetLandmarkFishGroup ; Return fishgroup of landmark e in d
	ld a, d
	pop de
	pop bc ;restore fishgroup
	pop hl ;restore landmark address
	cp b
	jr nz, .loop ; if it is a different fishgroup, keep going
	
	call _IsLandmarkPresent
	jr c, .loop ; if the landmark is already on the list, continue
	
	;fishgroup matches, add landmark
	ld a, e
	or WILD_FISH_MAP_MASK
	ld [hli], a ;store landmark and increment pointer
	jr .loop

; Input: landmark in e
; Goes through TileMap and checks if the landmark has already been added.
; If the nest is present in grass/underwater/surfing/fishing only the first one added is preserved since only one icon can appear on the map
; returns carry if present
_IsLandmarkPresent:
	push hl
	push bc
	push de

	ld b, e ; landmark

	ld hl, TileMap
.loop
	ld a, [hli]
	and LANDMARK_MASK
	cp b
	jr z, .found
	cp 0
	jr z, .end
	jr .loop
	
.found
	pop de
	pop bc
	pop hl
	scf
	ret
.end
	pop de
	pop bc
	pop hl
	xor a
	ret

;This function is called after FindNest, goes trhough the landmark list and unless the landmark is already in the list, appends another landmark to the list.
FindFishNest:
	
	;First we find the last entry in the landmark list (ends at 0x00)
	ld hl, TileMap
.loop
	ld a, [hli]
	cp 0
	jr z, .found
	jr .loop
	
.found
	dec hl ; hl now points to the first empty landmark, store it

;Code to check all groups for a single rod
	ld b, FISHGROUP_RIND
	ld a, [EnemyMonUnused] ;0 = wild, 1 = vine/rock, 2 = old, 3 = super, 4 = master
	sub 2 ; convert EnemyMonUnused to rod index
	cp a, 4
	ret nc ; Do nothing if invalid rod (a >= 4)
	ld c, a
.groupLoop
	push bc
	call _CheckAddFishgroup
	pop bc
	dec b
	jr nz, .groupLoop
	ret

;code to check all groups and rods
;	ld b, FISHGROUP_RIND
;	ld c, 4 ;start with master rod
;.loop2
;	push bc
;	call _CheckAddFishgroup
;	pop bc
;	dec c
;	jr nz, .loop2 ;if we still have rods, do it again
;	dec b
;	ld c, 4 ; next fishgroup and start with master rod again
;	jr nz, .loop2
;	ret
