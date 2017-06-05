const_value set 2
	const CHERRYGROVECITY_GRAMPS
	const CHERRYGROVECITY_SILVER
	const CHERRYGROVECITY_TEACHER
	const CHERRYGROVECITY_YOUNGSTER
	const CHERRYGROVECITY_POKE_BALL


CherrygroveCity_MapScriptHeader:
.MapTriggers:
	db 0

	; triggers
;	maptrigger .Trigger0
;	maptrigger .Trigger1

.MapCallbacks:
	db 1

	; callbacks
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

;.Trigger0:
;	end

;.Trigger1:
;	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_CHERRYGROVE
	return

CherrygroveCityGuideGent:
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
	disappear CHERRYGROVECITY_GRAMPS
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
	iftrue .GotGSBALL
	writetext UnknownText_0x19c4e2
	pause 10
	verbosegiveitem GS_BALL
	waitbutton
	closetext
	setevent EVENT_GOT_GS_BALL_FROM_TRACEY
	end

.GotGSBALL:
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
	loadtrainer MYSTICALMAN, 1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	opentext
	writetext TraceyLeavingTangelo
	waitbutton
	closetext
	applymovement PLAYER, PlayerMovement
	applymovement CHERRYGROVECITY_SILVER, Tracey_Movement
	disappear CHERRYGROVECITY_SILVER
	setevent EVENT_TANGELO_TRACEY_LEAVING
	pause 20
	special Special_FadeOutMusic
	playmapmusic
	pause 10
	end

CherrygroveTeacherScript:
	faceplayer
	opentext
	checkflag ENGINE_MAP_CARD
	iftrue .HaveMapCard
	writetext CherrygroveTeacherText_NoMapCard
	waitbutton
	closetext
	end

.HaveMapCard:
	writetext CherrygroveTeacherText_HaveMapCard
	waitbutton
	closetext
	end

CherrygroveYoungsterScript:
	faceplayer
	opentext
	checkflag ENGINE_POKEDEX
	iftrue .HavePokedex
	writetext CherrygroveYoungsterText_NoPokedex
	waitbutton
	closetext
	end

.HavePokedex:
	writetext CherrygroveYoungsterText_HavePokedex
	waitbutton
	closetext
	end
	
TangeloSurf:
	itemball RARE_CANDY

CherrygroveCitySign:
	jumptext CherrygroveCitySignText

GuideGentsHouseSign:
	jumptext GuideGentsHouseSignText

CherrygroveCityPokeCenterSign:
	jumpstd pokecentersign

CherrygroveCityMartSign:
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

CherrygroveTeacherText_NoMapCard:
	text "There are lots of"
	line "TRAINERS on ROUTE"
	cont "50."
	
	para "They all plan on"
	line "taking on the"
	cont "ORANGE CREW."
	done

CherrygroveTeacherText_HaveMapCard:
	text "There are lots of"
	line "TRAINERS on ROUTE"
	cont "50."
	
	para "They all plan on"
	line "taking on the"
	cont "ORANGE CREW."
	done

CherrygroveYoungsterText_NoPokedex:
	text "The #MART is"
	line "all the way over"
	cont "here on the west"
	cont "end of town."
	
	para "What kind of man"
	line "thought that was"
	cont "a good place to"
	cont "put it!?"
	done

CherrygroveYoungsterText_HavePokedex:
	text "The #MART is"
	line "all the way over"
	cont "here on the west"
	cont "end of town."
	
	para "What kind of man"
	line "thought that was"
	cont "a good place to"
	cont "put it!?"
	done

CherrygroveCitySignText:
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
	
CherrygroveCity_MapEventHeader:: db 0, 0

.Warps: db 5
	warp_def 23, 7, 2, CHERRYGROVE_MART
	warp_def 9, 19, 1, CHERRYGROVE_POKECENTER_1F
	warp_def 19, 19, 1, CHERRYGROVE_GYM_SPEECH_HOUSE
	warp_def 19, 29, 1, CHERRYGROVE_EVOLUTION_SPEECH_HOUSE
	warp_def 9, 11, 2, TANGELO_PORT

.CoordEvents: db 0

.BGEvents: db 4
	signpost 20, 24, SIGNPOST_READ, CherrygroveCitySign
	signpost 7, 25, SIGNPOST_READ, GuideGentsHouseSign
	signpost 23, 8, SIGNPOST_READ, CherrygroveCityMartSign
	signpost 9, 20, SIGNPOST_READ, CherrygroveCityPokeCenterSign

.ObjectEvents: db 5
	person_event SPRITE_SURF, 5, 24, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CherrygroveCityGuideGent, EVENT_GUIDE_GENT_IN_HIS_HOUSE
	person_event SPRITE_SILVER, 7, 24, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TangeloTraceyScript, EVENT_TANGELO_TRACEY_LEAVING
	person_event SPRITE_TEACHER, 11, 26, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CherrygroveTeacherScript, -1
	person_event SPRITE_YOUNGSTER, 22, 21, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CherrygroveYoungsterScript, -1
	person_event SPRITE_POKE_BALL, 23, 33, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TangeloSurf, EVENT_TANGELO_SURF

