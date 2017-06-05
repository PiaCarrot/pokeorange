const_value set 2
	const ILEXFOREST_POKE_BALL1
	const ILEXFOREST_LASS
	const ILEXFOREST_YOUNGSTER2
	const ILEXFOREST_POKE_BALL2
	const ILEXFOREST_POKE_BALL3
	const ILEXFOREST_POKE_BALL4
	const TANGELO_JUNGLE_BUG_BOY
	const TANGELO_JUNGLE_BUG_BOY2
	const TANGELO_JUNGLE_NESS

IlexForest_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerBug_catcherWayne:
	trainer EVENT_BEAT_BUG_CATCHER_WAYNE, BUG_CATCHER, 15, Bug_catcherWayneSeenText, Bug_catcherWayneBeatenText, 0, Bug_catcherWayneScript

Bug_catcherWayneScript:
	end_if_just_battled
	opentext
	writetext Bug_catcherWayneAfterText
	waitbutton
	closetext
	end
	
TrainerBug_catcherMushi:
	trainer EVENT_BEAT_BUG_CATCHER_MUSHI, BUG_CATCHER, 16, Bug_catcherMushiSeenText, Bug_catcherMushiBeatenText, 0, Bug_catcherMushiScript

Bug_catcherMushiScript:
	end_if_just_battled
	opentext
	writetext Bug_catcherMushiAfterText
	waitbutton
	closetext
	end
	
TrainerBug_catcherAlex:
	trainer EVENT_BEAT_BUG_CATCHER_ALEX, BUG_CATCHER, 17, Bug_catcherAlexSeenText, Bug_catcherAlexBeatenText, 0, Bug_catcherAlexScript

Bug_catcherAlexScript:
	end_if_just_battled
	opentext
	writetext Bug_catcherAlexAfterText
	waitbutton
	closetext
	end
	
TrainerYoungsterNess:
	trainer EVENT_BEAT_YOUNGSTER_NESS, YOUNGSTER, 15, YoungsterNessSeenText, YoungsterNessBeatenText, 0, YoungsterNessScript

YoungsterNessScript:
	end_if_just_battled
	opentext
	writetext YoungsterNessAfterText
	waitbutton
	closetext
	end

IlexForestLassScript:
	jumptextfaceplayer Text_IlexForestLass

IlexForestRevive:
	itemball POISON_BARB

IlexForestXAttack:
	itemball SUPER_POTION

IlexForestAntidote:
	itemball ANTIDOTE

IlexForestEther:
	itemball ETHER

IlexForestHiddenEther:
	dwb EVENT_ILEX_FOREST_HIDDEN_ETHER, ETHER

IlexForestHiddenSuperPotion:
	dwb EVENT_ILEX_FOREST_HIDDEN_SUPER_POTION, SUPER_POTION

IlexForestHiddenFullHeal:
	dwb EVENT_ILEX_FOREST_HIDDEN_FULL_HEAL, FULL_HEAL

MapIlexForestSignpost4Script:
	jumptext Text_IlexForestSignpost4

Text_IlexForestLass:
	text "Oh, no! I got"
	line "lost! It's my"
	cont "fault, really."
	
	para "I was trying to"
	line "catch a PIKACHU!"
	done

Text_IlexForestSignpost4:
	text "TANGELO JUNGLE"
	line "Warning!"
	
	para "Wild #MON are"
	line "very dangeous!"
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
	line "could battle..."
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
	
IlexForest_MapEventHeader:: db 0, 0

.Warps: db 3
	warp_def 5, 25, 3, ROUTE_34_ILEX_FOREST_GATE
	warp_def 52, 23, 1, ROUTE_31_VIOLET_GATE
	warp_def 53, 23, 2, ROUTE_31_VIOLET_GATE

.CoordEvents: db 0

.BGEvents: db 4
	signpost 27, 10, SIGNPOST_ITEM, IlexForestHiddenEther
	signpost 11, 15, SIGNPOST_ITEM, IlexForestHiddenSuperPotion
	signpost 40, 6, SIGNPOST_ITEM, IlexForestHiddenFullHeal
	signpost 39, 21, SIGNPOST_UP, MapIlexForestSignpost4Script

.ObjectEvents: db 9
	person_event SPRITE_POKE_BALL, 48, 2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, IlexForestRevive, EVENT_ILEX_FOREST_REVIVE
	person_event SPRITE_YOUNGSTER, 38, 9, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, IlexForestLassScript, -1
	person_event SPRITE_BUG_BOY, 13, 18, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 0, TrainerBug_catcherWayne, -1
	person_event SPRITE_BUG_BOY, 19, 26, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 2, TrainerBug_catcherMushi, -1
	person_event SPRITE_BUG_BOY, 10, 2, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 2, TrainerBug_catcherAlex, -1
	person_event SPRITE_POKE_BALL, 34, 1, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, IlexForestXAttack, EVENT_ILEX_FOREST_X_ATTACK
	person_event SPRITE_POKE_BALL, 1, 5, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, IlexForestAntidote, EVENT_ILEX_FOREST_ANTIDOTE
	person_event SPRITE_POKE_BALL, 6, 11, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, IlexForestEther, EVENT_ILEX_FOREST_ETHER
	person_event SPRITE_YOUNGSTER, 28, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 >> 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerYoungsterNess, -1

