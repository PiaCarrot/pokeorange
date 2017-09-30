const_value set 2
	const GOLDEN_ISLAND_CATMAN_1
	const GOLDEN_ISLAND_CATMAN_2
	const GOLDEN_ISLAND_CATMAN_3
	const GOLDEN_ISLAND_JESSIE
	const GOLDEN_ISLAND_JAMES
	const GOLDEN_ISLAND_CATGUARD_1
	const GOLDEN_ISLAND_CATGUARD_2
	const GOLDEN_ISLAND_ITEM_BALL
	const GOLDEN_ISLAND_FRUIT_TREE

GoldenIsland_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

GoldenIslandSign:
	jumptext GoldenIslandSignText

GoldenIslandSignText:
	text "GOLDEN ISLAND"

	para "MEOWTH are"
	line "welcome!"
	done
	
CatManGuardingExitScript:
	jumptextfaceplayer CatManGuardText
	
CatManGuardText:
	text "The BOUNTY HARVEST"
	line "is underway."
	
	para "None may pass at"
	line "this time."
	done
	
GoldenIslandAmuletCoin:
	itemball AMULET_COIN
	
CatManOutside1Script:
	jumptextfaceplayer CatManOutside1Text
	
CatManOutside1Text:
	text "Welcome to GOLDEN"
	line "ISLAND!"
	
	para "If you have a"
	line "MEOWTH, our elder"
	cont "would love to"
	cont "speak with you."
	done
	
CatManOutside2Script:
	jumptextfaceplayer CatManOutside2Text
	
CatManOutside2Text:
	text "Our livelihood de-"
	line "pends on a MEOWTH"
	cont "with the move PAY"
	cont "DAY!"
	done
	
CatManOutside3Script:
	jumptextfaceplayer CatManOutside3Text
	
CatManOutside3Text:
	text "If I had a MEOWTH,"
	line "I think I'd name"
	cont "it NYARTH."
	
	para "Sounds cool to me."
	done

GoldenIslandLargeStatue:
	jumptext GoldenIslandLargeStatueText
	
GoldenIslandLargeStatueText:
	text "A huge MEOWTH"
	line "statue made out of"
	cont "solid gold!"
	done
	
GoldenIslandSmallStatue:
	jumptext GoldenIslandSmallStatueText
	
GoldenIslandSmallStatueText:
	text "A small, golden"
	line "statue depicting"
	cont "a MEOWTH."
	done
	
GoldenIslandFruitTree:
	fruittree FRUITTREE_GOLDEN_ISLAND
	
GoldenIslandRocketEvent:
	end
	
GoldenIsland_MapEventHeader::

.Warps: db 4
	warp_def 5, 13, 1, GOLDEN_ISLAND_HOUSE_1
	warp_def 9, 5, 1, GOLDEN_ISLAND_HOUSE_2
	warp_def 19, 3, 1, GOLDEN_ISLAND_HOUSE_3
	warp_def 13, 25, 1, GOLDEN_ISLAND_ELDER_HOUSE

.CoordEvents: db 2
	xy_trigger 0, 16, 22, 0, GoldenIslandRocketEvent, 0, 0
	xy_trigger 0, 16, 23, 0, GoldenIslandRocketEvent, 0, 0

.BGEvents: db 5
	signpost 8, 14, SIGNPOST_READ, GoldenIslandSign
	signpost 14, 13, SIGNPOST_READ, GoldenIslandLargeStatue
	signpost 14, 14, SIGNPOST_READ, GoldenIslandLargeStatue
	signpost 16, 11, SIGNPOST_UP, GoldenIslandSmallStatue
	signpost 16, 16, SIGNPOST_UP, GoldenIslandSmallStatue

.ObjectEvents: db 9
	person_event SPRITE_CAT_MAN, 7, 17, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 2, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CatManOutside1Script, -1
	person_event SPRITE_CAT_MAN, 12, 3, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 2, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CatManOutside2Script, -1
	person_event SPRITE_CAT_MAN, 17, 14, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CatManOutside3Script, -1
	person_event SPRITE_JESSIE, 14, 25, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_GOLDEN_ISLAND
	person_event SPRITE_JAMES, 15, 25, SPRITEMOVEDATA_STANDING_UP, 2, 2, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_GOLDEN_ISLAND
	person_event SPRITE_CAT_MAN, 27, 11, SPRITEMOVEDATA_STANDING_UP, 2, 2, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CatManGuardingExitScript, EVENT_BOUNTY_HARVEST
	person_event SPRITE_CAT_MAN, 27, 12, SPRITEMOVEDATA_STANDING_UP, 2, 2, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CatManGuardingExitScript, EVENT_BOUNTY_HARVEST
	person_event SPRITE_POKE_BALL, 25, 25, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, GoldenIslandAmuletCoin, EVENT_GOLDEN_ISLAND_AMULET_COIN
	person_event SPRITE_FRUIT_TREE, 1, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GoldenIslandFruitTree, -1