const_value = 1

MandarinDesert_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

MandarinDesertBoulder:
	jumpstd strengthboulder
	
MandarinDesertTMSandstorm:
	itemball TM_SANDSTORM
	
MandarinDesertTMIron:
	;itemball IRON
	itemball METAL_COAT
	
MandarinDesertSmokeBall:
	itemball SMOKE_BALL

MandarinDesertSign:
	jumptext MandarinDesertSignText
	
MandarinDesertSignText:
	text "MANDARIN DESERT"
	
	para "BEWARE!"
	
	para "SANDSTORM hurts"
	line "any #MON that"
	cont "isn't STEEL, ROCK,"
	cont "or GROUND-type!"
	done

MandarinDesert_MapEventHeader::

.Warps: db 4
	warp_def 5, 8, 1, SUNRAY_CAVE_MANDARIN_DESERT_1F
	warp_def 45, 41, 1, ROUTE_62_MANDARIN_DESERT_GATE
	warp_def 45, 42, 2, ROUTE_62_MANDARIN_DESERT_GATE
	warp_def 17, 18, 2, ROUTE_62

.CoordEvents: db 0

.BGEvents: db 1
	signpost 36, 40, SIGNPOST_READ, MandarinDesertSign

.ObjectEvents: db 6
	person_event SPRITE_BOULDER, 18, 14, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MandarinDesertBoulder, -1
	person_event SPRITE_BOULDER, 9, 30, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MandarinDesertBoulder, -1
	person_event SPRITE_BOULDER, 8, 31, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MandarinDesertBoulder, -1
	person_event SPRITE_POKE_BALL, 4, 29, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MandarinDesertTMSandstorm, EVENT_MANDARIN_DESERT_SANDSTORM
	person_event SPRITE_POKE_BALL, 41, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MandarinDesertTMIron, EVENT_MANDARIN_DESERT_IRON
	person_event SPRITE_POKE_BALL, 15, 10, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MandarinDesertSmokeBall, EVENT_MANDARIN_DESERT_SMOKE_BALL

