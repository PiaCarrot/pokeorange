const_value = 1
	const KUMQUAT_POOL_TRAINER_1
	const KUMQUAT_POOL_TRAINER_2
	const KUMQUAT_POOL_TRAINER_TRAD
	const KUMQUAT_POOL_TRAINER_4
	const KUMQUAT_POOL_KEY_TRAINER_MARINA

KumquatHotelPool_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

SwimmerMarinaScript:
	faceplayer
	opentext
	checkevent EVENT_POOL_MASTER_DEFEATED
	iftrue .BeatPoolMaster
	writetext SwimmerMarinaText1
	waitbutton
	winlosstext MarinaWinLoss, 0
	setlasttalked KUMQUAT_POOL_KEY_TRAINER_MARINA
	loadtrainer SWIMMERF, 8
	startbattle
	reloadmapafterbattle
	opentext
	writetext SwimmerMarinaText2
	waitbutton
	playsound SFX_1ST_PLACE
	writetext GotCardKeyPoolText
	waitbutton
	closetext
	setevent EVENT_POOL_MASTER_DEFEATED
	end
	
.BeatPoolMaster:
	writetext AlreadyBeatMarinaText
	waitbutton
	closetext
	end
	
GotCardKeyPoolText:
	text "You got the LVL 1"
	line "CARD KEY!"
	
	para "You can use that"
	line "in the ELEVATOR"
	cont "in the lobby."
	done
	
MarinaWinLoss:
	text "Crikey!"
	done
	
AlreadyBeatMarinaText:
	text "I found my GOLDUCK"
	line "on KINNOW ISLAND."
	cont "We've been best"
	cont "mates since!"
	done
	
SwimmerMarinaText1:
	text "Nyahah! I'm MARINA"
	line "of KUMQUAT GYM!"
	cont "They call me the"
	cont "POOL MASTER!"
	
	para "If you beat me,"
	line "you get the CARD"
	cont "KEY to the upper"
	cont "floors!"
	done
	
SwimmerMarinaText2:
	text "Crikey! Well done,"
	line "mate! Here's your"
	cont "prize!"
	done
	
CooltrainerMTradScript:
	trainer EVENT_BEAT_COOLTRAINER_M_TRAD, COOLTRAINERM, TRAD, CooltrainerMTradSeenText, CooltrainerMTradBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerMTradAfterText
	waitbutton
	closetext
	end

CooltrainerMTradSeenText:
	text "MARINA is just too"
	line "good for the likes"
	cont "of you!"
	done

CooltrainerMTradBeatenText:
	text "I'm washed out!"
	done

CooltrainerMTradAfterText:
	text "Even if you beat"
	line "MARINA, there's"
	cont "a lot more to"
	cont "this hotel!"
	done
	
CooltrainerFMaryScript:
	trainer EVENT_BEAT_COOLTRAINERF_MARY, COOLTRAINERF, MARY, CooltrainerFMarySeenText, CooltrainerFMaryBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerFMaryAfterText
	waitbutton
	closetext
	end

CooltrainerFMarySeenText:
	text "Training under"
	line "LUANA has made my"
	cont "#MON the best"
	cont "they can be!"
	done

CooltrainerFMaryBeatenText:
	text "Training never"
	line "ends!"
	done

CooltrainerFMaryAfterText:
	text "We just have to"
	line "work harder!"
	done
	
OtakuDocScript:
	trainer EVENT_BEAT_OTAKU_DOC, OTAKU, DOC, OtakuDocSeenText, OtakuDocBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext OtakuDocAfterText
	waitbutton
	closetext
	end

OtakuDocSeenText:
	text "I'm at the apex of"
	line "my career!"
	
	para "Prepare to fall!"
	done

OtakuDocBeatenText:
	text "Master SHEILA!"
	done

OtakuDocAfterText:
	text "Does any of my"
	line "effort mean any-"
	cont "thing?"
	done
	
LassRileyScript:
	trainer EVENT_BEAT_LASS_RILEY, LASS, RILEY, LassRileySeenText, LassRileyBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext LassRileyAfterText
	waitbutton
	closetext
	end

LassRileySeenText:
	text "Cuteness is totes"
	line "prio! Feel my"
	cont "cuties' wrath!"
	done

LassRileyBeatenText:
	text "Kyaa! My babies!"
	done

LassRileyAfterText:
	text "You are totes"
	line "going on my black"
	cont "list!"
	done

;EVENT_POOL_MASTER_DEFEATED

KumquatHotelPool_MapEventHeader::

.Warps: db 2
	warp_def 15, 9, 3, KUMQUAT_HOTEL_LOBBY
	warp_def 15, 10, 3, KUMQUAT_HOTEL_LOBBY

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 5
	person_event SPRITE_COOLTRAINER_F,  5, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TRAINER, 2, CooltrainerFMaryScript, -1
	person_event SPRITE_LASS,  9,  0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 2, LassRileyScript, -1
	person_event SPRITE_COOLTRAINER_M,  5,  0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 4, CooltrainerMTradScript, -1
	person_event SPRITE_FISHER,  9, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_TRAINER, 2, OtakuDocScript, -1
	person_event SPRITE_SWIMMER_GIRL,  8,  7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SwimmerMarinaScript, -1
