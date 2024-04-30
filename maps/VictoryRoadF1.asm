const_value = 1
	const VR_POKEBALL_1
	const VR_TRAINER_1
	const VR_TRAINER_2
	const VR_TRAINER_3
	const VR_TRAINER_4
	const VR_TRAINER_5
	const VR_POKEBALL_2

VictoryRoadF1_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

VictoryRoadF1TriAttack:
	itemball TM_TRI_ATTACK
	
VictoryRoadF1Nugget:
	itemball DUBIOUS_DISC
	
;=================================
;=================================
		
TrainerEngineerKalarie:
	trainer EVENT_BEAT_ENGINEER_KALARIE, ENGINEER, KALARIE, EngineerKalarieSeenText, EngineerKalarieBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext EngineerKalarieAfterText
	waitbutton
	closetext
	end

EngineerKalarieSeenText:
	text "Welcome to VICTORY"
	line "ROAD. Will you"
	cont "make it through?"
	done

EngineerKalarieBeatenText:
	text "Excellent."
	done

EngineerKalarieAfterText:
	text "Go forth, if you"
	line "dare."
	done
	
;=================================
;=================================
		

TrainerCooltrainerFGranny:
	faceplayer
	opentext
	checkevent EVENT_BEAT_COOLTRAINERF_GRANNY
	iftrue .AfterScript
	playmusic MUSIC_BEAUTY_ENCOUNTER
	writetext CooltrainerFGrannySeenText
	waitbutton
	closetext
	checkevent EVENT_GOT_BULBASAUR_FROM_IVY
	iftrue .BulbasaurGranny
	checkevent EVENT_GOT_SQUIRTLE_FROM_IVY
	iftrue .SquirtleGranny
	winlosstext CooltrainerFGrannyBeatenText, 0
	loadtrainer COOLTRAINERF, 7
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERF_GRANNY
	closetext
	end

.SquirtleGranny
	winlosstext CooltrainerFGrannyBeatenText, 0
	loadtrainer COOLTRAINERF, 8
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERF_GRANNY
	closetext
	end

.BulbasaurGranny
	winlosstext CooltrainerFGrannyBeatenText, 0
	loadtrainer COOLTRAINERF, 9
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERF_GRANNY
	closetext
	end
	
.AfterScript:
	writetext CooltrainerFGrannyAfterText
	waitbutton
	closetext
	end

CooltrainerFGrannySeenText:
	text "On your way to"
	line "PUMMELO ISLAND?"
	done

CooltrainerFGrannyBeatenText:
	text "Just wanted to"
	line "make sure<...>"
	done

CooltrainerFGrannyAfterText:
	text "There's an island"
	line "north of the"
	cont "ORANGE ARCHIPELAGO"
	cont "where I caught my"
	
	para "EEVEEs!"
	done

;=================================
;=================================
		
TrainerOtakuRwne:
	trainer EVENT_BEAT_OTAKU_RWNE, OTAKU, RWNE, OtakuRwneSeenText, OtakuRwneBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext OtakuRwneAfterText
	waitbutton
	closetext
	end

OtakuRwneSeenText:
	text "How much do you"
	line "like #MON?"
	done

OtakuRwneBeatenText:
	text "Ah, I see you are"
	line "a kid of culture<...>"
	done

OtakuRwneAfterText:
	text "Ah, I see you are"
	line "a kid of culture<...>"
	done

;=================================
;=================================
		
TrainerCooltrainerFNuuk:
	trainer EVENT_BEAT_COOLTRAINERF_NUUK, COOLTRAINERF, 10, CooltrainerFNuukSeenText, CooltrainerFNuukBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerFNuukAfterText
	waitbutton
	closetext
	end

CooltrainerFNuukSeenText:
	text "The way #MON"
	line "are so animated"
	cont "make them great!"
	done

CooltrainerFNuukBeatenText:
	text "That put a pep in"
	line "my step!"
	done

CooltrainerFNuukAfterText:
	text "I'm fired up now!"
	done

;=================================
;=================================
		
TrainerBlackbeltSteppo:
	trainer EVENT_BEAT_BLACKBELT_STEPPO, BLACKBELT_T, STEPPO, BlackbeltSteppoSeenText, BlackbeltSteppoBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext BlackbeltSteppoAfterText
	waitbutton
	closetext
	end

BlackbeltSteppoSeenText:
	text "Your gains are"
	line "insufficient!"
	done

BlackbeltSteppoBeatenText:
	text "My gains are"
	line "insufficient<...>"
	done

BlackbeltSteppoAfterText:
	text "I require more"
	line "training!"
	done

VictoryRoadF1_MapEventHeader::

.Warps: db 5
	warp_def 37, 35, 1, ROUTE_69_SOUTH
	warp_def 29, 23, 2, ROUTE_69_SOUTH
	warp_def 25,  7, 3, ROUTE_69_SOUTH
	warp_def 13, 14, 4, VICTORY_ROAD_F2
	warp_def 15, 10, 5, VICTORY_ROAD_F2


.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 7
	person_event SPRITE_POKE_BALL, 16, 36, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, VictoryRoadF1TriAttack, EVENT_VICTORY_ROAD_F1_TRI_ATTACK
	person_event SPRITE_SUPER_NERD, 30, 16, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerEngineerKalarie, -1
	person_event SPRITE_COOLTRAINER_F, 34, 23, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TrainerCooltrainerFGranny, -1
	person_event SPRITE_FISHER,  9, 20, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 1, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_TRAINER, 3, TrainerOtakuRwne, -1
	person_event SPRITE_COOLTRAINER_F, 10, 27, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 2, TrainerCooltrainerFNuuk, -1
	person_event SPRITE_BLACK_BELT, 20, 31, SPRITEMOVEDATA_STANDING_RIGHT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 3, TrainerBlackbeltSteppo, -1
	person_event SPRITE_POKE_BALL, 20, 12, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, VictoryRoadF1Nugget, EVENT_VICTORY_ROAD_F1_NUGGET

