KumquatHotelBottomRoom3_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

AthleteBruceScript:
	trainer EVENT_BEAT_ATHLETE_BRUCE, ATHLETE, BRUCE, AthleteBruceSeenText, AthleteBruceBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext AthleteBruceAfterText
	waitbutton
	closetext
	end

AthleteBruceSeenText:
	text "DO-DUO!"
	line "DO-DRIO!"
	done

AthleteBruceBeatenText:
	text "DO-OH!"

	done

AthleteBruceAfterText:
	text "DODUO are the"
	line "coolest!"
	done

KumquatHotelBottomRoom3_MapEventHeader::

.Warps: db 1
	warp_def  0,  1, 5, KUMQUAT_HOTEL_SUITES

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_COOLTRAINER_M,  4, 1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_TRAINER, 2, AthleteBruceScript, -1