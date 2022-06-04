const_value = 1
	const BUTWAL_WEST_UW_DIVER1
	const BUTWAL_WEST_UW_DIVER2

ButwalIslandUnderwaterWest_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .InitializeDiveMap

.InitializeDiveMap:
	divemap BUTWAL_ISLAND_WEST, 12, -2
	return
	
; DIVER_HIROSHI
TrainerDiverMHiroshi:
	trainer EVENT_BEAT_DIVER_HIROSHI, DIVER_MALE, HIROSHI, DiverHiroshiSeenText, DiverHiroshiWinText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext DiverHiroshiAfterText
	waitbutton
	closetext
	end
	
DiverHiroshiSeenText:
	text "Blub?"
	done
	
DiverHiroshiWinText:
	text "Blub."
	done
	
DiverHiroshiAfterText:
	text "Blub blub<...>"
	done
	
; DIVER_AMI
TrainerDiverFAmi:
	trainer EVENT_BEAT_DIVER_AMI, DIVER_FEMALE, AMI, DiverAmiSeenText, DiverAmiWinText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext DiverAmiAfterText
	waitbutton
	closetext
	end
	
DiverAmiSeenText:
	text "<...>Blub."
	done
	
DiverAmiWinText:
	text "Blub bu!"
	done
	
DiverAmiAfterText:
	text "<...>"
	done

ButwalIslandUnderwaterWest_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_DIVER_MALE_UW, 8, 15, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerDiverMHiroshi, -1
	person_event SPRITE_DIVER_FEMALE_UW, 4, 8, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerDiverFAmi, -1

