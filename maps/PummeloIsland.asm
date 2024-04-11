const_value = 1
	const PUMMELO_ISLAND_YOUNGSTER
	const PUMMELO_ISLAND_CROSS
	const PUMMELO_ISLAND_FRUITTREE_1
	const PUMMELO_ISLAND_FRUITTREE_2

PummeloIsland_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_PUMMELO
	return
	
PummeloIslandCrossScript:
	appear PUMMELO_ISLAND_CROSS
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 10
	applymovement PUMMELO_ISLAND_CROSS, PummeloCrossMovement1
	playmusic MUSIC_LOOK_GLADION
	opentext
	writetext CrossPummeloIslandText
	waitbutton
	closetext
	checkevent EVENT_GOT_CHARMANDER_FROM_IVY
	iftrue .GotCharmander
	checkevent EVENT_GOT_SQUIRTLE_FROM_IVY
	iftrue .GotSquirtle
	winlosstext CrossPummeloIslandWinLoss, 0
	setlasttalked PUMMELO_ISLAND_CROSS
	loadtrainer CROSS, 15
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle
	end
	
.GotCharmander:
	winlosstext CrossPummeloIslandWinLoss, 0
	setlasttalked PUMMELO_ISLAND_CROSS
	loadtrainer CROSS, 13
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle
	
.GotSquirtle:
	winlosstext CrossPummeloIslandWinLoss, 0
	setlasttalked PUMMELO_ISLAND_CROSS
	loadtrainer CROSS, 14
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.returnfrombattle:
	playmusic MUSIC_LOOK_GLADION
	opentext
	writetext CrossPummeloIslandLeavingNowText
	waitbutton
	closetext
	disappear PUMMELO_ISLAND_CROSS
	special Special_FadeInQuickly
	pause 20
	playmapmusic
	pause 10
	domaptrigger PUMMELO_ISLAND, $1
	setevent EVENT_CROSS_ON_PUMMELO
	opentext
	writetext CrossPummeloIslandDroppedWingText
	waitbutton
	verbosegiveitem RAINBOW_WING
	closetext
	end	
	
CrossPummeloIslandText:
	text "CROSS: Well."
	line "Look who finally"
	cont "showed up."
	
	para "I met the CHAMPION"
	line "of the ORANGE"
	cont "CREW, DRAKE."
	
	para "He beat me good."
	line "I couldn't believe"
	cont "it. My #MON"
	cont "are stronger than"
	
	para "ever. Is what they"
	line "keep telling me"
	cont "true? Because I"
	cont "treat #MON"
	
	para "poorly, I'm weak?"
	line "No. They're wrong!"
	cont "I was chosen!"
	cont "I'll prove it to"
	
	para "you, <PLAYER>!"
	done
	
CrossPummeloIslandWinLoss:
	text "I was chosen!"
	
	para "You're all wrong!"
	line "I am a #MON"
	cont "MASTER!"
	done
	
CrossPummeloIslandLeavingNowText:
	text "CROSS: <...>"

	para "I'll say it again."
	line "I am chosen<...>by"
	cont "the legendary"
	cont "#MON!"
	
	para "When I was young,"
	line "I saw it fly over"
	cont "my hometown."
	
	para "A giant, rainbow"
	line "#MON that isn't"
	cont "in any book or"
	cont "ENCYCLOPEDIA."
	
	para "My search across"
	line "lands lead me an"
	cont "old JOHTO folk-"
	cont "tale. HO-OH."
	
	para "It calls to me,"
	line "somewhere in the"
	cont "ORANGE ISLANDS,"
	cont "and no one can or"
	cont "will stop me!"
	
	para "Farewell, <PLAYER>."
	line "Next time we meet,"
	cont "I will have the"
	cont "legendary #MON"
	
	para "and prove you all"
	line "wrong!"
	done

CrossPummeloIslandDroppedWingText:
	text "Uh? What's this?"
	
	para "He seems to have"
	line "dropped something."
	done
	
PummeloCrossMovement1:
	step DOWN
	step DOWN
	step DOWN
	step_end
	
PummeloBadgeYoungsterScript:
	faceplayer
	opentext
	writetext MissingBadgeText
	waitbutton
	checkflag ENGINE_SPIKE_SHELL_BADGE
	iffalse .CheckLuana
	checkflag ENGINE_JADE_STAR_BADGE
	iffalse .Missing1Badge
	writetext MissingNoBadgeText
	waitbutton
	closetext
	end
	
.CheckLuana:
	checkflag ENGINE_JADE_STAR_BADGE
	iffalse .Missing2Badge
	writetext Missing1BadgeText
	waitbutton
	closetext
	end
	
.Missing1Badge:
	writetext Missing1BadgeText
	waitbutton
	closetext
	end
	
.Missing2Badge:
	writetext Missing2BadgeText
	waitbutton
	closetext
	end
	
MissingBadgeText:
	text "You're a trainer!"
	line "How many badges do"
	cont "you have?"
	done
	
Missing1BadgeText:
	text "Aha! You are miss-"
	line "ing a badge!"
	
	para "They won't let you"
	line "into the PUMMELO"
	cont "STADIUM like that!"
	done
	
Missing2BadgeText:
	text "Aha! You are miss-"
	line "ing two badges!"
	
	para "You're really a"
	line "slacker, aren't"
	cont "you?"
	done

MissingNoBadgeText:
	text "All four badges!"
	
	para "Wow, you're super"
	line "awesome!"
	done
	
PummeloSailorScript:
	jumptextfaceplayer PummeloSailorScriptText
	
PummeloOfficerScript:
	faceplayer 
	opentext
	writetext PummeloOfficerScriptText
	yesorno
	iftrue .YesImAPirate
	writetext PummeloOfficerScriptText3
	waitbutton
	closetext
	end
	
