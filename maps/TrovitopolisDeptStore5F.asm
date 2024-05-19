const_value = 1
	const TROVITOPOLISDEPTSTORE5F_CLERK
	const TROVITOPOLISDEPTSTORE5F_BLACK_BELT_1
	const TROVITOPOLISDEPTSTORE5F_BLACK_BELT_2
	const TROVITOPOLISDEPTSTORE5F_BLACK_BELT_3
	const TROVITOPOLISDEPTSTORE5F_BLACK_BELT_4

TrovitopolisDeptStore5F_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

TrovitopolisDeptStore5FDirectory:
	jumptext TrovitopolisDeptStore5FDirectoryText

TrovitopolisDeptStore5FElevatorButton:
	jumpstd elevatorbutton

TrovitopolisDeptStore5FDirectoryText:
	text "Customize Your"
	line "#MON"

	para "5F TM CORNER"
	done
	
TrovitopolisTMMartScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_TROVITOPOLIS_TM
	closetext
	end
	
Route52IcepunchTutor:
	faceplayer
	opentext
	writetext GivePlayerIcepunchText
	yesorno
	iffalse .TutorRefused
	writebyte ICE_PUNCH
	writetext Text_IcepunchTutorClear
	special Special_MoveTutor
	if_equal $0, .TeachMove
.TutorRefused
	writetext Text_IcepunchTutorRefused
	waitbutton
	closetext
	end

.TeachMove
	writetext Text_IcepunchTutorTaught
	waitbutton
	closetext
	end

GivePlayerIcepunchText:
	text "Hu ha! We are the"
	line "Order of the Fist!"
	
	para "Our leader left us"
	line "here to teach our"
	cont "ways while he went"
	cont "on a mission to"
	cont "TANGELO ISLAND!"
	
	para "As such, I can"
	line "teach your #MON"
	cont "ICE PUNCH! Want"
	cont "to learn?"
	done
	
Text_IcepunchTutorTaught:
	text "ICE PUNCH is"
	line "an ICE attack"
	cont "that can sometimes"
	cont "freeze your foe!"
	done
	
Text_IcepunchTutorRefused:
	text "Very well!"
	done
	
Text_IcepunchTutorClear:
	text ""
	done
	
Route52FirepunchTutor:
	faceplayer
	opentext
	writetext GivePlayerFirepunchText
	yesorno
	iffalse .TutorRefused
	writebyte FIRE_PUNCH
	writetext Text_FirepunchTutorClear
	special Special_MoveTutor
	if_equal $0, .TeachMove
.TutorRefused
	writetext Text_FirepunchTutorRefused
	waitbutton
	closetext
	end

.TeachMove
	writetext Text_FirepunchTutorTaught
	waitbutton
	closetext
	end

GivePlayerFirepunchText:
	text "Hu ha! We are the"
	line "Order of the Fist!"
	
	para "Our leader left us"
	line "here to teach our"
	cont "ways while he went"
	cont "on a mission to"
	cont "TANGELO ISLAND!"
	
	para "As such, I can"
	line "teach your #MON"
	cont "FIRE PUNCH! Want"
	cont "to learn?"
	done
	
Text_FirepunchTutorTaught:
	text "FIRE PUNCH is"
	line "a FIRE attack"
	cont "that can sometimes"
	cont "burn your foe!"
	done
	
Text_FirepunchTutorRefused:
	text "Very well!"
	done
	
Text_FirepunchTutorClear:
	text ""
	done
	
Route52CometpunchTutor:
	faceplayer
	opentext
	writetext GivePlayerCometpunchText
	yesorno
	iffalse .TutorRefused
	writebyte COMET_PUNCH
	writetext Text_CometpunchTutorClear
	special Special_MoveTutor
	if_equal $0, .TeachMove
.TutorRefused
	writetext Text_CometpunchTutorRefused
	waitbutton
	closetext
	end

.TeachMove
	writetext Text_CometpunchTutorTaught
	waitbutton
	closetext
	end

GivePlayerCometpunchText:
	text "Hu ha! We are the"
	line "Order of the Fist!"
	
	para "Our leader left us"
	line "here to teach our"
	cont "ways while he went"
	cont "on a mission to"
	cont "TANGELO ISLAND!"
	
	para "As such, I can"
	line "teach your #MON"
	cont "COMET PUNCH! Want"
	cont "to learn?"
	done
	
Text_CometpunchTutorTaught:
	text "COMET PUNCH is"
	line "a NORMAL attack"
	cont "that can hit the"
	cont "foe many times!"
	done
	
Text_CometpunchTutorRefused:
	text "Very well!"
	done
	
Text_CometpunchTutorClear:
	text ""
	done
	
Route52DynamicPunchTutor:
	faceplayer
	opentext
	writetext GivePlayerDynamicpunchText
	yesorno
	iffalse .TutorRefused
	writebyte DYNAMICPUNCH
	writetext Text_DynamicpunchTutorClear
	special Special_MoveTutor
	if_equal $0, .TeachMove
.TutorRefused
	writetext Text_DynamicpunchTutorRefused
	waitbutton
	closetext
	end

.TeachMove
	writetext Text_DynamicpunchTutorTaught
	waitbutton
	closetext
	end

GivePlayerDynamicpunchText:
	text "Hu ha! We are the"
	line "Order of the Fist!"
	
	para "Our leader left us"
	line "here to teach our"
	cont "ways while he went"
	cont "on a mission to"
	cont "TANGELO ISLAND!"
	
	para "As such, I can"
	line "teach your #MON"
	cont "DYNAMICPUNCH! Want"
	cont "to learn?"
	done
	
Text_DynamicpunchTutorTaught:
	text "DYNAMICPUNCH is"
	line "a FIGHTING attack"
	cont "that can confuse"
	cont "the foe!"
	done
	
Text_DynamicpunchTutorRefused:
	text "Very well!"
	done
	
Text_DynamicpunchTutorClear:
	text ""
	done

TrovitopolisDeptStore5F_MapEventHeader:

.Warps: db 3
	warp_def $0, $c, 1, TROVITOPOLIS_DEPT_STORE_4F
	warp_def $0, $f, 1, TROVITOPOLIS_DEPT_STORE_6F
	warp_def $0, $2, 1, TROVITOPOLIS_DEPT_STORE_ELEVATOR

.XYTriggers: db 0

.Signposts: db 2
	signpost 0, 14, SIGNPOST_READ, TrovitopolisDeptStore5FDirectory
	signpost 0, 3, SIGNPOST_READ, TrovitopolisDeptStore5FElevatorButton

.PersonEvents: db 5
	person_event SPRITE_CLERK, 5, 8, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TrovitopolisTMMartScript, -1
	person_event SPRITE_BLACK_BELT,  5, 13, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route52IcepunchTutor, -1
	person_event SPRITE_BLACK_BELT,  2, 11, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1,  (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route52FirepunchTutor, -1
	person_event SPRITE_BLACK_BELT,  2,  5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Route52CometpunchTutor, -1
	person_event SPRITE_BLACK_BELT,  5,  3, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Route52DynamicPunchTutor, -1
