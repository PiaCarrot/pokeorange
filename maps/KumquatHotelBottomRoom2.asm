KumquatHotelBottomRoom2_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

AthleteBarneyScript:
	trainer EVENT_BEAT_ATHLETE_BARNEY, ATHLETE, BARNEY, AthleteBarneySeenText, AthleteBarneyBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext AthleteBarneyAfterText
	waitbutton
	closetext
	end

AthleteBarneySeenText:
	text "SUITE? SWEET?"
	line "SWEAT?"
	cont "Uh."
	
	para "SHOOT!"
	done

AthleteBarneyBeatenText:
	text "Dag gone it!"
	done

AthleteBarneyAfterText:
	text "You have more"
	line "sweet suites to"
	cont "check out."
	done

KumquatHotelBottomRoom2_MapEventHeader::

.Warps: db 1
	warp_def  0,  1, 4, KUMQUAT_HOTEL_SUITES

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_COOLTRAINER_M,  4, 1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TRAINER, 2, AthleteBarneyScript, -1