const_value = 1

SunburstLargeHouse_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

SunburstGrannyScript:
	jumptextfaceplayer SunburstGrannyText

SunburstGrannyText:
	text "Once you go past"
	line "CRYSTAL CAVE, you"
	cont "must cross ROUTE"
	cont "55, PINKAN ISLAND,"
	cont "and ROUTE 56 to go"
	cont "to KINNOW ISLAND."
	done

SunburstLargeHouse_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 5, SUNBURST_ISLAND
	warp_def 7, 3, 5, SUNBURST_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_GRANNY, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 2, 2, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, SunburstGrannyScript, -1
