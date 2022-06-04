const_value = 1
	const INFO_WAITRESS
	const WAITRESS_SATOMI
	const WAITRESS_NAOMI
	const WAITRESS_SAORI
	const WAITRESS_JUN

KinnowCafe_MapScriptHeader::

.MapTriggers: db 0

.MapCallbacks: db 0

WaitressInfo:
	opentext
	faceplayer
	writetext InfoTextCafe
	waitbutton
	closetext
	end

InfoTextCafe:
	text "Welcome to PIA"
	line "CARROT!"

	para "Please battle to"
	line "your heart's cont-"
	cont "ent!"
	done

WaitressSatomi:
	trainer EVENT_BEAT_WAITRESS_SATOMI, WAITRESS, SATOMI, WaitressSatomiSeenText, WaitressSatomiBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext WaitressSatomiAfterText
	waitbutton
	closetext
	end

WaitressSatomiSeenText:
	text "The OWNER went ov-"
	line "erseas to search"
	cont "for new #MON!"
	done

WaitressSatomiBeatenText:
	text "Wow! If only the"
	line "OWNER was here!"
	done

WaitressSatomiAfterText:
	text "The OWNER is way"
	line "stronger than any"
	cont "of us!"
	done

WaitressNaomi:
	trainer EVENT_BEAT_WAITRESS_NAOMI, WAITRESS, NAOMI, WaitressNaomiSeenText, WaitressNaomiBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext WaitressNaomiAfterText
	waitbutton
	closetext
	end

WaitressNaomiSeenText:
	text "Would you like fr-"
	line "ies with that?"
	done

WaitressNaomiBeatenText:
	text "For here or TO GO?"
	done

WaitressNaomiAfterText:
	text "Fanservice costs"
	line "extra."
	done

WaitressSaori:
	trainer EVENT_BEAT_WAITRESS_SAORI, WAITRESS, SAORI, WaitressSaoriSeenText, WaitressSaoriBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext WaitressSaoriAfterText
	waitbutton
	closetext
	end

WaitressSaoriSeenText:
	text "One special coming"
	line "right up!"
	done

WaitressSaoriBeatenText:
	text "No! I lost!"
	done

WaitressSaoriAfterText:
	text "It was supposed"
	line "to be a special"
	cont "for me<...>"
	done

WaitressJun:
	trainer EVENT_BEAT_WAITRESS_JUN, WAITRESS, JUN, WaitressJunSeenText, WaitressJunBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext WaitressJunAfterText
	waitbutton
	closetext
	end

WaitressJunSeenText:
	text "You came to battle"
	line "us?"

	para "Well, let's do it!"
	done

WaitressJunBeatenText:
	text "Well done."
	done

WaitressJunAfterText:
	text "Good luck on your"
	line "journey."

	para "You remind me of"
	line "the OWNER."
	done

KinnowCafe_MapEventHeader::

.Warps: db 2
	warp_def 9, 2, 6, KINNOW_ISLAND
	warp_def 9, 3, 6, KINNOW_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 5
	person_event SPRITE_COOLTRAINER_F, 6, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, WaitressInfo, -1
	person_event SPRITE_COOLTRAINER_F, 2, 3, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, WaitressSatomi, -1
	person_event SPRITE_COOLTRAINER_F, 3, 7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_TRAINER, 0, WaitressNaomi, -1
	person_event SPRITE_COOLTRAINER_F, 5, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 0, WaitressSaori, -1
	person_event SPRITE_COOLTRAINER_F, 7, 6, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 0, WaitressJun, -1
