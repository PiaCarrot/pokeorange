WreckedShipUnderwater_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .InitializeDiveMap

.InitializeDiveMap:
	divemap WRECKED_SHIP_UNSUNK, 0, 0
	return
	
WreckedShipTradeStone:
	itemball TRADE_STONE
	
WreckedShipDiveBall:
	itemball DIVE_BALL
	
WreckedShipHiddenHyperPotion:
	dwb EVENT_WRECKED_SHIP_HIDDEN_HYPER_POTION, HYPER_POTION

WreckedShipUnderwater_MapEventHeader::

.Warps: db 7
	warp_def 21, 4, 1, WRECKED_SHIP
	warp_def 21, 5, 1, WRECKED_SHIP
	warp_def 16, 3, 4, WRECKED_SHIP_UNDERWATER
	warp_def 8, 5, 3, WRECKED_SHIP_UNDERWATER
	warp_def 15, 18, 6, WRECKED_SHIP_UNDERWATER
	warp_def 7, 18, 5, WRECKED_SHIP_UNDERWATER
	warp_def 7, 19, 5, WRECKED_SHIP_UNDERWATER

.CoordEvents: db 0

.BGEvents: db 1
	signpost 2, 32, SIGNPOST_ITEM, WreckedShipHiddenHyperPotion

.ObjectEvents: db 2
	person_event SPRITE_POKE_BALL, 20, 31, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, WreckedShipTradeStone, EVENT_WRECKED_SHIP_TRADE_STONE
	person_event SPRITE_POKE_BALL, 2, 1, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, WreckedShipDiveBall, EVENT_WRECKED_SHIP_DIVE_BALL
