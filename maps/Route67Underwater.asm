const_value set 1

Route67Underwater_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .InitializeDiveMap

.InitializeDiveMap:
	divemap ROUTE_67, 0, 0
	return
	
Route67UnderwaterDragonFang:
	itemball DRAGON_FANG

Route67UnderwaterUltraBall:
	itemball ULTRA_BALL

Route67UnderwaterMaxPotion:
	itemball MAX_POTION

Route67UnderwaterElixir:
	itemball ELIXER

Route67UnderwaterKingsRock:
	itemball KINGS_ROCK
	
Route67Underwater_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 5
	person_event SPRITE_POKE_BALL, 26, 57, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route67UnderwaterDragonFang, EVENT_ROUTE_67_UNDERWATER_DRAGON_FANG
	person_event SPRITE_POKE_BALL,  3, 25, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route67UnderwaterUltraBall, EVENT_ROUTE_67_UNDERWATER_ULTRA_BALL
	person_event SPRITE_POKE_BALL, 24, 28, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route67UnderwaterMaxPotion, EVENT_ROUTE_67_UNDERWATER_MAX_POTION
	person_event SPRITE_POKE_BALL,  6, 38, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route67UnderwaterElixir, EVENT_ROUTE_67_UNDERWATER_ELIXIR
	person_event SPRITE_POKE_BALL, 18, 42, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route67UnderwaterKingsRock, EVENT_ROUTE_67_UNDERWATER_KINGS_ROCK
