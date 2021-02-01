const_value set 1
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
	end	
	
CrossPummeloIslandText:
	text "CROSS: Well."
	line "Look who finally"
	cont "showed up."
	
	para "I met the CHAMPION"
	line "of the ORANGE"
	cont "CREW, DANNY."
	
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
	
	para "I am chosen<...>by"
	line "the legendary"
	cont "#MON!"
	
	para "When I was young,"
	cont "I saw it fly over"
	cont "my hometown."
	
	para "A giant, rainbow"
	line "#MON that isn't"
	cont "in any book or"
	cont "ENCYCLOPEDIA."
	
	para "My research led me"
	line "to HO-OH. It calls"
	cont "to me, and no one"
	cont "can stop me!"
	
	para "Farewell, <PLAYER>."
	line "Next time we meet,"
	cont "I will have the"
	cont "legendary #MON"
	
	para "and prove you all"
	line "wrong!"
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

PummeloIsland_MapEventHeader::

.Warps: db 2
	warp_def 21, 26, 1, HALL_OF_FAME
	warp_def 21, 27, 2, HALL_OF_FAME

.CoordEvents: db 1
	xy_trigger 0, 27, 26, PummeloIslandCrossScript

.BGEvents: db 9
	signpost 31, 27, SIGNPOST_READ, PummeloIslandSign
	signpost 22, 28, SIGNPOST_READ, PummeloIslandSign2
	signpost 12, 20, SIGNPOST_READ, PummeloIslandSign3
	signpost 18, 21, SIGNPOST_READ, PummeloStatue
	signpost 18, 16, SIGNPOST_READ, PummeloStatue
	signpost 16, 16, SIGNPOST_READ, PummeloStatue
	signpost 16, 21, SIGNPOST_READ, PummeloStatue
	signpost 14, 16, SIGNPOST_READ, PummeloStatue
	signpost 14, 21, SIGNPOST_READ, PummeloStatue

.ObjectEvents: db 6
	person_event SPRITE_YOUNGSTER, 31, 24, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, PummeloBadgeYoungsterScript, -1
	person_event SPRITE_ROCKER, 23, 26, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_CROSS_ON_PUMMELO
	person_event SPRITE_FRUIT_TREE, 35, 46, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PummeloIslandFruitTree1, -1
	person_event SPRITE_FRUIT_TREE, 19, 38, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PummeloIslandFruitTree2, -1
	person_event SPRITE_POKE_BALL,  4, 26, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, PummeloIslandProtein, EVENT_PUMMELO_ISLAND_PROTEIN
	person_event SPRITE_POKE_BALL, 16,  4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, PummeloIslandRareCandy, EVENT_PUMMELO_ISLAND_RARE_CANDY