.YesImAPirate:
	writetext PummeloOfficerScriptText2
	waitbutton
	closetext
	end
	
PummeloOfficerGuardScript:
	jumptextfaceplayer PummeloOfficerGuardScriptText

PummeloIslandFruitTree1:
	fruittree FRUITTREE_PUMMELO_ISLAND_1
	
PummeloIslandFruitTree2:
	fruittree FRUITTREE_PUMMELO_ISLAND_2
	
PummeloIslandProtein:
	itemball PROTEIN
	
PummeloIslandRareCandy:
	itemball RARE_CANDY
	
PummeloIslandSign:
	jumptext PummeloIslandSignText
	
PummeloIslandSign2:
	jumptext PummeloIslandSign2Text
	
PummeloIslandSign3:
	jumptext PummeloIslandSign3Text
	
PummeloStatue:
	jumptext PummeloStatueText
	
PummeloIslandSign4:
	jumptext PummeloIslandSign4Text

PummeloIslandSignText:
	text "PUMMELO ISLAND"
	
	para "Where CHAMPIONS"
	line "rise like a"
	cont "tsunami!"
	done
	
PummeloIslandSign2Text:
	text "HALL OF FAME"
	done
	
PummeloIslandSign3Text:
	text "PUMMELO STADIUM"
	done
	
PummeloStatueText:
	text "An impressive"
	line "statue of a"
	cont "DRAGON #MON."
	done
	
PummeloIslandSign4Text:
	text "EAST TO ROUTE 70"
	done
	
PummeloSailorScriptText:
	text "I just came in"
	line "from HAMLIN."
	
	para "If you go out"
	line "that way, watch"
	cont "out for pirates!"
	done
	
PummeloOfficerScriptText:
	text "Hey there!"
	line "That bandana!"
	
	para "Are you a pirate?"
	done
	
PummeloOfficerScriptText2:
	text "You couldn't be!"
	line "You're way too"
	cont "young!"
	done
	
PummeloOfficerScriptText3:
	text "Of course, I'm"
	line "so sorry!"
	
	para "You couldn't be!"
	line "You're way too"
	cont "young!"
	done
	
PummeloOfficerGuardScriptText:
	text "Sorry, the road is"
	line "closed due to bri-"
	cont "gands posing as"
	cont "highwaymen."
	
	para "As soon as the"
	line "situation is under"
	cont "control the road"
	cont "will open again."
	done

PummeloIsland_MapEventHeader::

.Warps: db 14
	warp_def 21, 26, 1, HALL_OF_FAME
	warp_def 21, 27, 2, HALL_OF_FAME
	warp_def 11, 18, 1, PUMMELO_STADIUM
	warp_def 11, 19, 2, PUMMELO_STADIUM
	warp_def 27, 11, 1, PUMMELO_ISLAND_HOUSE_1
	warp_def 35, 13, 1, PUMMELO_ISLAND_HOUSE_2
	warp_def 35, 23, 1, PUMMELO_ISLAND_HOUSE_3
	warp_def 31, 31, 1, PUMMELO_ISLAND_HOUSE_4
	warp_def 21, 41, 1, PUMMELO_ISLAND_HOUSE_5
	warp_def  9, 45, 1, PUMMELO_ISLAND_HOUSE_6
	warp_def 29, 21, 1, PUMMELO_CENTER
	warp_def 29, 17, 1, PUMMELO_MART
	warp_def 32, 51, 1, PUMMELO_ROUTE_70_GATE
	warp_def 33, 51, 2, PUMMELO_ROUTE_70_GATE

.CoordEvents: db 1
	xy_trigger 0, 27, 26, PummeloIslandCrossScript

.BGEvents: db 10
	signpost 31, 27, SIGNPOST_READ, PummeloIslandSign
	signpost 22, 28, SIGNPOST_READ, PummeloIslandSign2
	signpost 12, 20, SIGNPOST_READ, PummeloIslandSign3
	signpost 18, 21, SIGNPOST_READ, PummeloStatue
	signpost 18, 16, SIGNPOST_READ, PummeloStatue
	signpost 16, 16, SIGNPOST_READ, PummeloStatue
	signpost 16, 21, SIGNPOST_READ, PummeloStatue
	signpost 14, 16, SIGNPOST_READ, PummeloStatue
	signpost 14, 21, SIGNPOST_READ, PummeloStatue
	signpost 31, 45, SIGNPOST_READ, PummeloIslandSign4

.ObjectEvents: db 10
	person_event SPRITE_YOUNGSTER, 31, 10, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, PummeloBadgeYoungsterScript, -1
	person_event SPRITE_ROCKER, 23, 26, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_CROSS_ON_PUMMELO
	person_event SPRITE_FRUIT_TREE, 35, 46, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PummeloIslandFruitTree1, -1
	person_event SPRITE_FRUIT_TREE, 19, 38, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PummeloIslandFruitTree2, -1
	person_event SPRITE_POKE_BALL,  4, 26, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, PummeloIslandProtein, EVENT_PUMMELO_ISLAND_PROTEIN
	person_event SPRITE_POKE_BALL, 16,  4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, PummeloIslandRareCandy, EVENT_PUMMELO_ISLAND_RARE_CANDY
	person_event SPRITE_OFFICER, 31, 24, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, PummeloOfficerScript, -1
	person_event SPRITE_SAILOR, 36, 28, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, PummeloSailorScript, -1
	person_event SPRITE_OFFICER, 32, 51, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, PummeloOfficerGuardScript, EVENT_BEAT_ORANGE_LEAGUE
	person_event SPRITE_OFFICER, 33, 51, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, PummeloOfficerGuardScript, EVENT_BEAT_ORANGE_LEAGUE



