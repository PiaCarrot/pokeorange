const_value = 1
	const GOLDEN_ISLAND_CATMAN_1
	const GOLDEN_ISLAND_CATMAN_2
	const GOLDEN_ISLAND_CATMAN_3
	const GOLDEN_ISLAND_JESSIE
	const GOLDEN_ISLAND_JAMES
	const GOLDEN_ISLAND_CATGUARD_1
	const GOLDEN_ISLAND_CATGUARD_2
	const GOLDEN_ISLAND_ITEM_BALL
	const GOLDEN_ISLAND_FRUIT_TREE
	const GOLDEN_ISLAND_BATTLE_CAT

GoldenIsland_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

GoldenIslandSign:
	jumptext GoldenIslandSignText

GoldenIslandSignText:
	text "GOLDEN ISLAND"

	para "MEOWTH are"
	line "welcome!"
	done

CatManGuardingExitScript:
	jumptextfaceplayer CatManGuardText

CatManGuardText:
	text "The BOUNTY HARVEST"
	line "is underway."

	para "None may pass at"
	line "this time."
	done

GoldenIslandAmuletCoin:
	itemball AMULET_COIN

CatManOutside1Script:
	jumptextfaceplayer CatManOutside1Text

CatManOutside1Text:
	text "Welcome to GOLDEN"
	line "ISLAND!"

	para "If you have a"
	line "MEOWTH, our elder"
	cont "would love to"
	cont "speak with you."
	done

CatManOutside2Script:
	jumptextfaceplayer CatManOutside2Text

CatManOutside2Text:
	text "Our livelihood de-"
	line "pends on a MEOWTH"
	cont "with the move PAY"
	cont "DAY!"
	done

CatManOutside3Script:
	jumptextfaceplayer CatManOutside3Text

CatManOutside3Text:
	text "If I had a MEOWTH,"
	line "I think I'd name"
	cont "it NYARTH."

	para "Sounds cool to me."
	done

GoldenIslandLargeStatue:
	jumptext GoldenIslandLargeStatueText

GoldenIslandLargeStatueText:
	text "A huge MEOWTH"
	line "statue made out of"
	cont "solid gold!"
	done

GoldenIslandSmallStatue:
	jumptext GoldenIslandSmallStatueText

GoldenIslandSmallStatueText:
	text "A small, golden"
	line "statue depicting"
	cont "a MEOWTH."
	done

GoldenIslandFruitTree:
	fruittree FRUITTREE_GOLDEN_ISLAND

GoldenIslandRocketEvent:
	showemote EMOTE_SHOCK, PLAYER, 15
	opentext
	writetext GoldenIslandRocketText
	waitbutton
	closetext
	applymovement GOLDEN_ISLAND_JESSIE, GOLDEN_ISLAND_JESSIE_MOVEMENT
	disappear GOLDEN_ISLAND_JESSIE
	playsound SFX_ENTER_DOOR
	applymovement GOLDEN_ISLAND_JAMES, GOLDEN_ISLAND_JAMES_MOVEMENT
	disappear GOLDEN_ISLAND_JAMES
	playsound SFX_ENTER_DOOR
	setevent EVENT_TEAM_ROCKET_GOLDEN_ISLAND
	domaptrigger GOLDEN_ISLAND, $1
	end

GoldenIslandRocketText:
	text "JESSIE: It seems"
	line "they're holing"
	cont "MEOWTH up in here."

	para "What should we do,"
	line "JAMES?"

	para "JAMES: Well, it"
	line "doesn't look like"
	cont "the locals noticed"
	cont "us."

	para "We should just go"
	line "in and beat the"
	cont "crazy cat people."

	para "JESSIE: Ah haha!"
	line "Then all of their"
	cont "#MON are as"
	cont "good as ours!"

	para "JAMES: Ooh!"
	line "I like the way you"
	cont "think, JESSIE!"

	para "JESSIE and JAMES:"
	line "Ahahahahahaha!"
	done

GOLDEN_ISLAND_JESSIE_MOVEMENT:
	step UP
	step_end

GOLDEN_ISLAND_JAMES_MOVEMENT:
	step UP
	step UP
	step_end

