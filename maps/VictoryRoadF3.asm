const_value set 1

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
	text "Estoy devastado,"
	line "amigo<...>"
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

VictoryRoadF3_MapEventHeader::

.Warps: db 5
	warp_def 45, 37, 8, ROUTE_69_SOUTH
	warp_def 25, 31, 9, ROUTE_69_SOUTH
	warp_def  3, 35, 10, ROUTE_69_SOUTH
	warp_def  3,  5, 11, ROUTE_69_SOUTH
	warp_def 41, 21, 14, ROUTE_69_SOUTH

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_DIVER_MALE_SWIM,  8, 10, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerDiverMCaos, -1
	person_event SPRITE_COOLTRAINER_M,  8, 19, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerSightseerMCoral, -1
	person_event SPRITE_DIVER_MALE_SWIM, 10, 28, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerDiverMMonsta, -1
