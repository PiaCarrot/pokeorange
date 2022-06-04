const_value = 1
	const SUNBURST_VENDOR1
	const SUNBURST_VENDOR2
	const SUNBURST_VENDOR3
	const SUNBURST_GRAMPS
	const SUNBURST_COOLTRAINERF
	const SUNBURST_FISHER2
	const SUNBURST_SUNNY_DAY

SunburstIsland_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_SUNBURST
	return

SunburstFatManScript:
	jumptextfaceplayer SunburstFatManText

SunburstCooltrainerFScript:
	jumptextfaceplayer SunburstCooltrainerFText

SunburstGrampsScript:
	jumptextfaceplayer SunburstGrampsText

SunburstBlueSalesmanScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_SUNBURST1
	closetext
	end

SunburstRedSalesmanScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_SUNBURST2
	closetext
	end

SunburstGreenSalesmanScript:
	faceplayer
	opentext
	pokemart MARTTYPE_STANDARD, MART_SUNBURST3
	closetext
	end

SunburstSign:
	jumptext SunburstSignText

BazaarSign:
	jumptext BazaarSignText

IslandSign:
	jumptext IslandSignText

CenterSign:
	jumptext CenterSignText

CaveSign:
	jumptext CaveSignText

SunburstHiddenIron:
	dwb EVENT_SUNBURST_ISLAND_HIDDEN_IRON, IRON

SunburstHiddenMoonStone:
	dwb EVENT_SUNBURST_ISLAND_HIDDEN_MOON_STONE, MOON_STONE

SunburstTMSunnyDay:
	itemball TM_SUNNY_DAY

SunburstFatManText:
	text "This is CRYSTAL"
	line "CAVE."

	para "Legend has it"
	line "that an ONIX made"
	cont "of crystal lives"
	cont "inside."

	para "Speaking of ONIX,"
	line "a gym leader from"
	cont "KANTO came by"
	cont "earlier."
	done

SunburstCooltrainerFText:
	text "Oh my gosh!"

	para "I saw BROCK, the"
	line "PEWTER CITY gym"
	cont "leader from KANTO!"
	done

SunburstGrampsText:
	text "This used to be"
	line "a well-off town,"
	cont "like MANDARIN"
	cont "ISLAND NORTH was."

	para "Recently tourism"
	line "has died off, our"
	cont "business has been"
	cont "suffering for it."
	done

SunburstSignText:
	text "SUNBURST ISLAND"

	para "The island where"
	line "crystal shines"
	cont "bright."
	done

BazaarSignText:
	text "SUNBURST BAZAAR"
	done

IslandSignText:
	text "CRYSTAL SHOP"

	para "Out of Business"
	done

CenterSignText:
	text "SUNBURST ISLAND"
	line "#MON CENTER"
	done

CaveSignText:
	text "CRYSTAL CAVE"

	para "Follow right to"
	line "ROUTE 55."
	done
	
SunburstHiddenNugget:
	dwb EVENT_ROUTE_SUNBURST_ISLAND_HIDDEN_NUGGET, NUGGET

SunburstIsland_MapEventHeader::

.Warps: db 6
	warp_def 41, 30, 1, CRYSTAL_CAVE_1F
	warp_def 27, 27, 1, SUNBURST_POKECENTER
	warp_def 9, 7, 1, SUNBURST_CRYSTAL_SHOP
	warp_def 11, 21, 1, SUNBURST_SMALL_HOUSE
	warp_def 17, 27, 1, SUNBURST_LARGE_HOUSE
	warp_def 33, 7, 1, SUNBURST_SOUTH_HOUSE

.CoordEvents: db 0

.BGEvents: db 8
	signpost 18, 30, SIGNPOST_READ, SunburstSign
	signpost 26, 18, SIGNPOST_READ, BazaarSign
	signpost 9, 5, SIGNPOST_READ, IslandSign
	signpost 27, 28, SIGNPOST_READ, CenterSign
	signpost 42, 28, SIGNPOST_READ, CaveSign
	signpost 28, 14, SIGNPOST_ITEM, SunburstHiddenIron
	signpost 29, 19, SIGNPOST_ITEM, SunburstHiddenMoonStone
	signpost 41, 10, SIGNPOST_ITEM, SunburstHiddenNugget

.ObjectEvents: db 7
	person_event SPRITE_GRAMPS, 22,  7, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunburstGrampsScript, -1
	person_event SPRITE_YOUNGSTER, 26, 15, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SunburstBlueSalesmanScript, -1
	person_event SPRITE_YOUNGSTER, 24, 21, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunburstRedSalesmanScript, -1
	person_event SPRITE_YOUNGSTER, 24, 16, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SunburstGreenSalesmanScript, -1
	person_event SPRITE_COOLTRAINER_F, 13, 31, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunburstCooltrainerFScript, -1
	person_event SPRITE_FISHER, 42, 25, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SunburstFatManScript, -1
	person_event SPRITE_POKE_BALL, 7, 21, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, SunburstTMSunnyDay, EVENT_SUNBURST_TM_SUNNY_DAY
