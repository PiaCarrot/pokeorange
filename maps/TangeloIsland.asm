const_value set 2
	const TANGELOISLAND_LAPRAS
	const TANGELOISLAND_TRACEY
	const TANGELOISLAND_TEACHER
	const TANGELOISLAND_YOUNGSTER
	const TANGELOISLAND_POKE_BALL

TangeloIsland_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_TANGELO
	return

TangeloIslandGuideGent:
	faceplayer
	opentext
	writetext GuideGentIntroText
	yesorno
	iftrue .Yes
	waitbutton
	closetext
	end
.Yes:
	writetext GotLaprasText
	playsound SFX_GET_BADGE
	waitsfx
	givepoke LAPRAS, 10, NO_ITEM, 0
	disappear TANGELOISLAND_LAPRAS
	special Special_FadeInQuickly
	writetext LaprasSurf
	waitbutton
	verbosegiveitem HM_SURF
	closetext
	clearevent EVENT_GUIDE_GENT_VISIBLE_IN_CHERRYGROVE
	waitsfx
	end

TangeloTraceyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_GS_BALL_FROM_TRACEY
	iftrue .GotGSBall
	writetext UnknownText_0x19c4e2
	pause 10
	verbosegiveitem GS_BALL
	waitbutton
	closetext
	setevent EVENT_GOT_GS_BALL_FROM_TRACEY
	end

.GotGSBall:
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .TraceyBattle
	writetext TraceyRelievedText
	waitbutton
	closetext
	end

.TraceyBattle:
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	writetext TraceyBattleText
	waitbutton
	closetext
	winlosstext TraceyWinLoss, 0
	loadtrainer TRACEY, 1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	opentext
	writetext TraceyLeavingTangelo
	waitbutton
	closetext
	applymovement PLAYER, PlayerMovement
	applymovement TANGELOISLAND_TRACEY, Tracey_Movement
	disappear TANGELOISLAND_TRACEY
	setevent EVENT_TANGELO_TRACEY_LEAVING
	pause 20
	special Special_FadeOutMusic
	playmapmusic
	pause 10
	end

TangeloTeacherScript:
	faceplayer
	opentext
	checkflag ENGINE_MAP_CARD
	iftrue .HaveMapCard
	writetext TangeloTeacherText_NoMapCard
	waitbutton
	closetext
	end

.HaveMapCard:
	writetext TangeloTeacherText_HaveMapCard
	waitbutton
	closetext
	end

TangeloYoungsterScript:
	faceplayer
	opentext
	checkflag ENGINE_POKEDEX
	iftrue .HavePokedex
	writetext TangeloYoungsterText_NoPokedex
	waitbutton
	closetext
	end

.HavePokedex:
	writetext TangeloYoungsterText_HavePokedex
	waitbutton
	closetext
	end

TangeloSurf:
	itemball RARE_CANDY

TangeloIslandSign:
	jumptext TangeloIslandSignText

GuideGentsHouseSign:
	jumptext GuideGentsHouseSignText

TangeloIslandPokeCenterSign:
	jumpstd pokecentersign

TangeloIslandMartSign:
	jumpstd martsign

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

GuideGentIntroText:
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

	para "<......>"

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

TangeloTeacherText_NoMapCard:
	text "There are lots of"
	line "TRAINERS on ROUTE"
	cont "50."

	para "They all plan on"
	line "taking on the"
	cont "ORANGE CREW."
	done

TangeloTeacherText_HaveMapCard:
	text "There are lots of"
	line "TRAINERS on ROUTE"
	cont "50."

	para "They all plan on"
	line "taking on the"
	cont "ORANGE CREW."
	done

TangeloYoungsterText_NoPokedex:
	text "The #MART is"
	line "all the way over"
	cont "here on the west"
	cont "end of town."

	para "What kind of man"
	line "thought that was"
	cont "a good place to"
	cont "put it!?"
	done

TangeloYoungsterText_HavePokedex:
	text "The #MART is"
	line "all the way over"
	cont "here on the west"
	cont "end of town."

	para "What kind of man"
	line "thought that was"
	cont "a good place to"
	cont "put it!?"
	done

TangeloIslandSignText:
	text "TANGELO ISLAND"
	done

GuideGentsHouseSignText:
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
	step DOWN
	step DOWN
	step_end

TangeloIsland_MapEventHeader::
	; filler
	db 0, 0

.Warps: db 5
	warp_def 23, 7, 2, TANGELO_MART
	warp_def 9, 19, 1, TANGELO_POKECENTER_1F
	warp_def 19, 19, 1, TANGELO_GYM_SPEECH_HOUSE
	warp_def 19, 29, 1, TANGELO_EVOLUTION_SPEECH_HOUSE
	warp_def 9, 11, 2, TANGELO_PORT

.CoordEvents: db 0

.BGEvents: db 4
	signpost 20, 24, SIGNPOST_READ, TangeloIslandSign
	signpost 7, 25, SIGNPOST_READ, GuideGentsHouseSign
	signpost 23, 8, SIGNPOST_READ, TangeloIslandMartSign
	signpost 9, 20, SIGNPOST_READ, TangeloIslandPokeCenterSign

.ObjectEvents: db 5
	person_event SPRITE_SURF, 5, 24, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TangeloIslandGuideGent, EVENT_GUIDE_GENT_IN_HIS_HOUSE
	person_event SPRITE_SILVER, 7, 24, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TangeloTraceyScript, EVENT_TANGELO_TRACEY_LEAVING
	person_event SPRITE_TEACHER, 11, 26, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TangeloTeacherScript, -1
	person_event SPRITE_YOUNGSTER, 22, 21, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TangeloYoungsterScript, -1
	person_event SPRITE_POKE_BALL, 23, 33, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TangeloSurf, EVENT_TANGELO_SURF
