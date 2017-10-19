Route62_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

Route62XSpecialAttack:
	itemball X_SPCL_ATK
	
Route62TMEarthquake:
	itemball TM_EARTHQUAKE
	
Route62Blackglasses:
	itemball BLACKGLASSES
	
Route62PPUp:
	itemball PP_UP

Route62_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 4
	person_event SPRITE_POKE_BALL, 23, 57, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route62XSpecialAttack, EVENT_ROUTE_62_X_SPCL_ATK
	person_event SPRITE_POKE_BALL, 25, 14, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route62TMEarthquake, EVENT_ROUTE_62_TM_EARTHQUAKE
	person_event SPRITE_POKE_BALL, 35, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route62Blackglasses, EVENT_ROUTE_62_BLACKGLASSES
	person_event SPRITE_POKE_BALL, 8, 42, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route62PPUp, EVENT_ROUTE_62_PP_UP
