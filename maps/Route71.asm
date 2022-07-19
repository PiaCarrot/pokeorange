Route71_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .InitializeDiveMap

.InitializeDiveMap:
	divemap ROUTE_71_UNDERWATER, 0, 0
	return

Route71LaprasScript:
	faceplayer
	opentext
	checkevent EVENT_LAPRAS_FAMILY
	iftrue .AlreadyShownLapras
	writetext Route71LaprasText1
	waitbutton
	special Special_BillsGrandfather
	iffalse .NoLapras
	if_not_equal LAPRAS, .NoLapras
	writetext Route71LaprasText3
	waitbutton
	cry LAPRAS
	verbosegiveitem TM_RETURN
	closetext
	setevent EVENT_LAPRAS_FAMILY
	end
	
.AlreadyShownLapras:
	writetext Route71LaprasText2
	waitbutton
	closetext
	end
	
.NoLapras:
	closetext
	end
	
Route71LaprasText1:
	text "The LAPRAS looks"
	line "at you curiously."
	cont "Perhaps this is"
	cont "LAPRAS' family"
	
	para "that TRACEY men-"
	line "tioned."
	done
	
Route71LaprasText2:
	text "The family of"
	line "LAPRAS is over-"
	cont "joyed that their"
	cont "lost one is safe."
	done
	
Route71LaprasText3:
	text "Upon being re-"
	line "united with their"
	cont "lost one, the pod"
	cont "of LAPRAS seem"
	
	para "overjoyed!"
	line "It appears LAPRAS"
	cont "is ready to move"
	cont "on!"
	done
	
Route71PirateGuard:
	jumptextfaceplayer Route71PirateGuardText
	
Route71PirateGuardText:
	text "Yarr! There be no"
	line "gettin' through,"
	cont "scallywag!"
	done
	
Route71PirateTutorScript:
	faceplayer
	opentext
	writetext GivePlayerSwordsDanceText
	yesorno
	iffalse .TutorRefused
	writebyte SWORDS_DANCE
	writetext Text_SwordsDanceTutorClear
	special Special_MoveTutor
	if_equal $0, .TeachMove
.TutorRefused
	writetext Text_SwordsDanceTutorRefused
	waitbutton
	closetext
	end

.TeachMove
	writetext Text_SwordsDanceTutorTaught
	waitbutton
	closetext
	end

GivePlayerSwordsDanceText:
	text "Yarr!"
	line "I bet ye want to"
	cont "be as good at"
	cont "sword fightin' as"
	
	para "me!"
	line "Well, ter' bad!"
	cont "But, I can teach"
	cont "yer #MON"
	
	para "SWORDS DANCE if"
	line "ye want?"
	done
	
Text_SwordsDanceTutorTaught:
	text "Arr! SWORDS DANCE"
	line "Will let ye raise"
	cont "your ATTACK up two"
	cont "stages! Arr!"
	done
	
Text_SwordsDanceTutorRefused:
	text "Arr! Off with ye,"
	line "scurvy dog!"
	done
	
Text_SwordsDanceTutorClear:
	text ""
	done
	
Route71TradeStone:
	itemball TRADE_STONE

Route71_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 7
	person_event SPRITE_SURF, 15, 55, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route71LaprasScript, EVENT_PIRATES_DEFEATED_LAPRAS_FAMILY
	person_event SPRITE_SURF, 18, 56, SPRITEMOVEDATA_STANDING_LEFT, 2, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route71LaprasScript, EVENT_PIRATES_DEFEATED_LAPRAS_FAMILY
	person_event SPRITE_SURF, 17, 53, SPRITEMOVEDATA_STANDING_UP, 2, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route71LaprasScript, EVENT_PIRATES_DEFEATED_LAPRAS_FAMILY
	person_event SPRITE_POKE_BALL, 10,  4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route71TradeStone, EVENT_ROUTE_71_TRADE_STONE
	person_event SPRITE_SAILOR, 29, 41, SPRITEMOVEDATA_STANDING_LEFT, 2, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route71PirateGuard, EVENT_RAYMOND_DEFEATED
	person_event SPRITE_SAILOR, 28, 41, SPRITEMOVEDATA_STANDING_LEFT, 2, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route71PirateGuard, EVENT_RAYMOND_DEFEATED
	person_event SPRITE_SAILOR, 10, 26, SPRITEMOVEDATA_STANDING_UP, 2, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route71PirateTutorScript, -1

