const_value set 2
	const VIOLETCITY_LASS
	const VIOLETCITY_SUPER_NERD
	const VIOLETCITY_GRAMPS
	const VIOLETCITY_YOUNGSTER
	const VIOLETCITY_FRUIT_TREE
	const VIOLETCITY_POKE_BALL1
	const VIOLETCITY_POKE_BALL2

VioletCity_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_VIOLET
	return

VioletCityLassScript:
	jumptextfaceplayer VioletCityLassText

VioletCitySuperNerdScript:
	jumptextfaceplayer VioletCitySuperNerdText

VioletCityGrampsScript:
	jumptextfaceplayer VioletCityGrampsText

VioletCityYoungsterScript:
	jumptextfaceplayer VioletCityYoungsterText

VioletCitySign:
	jumptext VioletCitySignText

VioletGymSign:
	jumptext VioletGymSignText

VioletCityPokeCenterSign:
	jumpstd pokecentersign

VioletCityMartSign:
	jumpstd martsign

VioletCityPPUp:
	itemball PP_UP

VioletCityRareCandy:
	itemball RARE_CANDY

VioletCityFruitTreeScript:
	fruittree FRUITTREE_VIOLET_CITY

VioletCityHiddenHyperPotion:
	dwb EVENT_VIOLET_CITY_HIDDEN_HYPER_POTION, HYPER_POTION

VioletCityLassText:
	text "I heard a HORSEA"
	line "was spotted in"
	cont "the pond behind"
	cont "the gym!"
	done

VioletCitySuperNerdText:
	text "Hey, you're a"
	line "#MON trainer?"

	para "There's a GYM"
	line "here! It's run"
	cont "by CISSY!"
	done

VioletCityGrampsText:
	text "My sister, CISSY"
	line "is the strongest"
	cont "trainer I know!"
	
	para "Fat chance you can"
	line "beat her!"
	done

VioletCityYoungsterText:
	text "CISSY's brother,"
	line "SENDA is pretty"
	cont "arrogant."
	
	para "If he says some-"
	line "thing dumb, just"
	cont "ignore him."
	done

VioletCitySignText:
	text "MIKAN ISLAND"
	
	para "The island where"
	line "vivid coral lies."
	done

VioletGymSignText:
	text "MIKAN ISLAND"
	line "#MON GYM"
	cont "LEADER: CISSY"

	para "The beautiful"
	line "WATER user of"
	cont "the ORANGE CREW"
	done

VioletCity_MapEventHeader:: db 0, 0

.Warps: db 7
	warp_def 15, 7, 2, VIOLET_MART
	warp_def 5, 14, 1, VIOLET_GYM
	warp_def 19, 17, 1, VIOLET_NICKNAME_SPEECH_HOUSE
	warp_def 29, 11, 1, VIOLET_POKECENTER_1F
	warp_def 1, 1, 1, VIOLET_ONIX_TRADE_HOUSE
	warp_def 20, 27, 1, ROUTE_32_RUINS_OF_ALPH_GATE
	warp_def 21, 27, 2, ROUTE_32_RUINS_OF_ALPH_GATE

.CoordEvents: db 0

.BGEvents: db 5
	signpost 19, 13, SIGNPOST_READ, VioletCitySign
	signpost 7, 17, SIGNPOST_READ, VioletGymSign
	signpost 29, 12, SIGNPOST_READ, VioletCityPokeCenterSign
	signpost 15, 8, SIGNPOST_READ, VioletCityMartSign
	signpost 4, 28, SIGNPOST_ITEM, VioletCityHiddenHyperPotion

.ObjectEvents: db 7
	person_event SPRITE_LASS, 21, 23, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, VioletCityLassScript, -1
	person_event SPRITE_SUPER_NERD, 24, 11, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, VioletCitySuperNerdScript, -1
	person_event SPRITE_YOUNGSTER, 8, 13, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, VioletCityGrampsScript, -1
	person_event SPRITE_YOUNGSTER, 17, 9, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, VioletCityYoungsterScript, -1
	person_event SPRITE_FRUIT_TREE, 29, 26, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, VioletCityFruitTreeScript, -1
	person_event SPRITE_POKE_BALL, 6, 11, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, VioletCityPPUp, EVENT_VIOLET_CITY_PP_UP
	person_event SPRITE_POKE_BALL, 12, 28, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, VioletCityRareCandy, EVENT_VIOLET_CITY_RARE_CANDY