CatManBattleHouseScript:
	checkevent EVENT_ELDER_GOT_MEOWTH
	iffalse .DontWannaFight
	opentext
	writetext CatManBattleHouseText1
	yesorno
	iftrue .BattleHouseBegin
	writetext DeclineBattleHouseText
	waitbutton
	closetext
	end
	
.DontWannaFight:
	opentext
	writetext CatManBattleHouseNoFightText
	waitbutton
	closetext
	end

.BattleHouseBegin:
	writetext CatManBattleHouseText2
	waitbutton
	winlosstext CatmanDaikonWinLoss, 0
	loadtrainer CATMAN, DAIKON
	startbattle
	playmapmusic
	reloadmapafterbattle
	opentext
	writetext CatManBattleHouseText3
	waitbutton
	closetext
	playsound SFX_EXIT_BUILDING
	special Special_FadeInQuickly
	opentext
	writetext CatManBattleHouseText4
	waitbutton
	winlosstext CatmanKunioWinLoss, 0
	loadtrainer CATMAN, KUNIO
	startbattle
	playmapmusic
	reloadmapafterbattle
	opentext
	writetext CatManBattleHouseText5
	waitbutton
	closetext
	playsound SFX_EXIT_BUILDING
	special Special_FadeInQuickly
	opentext
	writetext CatManBattleHouseText6
	waitbutton
	winlosstext CatmanYoshikawaWinLoss, 0
	loadtrainer CATMAN, YOSHIKAWA
	startbattle
	playmapmusic
	reloadmapafterbattle
	opentext
	writetext CatManBattleHouseText7
	waitbutton
	closetext
	playsound SFX_EXIT_BUILDING
	special Special_FadeInQuickly
	opentext
	writetext CatManBattleHouseText8
	waitbutton
	winlosstext CatmanRenWinLoss, 0
	loadtrainer CATMAN, REN
	startbattle
	playmapmusic
	reloadmapafterbattle
	opentext
	writetext CatManBattleHouseText9
	waitbutton
	closetext
	playsound SFX_EXIT_BUILDING
	special Special_FadeInQuickly
	opentext
	writetext CatManBattleHouseText10
	waitbutton
	winlosstext CatmanMimiWinLoss, 0
	loadtrainer CATMAN, MIMI
	startbattle
	playmapmusic
	reloadmapafterbattle
	opentext
	writetext CatManBattleHouseText11
	waitbutton
	closetext
	applymovement GOLDEN_ISLAND_BATTLE_CAT, BATTLE_HOUSE_MOVEMENT1
	disappear GOLDEN_ISLAND_BATTLE_CAT
	playsound SFX_ENTER_DOOR
	setevent EVENT_CAT_BATTLE_HOUSE_CLEARED
	end

BATTLE_HOUSE_MOVEMENT1:
	step UP
	step_end

CatmanDaikonWinLoss:
	text "I gave it my best"
	line "shot!"
	done

CatmanKunioWinLoss:
	text "Wow, not bad at"
	line "all!"
	done

CatmanYoshikawaWinLoss:
	text "Hmph."
	done

CatmanRenWinLoss:
	text "Can you do it?"
	done

CatmanMimiWinLoss:
	text "We have a winner!"
	done

CatManBattleHouseText1:
	text "Welcome to the"
	line "GOLDEN ISLAND"
	cont "BATTLE HOUSE!"

	para "To enter, you"
	line "must win 5 consec-"
	cont "utive battles!"

	para "You will then be"
	line "be given a great"
	cont "prize!"

	para "Want to try?"
	done
	
CatManBattleHouseNoFightText:
	text "Nyaa<...>"
	line "Welcome to the"
	cont "GOLDEN ISLAND"
	cont "BATTLE HOUSE<...>"
	
	para "We're nyaat takin'"
	line "challengers right"
	cont "now."
	
	para "How can we, when"
	line "we don't have the"
	cont "MEOWTH of BOUNTY?"
	cont "Nyaa<...>"
	done

DeclineBattleHouseText:
	text "Very well."
	line "The BATTLE HOUSE"
	cont "is always open!"
	done

CatManBattleHouseText2:
	text "A challenger!"

	para "Well, then. I will"
	line "be your first opp-"
	cont "onent!"
	done

