const_value set 1
	const KUMQUAT_POOL_TRAINER_1
	const KUMQUAT_POOL_TRAINER_2
	const KUMQUAT_POOL_TRAINER_TRAD
	const KUMQUAT_POOL_TRAINER_4
	const KUMQUAT_POOL_KEY_TRAINER_SHEILA

KumquatHotelPool_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

PlaceholderScript:
	end
	
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
	text "SHEILA is just too"
	line "good for the likes"
	cont "of you!"
	done

CooltrainerMTradBeatenText:
	text "I'm washed out!"
	done

CooltrainerMTradAfterText:
	text "Even if you beat"
	line "SHEILA, there's"
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
	
;EVENT_POOL_MASTER_DEFEATED

KumquatHotelPool_MapEventHeader::

.Warps: db 2
	warp_def 15, 9, 3, KUMQUAT_HOTEL_LOBBY
	warp_def 15, 10, 3, KUMQUAT_HOTEL_LOBBY

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 5
	person_event SPRITE_COOLTRAINER_F,  5, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_TRAINER, 2, CooltrainerFMaryScript, -1
	person_event SPRITE_LASS,  9,  0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 0, PlaceholderScript, -1
	person_event SPRITE_COOLTRAINER_M,  5,  0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_TRAINER, 4, CooltrainerMTradScript, -1
	person_event SPRITE_FISHER,  9, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_TRAINER, 0, PlaceholderScript, -1
	person_event SPRITE_SWIMMER_GIRL,  8,  7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PlaceholderScript, -1
