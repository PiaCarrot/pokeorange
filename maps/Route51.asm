const_value = 1
	const ROUTE51_YOUNGSTER
	const ROUTE51_BUG_CATCHER
	const ROUTE51_FRUIT_TREE
	const ROUTE51_POKE_BALL1
	const ROUTE51_POKE_BALL2
	const ROUTE51_HO_OH
	const ROUTE51_CROSS

Route51_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 1
	dbw MAPCALLBACK_OBJECTS, Route51HideCrossCallback

Route51HideCrossCallback:
	checkevent EVENT_MARSHADOW_HOOH_EVENT_STARTED
	iffalse .hideall
	;now check if the player has the Rainbow Wing (this is reliable since it is now impossible to put the Rainbow Wing in the PC)
	checkitem RAINBOW_WING
	iftrue .hidecross ; if the player has the Rainbow Wing, Cross has already been battled
	return ; event started and cross not battled, so don't hide anything
	
.hidecross ;in this branch we got the Rainbow Wing back, so we have battled Cross
	disappear ROUTE51_CROSS
	checkevent EVENT_ROUTE51_HO_OH_FOUGHT
	iftrue .hideall
	appear ROUTE51_HO_OH
	return

.hideall
	disappear ROUTE51_CROSS
	disappear ROUTE51_HO_OH
	return

TrainerBug_catcherSam:
	trainer EVENT_BEAT_BUG_CATCHER_SAM, BUG_CATCHER, SAM, Bug_catcherSamSeenText, Bug_catcherSamBeatenText, 2, .Script

.Script:
	end_if_just_battled
	opentext
	writetext Bug_catcherSamAfterText
	waitbutton
	closetext
	end

Route51YoungsterScript:
	jumptextfaceplayer Route51YoungsterText

Route51Sign:
	jumptext Route51SignText

Route51FruitTree:
	fruittree FRUITTREE_ROUTE_51

Route51Potion:
	itemball POTION

Route51PokeBall:
	itemball POKE_BALL

Bug_catcherSamSeenText:
	text "My BEEDRILL is"
	line "sure to beat you!"
	done

Bug_catcherSamBeatenText:
	text "BEEDRILL!"
	done

Bug_catcherSamAfterText:
	text "Listen, BUG-type"
	line "#MON evolve"
	cont "very quickly."
	done

Route51YoungsterText:
	text "TANGELO JUNGLE is"
	line "pretty hard to get"
	cont "through."

	para "It's full of tricky"
	line "paths and #MON."
	done

Route51SignText:
	text "ROUTE 51"
	done

Route51Ho_ohScript:	
	faceplayer
	opentext
	writetext Ho_ohText
	cry HO_OH
	pause 15
	closetext
	writecode VAR_BATTLETYPE, BATTLETYPE_HOOH
	loadwildmon HO_OH, 70
	startbattle
	disappear ROUTE51_HO_OH
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_ROUTE51_HO_OH_FOUGHT
	end
	
Ho_ohText:
	text "Shaooo!"
	done

Route51CrossScript_left:
	checkevent EVENT_CROSS_AT_ROUTE51
	iffalse .finish
	spriteface PLAYER, RIGHT
	playmusic MUSIC_CROSS_ENCOUNTER
	opentext
	writetext CrossRoute51Text
	waitbutton
	closetext
	spriteface ROUTE51_CROSS, LEFT
	jump Route51CrossScript
.finish
	end

Route51CrossScript_up:
	checkevent EVENT_CROSS_AT_ROUTE51
	iffalse .finish
	spriteface PLAYER, DOWN
	playmusic MUSIC_CROSS_ENCOUNTER
	opentext
	writetext CrossRoute51Text
	waitbutton
	closetext
	spriteface ROUTE51_CROSS, UP
	jump Route51CrossScript
.finish
	end

Route51CrossScript:
	opentext
	writetext CrossRoute51Text2
	waitbutton
	closetext
	checkevent EVENT_GOT_CHARMANDER_FROM_IVY
	iftrue .GotCharmander
	checkevent EVENT_GOT_SQUIRTLE_FROM_IVY
	iftrue .GotSquirtle
	winlosstext CrossRoute51WinLoss, 0
	setlasttalked ROUTE51_CROSS
	loadtrainer CROSS, 18
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle
	end
	
.GotCharmander:
	winlosstext CrossRoute51WinLoss, 0
	setlasttalked ROUTE51_CROSS
	loadtrainer CROSS, 16
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle
	
