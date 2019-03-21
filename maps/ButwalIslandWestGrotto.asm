ButwalIslandWestGrotto_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

ButwalMossRock:
	jumptext ButwalMossRockText

ButwalMossRockText:
	text "A strange aura"
	line "emanates from the"
	cont "the rock<...>"
	done

ButwalIslandWestGrotto_MapEventHeader::

.Warps: db 1
	warp_def 3, 3, 1, BUTWAL_ISLAND_WEST

.CoordEvents: db 0

.BGEvents: db 1
	signpost 2, 3, SIGNPOST_READ, ButwalMossRock

.ObjectEvents: db 0

