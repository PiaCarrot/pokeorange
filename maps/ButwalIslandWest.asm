ButwalIslandWest_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 2
	dbw MAPCALLBACK_NEWMAP, .InitializeDiveMap
	dbw MAPCALLBACK_TILES, ButwalIslandWestBridgeCallback

.InitializeDiveMap:
	divemap BUTWAL_ISLAND_UNDERWATER_WEST, -12, 2
	return
	
ButwalIslandWestBridgeCallback:
	checktriggers
	iftrue .underfoot
	callasm ButwalIslandWest_OverheadBridgeAsm
	return

.underfoot:
	callasm ButwalIslandWest_UnderfootBridgeAsm
	return

ButwalIslandWestBridgeOverheadTrigger:
	callasm ButwalIslandWest_OverheadBridgeAsm
	endbridgetrigger wButwalIslandWestTrigger, $0

ButwalIslandWestBridgeUnderfootTrigger:
	callasm ButwalIslandWest_UnderfootBridgeAsm
	endbridgetrigger wButwalIslandWestTrigger, $1

ButwalIslandWest_OverheadBridgeAsm:
	changebridgeblock 26, 4, $c0, BUTWAL_ISLAND_WEST
	changebridgeblock 26, 6, $c1, BUTWAL_ISLAND_WEST
	changebridgeblock 26, 8, $c1, BUTWAL_ISLAND_WEST
	changebridgeblock 26, 10, $c1, BUTWAL_ISLAND_WEST
	changebridgeblock 26, 12, $c2, BUTWAL_ISLAND_WEST
	endbridgeblocks

ButwalIslandWest_UnderfootBridgeAsm:
	changebridgeblock 26, 4, $b9, BUTWAL_ISLAND_WEST
	changebridgeblock 26, 6, $b4, BUTWAL_ISLAND_WEST
	changebridgeblock 26, 8, $b4, BUTWAL_ISLAND_WEST
	changebridgeblock 26, 10, $4c, BUTWAL_ISLAND_WEST
	changebridgeblock 26, 12, $ba, BUTWAL_ISLAND_WEST
	endbridgeblocks

	
; COOLTRAINER_M KUBO
TrainerCooltrainerMKubo:
	trainer EVENT_BEAT_COOLTRAINER_M_KUBO, COOLTRAINERM, KUBO, CooltrainerMKuboSeenText, CooltrainerMKuboWinText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerMKuboAfterText
	waitbutton
	closetext
	end
	
CooltrainerMKuboSeenText:
	text "This is me and my"
	line "bro's turf!"
	
	para "I'm gonna send you"
	line "home crying, kid!"
	done
	
CooltrainerMKuboWinText:
	text "Big bro!"
	done
	
CooltrainerMKuboAfterText:
	text "My ACE #MON"
	line "were defeated!"
	done
	

; COOLTRAINER_M NAGI
TrainerCooltrainerMNagi:
	trainer EVENT_BEAT_COOLTRAINER_M_NAGI, COOLTRAINERM, NAGI, CooltrainerMNagiSeenText, CooltrainerMNagiWinText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerMNagiAfterText
	waitbutton
	closetext
	end
	
CooltrainerMNagiSeenText:
	text "Beat my little bro"
	line "did ya'?"
	
	para "Guess I'll show"
	line "you what we are"
	cont "capable of!"
	done
	
CooltrainerMNagiWinText:
	text "I see your power!"
	line "Staggering!"
	done
	
CooltrainerMNagiAfterText:
	text "We brothers will"
	line "continue training"
	cont "until we can beat"
	cont "LUANA."
	done
	
ButwalWestTM17Protect:
	itemball TM_PROTECT
	
ButwalWestRevive:
	itemball REVIVE
	
ButwalWestMaxPotion:
	itemball MAX_POTION
	
ButwalWestFruitTree:
	fruittree FRUITTREE_BUTWAL_WEST
	
ButwalWestHiddenElixir:
	dwb EVENT_BUTWAL_WEST_HIDDEN_ELIXIR, ELIXER

ButwalIslandWest_MapEventHeader::

.Warps: db 1
	warp_def 23, 24, 1, BUTWAL_ISLAND_WEST_GROTTO

.CoordEvents: db 3
	xy_trigger 1, 16, 26, ButwalIslandWestBridgeOverheadTrigger
	xy_trigger 0, 17, 26, ButwalIslandWestBridgeUnderfootTrigger
	xy_trigger 0, 12, 30, ButwalIslandWestBridgeUnderfootTrigger

.BGEvents: db 1
	signpost 35, 25, SIGNPOST_ITEM, ButwalWestHiddenElixir

.ObjectEvents: db 6
	person_event SPRITE_COOLTRAINER_M, 30, 9, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerCooltrainerMKubo, -1
	person_event SPRITE_COOLTRAINER_M, 32, 11, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerCooltrainerMNagi, -1
	person_event SPRITE_POKE_BALL, 3, 26, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, ButwalWestTM17Protect, EVENT_BUTWAL_WEST_PROTECT
	person_event SPRITE_POKE_BALL, 15, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, ButwalWestRevive, EVENT_BUTWAL_WEST_REVIVE
	person_event SPRITE_POKE_BALL,  6, 22, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, ButwalWestMaxPotion, EVENT_BUTWAL_WEST_MAX_POTION
	person_event SPRITE_FRUIT_TREE, 33, 18, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ButwalWestFruitTree, -1
