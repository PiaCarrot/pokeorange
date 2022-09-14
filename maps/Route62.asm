const_value = 1
	const ROUTE_62_ITEMBALL1
	const ROUTE_62_ITEMBALL2
	const ROUTE_62_ITEMBALL3
	const ROUTE_62_ITEMBALL4
	const ROUTE_62_LASS
	const ROUTE_62_YOUNGSTER
	const ROUTE_62_TRACEY

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
	text "Should've caught"
	line "more #MON"
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
	
Route62TraceyScript:
	faceplayer
	showemote EMOTE_SHOCK, ROUTE_62_TRACEY, 15
	playmusic MUSIC_TRACEY_ENCOUNTER
	opentext
	writetext TraceyRoute62Text
	waitbutton
	closetext
	winlosstext TraceyRoute62WinLoss, 0
	loadtrainer TRACEY, 3
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_TRACEY_ENCOUNTER
	opentext
	writetext TraceyRoute62LeavingNowText
	waitbutton
	closetext
	applymovement ROUTE_62_TRACEY, Tracey62_Movement
	disappear ROUTE_62_TRACEY
	playsound SFX_ENTER_DOOR
	special Special_FadeOutMusic
	special RestartMapMusic
	playmusic MUSIC_ROUTE_62
	pause 10
	setevent EVENT_ROUTE_62_TRACEY
	end
	
TraceyRoute62Text:
	text "TRACEY: Well, look"
	line "who it is!"
	
	para "<PLAYER>, how's it"
	line "going? I bet you"
	cont "got a lot stronger"
	cont "since ROUTE 56!"
	
	para "Why don't we test"
	line "my theory in a"
	cont "battle!"
	done
	
TraceyRoute62WinLoss:
	text "Unbelievable!"
	done
	
TraceyRoute62LeavingNowText:
	text "TRACEY: I'm headed"
	line "to TROVITOPOLIS!"
	
	para "I've heard they"
	line "have a huge prob-"
	cont "lem due to their"
	cont "mayor."
	
	para "I'm going to go"
	line "see if I can"
	cont "help them!"
	
	para "Seeya, <PLAYER>!"
	done
	
Tracey62_Movement:
	step UP
	step RIGHT
	step UP
	step_end

Route62_MapEventHeader::

.Warps: db 1
	warp_def 7, 6, 3, ROUTE_62_MANDARIN_DESERT_GATE

.CoordEvents: db 0

.BGEvents: db 2
	signpost 14, 62, SIGNPOST_READ, Route62Sign
	signpost  8, 46, SIGNPOST_READ, Route62ClimbSign

.ObjectEvents: db 7
	person_event SPRITE_POKE_BALL, 10, 34, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route62XSpecialAttack, EVENT_ROUTE_62_X_SPCL_ATK
	person_event SPRITE_POKE_BALL, 25, 14, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route62TMEarthquake, EVENT_ROUTE_62_TM_EARTHQUAKE
	person_event SPRITE_POKE_BALL, 39, 64, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route62Blackglasses, EVENT_ROUTE_62_BLACKGLASSES
	person_event SPRITE_POKE_BALL, 12, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route62PPUp, EVENT_ROUTE_62_PP_UP
	person_event SPRITE_LASS, 23, 37, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerLassFuyumi, -1
	person_event SPRITE_YOUNGSTER, 22, 23, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerYoungsterHiruma, -1
	person_event SPRITE_TRACEY, 9, 5, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route62TraceyScript, EVENT_ROUTE_62_TRACEY

