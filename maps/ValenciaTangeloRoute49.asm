const_value = 1

ValenciaTangeloRoute49_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

Route49Pokeball:
	itemball POKE_BALL
	
Route49Potion:
	itemball POTION

ValenciaTangeloRoute49_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_POKE_BALL, 38, 16, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route49Pokeball, EVENT_ROUTE_49_POKEBALL
	person_event SPRITE_POKE_BALL, 20, 12, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route49Potion, EVENT_ROUTE_49_POTION

