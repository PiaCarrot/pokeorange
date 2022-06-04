const_value = 1

SunburstSmallHouse_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

SunburstCooltrainerScript:
	jumptextfaceplayer SunburstCooltrainerText

SunburstCooltrainerText:
	text "I saw them!"

	para "WAILMER on ROUTE"
	line "55! Isn't the"
	cont "ocean amazing?"
	done

SunburstSmallHouse_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 4, SUNBURST_ISLAND
	warp_def 7, 3, 4, SUNBURST_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_COOLTRAINER_M, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 2, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunburstCooltrainerScript, -1
