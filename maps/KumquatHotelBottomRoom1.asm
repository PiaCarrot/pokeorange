KumquatHotelBottomRoom1_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

AthleteJimboScript:
	trainer EVENT_BEAT_ATHLETE_JIMBO, ATHLETE, JIMBO, AthleteJimboSeenText, AthleteJimboBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext AthleteJimboAfterText
	waitbutton
	closetext
	end

AthleteJimboSeenText:
	text "We all look kind"
	line "of alike."
	
	done

AthleteJimboBeatenText:
	text "Wrong guy!"
	done

AthleteJimboAfterText:
	text "Only one of us has"
	line "the CARD KEY."
	done

KumquatHotelBottomRoom1_MapEventHeader::

.Warps: db 1
	warp_def  0,  1, 5, KUMQUAT_HOTEL_SUITES

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_COOLTRAINER_M,  4, 1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TRAINER, 2, AthleteJimboScript, -1