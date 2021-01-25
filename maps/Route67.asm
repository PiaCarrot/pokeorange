Route67_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .InitializeDiveMap

.InitializeDiveMap:
	divemap ROUTE_67_UNDERWATER, 0, 0
	return

Route67Sign:
	jumptext Route67SignText
	
Route67SignText:
	text "ROUTE 67"
	done
	
Route67SeedBomb:
	itemball TM_SEED_BOMB
	
Route67PPUp:
	itemball PP_UP
	
Route67FullRestore:
	itemball FULL_RESTORE
	
Route67HiddenGrapefruit:
	dwb EVENT_ROUTE_67_HIDDEN_GRAPEFRUIT, SWEET_ORANGE
	
Route67HiddenMaxRevive:
	dwb EVENT_ROUTE_67_HIDDEN_MAX_REVIVE, MAX_REVIVE
	
;=================================
;=================================

TrainerOtakuAbe:
	trainer EVENT_BEAT_OTAKU_ABE, OTAKU, ABE, OtakuAbeSeenText, OtakuAbeBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext OtakuAbeAfterText
	waitbutton
	closetext
	end

OtakuAbeSeenText:
	text "Gotta Catch 'Em"
	line "All!"
	done

OtakuAbeBeatenText:
	text "Why catch them"
	line "all in real life?"
	done

OtakuAbeAfterText:
	text "I have almost all"
	line "the #MON in"
	cont "my GAMEBOY game!"
	done
	
;=================================
;=================================
		
TrainerLassTori:
	trainer EVENT_BEAT_LASS_TORI, LASS, TORI, LassToriSeenText, LassToriBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext LassToriAfterText
	waitbutton
	closetext
	end

LassToriSeenText:
	text "Strength in num-"
	line "bers!"
	done

LassToriBeatenText:
	text "Kyaa!"
	done

LassToriAfterText:
	text "My cuties got me"
	line "this far! I won't"
	cont "give up yet!"
	done
	
;=================================
;=================================
		
TrainerFisherGin:
	trainer EVENT_BEAT_FISHER_GIN, FISHER, GIN, FisherGinSeenText, FisherGinBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext FisherGinAfterText
	waitbutton
	closetext
	end

FisherGinSeenText:
	text "I caught a special"
	line "one<...>"
	done

FisherGinBeatenText:
	text "It sparkles!"
	done

FisherGinAfterText:
	text "I lied."
	
	para "I didn't catch it."
	line "Some salesman told"
	cont "me it was super"
	cont "strong."
	done
	
;=================================
;=================================
		
TrainerCooltrainerMFabio:
	trainer EVENT_BEAT_COOLTRAINERM_FABIO, COOLTRAINERM, FABIO, CooltrainerMFabioSeenText, CooltrainerMFabioBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerMFabioAfterText
	waitbutton
	closetext
	end

CooltrainerMFabioSeenText:
	text "What's up hotshot?"
	done

CooltrainerMFabioBeatenText:
	text "Hot, hot, hot!"
	done

CooltrainerMFabioAfterText:
	text "You're on fire,"
	line "kid!"
	done
	
;=================================
;=================================
		
TrainerCooltrainerFLiz:
	trainer EVENT_BEAT_COOLTRAINERF_LIZ, COOLTRAINERF, LIZ, CooltrainerFLizSeenText, CooltrainerFLizBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerFLizAfterText
	waitbutton
	closetext
	end

CooltrainerFLizSeenText:
	text "Good type coverage"
	line "is what makes the"
	cont "team."
	done

CooltrainerFLizBeatenText:
	text "No way!"
	done

CooltrainerFLizAfterText:
	text "Nevertheless, you"
	line "should always have"
	cont "your weaknesses"
	cont "covered."
	done
	
;=================================
;=================================
		
TrainerBirdkeeperCid:
	trainer EVENT_BEAT_BIRDKEEPER_CID, BIRDKEEPER, CID, BirdkeeperCidSeenText, BirdkeeperCidBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext BirdkeeperCidAfterText
	waitbutton
	closetext
	end

BirdkeeperCidSeenText:
	text "Isn't FLYING just"
	line "the best?"
	done

BirdkeeperCidBeatenText:
	text "FLY away!"
	done

BirdkeeperCidAfterText:
	text "Use FLY, PIDGEOT!"
	
	para "<...>"
	line "<...>"
	cont "<...>"
	cont "<...>"
	
	para "PIDGEOT?"
	done
	
;=================================
;=================================
		
TrainerSwimmerFLulu:
	trainer EVENT_BEAT_SWIMMERF_LULU, SWIMMERF, LULU, SwimmerFLuluSeenText, SwimmerFLuluBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmerFLuluAfterText
	waitbutton
	closetext
	end

SwimmerFLuluSeenText:
	text "I found all my"
	line "#MON while"
	cont "diving!"
	done

SwimmerFLuluBeatenText:
	text "Blub<...>"
	done

SwimmerFLuluAfterText:
	text "There's lots of"
	line "treasure to be"
	cont "found UNDERWATER."
	done

Route67_MapEventHeader::

.Warps: db 1
	warp_def  5, 37, 1, KUMQUAT_HOUSE_3

.CoordEvents: db 0

.BGEvents: db 3
	signpost  4, 54, SIGNPOST_READ, Route67Sign
	signpost  7, 54, SIGNPOST_ITEM, Route67HiddenGrapefruit
	signpost 25, 22, SIGNPOST_ITEM, Route67HiddenMaxRevive

.ObjectEvents: db 10
	person_event SPRITE_POKE_BALL, 18, 52, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route67SeedBomb, EVENT_ROUTE_67_SEED_BOMB
	person_event SPRITE_POKE_BALL, 20,  7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route67PPUp, EVENT_ROUTE_67_PP_UP
	person_event SPRITE_POKE_BALL, 15, 41, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route67FullRestore, EVENT_ROUTE_67_FULL_RESTORE
	person_event SPRITE_LASS, 18, 48, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerLassTori, -1
	person_event SPRITE_FISHER, 14, 19, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 4, TrainerFisherGin, -1
	person_event SPRITE_FISHER,  8, 38, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_TRAINER, 1, TrainerOtakuAbe, -1
	person_event SPRITE_COOLTRAINER_M, 13, 50, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerCooltrainerMFabio, -1
	person_event SPRITE_COOLTRAINER_F, 15, 51, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 2, TrainerCooltrainerFLiz, -1
	person_event SPRITE_COOLTRAINER_M, 17, 37, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerBirdkeeperCid, -1
	person_event SPRITE_SWIMMER_GIRL, 12,  6, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSwimmerFLulu, -1

