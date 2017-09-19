MoroIslandMuseum_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

.Scripts:

MoroTrophyScript:
	jumptext MoroTrophyText
	
MoroTrophyText:
	text "Although quite old"
	line "and rusted, it"
	cont "gives off a proud"
	cont "vibe."
	done

MoroIslandMuseum_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 15, 4, 1, MORO_ISLAND
	warp_def 15, 5, 1, MORO_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_GOLD_TROPHY, 10, 11, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MoroTrophyScript, EVENT_MORO_TROPHY_FOUND

