const_value set 1
	const ROUTE49_YOUNGSTER
	const ROUTE49_FRUIT_TREE
	const ROUTE49_FISHER
	const ROUTE49_COOLTRAINER_M2
	const ROUTE49_TUSCANY
	const ROUTE49_POKE_BALL

Route49_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

Route49YoungsterScript:
	jumptextfaceplayer Route49YoungsterText

Route49TeacherScript:
	jumptextfaceplayer Route49TeacherText

Route49FisherScript:
	jumptextfaceplayer Route49FisherText
	end

CooltrainerMScript_0x1a1031:
	faceplayer
	opentext
	checkday
	iftrue .day_morn
	checknite
	iftrue .nite
.day_morn
	writetext Text_WaitingForNight
	waitbutton
	closetext
	end

.nite
	writetext Text_WaitingForMorning
	waitbutton
	closetext
	end

Route49Sign:
	jumptext Route49SignText

Route49FruitTree:
	fruittree FRUITTREE_ROUTE_49

Route49FreshWater:
	itemball FRESH_WATER

Route49YoungsterText:
	text "Yo. That's a"
	line "cool #MON."

	para "But be careful."
	line "I hear there are"

	para "some shady char-"
	line "acters around."
	done

Route49TeacherText:
	text "Hey! I caught a"
	line "strange RATTATA."
	cont "It has black fur!"
	done

Route49FisherText:
	text "Did you know?"
	line "PROF. IVY once"

	para "saved a RATICATE"
	line "that was poisoned"
	cont "by VILEPLUME."
	done

Text_WaitingForNight:
	text "I'm waiting for"
	line "#MON that"

	para "appear only at"
	line "night."
	done

Text_WaitingForMorning:
	text "I'm waiting for"
	line "#MON that"

	para "appear only in the"
	line "morning."
	done

Route49SignText:
	text "ROUTE 49"
	line "VALENCIA ISLAND"
	done

Route49_MapEventHeader::

.Warps: db 1
	warp_def 5, 7, 2, VALENCIA_PORT

.CoordEvents: db 0

.BGEvents: db 1
	signpost 11, 31, SIGNPOST_READ, Route49Sign

.ObjectEvents: db 6
	person_event SPRITE_YOUNGSTER, 16, 31, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route49YoungsterScript, -1
	person_event SPRITE_COOLTRAINER_F, 16, 12, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route49TeacherScript, -1
	person_event SPRITE_FRUIT_TREE, 14, 29, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route49FruitTree, -1
	person_event SPRITE_YOUNGSTER, 17, 23, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route49FisherScript, -1
	person_event SPRITE_COOLTRAINER_M, 12, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CooltrainerMScript_0x1a1031, -1
	person_event SPRITE_POKE_BALL, 6, 21, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route49FreshWater, EVENT_ROUTE_49_FRESH_WATER
