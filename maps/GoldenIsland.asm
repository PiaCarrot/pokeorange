GoldenIsland_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

GoldenIslandSign:
	jumptext GoldenIslandSignText

GoldenIslandSignText:
	text "GOLDEN ISLAND"

	para "MEOWTH are"
	line "welcome!"
	done

GoldenIsland_MapEventHeader::

.Warps: db 1
	warp_def 9, 5, 1, MORO_ROUTE_60_GATE

.CoordEvents: db 0

.BGEvents: db 1
	signpost 8, 14, SIGNPOST_READ, GoldenIslandSign

.ObjectEvents: db 0
