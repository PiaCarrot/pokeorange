MtNavelIceRock_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

NavelIceRock:
	jumptext NavelIceRockText

NavelIceRockText:
	text "A strange aura"
	line "emanates from the"
	cont "the rock<...>"
	done

MtNavelIceRock_MapEventHeader::

.Warps: db 1
	warp_def 3, 3, 6, MT_NAVEL_2F

.CoordEvents: db 0

.BGEvents: db 1
	signpost 2, 3, SIGNPOST_READ, NavelIceRock

.ObjectEvents: db 0

