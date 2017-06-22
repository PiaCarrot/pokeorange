NavelIsland_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

.Scripts:

NavelIslandSign:
	jumptext NavelIslandSignText
	
NavelIslandSignText:
	text "NAVEL ISLAND"
	
	para "GYM CHALLENGERS"
	line "only! MT.NAVEL is"
	cont "very dangerous!"
	done

NavelIsland_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 21, 16, 1, MT_NAVEL_1F
	warp_def 9, 26, 2, MT_NAVEL_1F

.CoordEvents: db 0

.BGEvents: db 1
	signpost 24, 16, SIGNPOST_READ, NavelIslandSign

.ObjectEvents: db 0

