const_value = 1

MurcottHouse2_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MurcottFirebreatherScript:
	jumptextfaceplayer MurcottFirebreatherText
	
MurcottFirebreatherText:
	text "To some, it might"
	line "be common sense,"
	cont "but if you pass"
	cont "the school test in"
	
	para "TROVITOPOLIS, the"
	line "teacher will give"
	cont "you a good item!"
	done

MurcottHouse2_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 3, MURCOTT_ISLAND
	warp_def 7, 3, 3, MURCOTT_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_FISHER, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MurcottFirebreatherScript, -1

