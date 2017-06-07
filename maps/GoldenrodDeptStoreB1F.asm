const_value set 2

GoldenrodDeptStoreB1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 2

	; callbacks

	dbw MAPCALLBACK_TILES, UnknownScript_0x7d781

	dbw MAPCALLBACK_NEWMAP, UnknownScript_0x7d7ac

UnknownScript_0x7d781:
	checkevent EVENT_RECEIVED_CARD_KEY
	iftrue UnknownScript_0x7d78a
	jump UnknownScript_0x7d791

UnknownScript_0x7d78a:
	changeblock $10, $4, $d
	jump UnknownScript_0x7d791

UnknownScript_0x7d791:
	checkevent EVENT_WAREHOUSE_LAYOUT_2
	iftrue .Layout2
	checkevent EVENT_WAREHOUSE_LAYOUT_3
	iftrue .Layout3
	changeblock $a, $8, $d
	return

.Layout2:
	changeblock $4, $a, $d
	return

.Layout3:
	changeblock $a, $c, $d
	return

UnknownScript_0x7d7ac:
	clearevent EVENT_WAREHOUSE_BLOCKED_OFF
	return

GoldenrodDeptStoreB1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $2, $11, 3, UNDERGROUND_WAREHOUSE
	warp_def $4, $9, 1, GOLDENROD_DEPT_STORE_ELEVATOR
	warp_def $4, $a, 2, GOLDENROD_DEPT_STORE_ELEVATOR

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 0
