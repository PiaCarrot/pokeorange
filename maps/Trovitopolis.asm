const_value = 1

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

TrovitopolisGrampsScript:
	faceplayer
	opentext
	writetext TrovitopolisGrampsText
	waitbutton
	;failsafe to give the rainbow wing on old saves that already beat Cross at Pummelo
	checkevent EVENT_BEAT_ORANGE_LEAGUE
	iffalse .done ;if you haven't beat the league, we are done (to beat the league you must beat Cross at Pummelo first)
	checkevent EVENT_CROSS_CORRUPTED_SUNRAY
	iftrue .done ;if you triggered this event, you already got the rainbow wing (but may not have it until you beat Cross at route 51)
	checkitem RAINBOW_WING ;you beat Cross on Pummelo, but haven't triggered Marshadow's event (and thus losing the Rainbow Wing), so assume old save and give it to the player
	iftrue .done
	verbosegiveitem RAINBOW_WING
	
.done
	closetext
	end

TrovitopolisGrampsText:
	text "Sometimes I've run"
	line "into an invisble"
	cont "wall in the caves."
	cont "Did it happen to"
	cont "you too?"
	
	para "I may be crazy,"
	line "but I feel like"
	cont "there's something"
	cont "watching me when"
	cont "it happens. Legend"
	cont "says the feathers"
	cont "of the legendary"
	cont "#MON HO-OH can"
	cont "show the secrets"
	cont "of the invisible,"
	cont "but I guess I'll"
	cont "never solve this"
	cont "mystery."

	done
	
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
	
TrovitopolisSailor2Script:
	jumptextfaceplayer TrovitopolisSailor2Text
	
TrovitopolisSailor2Text:
	text "The #MON CENTER"
	line "here is huge!"
	
	para "Apparently you can"
	line "trade and battle"
	cont "inside this one."
	done
	
TrovitopolisMaxRevive:
	itemball MAX_REVIVE
	
TrovitopolisRareCandy:
	itemball RARE_CANDY
	
TrovitopolisNugget:
	itemball NUGGET
	
TrovitopolisWaterStone:
	itemball WATER_STONE

Trovitopolis_MapEventHeader::

.Warps: db 13
	warp_def 31, 48, 2, TROVITOPOLIS_POKE_COMM_CENTER
	warp_def 3, 23, 1, SEWER_ENTRANCE
	warp_def 15, 36, 1, TROVITOPOLIS_DEPT_STORE_1F
	warp_def 41, 62, 2, SUNRAY_CAVE_MANDARIN_DESERT_1F
	warp_def 5, 55, 1, TROVITOPOLIS_MR_FLASH_HOUSE
	warp_def 21, 45, 1, TROVITOPOLIS_MOVE_DELETER_HOUSE
	warp_def 29, 59, 1, TROVITOPOLIS_HOUSE_1
	warp_def 29, 29, 1, TROVITOPOLIS_HOUSE_2
	warp_def 11, 25, 1, TROVITOPOLIS_HOUSE_3
	warp_def 17, 15, 1, TROVITOPOLIS_HOUSE_4
	warp_def 19, 6, 1, TROVITOPOLIS_PORT
	warp_def 17, 52, 1, MAYORS_OFFICE
	warp_def 21, 18, 1, TROVITOPOLIS_PRIMA_SCHOOL

.CoordEvents: db 0

.BGEvents: db 8
	signpost 37, 59, SIGNPOST_READ, TrovitopolisSign
	signpost 17, 49, SIGNPOST_READ, TrovitopolisMayorSign
	signpost 15, 37, SIGNPOST_READ, TrovitopolisDeptStoreSign
	signpost 20, 10, SIGNPOST_READ, TrovitopolisPortSign
	signpost 22, 16, SIGNPOST_READ, TrovitopolisSchoolSign
	signpost 22, 46, SIGNPOST_READ, TrovitopolisMoveDeleterSign
	signpost 6, 56, SIGNPOST_READ, TrovitopolisMrFlashSign
	signpost 4, 22, SIGNPOST_READ, TrovitopolisSewerSign

.ObjectEvents: db 9
	person_event SPRITE_COOLTRAINER_F, 26, 56, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 1, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TrovitopolisRedCoolTrainerScript, -1
	person_event SPRITE_COOLTRAINER_F, 32, 25, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TrovitopolisGreenCoolTrainerScript, -1
	person_event SPRITE_GENTLEMAN, 18, 36, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TrovitopolisGentlemanScript, -1
	person_event SPRITE_GRAMPS, 38, 56, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, TrovitopolisGrampsScript, -1
	person_event SPRITE_SAILOR, 21, 4, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TrovitopolisSailorScript, -1
	person_event SPRITE_SAILOR, 33, 45, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TrovitopolisSailor2Script, -1
	person_event SPRITE_POKE_BALL, 43, 32, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TrovitopolisMaxRevive, EVENT_TROVITOPOLIS_MAX_REVIVE
	person_event SPRITE_POKE_BALL, 5, 60, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TrovitopolisRareCandy, EVENT_TROVITOPOLIS_RARE_CANDY
	person_event SPRITE_POKE_BALL, 17, 61, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TrovitopolisNugget, EVENT_TROVITOPOLIS_NUGGET
	person_event SPRITE_POKE_BALL, 43, 25, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TrovitopolisWaterStone, EVENT_TROVITOPOLIS_WATER_STONE

