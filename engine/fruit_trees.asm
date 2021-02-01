FruitTreeScript:: ; 44000
	callasm GetCurTreeFruit
	opentext
	copybytetovar CurFruit
	itemtotext $0, $0
	writetext FruitBearingTreeText
	buttonsound
	callasm TryResetFruitTrees
	callasm CheckFruitTree
	iffalse .fruit
	writetext NothingHereText
	waitbutton
	jump .end

.fruit
	writetext HeyItsFruitText
	copybytetovar CurFruit
	giveitem ITEM_FROM_MEM
	iffalse .packisfull
	buttonsound
	writetext ObtainedFruitText
	callasm PickedFruitTree
	specialsound
	itemnotify
	jump .end

.packisfull
	buttonsound
	writetext FruitPackIsFullText
	waitbutton

.end
	closetext
	end
; 44041

GetCurTreeFruit: ; 44041
	ld a, [CurFruitTree]
	dec a
	call GetFruitTreeItem
	ld [CurFruit], a
	ret
; 4404c

TryResetFruitTrees: ; 4404c
	ld hl, DailyFlags
	bit 4, [hl]
	ret nz
	jp ResetFruitTrees
; 44055

CheckFruitTree: ; 44055
	ld b, 2
	call GetFruitTreeFlag
	ld a, c
	ld [ScriptVar], a
	ret
; 4405f

PickedFruitTree: ; 4405f
	ld b, 1
	jp GetFruitTreeFlag
; 4406a

ResetFruitTrees: ; 4406a
	xor a
	ld hl, FruitTreeFlags
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, DailyFlags
	set 4, [hl]
	ret
; 44078

GetFruitTreeFlag: ; 44078
	push hl
	push de
	ld a, [CurFruitTree]
	dec a
	ld e, a
	ld d, 0
	ld hl, FruitTreeFlags
	call FlagAction
	pop de
	pop hl
	ret
; 4408a

GetFruitTreeItem: ; 4408a
	push hl
	push de
	ld e, a
	ld d, 0
	ld hl, FruitTreeItems
	add hl, de
	ld a, [hl]
	pop de
	pop hl
	ret
; 44097

FruitTreeItems: ; 44097
	db BERRY ; FRUITTREE_ROUTE_49
	db BERRY ; FRUITTREE_ROUTE_50_1
	db PRZCUREBERRY ; FRUITTREE_ROUTE_50_2
	db BERRY ; FRUITTREE_ROUTE_51
	db GOLD_BERRY ; FRUITTREE_ROUTE_53
	db GOLD_BERRY ; FRUITTREE_MIKAN_ISLAND
	db PINKAN_BERRY ; FRUITTREE_PINKAN_ISLAND_1
	db PINKAN_BERRY ; FRUITTREE_PINKAN_ISLAND_2
	db PINKAN_BERRY ; FRUITTREE_PINKAN_ISLAND_3
	db PINKAN_BERRY ; FRUITTREE_PINKAN_ISLAND_4
	db GOLD_BERRY ;FRUITTREE_GOLDEN_ISLAND
	db ICE_BERRY ;FRUITTREE_MURCOTT_ISLAND
	db MYSTERYBERRY ;FRUITTREE_ASCORBIA_ISLAND
	db BURNT_BERRY ;FRUTTREE_ROUTE_64
	db PSNCUREBERRY ;FRUITTREE_BUTWAL_WEST
	db MIRACLEBERRY ;FRUITTREE_ROUTE_66
	db GOLD_BERRY ;FRUITTREE_RIND_ISLAND_1
	db MIRACLEBERRY ;FRUITTREE_RIND_ISLAND_2
	db MYSTERYBERRY ;FRUITTREE_PUMMELO_ISLAND_1
	db GOLD_BERRY ;FRUITTREE_PUMMELO_ISLAND_2
; 440b5

FruitBearingTreeText: ; 440b5
	text_jump _FruitBearingTreeText
	db "@"
; 440ba

HeyItsFruitText: ; 440ba
	text_jump _HeyItsFruitText
	db "@"
; 440bf

ObtainedFruitText: ; 440bf
	text_jump _ObtainedFruitText
	db "@"
; 440c4

FruitPackIsFullText: ; 440c4
	text_jump _FruitPackIsFullText
	db "@"
; 440c9

NothingHereText: ; 440c9
	text_jump _NothingHereText
	db "@"
; 440ce
