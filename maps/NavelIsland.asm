NavelIsland_MapScriptHeader::

.MapTriggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.Trigger0:
	end

.Trigger1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_NAVEL
	return

NavelIslandSign:
	jumptext NavelIslandSignText

NavelIslandSignText:
	text "NAVEL ISLAND"

	para "GYM CHALLENGERS"
	line "only! MT.NAVEL is"
	cont "very dangerous!"
	done

NavelIsland_MapEventHeader::

.Warps: db 5
	warp_def 21, 16, 1, MT_NAVEL_1F
	warp_def 9, 26, 2, MT_NAVEL_1F
	warp_def 27, 24, 3, MT_NAVEL_2F
	warp_def 15, 10, 4, MT_NAVEL_2F
	warp_def 21,  9, 1, UNNAMED_ISLAND_1_POKE_CENTER

.CoordEvents: db 0

.BGEvents: db 1
	signpost 24, 16, SIGNPOST_READ, NavelIslandSign

.ObjectEvents: db 0
