const_value = 1
	const BUTWAL_EAST_UW_DIVER1
	const BUTWAL_EAST_UW_DIVER2

ButwalIslandUnderwaterEast_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .InitializeDiveMap

.InitializeDiveMap:
	divemap BUTWAL_ISLAND_EAST, -2, -4
	return
	
; DIVER_OKABE
TrainerDiverMOkabe:
	trainer EVENT_BEAT_DIVER_OKABE, DIVER_MALE, OKABE, DiverOkabeSeenText, DiverOkabeWinText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext DiverOkabeAfterText
	waitbutton
	closetext
	end
	
DiverOkabeSeenText:
	text "Blub! Blub!"
	done
	
DiverOkabeWinText:
	text "Blugh<...>"
	done
	
DiverOkabeAfterText:
	text "Blub blub blub<...>"
	done
	
; DIVER_Mayuri
TrainerDiverFMayuri:
	trainer EVENT_BEAT_DIVER_MAYURI, DIVER_FEMALE, MAYURI, DiverMayuriSeenText, DiverMayuriWinText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext DiverMayuriAfterText
	waitbutton
	closetext
	end
	
DiverMayuriSeenText:
	text "<...>"
	done
	
DiverMayuriWinText:
	text "Bu bu!"
	done
	
DiverMayuriAfterText:
	text "<...>"
	line "<...>"
	cont "Blub."
	done

ButwalIslandUnderwaterEast_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_DIVER_MALE_UW, 12, 7, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerDiverMOkabe, -1
	person_event SPRITE_DIVER_FEMALE_UW, 4, 6, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerDiverFMayuri, -1

