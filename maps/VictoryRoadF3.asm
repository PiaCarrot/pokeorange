const_value = 1
	const VR_F3_DIVER_1
	const VR_F3_SIGHTSEER
	const VR_F3_DIVER_2
	const VR_F3_HIKER
	const VR_F3_POKEBALL_1
	const VR_F3_POKEBALL_2
	const VR_F3_POKEBALL_3

VictoryRoadF3_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

;=================================
;=================================
		
TrainerDiverMCaos:
	trainer EVENT_BEAT_DIVERM_CAOS, DIVER_MALE, CAOS, DiverMCaosSeenText, DiverMCaosBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext DiverMCaosAfterText
	waitbutton
	closetext
	end

DiverMCaosSeenText:
	text "Hola, amigo!"
	done

DiverMCaosBeatenText:
	text "En serio!?"
	done

DiverMCaosAfterText:
	text "Me siento"
	line "devastado<...>"
	done
	
;=================================
;=================================
		
TrainerSightseerMCoral:
	trainer EVENT_BEAT_SIGHTSEERM_CORAL, SIGHTSEERM, CORAL, SightseerMCoralSeenText, SightseerMCoralBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SightseerMCoralAfterText
	waitbutton
	closetext
	end

SightseerMCoralSeenText:
	text "You seem strong!"
	line "Battle me!"
	done

SightseerMCoralBeatenText:
	text "Save the reefs!"
	done

SightseerMCoralAfterText:
	text "I just came from"
	line "an island called"
	cont "PORTA VISTA."
	
	para "The mayor there,"
	line "NASTINA, killed a"
	cont "reef to build a"
	cont "hotel. Tragic."
	done
	
;=================================
;=================================
		
TrainerDiverMMonsta:
	trainer EVENT_BEAT_DIVERM_MONSTA, DIVER_MALE, MONSTA, DiverMMonstaSeenText, DiverMMonstaBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext DiverMMonstaAfterText
	waitbutton
	closetext
	end

DiverMMonstaSeenText:
	text "Rode on a WAILORD"
	line "and somehow ended"
	cont "up here<...>"
	done

DiverMMonstaBeatenText:
	text "Another white out!"
	done

DiverMMonstaAfterText:
	text "I'm just a man,"
	line "standing in the"
	cont "dusk<...>"

	para "looking at the"
	line "seagulls<...>"

	para "KOONTZ can sing"
	line "that much better"
	cont "than I can<...>"
	done
	
;=================================
;=================================
		
TrainerHikerSour:
	trainer EVENT_BEAT_HIKER_SOUR, HIKER, SOUR, HikerSourSeenText, HikerSourBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext HikerSourAfterText
	waitbutton
	closetext
	end

HikerSourSeenText:
	text "Gwahaha! Almost"
	line "at the end!"
	done

HikerSourBeatenText:
	text "Perfection!"
	done

HikerSourAfterText:
	text "I could go for"
	line "a bowl of POTATO"
	cont "SOUP."
	done
	
VictoryRoadF3ShadowClaw:
	itemball TM_SHADOW_CLAW
	
VictoryRoadF3Ether:
	itemball ETHER
	
VictoryRoadF3FullRestore:
	itemball FULL_RESTORE

VictoryRoadF3_MapEventHeader::

.Warps: db 7
	warp_def 45, 37, 8, ROUTE_69_SOUTH
	warp_def 25, 31, 9, ROUTE_69_SOUTH
	warp_def  3, 35, 10, ROUTE_69_SOUTH
	warp_def  3,  5, 11, ROUTE_69_SOUTH
	warp_def 41, 21, 14, ROUTE_69_SOUTH
	warp_def 21,  7, 7, VICTORY_ROAD_F3
	warp_def 39,  3, 6, VICTORY_ROAD_F3

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 7
	person_event SPRITE_DIVER_MALE_SWIM,  8, 10, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerDiverMCaos, -1
	person_event SPRITE_COOLTRAINER_M,  8, 19, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerSightseerMCoral, -1
	person_event SPRITE_DIVER_MALE_SWIM, 10, 28, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerDiverMMonsta, -1
	person_event SPRITE_POKEFAN_M, 34, 36, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_TRAINER, 1, TrainerHikerSour, -1
	person_event SPRITE_POKE_BALL, 43,  4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, VictoryRoadF3ShadowClaw, EVENT_VICTORY_ROAD_F3_SHADOW_CLAW
	person_event SPRITE_POKE_BALL, 10, 36, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, VictoryRoadF3Ether, EVENT_VICTORY_ROAD_F3_ETHER
	person_event SPRITE_POKE_BALL,  9,  4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, VictoryRoadF3FullRestore, EVENT_VICTORY_ROAD_F3_FULL_RESTORE
