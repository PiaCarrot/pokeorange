const_value = 1
	const UNNAMED_ISLAND_1_ROCK1
	const UNNAMED_ISLAND_1_ROCK2
	const UNNAMED_ISLAND_1_ROCK3
	const UNNAMED_ISLAND_1_ROCK4
	const UNNAMED_ISLAND_1_COOLTRAINERF
	const UNNAMED_ISLAND_1_TM

UnnamedIsland1_MapScriptHeader::

.MapTriggers: db 0

.MapCallbacks: db 0

UnnamedIsland1Rock:
	jumpstd smashrock

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
	itemball TM_STEEL_WING
	
UnnamedIsland1BlackOutMod:
	blackoutmod KINNOW_ISLAND
	end

UnnamedIsland1_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 6
	person_event SPRITE_ROCK, 8, 9, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, UnnamedIsland1Rock, -1
	person_event SPRITE_ROCK, 7, 13, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, UnnamedIsland1Rock, -1
	person_event SPRITE_ROCK, 8, 12, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, UnnamedIsland1Rock, -1
	person_event SPRITE_ROCK, 7, 8, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, UnnamedIsland1Rock, -1
	person_event SPRITE_COOLTRAINER_F, 12, 18, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 3, CooltrainerKeikoScript, -1
	person_event SPRITE_POKE_BALL, 12, 5, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, UnnamedIslandTM, EVENT_UNNAMED_ISLAND_1_TM_RETURN

