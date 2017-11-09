const_value set 1

Trovitopolis_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_TROVITOPOLIS
	return
	
TrovitopolisRedCoolTrainerScript:
	faceplayer
	checkevent EVENT_TROVITOPOLIS_SAVED
    iftrue .SavedText
    opentext
    writetext TrovitopolisRedCooltrainerCorruptedText
    waitbutton
    closetext
	end

.SavedText:
	opentext
	writetext TrovitopolisRedCooltrainerSavedText
	waitbutton
	closetext
	end
	
TrovitopolisGreenCoolTrainerScript:
	jumptextfaceplayer TrovitopolisGreenCoolTrainerText
	
TrovitopolisGentlemanScript:
	jumptextfaceplayer TrovitopolisGentlemanText
	
TrovitopolisSailorScript:
	jumptextfaceplayer TrovitopolisSailorText
	
TrovitopolisRedCooltrainerCorruptedText:
	text "The mayor keeps"
	line "raising our taxes!"

	para "Now that he has"
	line "those TEAM ROCKET"
	cont "goons working for"
	cont "him, they are even"
	
	para "trying to steal"
	line "the #MON!"
	done
		
TrovitopolisRedCooltrainerSavedText:
	text "Hey, you're the"
	line "kid who defeated"
	cont "TEAM ROCKET!"
	
	para "You're gonna be in"
	line "history books, you"
	cont "know?"
	done
	
TrovitopolisGreenCoolTrainerText:
	text "RUDY's so cool!"
	
	para "He trains with his"
	line "#MON through"
	cont "dancing!"
	
	para "He's also super"
	line "cute!"
	done
	
TrovitopolisGentlemanText:
	text "Ohoho!"
	
	para "On the ROOF of"
	line "the DEPT. STORE,"
	cont "you can buy a rare"
	cont "#MON."
	done

TrovitopolisSailorText:
	text "I saw the most"
	line "beautiful woman!"
	
	para "I think her name"
	line "was LORELEI. Some"
	cont "big shot from the"
	cont "KANTO region."
	done
	
TrovitopolisSign:
	jumptext TrovitopolisSignText
	
TrovitopolisSignText:
	text "TROVITOPOLIS"
	
	para "City that never"
	line "sleeps!"
	done
	
TrovitopolisMayorSign:
	jumptext TrovitopolisMayorSignText
	
TrovitopolisMayorSignText:
	text "MAYOR's OFFICE"
	done
	
TrovitopolisDeptStoreSign:
	jumptext TrovitopolisDeptStoreSignText
	
TrovitopolisDeptStoreSignText:
	text "DEPT. STORE"
	
	para "#MON SHOP on"
	line "ROOF"
	done
	
TrovitopolisPortSign:
	jumptext TrovitopolisPortSignText
	
TrovitopolisPortSignText:
	text "TROVITOPOLIS PORT"
	done
	
TrovitopolisSchoolSign:
	jumptext TrovitopolisSchoolSignText
	
TrovitopolisSchoolSignText:
	text "PRIMA's OFFICIAL"
	line "TRAINER SCHOOL"
	done

TrovitopolisMoveDeleterSign:
	jumptext TrovitopolisMoveDeleterSignText
	
TrovitopolisMoveDeleterSignText:
	text "MOVE DELETER"
	done

TrovitopolisMrFlashSign:
	jumptext TrovitopolisMrFlashSignText
	
TrovitopolisMrFlashSignText:
	text "MR. FLASH's HOUSE"
	done
	
TrovitopolisSewerSign:
	jumptext TrovitopolisSewerSignText
	
TrovitopolisSewerSignText:
	text "TROVITOPOLIS SEWER"
	line "ENTRANCE"
	done

Trovitopolis_MapEventHeader::

.Warps: db 1
	warp_def 31, 48, 1, TROVITOPOLIS_POKE_COMM_CENTER

.CoordEvents: db 0

.BGEvents: db 8
	signpost 37, 59, SIGNPOST_READ, TrovitopolisSign
	signpost 17, 49, SIGNPOST_READ, TrovitopolisMayorSign
	signpost 15, 33, SIGNPOST_READ, TrovitopolisDeptStoreSign
	signpost 20, 10, SIGNPOST_READ, TrovitopolisPortSign
	signpost 25, 19, SIGNPOST_READ, TrovitopolisSchoolSign
	signpost 22, 46, SIGNPOST_READ, TrovitopolisMoveDeleterSign
	signpost 6, 56, SIGNPOST_READ, TrovitopolisMrFlashSign
	signpost 6, 20, SIGNPOST_READ, TrovitopolisSewerSign

.ObjectEvents: db 4
	person_event SPRITE_COOLTRAINER_F, 26, 56, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 1, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TrovitopolisRedCoolTrainerScript, -1
	person_event SPRITE_COOLTRAINER_F, 32, 25, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TrovitopolisGreenCoolTrainerScript, -1
	person_event SPRITE_GENTLEMAN, 18, 36, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TrovitopolisGentlemanScript, -1
	person_event SPRITE_SAILOR, 21, 4, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TrovitopolisSailorScript, -1

