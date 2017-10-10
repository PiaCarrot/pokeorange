const_value set 1
	const TANGELOJUNGLE_POKE_BALL1
	const TANGELOJUNGLE_LASS
	const TANGELOJUNGLE_YOUNGSTER2
	const TANGELOJUNGLE_POKE_BALL2
	const TANGELOJUNGLE_POKE_BALL3
	const TANGELOJUNGLE_POKE_BALL4
	const TANGELO_JUNGLE_BUG_BOY
	const TANGELO_JUNGLE_BUG_BOY2
	const TANGELO_JUNGLE_NESS

TangeloJungle_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

TrainerBug_catcherWayne:
	trainer EVENT_BEAT_BUG_CATCHER_MIKE, BUG_CATCHER, MIKE, Bug_catcherWayneSeenText, Bug_catcherWayneBeatenText, 0, Bug_catcherWayneScript

Bug_catcherWayneScript:
	end_if_just_battled
	opentext
	writetext Bug_catcherWayneAfterText
	waitbutton
	closetext
	end

TrainerBug_catcherMushi:
	trainer EVENT_BEAT_BUG_CATCHER_MUSHI, BUG_CATCHER, MUSHI, Bug_catcherMushiSeenText, Bug_catcherMushiBeatenText, 0, Bug_catcherMushiScript

Bug_catcherMushiScript:
	end_if_just_battled
	opentext
	writetext Bug_catcherMushiAfterText
	waitbutton
	closetext
	end

TrainerBug_catcherAlex:
	trainer EVENT_BEAT_BUG_CATCHER_ALEX, BUG_CATCHER, ALEX, Bug_catcherAlexSeenText, Bug_catcherAlexBeatenText, 0, Bug_catcherAlexScript

Bug_catcherAlexScript:
	end_if_just_battled
	opentext
	writetext Bug_catcherAlexAfterText
	waitbutton
	closetext
	end

TrainerYoungsterNess:
	trainer EVENT_BEAT_YOUNGSTER_NESS, YOUNGSTER, NESS, YoungsterNessSeenText, YoungsterNessBeatenText, 0, YoungsterNessScript

YoungsterNessScript:
	end_if_just_battled
	opentext
	writetext YoungsterNessAfterText
	waitbutton
	closetext
	end

TangeloJungleLassScript:
	jumptextfaceplayer Text_TangeloJungleLass

TangeloJunglePoisonBarb:
	itemball POISON_BARB

TangeloJungleSuperPotion:
	itemball SUPER_POTION

TangeloJungleAntidote:
	itemball ANTIDOTE

TangeloJungleEther:
	itemball ETHER

TangeloJungleHiddenEther:
	dwb EVENT_TANGELO_JUNGLE_HIDDEN_ETHER, ETHER

TangeloJungleHiddenSuperPotion:
	dwb EVENT_TANGELO_JUNGLE_HIDDEN_SUPER_POTION, SUPER_POTION

TangeloJungleHiddenFullHeal:
	dwb EVENT_TANGELO_JUNGLE_HIDDEN_FULL_HEAL, FULL_HEAL

MapTangeloJungleSignpost4Script:
	jumptext Text_TangeloJungleSignpost4

Text_TangeloJungleLass:
	text "Oh, no! I got"
	line "lost! It's my"
	cont "fault, really."

	para "I was trying to"
	line "catch a PIKACHU!"
	done

Text_TangeloJungleSignpost4:
	text "TANGELO JUNGLE"
	line "Warning!"

	para "Wild #MON are"
	line "very dangerous!"
	cont "Be careful."
	done

Bug_catcherWayneSeenText:
	text "This JUNGLE is so"
	line "great! So many BUG"
	cont "TYPE #MON!"
	done

Bug_catcherWayneBeatenText:
	text "Huh? I lost?"
	done

Bug_catcherWayneAfterText:
	text "Y'know, even if"
	line "you don't like BUG"
	cont "#MON, there are"
	cont "others here too!"
	done

Bug_catcherMushiSeenText:
	text "Hm? You aren't"
	line "a BUTTERFREE!"
	done

Bug_catcherMushiBeatenText:
	text "I want a BUTTER-"
	line "FREE!"
	done

Bug_catcherMushiAfterText:
	text "BUTTERFREE some-"
	line "times appear in"
	cont "this JUNGLE."
	done

Bug_catcherAlexSeenText:
	text "I'm a BUG COLLEC-"
	line "TOR! I will own"
	cont "them all!"
	done

Bug_catcherAlexBeatenText:
	text "I never said I"
	line "could battle<...>"
	done

Bug_catcherAlexAfterText:
	text "I hear there are"
	line "over 80 BUG-TYPE"
	cont "#MON."

	para "I'm gonna catch"
	line "'em all!"
	done

YoungsterNessSeenText:
	text "Heh, a TRAINER?"
	line "You don't look"
	cont "like much. Let"
	cont "me show you!"
	done

YoungsterNessBeatenText:
	text "You didn't beat"
	line "me! I lost on"
	cont "purpose."
	done

YoungsterNessAfterText:
	text "Think you're so"
	line "tough after I"
	cont "lost on purpose?"

	para "What a loser."
	done

TangeloJungle_MapEventHeader::

.Warps: db 3
	warp_def 5, 25, 3, ROUTE_52_TANGELO_JUNGLE_GATE
	warp_def 52, 43, 1, ROUTE_51_TANGELO_JUNGLE_GATE
	warp_def 53, 43, 2, ROUTE_51_TANGELO_JUNGLE_GATE

.CoordEvents: db 0

.BGEvents: db 4
	signpost 42, 25, SIGNPOST_ITEM, TangeloJungleHiddenEther
	signpost 17, 37, SIGNPOST_ITEM, TangeloJungleHiddenSuperPotion
	signpost 26, 4, SIGNPOST_ITEM, TangeloJungleHiddenFullHeal
	signpost 51, 39, SIGNPOST_UP, MapTangeloJungleSignpost4Script

.ObjectEvents: db 9
	person_event SPRITE_POKE_BALL, 26, 45, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TangeloJunglePoisonBarb, EVENT_TANGELO_JUNGLE_POISON_BARB
	person_event SPRITE_YOUNGSTER, 37, 20, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TangeloJungleLassScript, -1
	person_event SPRITE_BUG_BOY, 6, 31, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 0, TrainerBug_catcherWayne, -1
	person_event SPRITE_BUG_BOY, 24, 15, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 2, TrainerBug_catcherMushi, -1
	person_event SPRITE_BUG_BOY, 13, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 2, TrainerBug_catcherAlex, -1
	person_event SPRITE_POKE_BALL, 14, 19, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TangeloJungleSuperPotion, EVENT_TANGELO_JUNGLE_SUPER_POTION
	person_event SPRITE_POKE_BALL, 44, 1, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TangeloJungleAntidote, EVENT_TANGELO_JUNGLE_ANTIDOTE
	person_event SPRITE_POKE_BALL, 14, 41, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TangeloJungleEther, EVENT_TANGELO_JUNGLE_ETHER
	person_event SPRITE_YOUNGSTER, 31, 4, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 >> 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerYoungsterNess, -1

