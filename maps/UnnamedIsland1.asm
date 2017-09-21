const_value set 2
	const UNNAMED_ISLAND_1_ROCK1
	const UNNAMED_ISLAND_1_ROCK2
	const UNNAMED_ISLAND_1_ROCK3
	const UNNAMED_ISLAND_1_ROCK4
	const UNNAMED_ISLAND_1_FISHER
	const UNNAMED_ISLAND_1_COOLTRAINERF
	const UNNAMED_ISLAND_1_TM

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

CooltrainerKeikoScript:
	trainer EVENT_BEAT_COOLTRAINERF_KEIKO, COOLTRAINERF, KEIKO, CooltrainerKeikoSeenText, CooltrainerKeikoBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerKeikoAfterText
	waitbutton
	closetext
	end

CooltrainerKeikoSeenText:
	text "On your way to"
	line "NAVEL ISLAND?"

	para "Sorry, but you"
	line "won't be seeing"
	cont "DANNY."
	done

CooltrainerKeikoBeatenText:
	text "Hmph."
	done

CooltrainerKeikoAfterText:
	text "DANNY doesn't let"
	line "anyone on the is-"
	cont "land unless they"
	cont "are a challenger."
	done

UnnamedIslandTM:
	itemball TM_RETURN

UnnamedIsland1_MapEventHeader::

.Warps: db 1
	warp_def 13, 13, 1, UNNAMED_ISLAND_1_POKE_CENTER

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 7
	person_event SPRITE_ROCK, 6, 9, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, UnnamedIsland1Rock, -1
	person_event SPRITE_ROCK, 5, 13, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, UnnamedIsland1Rock, -1
	person_event SPRITE_ROCK, 6, 12, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, UnnamedIsland1Rock, -1
	person_event SPRITE_ROCK, 5, 8, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, UnnamedIsland1Rock, -1
	person_event SPRITE_FISHER, 17, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 0, TrainerFisherYuuta, -1
	person_event SPRITE_COOLTRAINER_F, 10, 18, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 3, CooltrainerKeikoScript, -1
	person_event SPRITE_POKE_BALL, 10, 5, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, UnnamedIslandTM, EVENT_UNNAMED_ISLAND_1_TM_RETURN
