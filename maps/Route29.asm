const_value set 2
	const ROUTE29_YOUNGSTER
	const ROUTE29_FRUIT_TREE
	const ROUTE29_FISHER
	const ROUTE29_COOLTRAINER_M2
	const ROUTE29_TUSCANY
	const ROUTE29_POKE_BALL

Route29_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

Route29YoungsterScript:
	jumptextfaceplayer Route29YoungsterText

Route29TeacherScript:
	jumptextfaceplayer Route29TeacherText

Route29FisherScript:
	jumptextfaceplayer Route29FisherText
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

Route29Sign1:
	jumptext Route29Sign1Text

Route29Sign2:
	jumptext Route29Sign2Text

Route29FruitTree:
	fruittree FRUITTREE_ROUTE_29

Route29Potion:
	itemball FRESH_WATER

UnknownText_0x1a10a7:
	text "#MON hide in"
	line "the grass. Who"

	para "knows when they'll"
	line "pop out…"
	done

Route29YoungsterText:
	text "Yo. That's a"
	line "cool #MON."

	para "But be careful."
	line "I hear there are"

	para "some shady char-"
	line "acters around."
	done

Route29TeacherText:
	text "Hey! I caught a"
	line "strange RATTATA."
	cont "It has black fur!"
	done

Route29FisherText:
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

Route29Sign1Text:
	text "ROUTE 49"
	line "VALENCIA ISLAND"
	done

Route29Sign2Text:
	text "ROUTE 49"
	line "VALENCIA ISLAND"
	done

Route29_MapEventHeader:: db 0, 0

.Warps: db 1
	warp_def 5, 7, 2, VALENCIA_PORT

.CoordEvents: db 0

.BGEvents: db 2
	signpost 11, 31, SIGNPOST_READ, Route29Sign1
	signpost 6, 14, SIGNPOST_READ, Route29Sign2

.ObjectEvents: db 6
	person_event SPRITE_YOUNGSTER, 16, 31, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route29YoungsterScript, -1
	person_event SPRITE_COOLTRAINER_F, 16, 12, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route29TeacherScript, -1
	person_event SPRITE_FRUIT_TREE, 14, 29, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route29FruitTree, -1
	person_event SPRITE_YOUNGSTER, 17, 23, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route29FisherScript, -1
	person_event SPRITE_COOLTRAINER_M, 12, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CooltrainerMScript_0x1a1031, -1
	person_event SPRITE_POKE_BALL, 6, 21, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route29Potion, EVENT_ROUTE_29_POTION

