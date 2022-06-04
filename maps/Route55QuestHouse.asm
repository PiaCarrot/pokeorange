const_value = 1
	const ROUTE55QUESTHOUSE_GRANNY

Route55QuestHouse_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

BaasamaScript:
	jumptextfaceplayer BaasamaText

BaasamaText:
	text "Ah, hello there,"
	line "young child."

	para "A long time ago, I"
	line "had children of my"
	cont "own."

	para "I wonder what bec-"
	line "ame of them. It's"
	cont "been so long<...>"

	para "By now, they would"
	line "have children of"
	cont "their own."
	done

Route55QuestHouse_MapEventHeader::

.Warps: db 2
	warp_def 7, 3, 2, ROUTE_55
	warp_def 7, 4, 2, ROUTE_55

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_GRANNY, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 2, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, BaasamaScript, -1