CatManBattleHouseText3:
	text "I have lost."
	line "Allow me to get"
	cont "the next battler."
	done

CatManBattleHouseText4:
	text "Hey, there!"
	line "I'm way stronger"
	cont "than my friend,"
	cont "so let's go!"
	done

CatManBattleHouseText5:
	text "That worked up a"
	line "sweat! Let me get"
	cont "the next guy."
	done

CatManBattleHouseText6:
	text "Getting tired yet?"
	done

CatManBattleHouseText7:
	text "Hmph. I'll get"
	line "NOAH to beat you."
	done

CatManBattleHouseText8:
	text "You've made it"
	line "pretty far, but"
	cont "this is where it"
	cont "ends!"
	done

CatManBattleHouseText9:
	text "GRANT's the stron-"
	line "gest of us all."

	para "Prepare yourself."
	done

CatManBattleHouseText10:
	text "Good job making"
	line "it this far. I've"
	cont "been itching for a"
	cont "good challenge!"
	done

CatManBattleHouseText11:
	text "Congratulations."
	line "Come inside for"
	cont "your prize."
	done

GoldenIsland_MapEventHeader::

.Warps: db 8
	warp_def 5, 13, 1, GOLDEN_ISLAND_HOUSE_1
	warp_def 9, 5, 1, GOLDEN_ISLAND_HOUSE_2
	warp_def 19, 3, 1, GOLDEN_ISLAND_HOUSE_3
	warp_def 13, 25, 1, GOLDEN_ISLAND_ELDER_HOUSE
	warp_def 4, 21, 1, GOLDEN_ISLAND_GATE_HOUSE
	warp_def 5, 21, 2, GOLDEN_ISLAND_GATE_HOUSE
	warp_def 27, 11, 5, GOLDEN_ISLAND_GATE_HOUSE
	warp_def 27, 12, 6, GOLDEN_ISLAND_GATE_HOUSE

.CoordEvents: db 2
	xy_trigger 0, 16, 22, GoldenIslandRocketEvent
	xy_trigger 0, 16, 23, GoldenIslandRocketEvent

.BGEvents: db 7
	signpost 9, 15, SIGNPOST_READ, GoldenIslandSign
	signpost 14, 11, SIGNPOST_READ, GoldenIslandLargeStatue
	signpost 14, 12, SIGNPOST_READ, GoldenIslandLargeStatue
	signpost 16, 9, SIGNPOST_UP, GoldenIslandSmallStatue
	signpost 16, 14, SIGNPOST_UP, GoldenIslandSmallStatue
	signpost 20, 10, SIGNPOST_UP, GoldenIslandSmallStatue
	signpost 20, 13, SIGNPOST_UP, GoldenIslandSmallStatue

.ObjectEvents: db 10
	person_event SPRITE_CAT_MAN, 7, 17, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 2, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, CatManOutside1Script, -1
	person_event SPRITE_CAT_MAN, 12, 3, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 2, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CatManOutside2Script, -1
	person_event SPRITE_CAT_MAN, 17, 14, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CatManOutside3Script, -1
	person_event SPRITE_JESSIE, 14, 25, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_GOLDEN_ISLAND
	person_event SPRITE_JAMES, 15, 25, SPRITEMOVEDATA_STANDING_UP, 2, 2, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEAM_ROCKET_GOLDEN_ISLAND
	person_event SPRITE_CAT_MAN, 27, 11, SPRITEMOVEDATA_STANDING_UP, 2, 2, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CatManGuardingExitScript, EVENT_SAVED_CAT_ELDER
	person_event SPRITE_CAT_MAN, 27, 12, SPRITEMOVEDATA_STANDING_UP, 2, 2, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CatManGuardingExitScript, EVENT_SAVED_CAT_ELDER
	person_event SPRITE_POKE_BALL, 25, 25, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, GoldenIslandAmuletCoin, EVENT_GOLDEN_ISLAND_AMULET_COIN
	person_event SPRITE_FRUIT_TREE, 1, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GoldenIslandFruitTree, -1
	person_event SPRITE_CAT_MAN, 6, 13, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CatManBattleHouseScript, EVENT_CAT_BATTLE_HOUSE_CLEARED