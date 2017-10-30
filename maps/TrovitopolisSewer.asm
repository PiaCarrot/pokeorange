const_value set 1

TrovitopolisSewer_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

TrovitopolisSewerSludgeBomb:
	itemball TM_SLUDGE_BOMB

TrovitopolisSewerTradeStone:
	itemball TRADE_STONE

TrovitopolisSewerProtein:
	itemball PROTEIN

TrovitopolisSewerEscapeRope:
	itemball ESCAPE_ROPE

TrovitopolisSewer_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 4
	person_event SPRITE_POKE_BALL, 14, 49, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TrovitopolisSewerSludgeBomb, EVENT_TROVITOPOLIS_SEWER_SLUDGE_BOMB
	person_event SPRITE_POKE_BALL, 36, 51, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TrovitopolisSewerTradeStone, EVENT_TROVITOPOLIS_SEWER_TRADE_STONE
	person_event SPRITE_POKE_BALL, 14, 11, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TrovitopolisSewerProtein, EVENT_TROVITOPOLIS_SEWER_PROTEIN
	person_event SPRITE_POKE_BALL, 17, 30, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TrovitopolisSewerEscapeRope, EVENT_TROVITOPOLIS_SEWER_ESCAPE_ROPE

