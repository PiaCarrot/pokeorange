CheckWarpCollision:: ; 1499a
; Is this tile a warp?
	ld a, [PlayerStandingTile]
	cp COLL_HOLE
	jr z, .warp
	and $f0
	cp $70
	jr z, .warp
	and a
	ret

.warp
	scf
	ret
; 149af

CheckDirectionalWarp:: ; 149af
; If this is a directional warp, clear carry (press the designated button to warp).
; Else, set carry (immediate warp).
	ld a, [PlayerStandingTile]
	cp COLL_WARP_CARPET_DOWN
	jr z, .directional
	cp COLL_WARP_CARPET_LEFT
	jr z, .directional
	cp COLL_WARP_CARPET_UP
	jr z, .directional
	cp COLL_WARP_CARPET_RIGHT
	jr z, .directional
	scf
	ret

.directional
	xor a
	ret
; 149c6

CheckWarpFacingDown: ; 149c6
	ld de, 1
	ld hl, .blocks
	ld a, [PlayerStandingTile]
	jp IsInArray
; 149d3

.blocks ; 149d3
	db COLL_DOOR
	db COLL_STAIRCASE
	db COLL_CAVE
	db COLL_WARP_PANEL
	db -1
; 149dd

CheckGrassCollision:: ; 149dd
	ld a, [PlayerStandingTile]
	ld hl, .blocks
	ld de, 1
	jp IsInArray
; 149ea

.blocks ; 149ea
	db COLL_TALL_GRASS
	db COLL_LONG_GRASS
	db COLL_WATER ; why?
	db -1
; 149f5

CheckCutCollision: ; 149f5
	ld a, c
	ld hl, .blocks
	ld de, 1
	jp IsInArray
; 14a00

.blocks ; 14a00
	db COLL_CUT_TREE
	db COLL_TALL_GRASS
	db COLL_LONG_GRASS
	db -1
; 14a07

Function14a07:: ; 14a07
	ld a, [PlayerStandingTile]
	ld de, $1f
	cp COLL_DOOR
	ret z
	ld de, $13
	cp COLL_WARP_PANEL
	ret z
	ld de, $23
	ret
; 14a1a
