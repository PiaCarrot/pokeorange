const_value = 1
	const ROUTE58_SALESMAN

Route58_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

Route58SalesmanScript:
	opentext
	writetext LastMinuteSuppliesText
	yesorno
	iftrue .SellStuff
	closetext
	end

.SellStuff:
	pokemart MARTTYPE_STANDARD, MART_ROUTE_58
	closetext
	end

LastMinuteSuppliesText:
	text "Need any last min-"
	line "ute supplies for"
	cont "NAVEL ISLAND?"
	done

CooltrainerMAkira:
	trainer EVENT_BEAT_COOLTRAINERM_AKIRA, COOLTRAINERM, AKIRA, CooltrainerAkiraSeenText, CooltrainerAkiraBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerAkiraAfterText
	waitbutton
	closetext
	end

CooltrainerAkiraSeenText:
	text "NAVEL ISLAND is a"
	line "large dormant vol-"
	cont "cano."

	para "It's a perilous"
	line "dungeon home to"
	cont "many ICE-type"
	cont "#MON now."
	done

CooltrainerAkiraBeatenText:
	text "Hey, you're cool."
	done

CooltrainerAkiraAfterText:
	text "After hundreds of"
	line "years the peak of"
	cont "the island became"
	cont "cold and snowy."
	done

Route58Sign:
	jumptext Route58SignText

Route58SignText:
	text "ROUTE 58"
	line "EAST to NAVEL"
	cont "SOUTH to GRAPE-"
	cont "FRUIT ISLANDS"
	done

Route58_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 1
	signpost 12, 16, SIGNPOST_READ, Route58Sign

.ObjectEvents: db 2
	person_event SPRITE_FISHER,  6, 17, SPRITEMOVEDATA_STANDING_LEFT, 2, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route58SalesmanScript, -1
	person_event SPRITE_COOLTRAINER_M, 14, 17, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, CooltrainerMAkira, -1
