const_value = 1
	const ASCORBIA_ISLAND_TEACHER
	const ASCORBIA_ISLAND_LASS
	const ASCORBIA_ISLAND_ROCKER
	const ASCORBIA_ISLAND_BLACK_BELT
	const ASCORBIA_ISLAND_FRUIT_TREE
	const ASCORBIA_ISLAND_TM_DRAGON_PULSE
	const ASCORBIA_ISLAND_MAX_REPEL
	const ASCORBIA_ISLAND_POLKADOT_BOW
	const ASCORBIA_ISLAND_PIKACHU
	const ASCORBIA_ISLAND_GRANNY_NITE

AscorbiaIsland_MapScriptHeader:

.MapTriggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_ASCORBIA
	return

AscorbiaIslandFruitTreeScript:
	fruittree FRUITTREE_ASCORBIA_ISLAND
	
AscorbiaTMDragonPulse:
	itemball TM_DRAGON_PULSE
	
AscorbiaMaxRepel:
	;itemball MAX_REPEL
	itemball DRAGON_SCALE
	
AscorbiaPolkadotBow:
	itemball POLKADOT_BOW
	
AscorbiaTeacherScript:
	jumptextfaceplayer AscorbiaTeacherText
	
AscorbiaTeacherText:
	text "I think I got off"
	line "on the wrong port!"
	
	para "This isn't KUMQUAT"
	line "ISLAND!"
	done
	
AscorbiaLassScript:
	jumptextfaceplayer AscorbiaLassText
	
AscorbiaLassText:
	text "This is ASCORBIA"
	line "ISLAND! Isn't it"
	cont "super pretty?"
	
	para "The beach to the"
	line "west is beautiful!"
	done
	
AscorbiaRockerScript:
	jumptextfaceplayer AscorbiaRockerText
	
AscorbiaRockerText:
	text "There's a large"
	line "island west of"
	cont "here."
	
	para "I hear you need a"
	line "certain HM if you"
	cont "want to explore it"
	cont "fully."
	done

AscorbiaBlackBeltScript:
	jumptextfaceplayer AscorbiaBlackBeltText
	
AscorbiaBlackBeltText:
	text "I heard there's a"
	line "beautiful woman"
	cont "who paints at"
	cont "night time."
	
	para "I've never seen"
	line "her, though."
	done
	
AscorbiaTownSign:
	jumptext AscorbiaTownSignText
	
AscorbiaTownSignText:
	text "ASCORBIA ISLAND"
	
	para "Taking a turn of"
	line "fate"
	done	

AscorbiaFanclubSign:
	jumptext AscorbiaFanclubSignText
	
AscorbiaFanclubSignText:
	text "ASCORBIA ISLAND"
	line "FAN CLUB"
	done

AscorbiaMoveRelearnerSign:
	jumptext AscorbiaMoveRelearnerSignText
	
AscorbiaMoveRelearnerSignText:
	text "MOVE RELEARNER"
	done
	
AscorbiaIllustratorPikachu:
	faceplayer
	opentext
	writetext AscorbiaIllustratorPikachuText
	cry PIKACHU
	waitbutton
	closetext
	end

AscorbiaIllustratorPikachuText:
	text "Pii?"
	done
	
AscorbiaArtistLadyNightScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_ILLUSTRATOR_PIKACHU
	iftrue .AlreadyGotIllustrator
	writetext AscorbiaGrannyNiteText1
	yesorno
	iftrue .GetIllustratorPikachu
	writetext AscorbiaGrannyNiteText2
	waitbutton
	closetext
	end

.AlreadyGotIllustrator:
	writetext AscorbiaGrannyNiteText3
	waitbutton
	closetext
	end

.GetIllustratorPikachu:
	spriteface ASCORBIA_ISLAND_GRANNY_NITE, UP
	playsound SFX_JUMP_OVER_LEDGE
	applymovement ASCORBIA_ISLAND_PIKACHU, IllyPikaJumpMovement1
	cry PIKACHU
	playsound SFX_JUMP_OVER_LEDGE
	applymovement ASCORBIA_ISLAND_PIKACHU, IllyPikaJumpMovement2
	cry PIKACHU
	writetext AscorbiaGrannyNiteText4
	checkcode VAR_PARTYCOUNT
	if_equal 6, .NoRoomForIllyPikachu
	waitbutton
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke PIKACHU, 35
	special SpecialIllustratorPikachu
	setevent EVENT_GOT_ILLUSTRATOR_PIKACHU
	disappear ASCORBIA_ISLAND_PIKACHU
	writetext AscorbiaGrannyNiteText3
	waitbutton
	closetext
	end
	
