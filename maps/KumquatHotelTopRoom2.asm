KumquatHotelTopRoom2_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

AthleteEdScript:
	trainer EVENT_BEAT_ATHLETE_ED, ATHLETE, ED, AthleteEdSeenText, AthleteEdBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext AthleteEdAfterText
	waitbutton
	closetext
	end

AthleteEdSeenText:
	text "I love this job!"
	line "LUANA lets me work"
	cont "out, and I get to"
	cont "kick TRAINER butt!"
	done

AthleteEdBeatenText:
	text "Yowch!"
	done

AthleteEdAfterText:
	text "I think I pulled"
	line "my hamstring!"
	done

KumquatHotelTopRoom2_MapEventHeader::

.Warps: db 2
	warp_def  5,  1, 1, KUMQUAT_HOTEL_SUITES
	warp_def  5,  2, 1, KUMQUAT_HOTEL_SUITES

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_COOLTRAINER_M,  2,  1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TRAINER, 0, AthleteEdScript, -1