.GotSquirtle:
	winlosstext CrossRoute51WinLoss, 0
	setlasttalked ROUTE51_CROSS
	loadtrainer CROSS, 17
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	jump .returnfrombattle

.returnfrombattle:
	playmusic MUSIC_CROSS_ENCOUNTER
	opentext
	writetext CrossRout51DefeatText
	waitbutton
	closetext
	disappear ROUTE51_CROSS
	special Special_FadeInQuickly
	pause 20
	playmapmusic
	pause 10
	clearevent EVENT_CROSS_AT_ROUTE51
	cry HO_OH
	opentext
	writetext CrossRoute51PurifiedWingText
	waitbutton
	verbosegiveitem RAINBOW_WING
	closetext
	end

CrossRoute51Text:
	text "CROSS: Why will"
	line "you not face me,"
	cont "HO-OH? I have your"
	cont "RAINBOW WING!"
	cont "Submit to me, a"
	cont "#MON MASTER!"
	
	para "CROSS produces the" 
	line "RAINBOW WING, but"
	cont "it's covered in a"
	cont "dark miasma."
	
	para "HO-OH: Ayiiiehh!!"
	done
	
CrossRoute51Text2:
	text "CROSS: Oh, I see<...>"
	line "You wish for me to"
	cont "prove myself by"
	cont "beating the ORANGE"
	cont "CREW CHAMPION!"
	
	para "That will be easy,"
	line "with my new tools"
	cont "I've obtained!"
	done

CrossRoute51WinLoss:
	text "CROSS: MARSHADOW!"
	line "Where are you"
	cont "going? This isn't"
	cont "how it was meant"
	cont "to be<...>"
	done

CrossRout51DefeatText:
	text "CROSS: <...><...>"
	line "I understand now."
	cont "It was never about"
	cont "strength, was it?"
	
	para "I can see it now,"
	line "<PLAYER>."
	cont "Your #MON adore"
	cont "you, and you love"
	cont "them too. I only"
	cont "treated mine as"
	cont "tools to obtain"
	cont "even more power."
	
	para "I was never worthy"
	line "of HO-OH. You can"
	cont "have this, I don't"
	cont "need it anymore<...>"
	
	para "<PLAYER> received"
	line "the RAINBOW WING!"
	cont "It's still covered"
	cont "in a dark miasma."
	
	para "CROSS: I don't"
	line "expect you to"
	cont "forgive me for the"
	cont "way I've treated"
	cont "you, but I hope we"
	cont "meet again."
	done

CrossRoute51PurifiedWingText:
	text "HO-OH: Ayiiieehhh!"
	
	para "The dark miasma"
	line "enveloping the"
	cont "RAINBOW WING"
	cont "dissipates, and it"
	cont "shimmers again!"
	
	para "HO-OH looks down"
	line "upon you, awaiting"
	cont "your challenge."
	cont "You have earned"
	cont "the right to face"
	cont "it!"
	done

Route51_MapEventHeader::

.Warps: db 2
	warp_def 2, 12, 3, ROUTE_51_TANGELO_JUNGLE_GATE
	warp_def 3, 12, 4, ROUTE_51_TANGELO_JUNGLE_GATE

.CoordEvents: db 2
	xy_trigger 0, 11, 27, Route51CrossScript_left
	xy_trigger 0, 10, 28, Route51CrossScript_up

.BGEvents: db 1
	signpost 12, 20, SIGNPOST_READ, Route51Sign

.ObjectEvents: db 7
	person_event SPRITE_YOUNGSTER, 19, 14, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route51YoungsterScript, -1
	person_event SPRITE_BUG_BOY, 5, 12, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 1, TrainerBug_catcherSam, -1
	person_event SPRITE_FRUIT_TREE, 25, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route51FruitTree, -1
	person_event SPRITE_POKE_BALL,  1, 19, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route51Potion, EVENT_ROUTE_51_POTION
	person_event SPRITE_POKE_BALL,  6,  7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route51PokeBall, EVENT_ROUTE_51_POKE_BALL
	person_event SPRITE_HO_OH, 12, 28, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_RED, 0, 0, Route51Ho_ohScript, EVENT_TEMPORARY_1
	person_event SPRITE_ROCKER, 11, 28, SPRITEMOVEDATA_STANDING_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route51CrossScript, EVENT_TEMPORARY_2
