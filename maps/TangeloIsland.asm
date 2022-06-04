const_value = 1
	const TANGELOISLAND_LAPRAS
	const TANGELOISLAND_TRACEY
	const TANGELOISLAND_TEACHER
	const TANGELOISLAND_YOUNGSTER
	const TANGELOISLAND_POKE_BALL

TangeloIsland_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_TANGELO
	return

TangeloIslandLaprasScript:
	faceplayer
	opentext
	writetext LaprasIntroText
	yesorno
	iftrue .Yes
	waitbutton
	closetext
	end
.Yes:
	writetext GotLaprasText
	playsound SFX_GET_BADGE
	waitsfx
	givepoke LAPRAS, 10, BERRY, 0
	disappear TANGELOISLAND_LAPRAS
	special Special_FadeInQuickly
	writetext LaprasSurf
	waitbutton
	verbosegiveitem HM_SURF
	waitsfx
	closetext
	end

TangeloTraceyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_GS_BALL_FROM_TRACEY
	iftrue .GotGSBall
	writetext UnknownText_0x19c4e2
	pause 10
	verbosegiveitem GS_BALL
	waitsfx
	closetext
	setevent EVENT_GOT_GS_BALL_FROM_TRACEY
	end

.GotGSBall:
	checkevent EVENT_SHOWED_GS_BALL_TO_IVY
	iftrue .TraceyBattle
	writetext TraceyRelievedText
	waitbutton
	closetext
	end

.TraceyBattle:
	playmusic MUSIC_TRACEY_ENCOUNTER
	writetext TraceyBattleText
	waitbutton
	closetext
	winlosstext TraceyWinLoss, 0
	loadtrainer TRACEY, 1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_TRACEY_ENCOUNTER
	opentext
	writetext TraceyLeavingTangelo
	waitbutton
	closetext
	applymovement PLAYER, PlayerMovement
	applymovement TANGELOISLAND_TRACEY, Tracey_Movement
	disappear TANGELOISLAND_TRACEY
	pause 20
	special Special_FadeOutMusic
	playmapmusic
	pause 10
	end

TangeloTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_TANGELO_HEAL_BALL
	iftrue .AlreadyGotHealBall
	writetext TangeloTeacherText
	waitbutton
	verbosegiveitem HEAL_BALL
	closetext
	setevent EVENT_TANGELO_HEAL_BALL
	end
	
.AlreadyGotHealBall
	writetext TangeloTeacherText2
	waitbutton
	closetext
	end

TangeloYoungsterScript:
	jumptextfaceplayer TangeloYoungsterText

TangeloIslandRareCandy:
	itemball RARE_CANDY

TangeloIslandSign:
	jumptext TangeloIslandSignText

TangeloCenterSign:
	jumptext TangeloCenterSignText

TraceyBattleText:
	text "So you delivered"
	line "it?"

	para "What? You're"
	line "taking on the"
	cont "ORANGE CREW?"

	para "That's really"
	line "interesting."

	para "Say, why don't"
	line "we have a battle?"
	cont "I'm kinda strong!"
	done

TraceyLeavingTangelo:
	text "Say, why don't"
	line "you take this"
	cont "LAPRAS?"

	para "It was separated"
	line "from its family,"
	cont "and it needs a"
	cont "good trainer."

	para "Oh, how rude!"
	line "The name is"
	cont "TRACEY SKETCHIT."
	cont "I'm a WATCHER."

	para "Anyway, I must"
	line "be off. Seeya"
	cont "around!"
	done

LaprasIntroText:
	text "The LAPRAS seems"
	line "eager to join you."

	para "Take LAPRAS?"
	done

GotLaprasText:
	text "LAPRAS has joined"
	line "the party!"
	done

UnknownText_0x19c4e2:
	text "This poor LAPRAS"
	line "washed up on ROUTE"
	cont "50. I saved it."

	para "<...><...>"

	para "What's that? You"
	line "are from VALENCIA?"

	para "I see. Say, I was"
	line "on my way there to"
	cont "deliver something"

	para "to PROF.IVY for a"
	line "friend."

	para "Could you deliver"
	line "it for me?"
	done

TraceyRelievedText:
	text "Could you deliver"
	line "that GS BALL to"
	cont "her?"
	done

TraceyWinLoss:
	text "Wow, you might"
	line "have a chance!"
	done

TangeloTeacherText:
	text "If you want a"
	line "#MON you caught"
	cont "to be healthy,"
	cont "try a HEAL BALL!"
	done
	
TangeloTeacherText2:
	text "HEAL BALL will"
	line "bring a wild"
	cont "#MON back"
	cont "to full health!"
	done

TangeloYoungsterText:
	text "Some people don't"
	line "like coming out"
	cont "during the day."
	
	para "Same goes for the"
	line "night. In that"
	cont "sense, people are"
	cont "like #MON!"
	done

TangeloIslandSignText:
	text "TANGELO ISLAND"
	done

TangeloCenterSignText:
	text "TANGELO CENTER"
	done

LaprasSurf:
	text "There's something"
	line "floating on the"
	cont "water!"
	done

PlayerMovement:
	step RIGHT
	turn_head LEFT
	step_end

Tracey_Movement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

TangeloIsland_MapEventHeader::

.Warps: db 5
	warp_def 9, 11, 2, TANGELO_MART
	warp_def 9, 15, 1, TANGELO_POKECENTER_1F
	warp_def 19, 19, 1, TANGELO_GYM_SPEECH_HOUSE
	warp_def 19, 29, 1, TANGELO_EVOLUTION_SPEECH_HOUSE
	warp_def 11, 31, 2, TANGELO_PORT

.CoordEvents: db 0

.BGEvents: db 2
	signpost 20, 24, SIGNPOST_READ, TangeloIslandSign
	signpost 7, 21, SIGNPOST_READ, TangeloCenterSign

.ObjectEvents: db 5
	person_event SPRITE_SURF, 5, 20, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TangeloIslandLaprasScript, EVENT_TANGELO_ISLAND_LAPRAS
	person_event SPRITE_TRACEY, 7, 20, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TangeloTraceyScript, EVENT_TANGELO_ISLAND_TRACEY
	person_event SPRITE_COOLTRAINER_M, 22, 25, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TangeloTeacherScript, -1
	person_event SPRITE_YOUNGSTER, 12, 27, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TangeloYoungsterScript, -1
	person_event SPRITE_POKE_BALL, 23, 6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TangeloIslandRareCandy, EVENT_TANGELO_ISLAND_RARE_CANDY

