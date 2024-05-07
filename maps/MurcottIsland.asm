const_value = 1
	const MURCOTT_ISLAND_CROSS
	const MURCOTT_LASS
	const MURCOTT_FRUIT_TREE
	const MURCOTT_GRAMPS_2
	const MURCOTT_POKEBALL
	const MURCOTT_DAYCARE_GRAMPS
	const MURCOTT_DAYCARE_MON_1
	const MURCOTT_DAYCARE_MON_2

MurcottIsland_MapScriptHeader::

.Triggers: db 1
	maptrigger .AppearDayCareManScript

.Callbacks: db 2
	dbw MAPCALLBACK_NEWMAP, .FlyPoint
	dbw MAPCALLBACK_OBJECTS, .MurcottEggCheckCallback

.AppearDayCareManScript
	checkflag ENGINE_DAYCARE_MAN_HAS_EGG
	iftrue .PutDayCareManOutside2
	end
.PutDayCareManOutside2
	checkflag EVENT_DAYCARE_MAN_OUTSIDE
	iftrue .end
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	checkcode VAR_YCOORD
	if_greater_than  10, .DoNotMoveGramps
	checkcode VAR_XCOORD
	if_greater_than  18, .DoNotMoveGramps
.MoveGramps
	moveperson MURCOTT_DAYCARE_GRAMPS, 13, 5
	appear MURCOTT_DAYCARE_GRAMPS
	special Special_FadeInQuickly
	applymovement MURCOTT_DAYCARE_GRAMPS, DayCareGrampsAppearMovement ;daycare man can technically go trough the player/end up in the same position
	jump .end
.DoNotMoveGramps
	appear MURCOTT_DAYCARE_GRAMPS
	special Special_FadeInQuickly
.end
	moveperson MURCOTT_DAYCARE_GRAMPS, 15, 6 ;needed to make the old man stay in the final position
	clearevent EVENT_DAYCARE_MAN_IN_DAYCARE
	setevent EVENT_DAYCARE_MAN_OUTSIDE
	dotrigger 1
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_MURCOTT
	return

.MurcottEggCheckCallback:
	checkflag ENGINE_DAYCARE_MAN_HAS_EGG
	iftrue .PutDayCareManOutside
	clearevent EVENT_DAYCARE_MAN_IN_DAYCARE
	setevent EVENT_DAYCARE_MAN_OUTSIDE
	dotrigger 0
	jump .CheckMon1

.PutDayCareManOutside:
	setevent EVENT_DAYCARE_MAN_IN_DAYCARE
	clearevent EVENT_DAYCARE_MAN_OUTSIDE
	jump .CheckMon1

.CheckMon1:
	checkflag ENGINE_DAYCARE_MAN_HAS_MON
	iffalse .HideMon1
	clearevent EVENT_DAYCARE_MON_1
	jump .CheckMon2

.HideMon1:
	setevent EVENT_DAYCARE_MON_1
	jump .CheckMon2

.CheckMon2:
	checkflag ENGINE_DAYCARE_LADY_HAS_MON
	iffalse .HideMon2
	clearevent EVENT_DAYCARE_MON_2
	return

.HideMon2:
	setevent EVENT_DAYCARE_MON_2
	return

DayCareManScript_Outside:
	faceplayer
	opentext
	special Special_DayCareManOutside
	waitbutton
	closetext
	if_equal TRUE, .end_fail
	clearflag ENGINE_DAYCARE_MAN_HAS_EGG
	checkcode VAR_FACING
	if_equal RIGHT, .walk_around_player
	applymovement MURCOTT_DAYCARE_GRAMPS, MurcottMovementData_DayCareManWalksBackInside
	playsound SFX_ENTER_DOOR
	disappear MURCOTT_DAYCARE_GRAMPS
	dotrigger 0
.end_fail
	end

.walk_around_player
	applymovement MURCOTT_DAYCARE_GRAMPS, MurcottMovementData_DayCareManWalksBackInside_WalkAroundPlayer
	playsound SFX_ENTER_DOOR
	disappear MURCOTT_DAYCARE_GRAMPS
	dotrigger 0
	end

MurcottMovementData_DayCareManWalksBackInside:
	slow_step LEFT
	slow_step LEFT
	slow_step UP
	step_end

