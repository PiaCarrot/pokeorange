Route68_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

Route68Sign:
	jumptext Route68SignText
	
Route68SignText:
	text "ROUTE 68"
	
	para "I wonder who drew"
	line "these map lines?"
	done
;=================================
;=================================
		
TrainerSwimmerFMelly:
	trainer EVENT_BEAT_SWIMMERF_MELLY, SWIMMERF, MELLY, SwimmerFMellySeenText, SwimmerFMellyBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmerFMellyAfterText
	waitbutton
	closetext
	end

SwimmerFMellySeenText:
	text "WATER #MON"
	line "are the best!"
	done

SwimmerFMellyBeatenText:
	text "My point still"
	line "stands!"
	done

SwimmerFMellyAfterText:
	text "My point still"
	line "stands!"
	done
	
;=================================
;=================================
		
TrainerSwimmerFSally:
	trainer EVENT_BEAT_SWIMMERF_SALLY, SWIMMERF, SALLY, SwimmerFSallySeenText, SwimmerFSallyBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmerFSallyAfterText
	waitbutton
	closetext
	end

SwimmerFSallySeenText:
	text "My favorite ORANGE" 
	line "CREW member is"
	cont "CISSY!"
	done

SwimmerFSallyBeatenText:
	text "Aw<...>"
	done

SwimmerFSallyAfterText:
	text "I can see how you"
	line "beat CISSY<...>"
	done
	
;=================================
;=================================
		
TrainerSwimmerFRue:
	trainer EVENT_BEAT_SWIMMERF_RUE, SWIMMERF, RUE, SwimmerFRueSeenText, SwimmerFRueBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SwimmerFRueAfterText
	waitbutton
	closetext
	end

SwimmerFRueSeenText:
	text "ROUTE 68<...>"
	line "It's quite small."
	done

SwimmerFRueBeatenText:
	text "<...>"
	done

SwimmerFRueAfterText:
	text "Can you really"
	line "call this a ROUTE?"
	done

Route68_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 1
	signpost  5, 13, SIGNPOST_READ, Route68Sign

.ObjectEvents: db 3
	person_event SPRITE_SWIMMER_GIRL, 12,  6, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 2, TrainerSwimmerFMelly, -1
	person_event SPRITE_SWIMMER_GIRL, 13, 20, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSwimmerFSally, -1
	person_event SPRITE_SWIMMER_GIRL, 15, 12, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSwimmerFRue, -1


