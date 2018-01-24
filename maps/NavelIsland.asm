NavelIsland_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_NAVEL
	return

NavelIslandSailboatScript:
	end

NavelIslandSign:
	jumptext NavelIslandSignText

NavelIslandSignText:
	text "NAVEL ISLAND"

	para "GYM CHALLENGERS"
	line "only! MT.NAVEL is"
	cont "very dangerous!"
	done

NavelIsland_MapEventHeader::

.Warps: db 4
	warp_def 21, 16, 1, MT_NAVEL_1F
	warp_def 9, 26, 2, MT_NAVEL_1F
	warp_def 27, 24, 3, MT_NAVEL_2F
	warp_def 15, 10, 4, MT_NAVEL_2F

.CoordEvents: db 0

.BGEvents: db 1
	signpost 24, 16, SIGNPOST_READ, NavelIslandSign

.ObjectEvents: db 2
	person_event SPRITE_SAILBOAT_TOP, 21, 11, SPRITEMOVEDATA_SAILBOAT_TOP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, NavelIslandSailboatScript, -1
	person_event SPRITE_SAILBOAT_BOTTOM, 21, 11, SPRITEMOVEDATA_SAILBOAT_BOTTOM, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, NavelIslandSailboatScript, -1
