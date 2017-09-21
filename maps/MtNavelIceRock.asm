MtNavelIceRock_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

.Scripts:

NavelIceRock:
	jumptext NavelIceRockText

NavelIceRockText:
	text "A strange aura"
	line "emanates from the"
	cont "the rock<...>"
	done

MtNavelIceRock_MapEventHeader::

.Warps: db 1
	warp_def 5, 3, 6, MT_NAVEL_2F

.CoordEvents: db 0

.BGEvents: db 1
	signpost 3, 4, SIGNPOST_READ, NavelIceRock

.ObjectEvents: db 0
