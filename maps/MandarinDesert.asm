const_value set 1

MandarinDesert_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

MandarinDesertBoulder:
	jumpstd strengthboulder
	
MandarinDesertTMSandstorm:
	itemball TM_SANDSTORM
	
MandarinDesertTMIron:
	itemball IRON
	
MandarinDesertSmokeBall:
	itemball SMOKE_BALL

MandarinDesert_MapEventHeader::

.Warps: db 3
	warp_def 5, 8, 4, TROVITOPOLIS
	warp_def 45, 41, 1, ROUTE_62
	warp_def 45, 42, 1, ROUTE_62

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 6
	person_event SPRITE_BOULDER, 18, 14, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MandarinDesertBoulder, -1
	person_event SPRITE_BOULDER, 9, 30, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MandarinDesertBoulder, -1
	person_event SPRITE_BOULDER, 8, 31, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MandarinDesertBoulder, -1
	person_event SPRITE_POKE_BALL, 4, 29, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MandarinDesertTMSandstorm, EVENT_MANDARIN_DESERT_SANDSTORM
	person_event SPRITE_POKE_BALL, 41, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MandarinDesertTMIron, EVENT_MANDARIN_DESERT_IRON
	person_event SPRITE_POKE_BALL, 15, 10, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MandarinDesertSmokeBall, EVENT_MANDARIN_DESERT_SMOKE_BALL

