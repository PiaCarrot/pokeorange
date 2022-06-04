const_value = 1
	const ROUTE54_SWIMMERM1
	const ROUTE54_SWIMMERM2
	const ROUTE54_SWIMMERM3
	const ROUTE54_SWIMMERF1
	const ROUTE54_SWIMMERF2

Route54_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

TrainerSwimmermHairo:
	trainer EVENT_BEAT_SWIMMERM_HAIRO, SWIMMERM, HAIRO, SwimmermHairoSeenText, SwimmermHairoBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmermHairoAfterText
	waitbutton
	closetext
	end

TrainerSwimmermDaisuke:
	trainer EVENT_BEAT_SWIMMERM_DAISUKE, SWIMMERM, DAISUKE, SwimmermDaisukeSeenText, SwimmermDaisukeBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmermDaisukeAfterText
	waitbutton
	closetext
	end

TrainerSwimmermJunpei:
	trainer EVENT_BEAT_SWIMMERM_JUNPEI, SWIMMERM, JUNPEI, SwimmermJunpeiSeenText, SwimmermJunpeiBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmermJunpeiAfterText
	waitbutton
	closetext
	end

TrainerSwimmerfReina:
	trainer EVENT_BEAT_SWIMMERF_REINA, SWIMMERF, REINA, SwimmerfReinaSeenText, SwimmerfReinaBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmerfReinaAfterText
	waitbutton
	closetext
	end

TrainerSwimmerfUmiko:
	trainer EVENT_BEAT_SWIMMERF_UMIKO, SWIMMERF, UMIKO, SwimmerfUmikoSeenText, SwimmerfUmikoBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmerfUmikoAfterText
	waitbutton
	closetext
	end

Route54Sign:
	jumptext Route54SignText

NicoSign:
	jumptext NicoSignText

.Text:

SwimmermHairoSeenText:
	text "Did you see those"
	line "two weirdos in"
	cont "TEAM ROCKET out-"
	cont "fits earlier?"
	done

SwimmermHairoBeatenText:
	text "I wonder who they"
	line "are?"
	done

SwimmermHairoAfterText:
	text "I wonder who they"
	line "are?"
	done

SwimmermDaisukeSeenText:
	text "Racing #MON"
	line "is the best exer-"
	cont "cise!"
	done

SwimmermDaisukeBeatenText:
	text "Are you faster"
	line "than me?"
	done

SwimmermDaisukeAfterText:
	text "I'll beat the"
	line "world record some"
	cont "day!"
	done

SwimmermJunpeiSeenText:
	text "My #MON"
	line "have been raised"
	cont "with care!"

	para "Let's see who's"
	line "stronger!"
	done

SwimmermJunpeiBeatenText:
	text "Yo, that was a"
	line "good fight!"
	done

SwimmermJunpeiAfterText:
	text "That wasn't too"
	line "bad!"
	done

SwimmerfReinaSeenText:
	text "I see you're"
	line "heading to"
	cont "MANDARIN NORTH."

	para "Care to spar"
	line "with me first?"
	done

SwimmerfReinaBeatenText:
	text "Ohoho, not bad!"
	done

SwimmerfReinaAfterText:
	text "Ohohoho! STARYU"
	line "was no match for"
	cont "you!"
	done

SwimmerfUmikoSeenText:
	text "Yikes! I think a"
	line "MAREANIE almost"
	cont "touched me!"
	done

SwimmerfUmikoBeatenText:
	text "Thank goodness, it"
	line "was just some sea-"
	cont "weed<...>"
	done

SwimmerfUmikoAfterText:
	text "Thank goodness, it"
	line "was just some sea-"
	cont "weed<...>"
	done

Route54SignText:
	text "ROUTE 54 -"
	line "MANDARIN NORTH"
	done

NicoSignText:
	text "NICO ISLAND"

	para "Nico nico nii!"
	done

Route54_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 2
	signpost 20, 8, SIGNPOST_READ, Route54Sign
	signpost 9, 13, SIGNPOST_READ, NicoSign

.ObjectEvents: db 5
	person_event SPRITE_SWIMMER_GUY, 9, 16, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSwimmermHairo, -1
	person_event SPRITE_SWIMMER_GUY, 24, 13, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerSwimmermDaisuke, -1
	person_event SPRITE_SWIMMER_GUY,  5,  3, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSwimmermJunpei, -1
	person_event SPRITE_SWIMMER_GIRL, 13, 7, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerSwimmerfUmiko, -1
	person_event SPRITE_SWIMMER_GIRL, 27, 16, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSwimmerfReina, -1

