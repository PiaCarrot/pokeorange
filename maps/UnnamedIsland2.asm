const_value = 1
	const UNNAMED_ISLAND_2_FAST_BALL
	const UNNAMED_ISLAND_2_PP_UP
	const UNNAMED_ISLAND_2_TRADE_STONE

UnnamedIsland2_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

UnnamedIsland2FastBall:
	itemball FAST_BALL
	
UnnamedIsland2PPUp:
	itemball PP_UP
	
UnnamedIsland2TradeStone:
	itemball TRADE_STONE

UnnamedIsland2_MapEventHeader::

.Warps: db 0
.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_POKE_BALL, 30, 5, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, UnnamedIsland2FastBall, EVENT_UNNAMED_ISLAND_2_FAST_BALL
	person_event SPRITE_POKE_BALL, 32, 33, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, UnnamedIsland2PPUp, EVENT_UNNAMED_ISLAND_2_PP_UP
	person_event SPRITE_POKE_BALL, 23, 24, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, UnnamedIsland2TradeStone, EVENT_UNNAMED_ISLAND_2_TRADE_STONE

