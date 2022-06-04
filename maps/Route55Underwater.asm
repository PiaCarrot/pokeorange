const_value = 1
	const ROUTE_55_WATER_PULSE
	const ROUTE_55_NUGGET

Route55Underwater_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .InitializeDiveMap

.InitializeDiveMap:
	divemap ROUTE_55, 0, 0
	return
	
Route55TMWaterPulse:
	itemball TM_WATER_PULSE
	
Route55UnderwaterNugget:
	itemball NUGGET
	
Route55HiddenStardust:
	dwb EVENT_ROUTE_55_HIDDEN_STARDUST, STARDUST
	
Route55HiddenPearl:
	dwb EVENT_ROUTE_55_HIDDEN_PEARL, PEARL
	
Route55Underwater_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 2
	signpost 10, 6, SIGNPOST_ITEM, Route55HiddenStardust
	signpost 20, 11, SIGNPOST_ITEM, Route55HiddenPearl

.ObjectEvents: db 2
	person_event SPRITE_POKE_BALL, 17, 47, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route55TMWaterPulse, EVENT_ROUTE_55_WATER_PULSE
	person_event SPRITE_POKE_BALL, 21, 30, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route55UnderwaterNugget, EVENT_ROUTE_55_NUGGET