.NoRoomForIllyPikachu:
	writetext NoRoomForIllyPikachuText
	waitbutton
	closetext
	end
	
NoRoomForIllyPikachuText:
	text "Your #MON"
	line "party is full."
	done

IllyPikaJumpMovement1:
	fix_facing
	jump_step UP
	remove_fixed_facing
	step_end
	
IllyPikaJumpMovement2:
	fix_facing
	jump_step DOWN
	remove_fixed_facing
	step_end
	
AscorbiaGrannyNiteText1:
	text "Oh, hello there."
	line "Have you heard of"
	cont "the famous painter"
	cont "on this island?"
	
	para "Well, this may"
	line "come as a shock,"
	cont "but that painter"
	cont "is this PIKACHU!"
	
	para "But, if word were"
	line "to get out, I'm"
	cont "worried about"
	cont "PIKACHU's safety."
	
	para "You seem like a"
	line "capable trainer!"
	cont "How about it, why"
	cont "don't you take"
	
	para "PIKACHU under your"
	line "wing, and take it"
	cont "all around the"
	cont "world so it can"
	
	para "keep doing what it"
	line "loves?"
	done

AscorbiaGrannyNiteText2:
	text "Oh, I see. I"
	line "understand. You"
	cont "must already have"
	cont "a lot of wonderful"
	
	para "#MON."
	done
	
AscorbiaGrannyNiteText3:
	text "Safe travels,"
	line "PIKACHU!"
	done	

AscorbiaGrannyNiteText4:
	text "Why, I dare say it"
	line "has already taken"
	cont "a liking to you!"
	done

AscorbiaIsland_MapEventHeader::

.Warps: db 10
	warp_def 31, 17, 1, ASCORBIA_ISLAND_ROUTE_63_GATE
	warp_def 31, 18, 2, ASCORBIA_ISLAND_ROUTE_63_GATE
	warp_def 5, 11, 1, ASCORBIA_ISLAND_FAN_CLUB
	warp_def 5, 35, 1, ASCORBIA_ISLAND_MOVE_RELEARNER
	warp_def 29, 5, 1, ASCORBIA_ISLAND_HOUSE_1
	warp_def 25, 27, 1, ASCORBIA_ISLAND_HOUSE_2
	warp_def 19, 11, 1, ASCORBIA_ISLAND_MART
	warp_def 25, 13, 1, ASCORBIA_ISLAND_CENTER
	warp_def 11, 8, 2, HEART_SCALE_COVE
	warp_def 31, 24, 3, HEART_SCALE_COVE

.CoordEvents: db 0

.BGEvents: db 3
	signpost 12, 16, SIGNPOST_READ, AscorbiaTownSign
	signpost 5, 9, SIGNPOST_READ, AscorbiaFanclubSign
	signpost 7, 33, SIGNPOST_READ, AscorbiaMoveRelearnerSign

.ObjectEvents: db 10
	person_event SPRITE_SIGHTSEER_F, 17, 16, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, AscorbiaTeacherScript, -1
	person_event SPRITE_LASS, 26, 17, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, AscorbiaLassScript, -1
	person_event SPRITE_ROCKER, 6, 6, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, AscorbiaRockerScript, -1
	person_event SPRITE_BLACK_BELT, 9, 26, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, AscorbiaBlackBeltScript, -1
	person_event SPRITE_FRUIT_TREE, 35, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AscorbiaIslandFruitTreeScript, -1
	person_event SPRITE_POKE_BALL, 2, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, AscorbiaTMDragonPulse, EVENT_ASCORBIA_TM_DRAGON_PULSE
	person_event SPRITE_POKE_BALL, 4, 22, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, AscorbiaMaxRepel, EVENT_ASCORBIA_MAX_REPEL
	person_event SPRITE_POKE_BALL, 21, 39, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, AscorbiaPolkadotBow, EVENT_ASCORBIA_POLKADOT_BOW
	person_event SPRITE_PIKACHU, 27, 34, SPRITEMOVEDATA_POKEMON, 0, 0, -1, (1 << NITE), PAL_OW_YELLOW2, PERSONTYPE_SCRIPT, 0, AscorbiaIllustratorPikachu, EVENT_GOT_ILLUSTRATOR_PIKACHU
	person_event SPRITE_GRANNY, 28, 34, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, (1 << NITE), 0, PERSONTYPE_SCRIPT, 0, AscorbiaArtistLadyNightScript, -1

