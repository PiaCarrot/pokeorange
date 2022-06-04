const_value = 1
	const TROVITOPOLIS_PRIMA_LORELEI
	const TROVITOPOLIS_PRIMA_STUDENT1
	const TROVITOPOLIS_PRIMA_STUDENT2
	const TROVITOPOLIS_PRIMA_TEACHER

TrovitopolisPrimaSchool_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

StudentScript:
	opentext
	writetext StudentStudyingHardText
	waitbutton
	closetext
	end

StudentStudyingHardText:
	text "They seem to be"
	line "studying hard<...>"
	
	para "Best not disturb!"
	done
	
TeacherSchoolScript:
	faceplayer
	opentext
	checkevent EVENT_RECEIVED_HM_STRENGTH
	iftrue .AlreadyGotStrength
	writetext StrengthQuizWantToTakeText
	yesorno
	iftrue .StrengthQuiz
	writetext PrimaTeacherComeAgainText
	waitbutton
	closetext
	end
	
.AlreadyGotStrength:
	writetext AlreadyGotStrengthText
	waitbutton
	closetext
	end
	
.StrengthQuiz:
	writetext PrimaQuestion1
	yesorno
	iffalse .FailQuiz
	playsound SFX_ELEVATOR_END
	writetext PrimaQuestionCorrectText
	waitbutton
	writetext PrimaQuestion2
	yesorno
	iffalse .FailQuiz
	playsound SFX_ELEVATOR_END
	writetext PrimaQuestionCorrectText
	waitbutton
	writetext PrimaQuestion3
	yesorno
	iftrue .FailQuiz
	playsound SFX_ELEVATOR_END
	writetext PrimaQuestionCorrectText
	waitbutton
	writetext PrimaQuestion4
	yesorno
	iffalse .FailQuiz
	playsound SFX_ELEVATOR_END
	writetext PrimaQuestionCorrectText
	waitbutton
	writetext PrimaQuestion5
	yesorno
	iftrue .FailQuiz
	playsound SFX_ELEVATOR_END
	writetext PrimaQuestionCorrectText
	waitbutton
	writetext PrimaStrengthHMPrizeText
	waitbutton
	verbosegiveitem HM_STRENGTH
	setevent EVENT_RECEIVED_HM_STRENGTH
	closetext
	end

.FailQuiz:
	playsound SFX_WRONG
	writetext PrimaThatsWrongText
	waitbutton
	closetext
	end
	
PrimaQuestionCorrectText:
	text "That is correct!"
	done
	
PrimaThatsWrongText:
	text "Sorry, that's not"
	line "right."
	done
	
PrimaQuestion1: ;ANSWER IS YES
	text "CHATOT can learn"
	line "human speech?"
	done
	
PrimaQuestion2: ;ANSWER IS YES
	text "MAREEP is ELECTRIC"
	line "type?"
	done
	
PrimaQuestion3: ;ANSWER IS NO
	text "MAGIKARP can be"
	line "found almost any-"
	cont "where?"
	done
	
PrimaQuestion4: ;ANSWER IS YES
	text "LORELEI uses ICE"
	line "type #MON?"
	done
	
PrimaQuestion5: ;ANSWER IS NO
	text "RATTATA can learn"
	line "WATER GUN?"
	done

PrimaStrengthHMPrizeText:
	text "Wow, great job!"
	line "Here's your prize"
	cont "for completing the"
	cont "test!"
	done

StrengthQuizWantToTakeText:
	text "Welcome to PRIMA's"
	line "OFFICIAL SCHOOL"
	cont "for TRAINERS."
	
	para "We offer a good"
	line "item for students"
	cont "who can pass our"
	cont "test. Want to try?"
	done
	
PrimaTeacherComeAgainText:
	text "Please come back"
	line "if you change your"
	cont "mind."
	done
	
AlreadyGotStrengthText:
	text "What a bright"
	line "student you are!"
	done
	
LoreleiSchoolScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LORELEI
	iftrue .AlreadyBeatLoreleiOnce
	writetext DoYouWantToBattleLoreleiText
	yesorno
	iftrue .BattleLoreleiFirstTime
	writetext LoreleiComeBackLaterText
	waitbutton
	closetext
	end

.AlreadyBeatLoreleiOnce:
	;checkevent EVENT_BEAT_DRAKE?
	writetext AlreadyBeatLoreleiOnceText
	waitbutton
	closetext
	end
	
.BattleLoreleiFirstTime:
	writetext BattleLoreleiFirstTimeText
	waitbutton
	closetext
	winlosstext LoreleiWinLossText, 0
	loadtrainer LORELEI, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LORELEI
	opentext
	writetext AlreadyBeatLoreleiOnceText
	waitbutton
	closetext
	end

DoYouWantToBattleLoreleiText:
	text "LORELEI: <PLAYER>!"
	line "Thanks again for"
	cont "the help. I'd like"
	cont "to make it up to"
	
	para "you."
	
	para "How about a battle"
	line "between the two of"
	cont "us?"
	done

LoreleiComeBackLaterText:
	text "LORELEI: Ahaha!"
	line "Very well! If you"
	cont "change your mind,"
	cont "I'll be here."
	done

AlreadyBeatLoreleiOnceText:
	text "LORELEI: You're"
	line "quite the trainer,"
	cont "<PLAYER>! You"
	cont "remind me of the"
	
	para "current KANTO"
	line "CHAMPION. Take"
	cont "care of yourself."
	done

BattleLoreleiFirstTimeText:
	text "LORELEI: Okay!"
	line "Watch yourself,"
	cont "here I come!"
	done

LoreleiWinLossText:
	text "LORELEI: I'm"
	line "shivering in"
	cont "delight!"
	done

TrovitopolisPrimaSchool_MapEventHeader::

.Warps: db 2
	warp_def 7, 5, 13, TROVITOPOLIS
	warp_def 7, 6, 13, TROVITOPOLIS

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 4
	person_event SPRITE_LORELEI, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LoreleiSchoolScript, EVENT_LORELEI_AT_TRAINER_SCHOOL
	person_event SPRITE_YOUNGSTER, 6, 10, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, StudentScript, -1
	person_event SPRITE_LASS, 5, 2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, StudentScript, -1
	person_event SPRITE_SUPER_NERD, 2, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TeacherSchoolScript, -1

