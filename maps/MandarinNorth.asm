const_value set 2
	const MANDARINNORTH_LASS
	const MANDARINNORTH_GURU
	const MANDARINNORTH_POKE_BALL1
	const MANDARINNORTH_VOLTORB

MandarinNorth_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1

	; callbacks
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_MANDARIN_NORTH
	return

.Scripts:

MandarinNorthLassScript:
	jumptextfaceplayer MandarinNorthLassText

MandarinNorthGuruScript:
	jumptextfaceplayer MandarinNorthGuruText

MandarinNorthRareCandy:
	itemball RARE_CANDY

MandarinNorthPikachuScript:
	faceplayer
	opentext
	writetext PikachuText
	cry PIKACHU
	waitbutton
	closetext
	end

MandarinTownSign:
	jumptext MandarinTownSignText

UndergroundSign:
	jumptext UndergroundSignText

NameRaterSign:
	jumptext NameRaterSignText

MandarinNorthHiddenSuperPotion:
	dwb EVENT_MANDARIN_NORTH_HIDDEN_SUPER_POTION, SUPER_POTION

.Text:

MandarinNorthLassText:
	text "Welcome!"

	para "This is MANDARIN"
	line "ISLAND NORTH."

	para "Though, I'm not"
	line "sure why. MANDARIN"
	cont "ISLAND SOUTH isn't"
	cont "anywhere nearby."
	done

MandarinNorthGuruText:
	text "The ocean is so"
	line "beautiful."

	para "I could stare at"
	line "it forever."
	done

PikachuText:
	text "PIKACHU: Pikapii!"
	done

MandarinTownSignText:
	text "MANDARIN ISLAND"
	line "NORTH"

	para "The island where"
	line "fate takes turns"
	done

UndergroundSignText:
	text "UNDERGROUND"
	done

NameRaterSignText:
	text "NAME RATER"
	done

MandarinNorth_MapEventHeader:: db 0, 0

.Warps: db 6
	warp_def 15, 7, 1, MANDARIN_NORTH_POKECENTER
	warp_def 11, 27, 1, MANDARIN_NORTH_NAME_RATER
	warp_def 23, 19, 1, MANDARIN_NORTH_SMALL_HOUSE
	warp_def 15, 17, 1, MANDARIN_NORTH_LARGE_HOUSE
	warp_def 7, 11, 1, MANDARIN_UNDERGROUND
	warp_def 23, 13, 1, MANDARIN_NORTH_MART

.CoordEvents: db 0

.BGEvents: db 4
	signpost 26, 12, SIGNPOST_READ, MandarinTownSign
	signpost 8, 14, SIGNPOST_READ, UndergroundSign
	signpost 12, 26, SIGNPOST_READ, NameRaterSign
	signpost 21, 28, SIGNPOST_ITEM, MandarinNorthHiddenSuperPotion

.ObjectEvents: db 5
	person_event SPRITE_LASS, 18, 9, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MandarinNorthLassScript, -1
	person_event SPRITE_COOLTRAINER_F, 31, 5, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MandarinNorthGuruScript, -1
	person_event SPRITE_POKE_BALL, 29, 29, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MandarinNorthRareCandy, EVENT_MANDARIN_NORTH_RARE_CANDY
	person_event SPRITE_PIKACHU, 10, 21, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_RED, 0, 0, MandarinNorthPikachuScript, -1
	person_event SPRITE_PIKACHU, 13, 4, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_RED, 0, 0, MandarinNorthPikachuScript, -1