MurcottMovementData_DayCareManWalksBackInside_WalkAroundPlayer:
	slow_step DOWN
	slow_step LEFT
	slow_step LEFT
	slow_step UP
	slow_step UP
	step_end

DayCareGrampsAppearMovement:
	slow_step DOWN
	slow_step RIGHT
	slow_step RIGHT
	step_end

DayCareMon1Script:
	opentext
	special Special_DayCareMon1
	closetext
	end

DayCareMon2Script:
	opentext
	special Special_DayCareMon2
	closetext
	end

DayCareSign:
	jumptext DayCareSignText
	
DayCareSignText:
	text "DAY-CARE"

	para "LET US RAISE YOUR"
	line "#MON FOR YOU!"
	done
	
MurcottIslandSign:
	jumptext MurcottIslandSignText
	
MurcottIslandPharmacySign:
	jumptext MurcottIslandPharmacySignText
	
MurcottIslandSignText:
	text "MURCOTT ISLAND"
	
	para "New beginnings in"
	line "unexpected places"
	done
	
MurcottIslandPharmacySignText:
	text "PHARMACY"
	done

MurcottLassScript:
	jumptextfaceplayer MurcottLassText
	
MurcottLassText:
	text "There's a really"
	line "big DESERT on"
	cont "MANDARIN SOUTH!"
	done
	
MurcottIslandFruitTree:
	fruittree FRUITTREE_MURCOTT_ISLAND
	
MurcottOldManScript:
	jumptextfaceplayer MurcottOldManText
	
MurcottOldManText:
	text "My brother and his"
	line "wife run the DAY-"
	cont "CARE on the north"
	cont "end of town."
	
	para "They can raise a"
	line "#MON for you."
	done
	
MurcottIslandTMRainDance:
	itemball TM_RAIN_DANCE
	
CrossBattle3Script1:
	checkevent EVENT_MURCOTT_ISLAND_CROSS
	iftrue .End
	faceplayer
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, CrossMurcottIslandApproach1_Movement
	playmusic MUSIC_LOOK_GLADION
	opentext
	writetext CrossMurcottIslandText
	waitbutton
	closetext
	checkevent EVENT_GOT_CHARMANDER_FROM_IVY
	iftrue .GotCharmander
	checkevent EVENT_GOT_SQUIRTLE_FROM_IVY
	iftrue .GotSquirtle
	winlosstext CrossMurcottIslandWinLoss, 0
	setlasttalked MURCOTT_ISLAND_CROSS
	loadtrainer CROSS, 9
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle
	
.GotCharmander:
	winlosstext CrossMurcottIslandWinLoss, 0
	setlasttalked MURCOTT_ISLAND_CROSS
	loadtrainer CROSS, 7
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle
	
.GotSquirtle:
	winlosstext CrossMurcottIslandWinLoss, 0
	setlasttalked MURCOTT_ISLAND_CROSS
	loadtrainer CROSS, 8
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.returnfrombattle:
	playmusic MUSIC_LOOK_GLADION
	opentext
	writetext CrossMurcottIslandLeavingNowText
	waitbutton
	closetext
	applymovement MURCOTT_ISLAND_CROSS, CrossMurcottIsland_Movement
	disappear MURCOTT_ISLAND_CROSS
	pause 20
	special Special_FadeOutMusic
	playmapmusic
	pause 10
	domaptrigger MURCOTT_ISLAND, $1
	setevent EVENT_MURCOTT_ISLAND_CROSS
.End
	end	
	
CrossBattle3Script2:
	checkevent EVENT_MURCOTT_ISLAND_CROSS
	iftrue .End
	faceplayer
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, CrossMurcottIslandApproach2_Movement
	playmusic MUSIC_LOOK_GLADION
	opentext
	writetext CrossMurcottIslandText
	waitbutton
	closetext
	checkevent EVENT_GOT_CHARMANDER_FROM_IVY
	iftrue .GotCharmander
	checkevent EVENT_GOT_SQUIRTLE_FROM_IVY
	iftrue .GotSquirtle
	winlosstext CrossMurcottIslandWinLoss, 0
	setlasttalked MURCOTT_ISLAND_CROSS
	loadtrainer CROSS, 9
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle
	
