const_value set 2
	const NEWBARKTOWN_TEACHER
	const NEWBARKTOWN_FISHER
	const NEWBARKTOWN_SILVER

NewBarkTown_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1

.MapCallbacks:
	db 1

	; callbacks
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.Trigger0:
	end

.Trigger1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_NEW_BARK
	clearevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	return

NewBarkTown_TeacherStopsYouTrigger1:
	playmusic MUSIC_MOM
	spriteface NEWBARKTOWN_TEACHER, LEFT
	opentext
	writetext Text_WaitPlayer
	waitbutton
	closetext
	spriteface PLAYER, RIGHT
	applymovement NEWBARKTOWN_TEACHER, Movement_TeacherRunsToYou1_NBT
	opentext
	writetext Text_WhatDoYouThinkYoureDoing
	waitbutton
	closetext
	follow NEWBARKTOWN_TEACHER, PLAYER
	applymovement NEWBARKTOWN_TEACHER, Movement_TeacherBringsYouBack1_NBT
	stopfollow
	opentext
	writetext Text_ItsDangerousToGoAlone
	waitbutton
	closetext
	special RestartMapMusic
	end

NewBarkTown_TeacherStopsYouTrigger2:
	playmusic MUSIC_MOM
	spriteface NEWBARKTOWN_TEACHER, LEFT
	opentext
	writetext Text_WaitPlayer
	waitbutton
	closetext
	spriteface PLAYER, RIGHT
	applymovement NEWBARKTOWN_TEACHER, Movement_TeacherRunsToYou2_NBT
	spriteface PLAYER, UP
	opentext
	writetext Text_WhatDoYouThinkYoureDoing
	waitbutton
	closetext
	follow NEWBARKTOWN_TEACHER, PLAYER
	applymovement NEWBARKTOWN_TEACHER, Movement_TeacherBringsYouBack2_NBT
	stopfollow
	opentext
	writetext Text_ItsDangerousToGoAlone
	waitbutton
	closetext
	special RestartMapMusic
	end

NewBarkTownTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .MonIsAdorable
	writetext Text_GearIsImpressive
	waitbutton
	closetext
	end

.MonIsAdorable:
	writetext Text_YourMonIsAdorable
	waitbutton
	closetext
	end

NewBarkTownFisherScript:
	jumptextfaceplayer Text_ElmDiscoveredNewMon
;	setflag ENGINE_ZEPHYRBADGE
;	pause 5
;	setflag ENGINE_HIVEBADGE
;	pause 5
;	setflag ENGINE_PLAINBADGE
;	pause 5
;	setflag ENGINE_FOGBADGE
;	checkcode VAR_BADGES
;	warp SUNBURST_ISLAND, 21, 21
;	giveitem RARE_CANDY, 99
;	opentext
;	givepoke MUK, 50, BERRY
;	givepoke BLASTOISE, 50, BERRY
;	givepoke CHARIZARD, 50, BERRY
;	closetext
;	warp SUNBURST_ISLAND, 8, 4
;	end

NewBarkTownSilverScript:
	opentext
	writetext NewBarkTownRivalText1
	waitbutton
	closetext
	spriteface NEWBARKTOWN_SILVER, LEFT
	opentext
	writetext NewBarkTownRivalText2
	waitbutton
	closetext
	follow PLAYER, NEWBARKTOWN_SILVER
	applymovement PLAYER, Movement_SilverPushesYouAway_NBT
	stopfollow
	pause 5
	spriteface NEWBARKTOWN_SILVER, DOWN
	pause 5
	playsound SFX_TACKLE
	applymovement PLAYER, Movement_SilverShovesYouOut_NBT
	applymovement NEWBARKTOWN_SILVER, Movement_SilverReturnsToTheShadows_NBT
	end

NewBarkTownSign:
	jumptext NewBarkTownSignText

MapNewBarkTownSignpost1Script:
	jumptext PlayersHouseSignText

