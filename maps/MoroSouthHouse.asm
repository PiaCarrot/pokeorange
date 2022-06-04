const_value = 1

MoroSouthHouse_MapScriptHeader:
.MapTriggers: db 0

.MapCallbacks: db 0

MoroFarfetchdFan:
	jumptextfaceplayer MoroFarfetchdFanText

MoroFarfetchdFanText:
	text "I'll let you in on"
	line "a secret."

	para "On ROUTE 61, if"
	line "you keep going"
	cont "south, there's an"
	cont "island where FAR-"
	cont "FETCH'D gather."
	done

MoroSouthHouse_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 4, MORO_ISLAND
	warp_def 7, 3, 4, MORO_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_COOLTRAINER_M, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MoroFarfetchdFan, -1