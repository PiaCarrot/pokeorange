KumquatHotelTopRoom1_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

AthleteJuanScript:
	trainer EVENT_BEAT_ATHLETE_JUAN, ATHLETE, JUAN, AthleteJuanSeenText, AthleteJuanBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext AthleteJuanAfterText
	waitbutton
	closetext
	end

AthleteJuanSeenText:
	text "Life has many"
	line "doors."
	
	para "You picked the"
	line "wrong one!"
	done

AthleteJuanBeatenText:
	text "Gulp!"
	done

AthleteJuanAfterText:
	text "Maybe all the"
	line "doors lead to the"
	cont "KEY."
	done

KumquatHotelTopRoom1_MapEventHeader::

.Warps: db 2
	warp_def  5,  1, 1, KUMQUAT_HOTEL_SUITES
	warp_def  5,  2, 1, KUMQUAT_HOTEL_SUITES

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_COOLTRAINER_M,  2,  1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TRAINER, 0, AthleteJuanScript, -1
