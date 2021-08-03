Route71_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

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

Route71_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_SURF, 14, 52, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route71LaprasScript, EVENT_PIRATES_DEFEATED_LAPRAS_FAMILY
	person_event SPRITE_SURF, 16, 53, SPRITEMOVEDATA_STANDING_LEFT, 2, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route71LaprasScript, EVENT_PIRATES_DEFEATED_LAPRAS_FAMILY
	person_event SPRITE_SURF, 16, 50, SPRITEMOVEDATA_STANDING_UP, 2, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route71LaprasScript, EVENT_PIRATES_DEFEATED_LAPRAS_FAMILY