.GotCharmander:
	winlosstext CrossMurcottIslandWinLoss, 0
	setlasttalked MURCOTT_ISLAND_CROSS
	loadtrainer CROSS, 7
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle
	
.GotSquirtle:
	winlosstext CrossMurcottIslandWinLoss, 0
	setlasttalked MURCOTT_ISLAND_CROSS
	loadtrainer CROSS, 8
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.returnfrombattle:
	playmusic MUSIC_LOOK_GLADION
	opentext
	writetext CrossMurcottIslandLeavingNowText
	waitbutton
	closetext
	applymovement MURCOTT_ISLAND_CROSS, CrossMurcottIsland_Movement
	disappear MURCOTT_ISLAND_CROSS
	pause 20
	special Special_FadeOutMusic
	playmapmusic
	pause 10
	domaptrigger MURCOTT_ISLAND, $1
	setevent EVENT_MURCOTT_ISLAND_CROSS
.End
	end
	
CrossMurcottIslandText:
	text "CROSS: Stopping by"
	line "this loser town,"
	cont "<PLAYER>? Fitting."

	para "There's nothing"
	line "but old geezers."

	para "I came to find a"
	line "strong #MON,"
	cont "but I can't find"
	cont "a SCYTHER."

	para "No matter! I got"
	line "something even"
	cont "better off the"
	cont "next island!"

	para "Prepare yourself!"
	done
	
CrossMurcottIslandWinLoss:
	text "How frustrating!"
	done
	
CrossMurcottIslandLeavingNowText:
	text "CROSS: <...>"

	para "I won't let this"
	line "bring me down! I"
	cont "don't understand,"
	cont "though."

	para "I know I've made"
	line "my #MON the"
	cont "strongest they"
	cont "can be!"

	para "So why is it that"
	line "you win every"
	cont "time?"

	para "No matter, I'll"
	line "see you again!"
	done
	
CrossMurcottIsland_Movement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end
	
CrossMurcottIslandApproach1_Movement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end
	
CrossMurcottIslandApproach2_Movement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	turn_head RIGHT
	step_end
	
MurcottIsland_MapEventHeader::

.Warps: db 8
	warp_def 5, 13, 1, DAYCARE
	warp_def 11, 17, 1, MURCOTT_HOUSE_1
	warp_def 19, 13, 1, MURCOTT_HOUSE_2
	warp_def 23, 35, 1, MURCOTT_HOUSE_3
	warp_def 13, 3, 1, MURCOTT_POKE_CENTER
	warp_def 17, 37, 2, MURCOTT_POKE_MART
	warp_def  1, 14, 3, DAYCARE
	warp_def  1, 13, 3, DAYCARE

.CoordEvents: db 2
	xy_trigger 0, 14, 4, CrossBattle3Script1
	xy_trigger 0, 15, 4, CrossBattle3Script2

.BGEvents: db 3
	signpost 6, 16, SIGNPOST_READ, DayCareSign
	signpost 13, 9, SIGNPOST_READ, MurcottIslandSign
	signpost 23, 33, SIGNPOST_READ, MurcottIslandPharmacySign

.ObjectEvents: db 8
	person_event SPRITE_ROCKER, 14, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_MURCOTT_ISLAND_CROSS
	person_event SPRITE_LASS, 13, 15, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MurcottLassScript, -1
	person_event SPRITE_FRUIT_TREE, 29, 18, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MurcottIslandFruitTree, -1
	person_event SPRITE_GRAMPS, 18, 32, SPRITEMOVEDATA_STANDING_UP, 0, 0, -2, -2, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, MurcottOldManScript, -1
	person_event SPRITE_POKE_BALL, 31, 45, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MurcottIslandTMRainDance, EVENT_MURCOTT_ISLAND_RAIN_DANCE
	person_event SPRITE_GRAMPS,  6, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, DayCareManScript_Outside, EVENT_DAYCARE_MAN_OUTSIDE
	person_event SPRITE_DAYCARE_MON_1,  4, 17, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, 0, PERSONTYPE_SCRIPT, 0, DayCareMon1Script, EVENT_DAYCARE_MON_1
	person_event SPRITE_DAYCARE_MON_2,  4, 19, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, 0, PERSONTYPE_SCRIPT, 0, DayCareMon2Script, EVENT_DAYCARE_MON_2

