KumquatHotelGym_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

LuanaScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LUANA
	iftrue .FightDone
	writetext LuanaText
	waitbutton
	closetext
	winlosstext LuanaWinLossText, 0
	loadtrainer LUANA, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LUANA
	opentext
	writetext BeatLuanaText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_JADE_STAR_BADGE
	checkcode VAR_BADGES
.FightDone:
	checkevent EVENT_GOT_TM_PSYCHIC
	iftrue .SpeechAfterTM
;	setevent event_beat_gym_trainers
	writetext LuanaPsychicText
	buttonsound
	verbosegiveitem TM_PSYCHIC_M
	iffalse .NoRoomForPsychic
	setevent EVENT_GOT_TM_PSYCHIC
	writetext LuanaPsychicExplanationText
	waitbutton
	closetext
	end

.SpeechAfterTM:
	writetext LuanaAlreadyGotTMText
	waitbutton
.NoRoomForPsychic:
	closetext
	end
	
LuanaText:
	text "Well, I'll be!"
	
	para "You might be just"
	line "as strong as my"
	cont "kiddo!"
	
	para "Defeating me will"
	line "yield the JADE"
	cont "STAR BADGE."
	
	para "So, show me what"
	line "you've got!"
	done
	
LuanaWinLossText:
	text "The child has sur-"
	
	para "Oh, that's right!"
	line "You aren't my kid,"
	cont "<PLAYER>."
	
	para "Great battle! Take"
	line "this JADE STAR"
	cont "BADGE and go forth"
	cont "to PUMMELO!"
	done

BeatLuanaText:
	text "<PLAYER> received"
	line "JADE STAR BADGE."
	done

LuanaPsychicText:
	text "So precious!"

	para "That badge will"
	line "allow any #MON"
	cont "to obey you."

	para "Here--you can"
	line "have this."
	done

LuanaPsychicExplanationText:
	text "That TM contains"
	line "PSYCHIC."
	cont "I'm sure it will"
	cont "be helpful."
	done

LuanaAlreadyGotTMText:
	text "I'll see you"
	line "around, kiddo!"
	done

KumquatHotelGym_MapEventHeader::

.Warps: db 1
	warp_def  0,  7, 1, KUMQUAT_HOTEL_ELEVATOR

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_LUANA,  5,  4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LuanaScript, -1
