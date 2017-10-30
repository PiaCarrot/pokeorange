Route62_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

Route62XSpecialAttack:
	itemball X_SPCL_ATK
	
Route62TMEarthquake:
	itemball TM_EARTHQUAKE
	
Route62Blackglasses:
	itemball BLACKGLASSES
	
Route62PPUp:
	itemball PP_UP

; YOUNGSTER_HIRUMA
TrainerYoungsterHiruma:
	trainer EVENT_BEAT_YOUNGSTER_HIRUMA, YOUNGSTER, HIRUMA, YoungsterHirumaSeenText, YoungsterHirumaWinText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext YoungsterHirumaAfterText
	waitbutton
	closetext
	end
	
YoungsterHirumaSeenText:
	text "Hey, I know you!"

	para "You're <PLAYER>,"
	line "from VALENCIA IS-"
	cont "LAND. We left near"
	cont "the same time!"
	done
	
YoungsterHirumaWinText:
	text "I should have"
	line "caught more #MON"
	cont "along the way."
	done
	
YoungsterHirumaAfterText:
	text "Not bad. I need"
	line "to train hard!"
	done
	

; LASS_FUYUMI
TrainerLassFuyumi:
	trainer EVENT_BEAT_LASS_FUYUMI, LASS, FUYUMI, LassFuyumiSeenText, LassFuyumiWinText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext LassFuyumiAfterText
	waitbutton
	closetext
	end
	
LassFuyumiSeenText:
	text "Where are you"
	line "going?"
	
	para "Play with me for a"
	line "minute!"
	done
	
LassFuyumiWinText:
	text "Sniffle<...>"
	done
	
LassFuyumiAfterText:
	text "I didn't say you"
	line "could knock all"
	cont "my #MON out!"
	
	para "You meanie!"
	done
	
Route62Sign:
	jumptext R62SignText
	
R62SignText:
	text "ROUTE 62"
	line "to MANDARIN DESERT"
	done
	
Route62ClimbSign:
	jumptext R62ClimbSignText
	
R62ClimbSignText:
	text "Hidden in the mou-"
	line "tain lies SUNRAY"
	cont "CAVE."
	
	para "At the peak, the"
	line "rainbow awaits."
	done

Route62_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 2
	signpost 14, 62, SIGNPOST_READ, Route62Sign
	signpost 4, 50, SIGNPOST_READ, Route62ClimbSign

.ObjectEvents: db 7
	person_event SPRITE_POKE_BALL, 23, 57, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route62XSpecialAttack, EVENT_ROUTE_62_X_SPCL_ATK
	person_event SPRITE_POKE_BALL, 25, 14, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route62TMEarthquake, EVENT_ROUTE_62_TM_EARTHQUAKE
	person_event SPRITE_POKE_BALL, 35, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route62Blackglasses, EVENT_ROUTE_62_BLACKGLASSES
	person_event SPRITE_POKE_BALL, 8, 42, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route62PPUp, EVENT_ROUTE_62_PP_UP
	person_event SPRITE_LASS, 14, 11, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerLassFuyumi, -1
	person_event SPRITE_YOUNGSTER, 19, 46, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 3, TrainerYoungsterHiruma, -1
	person_event SPRITE_TRACEY, 31, 24, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_62_TRACEY

