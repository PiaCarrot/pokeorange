const_value = 1
	const MANDARINNORTHSMALLHOUSE_POKE_BALL

MandarinNorthSmallHouse_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MandarinNorthHMCut:
	itemball TM_THIEF

MandarinNorthSmallHouse_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 3, MANDARIN_NORTH
	warp_def 7, 3, 3, MANDARIN_NORTH

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_POKE_BALL, 3, 3, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MandarinNorthHMCut, EVENT_MANDARIN_NORTH_HM_CUT