MapNewBarkTownSignpost2Script:
	jumptext ElmsLabSignText

MapNewBarkTownSignpost3Script:
	jumptext ElmsHouseSignText

Movement_TeacherRunsToYou1_NBT:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

Movement_TeacherRunsToYou2_NBT:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

Movement_TeacherBringsYouBack1_NBT:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head LEFT
	step_end

Movement_TeacherBringsYouBack2_NBT:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head LEFT
	step_end

Movement_SilverPushesYouAway_NBT:
	turn_head UP
	step DOWN
	step_end

Movement_SilverShovesYouOut_NBT:
	turn_head UP
	fix_facing
	jump_step DOWN
	remove_fixed_facing
	step_end

Movement_SilverReturnsToTheShadows_NBT:
	step RIGHT
	step_end

Text_GearIsImpressive:
	text "<PLAY_G>!"

	para "PROF. IVY is"
	line "waiting for you!"
	done

Text_WaitPlayer:
	text "Yo, <PLAY_G>!"
	done

Text_WhatDoYouThinkYoureDoing:
	text "What do you think"
	line "you're doing?"
	done

Text_ItsDangerousToGoAlone:
	text "It's dangerous to"
	line "go out without a"
	cont "#MON!"

	para "Isn't PROF. IVY"
	line "giving you a "

	para "#MON? She's"
	line "on BAYVIEW ROAD."
	done

Text_YourMonIsAdorable:
	text "Oh! Nice #MON!"
	line "It looks cool,"
	cont "I wish I had one!"
	done

Text_TellMomIfLeaving:
	text "Hi, <PLAY_G>!"
	line "Leaving again?"

	para "You should tell"
	line "your mom if you"
	cont "are leaving."
	done

Text_CallMomOnGear:
	text "Call your mom on"
	line "your #GEAR to"

	para "let her know how"
	line "you're doing."
	done

Text_ElmDiscoveredNewMon:
	text "<PLAYER>!"

	para "PROFESSOR IVY is"
	line "smokin', don't"
	cont "you think?"
	done

NewBarkTownRivalText1:
	text "<......>"

	para "So this is the"
	line "famous ELM #MON"
	cont "LAB…"
	done

NewBarkTownRivalText2:
	text "…What are you"
	line "staring at?"
	done

NewBarkTownSignText:
	text "VALENCIA ISLAND"

	para "IVY RESEARCH"
	line "South side of"
	cont "village."
	done

PlayersHouseSignText:
	text "<PLAYER>'s House"
	done

ElmsLabSignText:
	text "IVY RESEARCH"
	line "No.2 BAYVIEW"
	done

ElmsHouseSignText:
	text "ELM'S HOUSE"
	done

NewBarkTown_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 19, 18, 1, ELMS_LAB
	warp_def 5, 13, 1, KRISS_HOUSE_1F
	warp_def 11, 3, 1, KRISS_NEIGHBORS_HOUSE
	warp_def 19, 5, 1, ELMS_HOUSE

.CoordEvents: db 2
	xy_trigger 0, 8, 1, 0, NewBarkTown_TeacherStopsYouTrigger1, 0, 0
	xy_trigger 0, 9, 1, 0, NewBarkTown_TeacherStopsYouTrigger2, 0, 0

.BGEvents: db 4
	signpost 12, 8, SIGNPOST_READ, NewBarkTownSign
	signpost 5, 11, SIGNPOST_READ, MapNewBarkTownSignpost1Script
	signpost 19, 15, SIGNPOST_READ, MapNewBarkTownSignpost2Script
	signpost 3, 13, SIGNPOST_READ, MapNewBarkTownSignpost3Script

.ObjectEvents: db 3
	person_event SPRITE_COOLTRAINER_M, 8, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, NewBarkTownTeacherScript, -1
	person_event SPRITE_YOUNGSTER, 18, 10, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, NewBarkTownFisherScript, -1
	person_event SPRITE_SILVER, 0, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, NewBarkTownSilverScript, -1

