const_value set 1
	const ICEPATHB2FMAHOGANYSIDE_BOULDER1
	const ICEPATHB2FMAHOGANYSIDE_BOULDER2
	const ICEPATHB2FMAHOGANYSIDE_BOULDER3
	const ICEPATHB2FMAHOGANYSIDE_BOULDER4

IcePathB2FMahoganySide_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

BoulderScript_0x7e5a3:
	jumptext UnknownText_0x7e5ad

UnknownText_0x7e5ad:
	text "It's immovably"
	line "imbedded in ice."
	done

IcePathB2FMahoganySide_MapEventHeader:

.Warps: db 6
	warp_def $1, $11, 2, ICE_PATH_B1F
	warp_def $b, $9, 1, ICE_PATH_B3F
	warp_def $4, $b, 3, ICE_PATH_B1F
	warp_def $6, $4, 4, ICE_PATH_B1F
	warp_def $c, $4, 5, ICE_PATH_B1F
	warp_def $c, $c, 6, ICE_PATH_B1F

.XYTriggers: db 0

.Signposts: db 0

.PersonEvents: db 4
	person_event SPRITE_BOULDER, 3, 11, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BoulderScript_0x7e5a3, EVENT_BOULDER_IN_ICE_PATH_1A
	person_event SPRITE_BOULDER, 7, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BoulderScript_0x7e5a3, EVENT_BOULDER_IN_ICE_PATH_2A
	person_event SPRITE_BOULDER, 12, 3, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BoulderScript_0x7e5a3, EVENT_BOULDER_IN_ICE_PATH_3A
	person_event SPRITE_BOULDER, 13, 12, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, BoulderScript_0x7e5a3, EVENT_BOULDER_IN_ICE_PATH_4A
