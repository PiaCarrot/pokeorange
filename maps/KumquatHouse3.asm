const_value = 1
	const ROUTE_67_ATTRACT_TUTOR

KumquatHouse3_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

Route67AttractTutor:
	faceplayer
	opentext
	writetext GivePlayerAttractText
	yesorno
	iffalse .TutorRefused
	writebyte ATTRACT
	writetext Text_AttractTutorClear
	special Special_MoveTutor
	if_equal $0, .TeachMove
.TutorRefused
	writetext Text_AttractTutorRefused
	waitbutton
	closetext
	end

.TeachMove
	writetext Text_AttractTutorTaught
	waitbutton
	closetext
	end

GivePlayerAttractText:
	text "Hey, cutie!"
	line "<...>"
	
	para "Hmm, you're cute,"
	line "but you have no"
	cont "game!"
	
	para "OK!"
	
	para "I'll teach your"
	line "#MON how to"
	cont "ATTRACT for you!"
	
	para "Want to learn"
	line "ATTRACT?"
	done
	
Text_AttractTutorTaught:
	text "ATTRACT charms"
	line "#MON of the"
	cont "opposite gender."
	done
	
Text_AttractTutorRefused:
	text "Tell me if you"
	line "change your mind!"
	done
	
Text_AttractTutorClear:
	text ""
	done

KumquatHouse3_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 1, ROUTE_67
	warp_def 7, 3, 1, ROUTE_67

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_LASS, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route67AttractTutor, -1