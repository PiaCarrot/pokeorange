const_value = 1
	const MANDARINUNDERGROUND_ENGINEER1
	const MANDARINUNDERGROUND_ENGINEER2

MandarinUndergroundBF1_MapScriptHeader::

.MapTriggers: db 0

.MapCallbacks: db 0

; Engineer Take
TrainerEngineerTake:
	trainer EVENT_BEAT_ENGINEER_TAKE, ENGINEER, TAKE, EngineerTakeSeenText, EngineerTakeWinText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext EngineerTakeAfterText
	waitbutton
	closetext
	end
	
EngineerTakeSeenText:
	text "Hey, kid! This is"
	line "a construction"
	cont "site! You can't be"
	cont "around here!"
	done
	
EngineerTakeWinText:
	text "Scram!"
	done
	
EngineerTakeAfterText:
	text "We're building a"
	line "RADIO TOWER here"
	cont "for those SILPH"
	cont "CO. employees!"
	
	para "What were their"
	line "names again? Oh,"
	cont "right! BOOF and"
	cont "CASSIDY!"
	done

; Engineer Mura
TrainerEngineerMura:
	trainer EVENT_BEAT_ENGINEER_MURA, ENGINEER, MURA, EngineerMuraSeenText, EngineerMuraWinText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext EngineerMuraAfterText
	waitbutton
	closetext
	end
	
EngineerMuraSeenText:
	text "Ahh, now look what"
	line "you've done!"
	
	para "You stepped on my"
	line "switch!"
	done
	
EngineerMuraWinText:
	text "I think it's bent."
	done
	
EngineerMuraAfterText:
	text "I guess I'll have"
	line "put in a new one."
	done

MandarinUndergroundBF1_MapEventHeader::

.Warps: db 3
	warp_def 4, 3, 3, MANDARIN_UNDERGROUND_ENTRANCE
	warp_def 2, 11, 1, MANDARIN_UNDERGROUND_BF2
	warp_def 12, 6, 4, MANDARIN_UNDERGROUND_ENTRANCE

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_SUPER_NERD, 7, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 1, TrainerEngineerTake, -1
	person_event SPRITE_SUPER_NERD, 1, 5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 2, TrainerEngineerMura, -1
