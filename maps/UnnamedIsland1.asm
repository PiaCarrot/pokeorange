const_value set 2
	const UNNAMED_ISLAND_1_ROCK1
	const UNNAMED_ISLAND_1_ROCK2
	const UNNAMED_ISLAND_1_ROCK3
	const UNNAMED_ISLAND_1_ROCK4
	const UNNAMED_ISLAND_1_FISHER
	const UNNAMED_ISLAND_1_COOLTRAINERF

UnnamedIsland1_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

.Scripts:

UnnamedIsland1Rock:
	jumpstd smashrock
	
TrainerFisherYuuta:
	trainer EVENT_BEAT_FISHER_YUUTA, FISHER, YUUTA, FisherYuutaSeenText, FisherYuutaBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext FisherYuutaAfterText
	waitbutton
	closetext
	end
	
FisherYuutaSeenText:
	text "Deep sea angling"
	line "will net you big"
	cont "catches!"
	done
	
FisherYuutaBeatenText:
	text "Wiped out!"
	done
	
FisherYuutaAfterText:
	text "Not bad."
	
	para "I sense a great"
	line "FISHER spirit in"
	cont "you."
	done
	
CooltrainerMegumiScript:
	trainer EVENT_BEAT_COOLTRAINERF_MEGUMI, COOLTRAINERF, MEGUMI, CooltrainerMegumiSeenText, CooltrainerMegumiBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerMegumiAfterText
	waitbutton
	closetext
	end
	
CooltrainerMegumiSeenText:
	text "On your way to"
	line "NAVEL ISLAND?"
	
	para "Sorry, but you"
	line "won't be seeing"
	cont "DANNY."
	end
	
CooltrainerMegumiBeatenText:
	text "Hmph."
	done
	
CooltrainerMegumiAfterText:
	text "DANNY doesn't let"
	line "anyone on the is-"
	cont "land unless they"
	cont "are a challenger."
	done

UnnamedIsland1_MapEventHeader:: db 0, 0

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 6
	person_event SPRITE_ROCK, 4, 9, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, UnnamedIsland1Rock, -1
	person_event SPRITE_ROCK, 4, 13, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, UnnamedIsland1Rock, -1
	person_event SPRITE_ROCK, 5, 12, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, UnnamedIsland1Rock, -1
	person_event SPRITE_ROCK, 3, 8, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, UnnamedIsland1Rock, -1
	person_event SPRITE_FISHER, 17, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 0, TrainerFisherYuuta, -1
	person_event SPRITE_COOLTRAINER_F, 10, 20, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 3, CooltrainerMegumiScript, -1

