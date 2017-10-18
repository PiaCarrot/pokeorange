
SpawnPoints: ; 0x152ab

spawn: MACRO
; map, x, y
	map \1
	db \2, \3
ENDM

	spawn KRISS_HOUSE_2F,  3,  3
	spawn VALENCIA_ISLAND, 13,  6
	spawn TANGELO_ISLAND,  19,  10
	spawn MIKAN_ISLAND,    11, 30
	spawn ROUTE_52,        13, 78
	spawn MANDARIN_NORTH,  7, 16
	spawn SUNBURST_ISLAND, 27, 28
	spawn ROUTE_56_WEST,   35, 8
	spawn KINNOW_ISLAND,   17, 10
	spawn NAVEL_ISLAND,    16, 22
	spawn MORO_ISLAND,     7, 12
	spawn MURCOTT_ISLAND,  25, 18
;	spawn TROVITOPOLIS,    0,  0
;	spawn ASCORBIA_ISLAND, 0,  0
;	spawn KUMQUAT_ISLAND,  0,  0
;	spawn PUMMELO_ISLAND,  0,  0
;	spawn HAMLIN_ISLAND,   0,  0
;	spawn SHAMOUTI_ISLAND, 0,  0
 	spawn N_A,             -1, -1


LoadSpawnPoint: ; 1531f
	; loads the spawn point in wd001
	push hl
	push de
	ld a, [wd001]
	cp SPAWN_N_A
	jr z, .spawn_n_a
	ld l, a
	ld h, 0
rept 2 ; multiply hl by 4
	add hl,hl
endr
	ld de, SpawnPoints
	add hl, de
	ld a, [hli]
	ld [MapGroup], a
	ld a, [hli]
	ld [MapNumber], a
	ld a, [hli]
	ld [XCoord], a
	ld a, [hli]
	ld [YCoord], a
.spawn_n_a
	pop de
	pop hl
	ret
; 15344


IsSpawnPoint: ; 15344
; Checks if the map loaded in de is a spawn point.  Returns carry if it's a spawn point.
	ld hl, SpawnPoints
	ld c, 0
.loop
	ld a, [hl]
	cp SPAWN_N_A
	jr z, .nope
	cp d
	jr nz, .next
	inc hl
	ld a, [hld]
	cp e
	jr z, .yes

.next
	push bc
	ld bc, 4 ; length of a spawn table entry
	add hl, bc
	pop bc
	inc c
	jr .loop

.nope
	and a
	ret

.yes
	scf
	ret
; 15363
