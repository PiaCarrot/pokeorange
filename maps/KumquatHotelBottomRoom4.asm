KumquatHotelBottomRoom4_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

AthleteJackScript:
	trainer EVENT_BEAT_ATHLETE_JACK, ATHLETE, JACK, AthleteJackSeenText, AthleteJackBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext AthleteJackAfterText
	waitbutton
	closetext
	end

AthleteJackSeenText:
	text "Just got back from"
	line "an intense run."
	
	para "I'm in the mood"
	line "for a battle!"
	done

AthleteJackBeatenText:
	text "That's a good"
	line "sweat!"
	done

AthleteJackAfterText:
	text "Phew! I'm beat!"
	done

KumquatHotelBottomRoom4_MapEventHeader::

.Warps: db 1
	warp_def  0,  1, 8, KUMQUAT_HOTEL_SUITES

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_COOLTRAINER_M,  4, 1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TRAINER, 2, AthleteJackScript, -1