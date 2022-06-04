const_value = 1
	const MORO_COOLTRAINER_M
	const MORO_COOLTRAINER_F
	const MORO_FATTY
	const MORO_ITEMBALL_WHIRLPOOL

MoroIsland_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_MORO
	return

MoroFattyScript:
	jumptextfaceplayer MoroFattyText

MoroFattyText:
	text "Technology is just"
	line "amazing!"

	para "Hm? You're asking"
	line "if I'm from VALEN-"
	cont "CIA ISLAND?"

	para "I'm not, why?"
	done

MoroCooltrainerMScript:
	jumptextfaceplayer MoroCooltrainerMText

MoroCooltrainerMText:
	text "Ever been to GOL-"
	line "DEN ISLAND?"

	para "There are a bunch"
	line "of crazy MEOWTH"
	cont "lovers there!"
	done

MoroCooltrainerFScript:
	jumptextfaceplayer MoroCooltrainerFText

MoroCooltrainerFText:
	text "I found the cutest"
	line "#MON on ROUTE"
	cont "60!"
	done

MoroIslandSign:
	jumptext MoroIslandSignText

MoroIslandSignText:
	text "MORO ISLAND"

	para "The lilac of the"
	line "east"
	done

MoroIslandMuseumSign:
	jumptext MoroIslandMuseumSignText

MoroIslandMuseumSignText:
	text "MORO ISLAND MUSEUM"
	done

MoroIslandTMFacade:
	itemball TM_FACADE

MoroIslandHiddenNugget:
	dwb EVENT_MORO_ISLAND_HIDDEN_NUGGET, NUGGET

MoroIsland_MapEventHeader::

.Warps: db 9
	warp_def 19, 16, 1, MORO_ISLAND_MUSEUM
	warp_def 11, 7, 1, MORO_POKE_CENTER
	warp_def 9, 27, 1, MORO_FISHING_HOUSE
	warp_def 25, 19, 1, MORO_SOUTH_HOUSE
	warp_def 11, 15, 1, MORO_HOUSE_1
	warp_def 19, 21, 1, MORO_HOUSE_2
	warp_def 15, 29, 1, MORO_MART
	warp_def 16, 4, 3, MORO_ROUTE_60_GATE
	warp_def 17, 4, 4, MORO_ROUTE_60_GATE

.CoordEvents: db 0

.BGEvents: db 3
	signpost 9, 11, SIGNPOST_READ, MoroIslandSign
	signpost 19, 13, SIGNPOST_READ, MoroIslandMuseumSign
	signpost 4, 8, SIGNPOST_ITEM, MoroIslandHiddenNugget

.ObjectEvents: db 4
	person_event SPRITE_COOLTRAINER_M, 22, 22, SPRITEMOVEDATA_WANDER, 0, 1, -1, -2, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MoroCooltrainerMScript, -1
	person_event SPRITE_COOLTRAINER_F, 19, 9, SPRITEMOVEDATA_WANDER, 0, 1, -1, -2, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, MoroCooltrainerFScript, -1
	person_event SPRITE_FISHER, 18, 30, SPRITEMOVEDATA_WANDER, 0, 1, -1, -2, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MoroFattyScript, -1
	person_event SPRITE_POKE_BALL, 29, 28, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MoroIslandTMFacade, EVENT_MORO_TM_FACADE
