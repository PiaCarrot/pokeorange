KinnowIsland_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_KINNOW
	return

KinnowPokeFanMScript:
	jumptextfaceplayer KinnowPokeFanMText

KinnowTownSign:
	jumptext KinnowTownSignText

CafePiaSign:
	jumptext CafePiaSignText

SkateShopSign:
	jumptext SkateShopSignText

KinnowNugget:
	itemball NUGGET

KinnowPokeFanMText:
	text "Welcome to KINNOW"
	line "ISLAND! Plenty to"
	cont "do around here."

	para "If you're itching"
	line "for a battle, head"
	cont "to the CAFE."

	para "The waitresses th-"
	line "ere love battles!"
	done

KinnowTownSignText:
	text "KINNOW ISLAND"
	line "The SAPPHIRE of"
	cont "the ORANGE ISLANDS"
	done

CafePiaSignText:
	text "PIA CARROT"
	line "CAFE"
	done

SkateShopSignText:
	text "SKATE SHOP"
	line "Roll around in"
	cont "style!"
	done
	
KinnowIslandHiddenPPUp:
	dwb EVENT_ROUTE_KINNOW_ISLAND_HIDDEN_PP_UP, PP_UP

KinnowIsland_MapEventHeader::

.Warps: db 11
	warp_def 15, 23, 1, KINNOW_TRADE_HOUSE
	warp_def 9, 7, 1, KINNOW_LORE_HOUSE
	warp_def 19, 13, 1, KINNOW_CHARCOAL_HOUSE
	warp_def 9, 17, 1, KINNOW_POKE_CENTER
	warp_def 9, 21, 2, KINNOW_MART
	warp_def 23, 26, 1, KINNOW_CAFE
	warp_def 9, 13, 2, KINNOW_SKATE_SHOP
	warp_def 6, 33, 1, KINNOW_ISLAND_ROUTE_57_GATE
	warp_def 7, 33, 2, KINNOW_ISLAND_ROUTE_57_GATE
	warp_def 27, 27, 1, KINNOW_SHOWBOAT_GATE
	warp_def 27, 28, 2, KINNOW_SHOWBOAT_GATE

.CoordEvents: db 0

.BGEvents: db 4
	signpost 18, 18, SIGNPOST_READ, KinnowTownSign
	signpost 24, 28, SIGNPOST_READ, CafePiaSign
	signpost 9, 11, SIGNPOST_READ, SkateShopSign
	signpost 10, 28, SIGNPOST_ITEM, KinnowIslandHiddenPPUp

.ObjectEvents: db 2
	person_event SPRITE_POKEFAN_M, 22, 16, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, KinnowPokeFanMScript, -1
	person_event SPRITE_POKE_BALL, 22, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, KinnowNugget, EVENT_KINNOW_NUGGET
