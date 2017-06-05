const_value set 2
	const ROUTE30_YOUNGSTER1
	const ROUTE30_YOUNGSTER2
	const ROUTE30_BUG_CATCHER
	const ROUTE30_FRUIT_TREE1
	const ROUTE30_FRUIT_TREE2
	const ROUTE30_COOLTRAINER_F
	const ROUTE30_POKE_BALL

Route30_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerYoungsterJoey:
	trainer EVENT_BEAT_YOUNGSTER_JOEY, YOUNGSTER, 1, YoungsterJoey1SeenText, YoungsterJoey1BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext YoungsterJoey1AfterText
	waitbutton
	closetext
	end

TrainerYoungsterMikey:
	trainer EVENT_BEAT_YOUNGSTER_MIKEY, YOUNGSTER, 2, YoungsterMikeySeenText, YoungsterMikeyBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext YoungsterMikeyAfterText
	waitbutton
	closetext
	end

TrainerBug_catcherDon:
	trainer EVENT_BEAT_BUG_CATCHER_DON, BUG_CATCHER, 1, Bug_catcherDonSeenText, Bug_catcherDonBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext Bug_catcherDonAfterText
	waitbutton
	closetext
	end

Route30CooltrainerFScript:
	jumptextfaceplayer Route30CooltrainerFText

Route30Sign:
	jumptext Route30SignText

Route30TrainerTips:
	jumptext Route30TrainerTipsText

Route30Antidote:
	itemball ANTIDOTE

Route30FruitTree1:
	fruittree FRUITTREE_ROUTE_30_1

Route30FruitTree2:
	fruittree FRUITTREE_ROUTE_30_2

Route30HiddenPotion:
	dwb EVENT_ROUTE_30_HIDDEN_POTION, POTION

YoungsterJoey1SeenText:
	text "Hey, you're taking"
	line "the ORANGE CREW"
	cont "CHALLENGE?"

	para "So am I!"
	line "Let's battle!"
	done

YoungsterJoey1BeatenText:
	text "Agh! I lost!"
	done

YoungsterJoey1AfterText:
	text "Darn! I have to"
	line "train even more"
	cont "to take on the"
	cont "ORANGE CREW!"
	done

YoungsterMikeySeenText:
	text "You're a #MON"
	line "trainer, right?"

	para "Then you have to"
	line "battle!"
	done

YoungsterMikeyBeatenText:
	text "You are way too"
	line "strong!"
	done

YoungsterMikeyAfterText:
	text "Becoming a good"
	line "trainer is really"
	cont "tough."

	para "I'm going to bat-"
	line "tle other people"
	cont "to get better."
	done

Bug_catcherDonSeenText:
	text "Instead of a bug"
	line "#MON, I found"
	cont "a trainer!"
	done

Bug_catcherDonBeatenText:
	text "Aiyaa!"
	done

Bug_catcherDonAfterText:
	text "I ran out of #"
	line "BALLS while I was"
	cont "catching #MON."

	para "I should've bought"
	line "some more…"
	done

Route30CooltrainerFText:
	text "You can cross"
	line "ROUTE 51 to enter"
	cont "the TANGELO"
	cont "JUNGLE."
	done

Route30SignText:
	text "ROUTE 50"
	done

Route30TrainerTipsText:
	text "TRAINER TIPS"

	para "No stealing other"
	line "people's #MON!"

	para "# BALLS are to"
	line "be thrown only at"
	cont "wild #MON!"
	done

Route30_MapEventHeader:: db 0, 0

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 3
	signpost 45, 3, SIGNPOST_READ, Route30Sign
	signpost 30, 10, SIGNPOST_READ, Route30TrainerTips
	signpost 2, 6, SIGNPOST_ITEM, Route30HiddenPotion

.ObjectEvents: db 7
	person_event SPRITE_YOUNGSTER, 29, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerYoungsterJoey, -1
	person_event SPRITE_YOUNGSTER, 14, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerYoungsterMikey, -1
	person_event SPRITE_BUG_CATCHER, 13, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 3, TrainerBug_catcherDon, -1
	person_event SPRITE_FRUIT_TREE, 10, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route30FruitTree1, -1
	person_event SPRITE_FRUIT_TREE, 49, 1, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route30FruitTree2, -1
	person_event SPRITE_COOLTRAINER_F, 42, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route30CooltrainerFScript, -1
	person_event SPRITE_POKE_BALL, 19, 13, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route30Antidote, EVENT_ROUTE_30_ANTIDOTE

