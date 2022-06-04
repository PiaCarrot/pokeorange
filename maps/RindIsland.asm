const_value = 1

RindIsland_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

RindIslandSign:
	jumptext RindIslandSignText

QuackenpokerSign:
	jumptext QuackenpokerSignText

RindIslandSignText:
	text "RIND ISLAND"
	
	para "WEST TO VICTORY"
	line "ROAD"
	done
	
QuackenpokerSignText:
	text "QUACKENPOKER LAB"
	done
	
RindIslandLureBall:
	itemball LURE_BALL
	
RindIslandFruitTree:
	fruittree FRUITTREE_RIND_ISLAND_1

RindIslandFruitTree2:
	fruittree FRUITTREE_RIND_ISLAND_2
	
RindIslandHiddenEther:
	dwb EVENT_RIND_ISLAND_HIDDEN_ETHER, ETHER
	
RindIslandHiddenNugget:
	dwb EVENT_RIND_ISLAND_HIDDEN_NUGGET, NUGGET

RindIsland_MapEventHeader::

.Warps: db 1
	warp_def  9, 13, 1, QUACKENPOKER_LAB

.CoordEvents: db 0

.BGEvents: db 4
	signpost 28, 40, SIGNPOST_READ, RindIslandSign
	signpost  9, 17, SIGNPOST_READ, QuackenpokerSign
	signpost 11, 31, SIGNPOST_ITEM, RindIslandHiddenEther
	signpost 27, 13, SIGNPOST_ITEM, RindIslandHiddenNugget

.ObjectEvents: db 3
	person_event SPRITE_POKE_BALL,  8, 32, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, RindIslandLureBall, EVENT_RIND_ISLAND_LURE_BALL
	person_event SPRITE_FRUIT_TREE, 20, 18, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, RindIslandFruitTree, -1
	person_event SPRITE_FRUIT_TREE,  3,  9, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, RindIslandFruitTree2, -1

