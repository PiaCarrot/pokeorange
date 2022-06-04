const_value = 1
	const MANDARINNORTH_LASS
	const MANDARINNORTH_GURU
	const MANDARINNORTH_POKE_BALL1
	const MANDARINNORTH_VOLTORB

MandarinNorth_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_MANDARIN_NORTH
	return

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

MandarinNorth_MapEventHeader::

.Warps: db 6
	warp_def 13, 7, 1, MANDARIN_NORTH_POKECENTER
	warp_def 9, 27, 1, MANDARIN_NORTH_NAME_RATER
	warp_def 21, 19, 1, MANDARIN_NORTH_SMALL_HOUSE
	warp_def 13, 17, 1, MANDARIN_NORTH_LARGE_HOUSE
	warp_def 5, 11, 1, MANDARIN_UNDERGROUND_ENTRANCE
	warp_def 21, 13, 1, MANDARIN_NORTH_MART

.CoordEvents: db 0

.BGEvents: db 4
	signpost 24, 12, SIGNPOST_READ, MandarinTownSign
	signpost 6, 14, SIGNPOST_READ, UndergroundSign
	signpost 10, 26, SIGNPOST_READ, NameRaterSign
	signpost 19, 28, SIGNPOST_ITEM, MandarinNorthHiddenSuperPotion

.ObjectEvents: db 5
	person_event SPRITE_LASS, 16, 9, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MandarinNorthLassScript, -1
	person_event SPRITE_COOLTRAINER_F, 29, 5, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MandarinNorthGuruScript, -1
	person_event SPRITE_POKE_BALL, 27, 29, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MandarinNorthRareCandy, EVENT_MANDARIN_NORTH_RARE_CANDY
	person_event SPRITE_PIKACHU, 8, 21, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_RED, 0, 0, MandarinNorthPikachuScript, -1
	person_event SPRITE_PIKACHU, 12,  4, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_RED, 0, 0, MandarinNorthPikachuScript, -1

