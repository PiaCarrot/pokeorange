const_value set 2
	const CRYSTAL_CAVE_1F_BROCK
	const CRYSTAL_CAVE_1F_ITEM1
	const CRYSTAL_CAVE_1F_ITEM2

CrystalCave1F_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

.Scripts:

CrystalCave1FBrockScript:
	faceplayer
	opentext
	writetext Brock1FText
	yesorno
	iftrue .Yes
	writetext BrockNoText
	waitbutton
	closetext
	end
.Yes:
	writetext BrockOkText
	waitbutton
	closetext
	applymovement CRYSTAL_CAVE_1F_BROCK, Brock_Movement
	disappear CRYSTAL_CAVE_1F_BROCK
	end

CrystalCave1FCarbos:
	itemball CARBOS

CrystalCave1FMysticWater:
	itemball MYSTIC_WATER

Brock1FText:
	text "Why, hello there."

	para "I'm BROCK, leader"
	line "of the PEWTER CITY"
	cont "#MON GYM."

	para "I am looking for"
	line "the legendary"
	cont "CRYSTAL ONIX."

	para "You can come, too,"
	line "but if it comes"
	cont "down to it, I will"
	cont "battle you for it."
	done

BrockNoText:
	text "No sweat, then!"
    line "Let me know if"
    cont "you change your"
	cont "mind."
	done

BrockOkText:
	text "Alright, then!"
	line "It should be far"
	cont "deeper into the"
	cont "cave."

	para "Keep up if you"
	line "can!"
	done

Brock_Movement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

CrystalCave1F_MapEventHeader:: db 0, 0

.Warps: db 3
	warp_def 23, 5, 1, SUNBURST_ISLAND
	warp_def 11, 7, 1, CRYSTAL_CAVE_B1
	warp_def 23, 27, 1, ROUTE_55

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_BROCK, 19, 23, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, CrystalCave1FBrockScript, EVENT_CRYSTAL_CAVE_1F_BROCK
	person_event SPRITE_POKE_BALL, 19, 31, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, CrystalCave1FCarbos, EVENT_CRYSTAL_CAVE_1F_CARBOS
	person_event SPRITE_POKE_BALL, 3, 3, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, CrystalCave1FMysticWater, EVENT_CRYSTAL_CAVE_1F_MYSTIC_WATER

