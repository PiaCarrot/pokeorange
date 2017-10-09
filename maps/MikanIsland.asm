const_value set 1
	const MIKANISLAND_LASS
	const MIKANISLAND_SUPER_NERD
	const MIKANISLAND_GRAMPS
	const MIKANISLAND_YOUNGSTER
	const MIKANISLAND_FRUIT_TREE
	const MIKANISLAND_POKE_BALL1
	const MIKANISLAND_POKE_BALL2

MikanIsland_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_MIKAN
	return

MikanIslandLassScript:
	jumptextfaceplayer MikanIslandLassText

MikanIslandSuperNerdScript:
	jumptextfaceplayer MikanIslandSuperNerdText

MikanIslandGrampsScript:
	jumptextfaceplayer MikanIslandGrampsText

MikanIslandYoungsterScript:
	jumptextfaceplayer MikanIslandYoungsterText

MikanIslandSign:
	jumptext MikanIslandSignText

MikanGymSign:
	jumptext MikanGymSignText

MikanIslandPPUp:
	itemball PP_UP

MikanIslandRareCandy:
	itemball RARE_CANDY

MikanIslandFruitTreeScript:
	fruittree FRUITTREE_MIKAN_ISLAND

MikanIslandHiddenHyperPotion:
	dwb EVENT_MIKAN_ISLAND_HIDDEN_HYPER_POTION, HYPER_POTION

MikanIslandLassText:
	text "I heard a HORSEA"
	line "was spotted in"
	cont "the pond behind"
	cont "the gym!"
	done

MikanIslandSuperNerdText:
	text "Hey, you're a"
	line "#MON trainer?"

	para "There's a GYM"
	line "here! It's run"
	cont "by CISSY!"
	done

MikanIslandGrampsText:
	text "My sister, CISSY"
	line "is the strongest"
	cont "trainer I know!"

	para "Fat chance you can"
	line "beat her!"
	done

MikanIslandYoungsterText:
	text "CISSY's brother,"
	line "SENDA is pretty"
	cont "arrogant."

	para "If he says some-"
	line "thing dumb, just"
	cont "ignore him."
	done

MikanIslandSignText:
	text "MIKAN ISLAND"

	para "The island where"
	line "vivid coral lies."
	done

MikanGymSignText:
	text "MIKAN ISLAND"
	line "#MON GYM"
	cont "LEADER: CISSY"

	para "The beautiful"
	line "WATER user of"
	cont "the ORANGE CREW"
	done

MikanIsland_MapEventHeader::

.Warps: db 7
	warp_def 15, 7, 2, MIKAN_MART
	warp_def 5, 14, 1, MIKAN_GYM
	warp_def 19, 17, 1, MIKAN_NICKNAME_SPEECH_HOUSE
	warp_def 29, 11, 1, MIKAN_POKECENTER_1F
	warp_def 1, 1, 1, MIKAN_ONIX_TRADE_HOUSE
	warp_def 20, 27, 1, MIKAN_ISLAND_ROUTE_53_GATE
	warp_def 21, 27, 2, MIKAN_ISLAND_ROUTE_53_GATE

.CoordEvents: db 0

.BGEvents: db 3
	signpost 19, 13, SIGNPOST_READ, MikanIslandSign
	signpost 7, 17, SIGNPOST_READ, MikanGymSign
	signpost 4, 28, SIGNPOST_ITEM, MikanIslandHiddenHyperPotion

.ObjectEvents: db 7
	person_event SPRITE_LASS, 21, 23, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, MikanIslandLassScript, -1
	person_event SPRITE_SUPER_NERD, 24, 11, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MikanIslandSuperNerdScript, -1
	person_event SPRITE_YOUNGSTER, 8, 13, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MikanIslandGrampsScript, -1
	person_event SPRITE_YOUNGSTER, 17, 9, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, MikanIslandYoungsterScript, -1
	person_event SPRITE_FRUIT_TREE, 29, 26, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MikanIslandFruitTreeScript, -1
	person_event SPRITE_POKE_BALL, 6, 11, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MikanIslandPPUp, EVENT_MIKAN_ISLAND_PP_UP
	person_event SPRITE_POKE_BALL, 12, 28, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MikanIslandRareCandy, EVENT_MIKAN_ISLAND_RARE_CANDY
