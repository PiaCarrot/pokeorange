const_value = 1
	const ROUTE_66_NORTH_SOUTH_FRUIT_TREE
	const ROUTE_66_NORTH_SOUTH_ITEMBALL_MAX_POTION
	const ROUTE_66_NORTH_SOUTH_LASS_LOLA
	const ROUTE_66_NORTH_SOUTH_COOLTRAINERM_DAVID
	const ROUTE_66_NORTH_SOUTH_BIRDKEEPER_DWIGHT
	const ROUTE_66_NORTH_SOUTH_SIGHTSEERF_FLORA

Route66NorthSouth_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0
	
;=================================
;=================================
	
Route66FruitTree:
	fruittree FRUITTREE_ROUTE_66
	
;=================================
;=================================
	
Route66NorthSouthMaxPotion:
	itemball MAX_POTION
	
;=================================
;=================================
		
TrainerLassLola:
	trainer EVENT_BEAT_LASS_LOLA, LASS, LOLA, LassLolaSeenText, LassLolaBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext LassLolaAfterText
	waitbutton
	closetext
	end

LassLolaSeenText:
	text "We got whooped by"
	line "LUANA! So we're"
	cont "looking for weak-"
	cont "lings to train on!"
	done

LassLolaBeatenText:
	text "Whooped again!"
	done

LassLolaAfterText:
	text "You looked so"
	line "easy, too<...>"
	done
	
;=================================
;=================================
	
TrainerCooltrainerMDavid:
	trainer EVENT_BEAT_COOLTRAINER_M_DAVID, COOLTRAINERM, DAVID, CooltrainerMDavidSeenText, CooltrainerMDavidBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerMDavidAfterText
	waitbutton
	closetext
	end

CooltrainerMDavidSeenText:
	text "The ORANGE crew!"
	
	para "Show me you're"
	line "worthy to fight"
	cont "them!"
	done

CooltrainerMDavidBeatenText:
	text "You pass!"
	done

CooltrainerMDavidAfterText:
	text "You pass!"
	done
	
;=================================
;=================================
		
TrainerBirdkeeperDwight:
	trainer EVENT_BEAT_BIRDKEEPER_DWIGHT, BIRDKEEPER, DWIGHT, BirdkeeperDwightSeenText, BirdkeeperDwightBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext BirdkeeperDwightAfterText
	waitbutton
	closetext
	end

BirdkeeperDwightSeenText:
	text "A bird in a cage<...>"
	done

BirdkeeperDwightBeatenText:
	text "It<...>"
	done

BirdkeeperDwightAfterText:
	text "It<...>"
	
	para "Can't spread its'"
	line "wings!"
	done
	
;=================================
;=================================
		
TrainerSightseerFFlora:
	trainer EVENT_BEAT_SIGHTSEERF_FLORA, SIGHTSEERF, FLORA, SightseerFFloraSeenText, SightseerFFloraBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SightseerFFloraAfterText
	waitbutton
	closetext
	end

SightseerFFloraSeenText:
	text "I'll have you know!"
	
	para "I'm a super strong"
	line "trainer!"
	cont "I have 6 BADGES!"
	done

SightseerFFloraBeatenText:
	text "No way!"
	done

SightseerFFloraAfterText:
	text "Well, I only have"
	line "one BADGE from the"
	cont "ORANGE ISLANDS<...>"
	done

Route66NorthSouth_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 6
	person_event SPRITE_FRUIT_TREE, 29,  4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route66FruitTree, -1
	person_event SPRITE_POKE_BALL, 33, 17, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route66NorthSouthMaxPotion, EVENT_ROUTE_66_NORTH_SOUTH_MAX_POTION
	person_event SPRITE_LASS, 10, 12, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerLassLola, -1
	person_event SPRITE_COOLTRAINER_M, 10,  6, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 2, TrainerCooltrainerMDavid, -1
	person_event SPRITE_COOLTRAINER_M, 12,  9, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerBirdkeeperDwight, -1
	person_event SPRITE_SIGHTSEER_F, 13, 13, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerSightseerFFlora, -1

