const_value = 1
	const ELDER_HOUSE_JESSIE
	const ELDER_HOUSE_JAMES
	const ELDER_HOUSE_ELDER
	const ELDER_HOUSE_MEOWTH

GoldenIslandElderHouse_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

GoldenIslandElderScript:
	checkevent EVENT_SAVED_CAT_ELDER
	iftrue .ElderTradeScript
	faceplayer
	opentext
	writetext ElderPleaseSaveMeText
	waitbutton
	closetext
	spriteface ELDER_HOUSE_JESSIE, UP
	spriteface ELDER_HOUSE_JAMES, UP
	spriteface ELDER_HOUSE_MEOWTH, UP
	showemote EMOTE_QUESTION, ELDER_HOUSE_JESSIE, 15
	showemote EMOTE_QUESTION, ELDER_HOUSE_JAMES, 15
	showemote EMOTE_QUESTION, ELDER_HOUSE_MEOWTH, 15
	playmusic MUSIC_ROCKET_OVERTURE
	opentext
	writetext ElderHouseJessieText1
	waitbutton
	closetext
	applymovement ELDER_HOUSE_JESSIE, ELDER_HOUSE_ROCKET_MOVEMENT1
	applymovement ELDER_HOUSE_JAMES, ELDER_HOUSE_ROCKET_MOVEMENT2
	opentext
	writetext ElderHouseJessieText2
	waitbutton
	closetext
    playmusic MUSIC_ROCKET_MOTTO
	opentext
	writetext ElderHouseJessieText3
	waitbutton
	closetext
	waitbutton
	pause 20
	special Special_FadeOutMusic
	playmapmusic
	pause 10
	playmusic MUSIC_ROCKET_OVERTURE
	opentext
	writetext ElderHouseJessieText4
	waitbutton
	closetext	
	winlosstext JessieJamesWinLoss, 0
	loadtrainer JESSIE_JAMES, 1
	startbattle
	playmapmusic
	reloadmapafterbattle
	setevent EVENT_SAVED_CAT_ELDER
	disappear ELDER_HOUSE_JAMES
	disappear ELDER_HOUSE_JESSIE
	disappear ELDER_HOUSE_MEOWTH
	special Special_FadeInQuickly
	opentext
	writetext SavedElderText
	waitbutton
	verbosegiveitem MORO_TROPHY
	writetext ElderFarewellText
	waitbutton
	closetext
	end

.ElderTradeScript:
	faceplayer
	opentext
	checkevent EVENT_ELDER_GOT_MEOWTH
	iftrue .AlreadyGaveMeowth	
	writetext ElderTradeScriptText1
	yesorno
	iffalse .SaidNo
	special Special_BillsGrandfather
	iffalse .SaidNo
	if_not_equal MEOWTH, .SaidNo
	playsound SFX_DEX_FANFARE_50_79
	writetext GaveMeowthText
	waitsfx
	writetext ElderTradeScriptText4
	waitbutton
;	special SpecialTakeMeowth
	closetext
	setevent EVENT_ELDER_GOT_MEOWTH
	end
	
.AlreadyGaveMeowth
	writetext ElderTradeScriptText2
	waitbutton
	closetext
	end
	
.SaidNo
	writetext ElderTradeScriptText3
	waitbutton
	closetext
	end
	
ElderTradeScriptText1:
	text "It's unfortunate"
	line "about that MEOWTH."
	
	para "We really need a"
	line "MEOWTH to grant us"
	cont "wealth<...>"
	
	para "Did you happen to"
	line "find one?"
	done
	
ElderTradeScriptText2:
	text "Thank you<...>"
	line "You have saved our"
	cont "village!"
	done
	
ElderTradeScriptText3:
	text "Oh<...> Please, do"
	line "return if you find"
	cont "a MEOWTH<...>"
	done
	
ElderTradeScriptText4:
	text "Oh! This is a"
	line "bonafide MEOWTH!"
	
	para "Oh, thank you,"
	line "thank you!"
	cont "With this, our"
	cont "village is saved!"
	done
	
GaveMeowthText:
	text "<PLAYER> gave MEOWTH"
	line "to the ELDER!"
	done

ElderPleaseSaveMeText:
	text "Please help me!"
	done

ElderHouseJessieText1:
	text "JESSIE: Hey, kid!"
	line "Who do you think"
	cont "you are?"
	done

ElderHouseJessieText2:
	text "JESSIE: Come here"
	line "to stop us, huh?"

	para "How about we take"
	line "your #MON too!"

	para "JAMES: Ooh! That"
	line "sounds diabolical,"
	cont "JESSIE!"

	para "MEOWTH: Yeah, that"
	line "sounds right up my"
	cont "alley!"
	done

ElderHouseJessieText3:
	text "JAMES: But first<...>"

	para "Prepare the world"
	line "for devastation!"

	para "To unite all"
	line "peoples within our"
	cont "nation!"
	done
	
ElderHouseJessieText4:
	text "<...> <...> <...>"

	para "JAMES: You say you"
	line "heard our motto,"
	cont "already?"

	para "JESSIE: That's im-"
	line "possible! Unless<...>"
	cont "BUTCH and CASSIDY"
	cont "stole our motto!"

	para "JAMES: But they"
	line "wouldn't!"

	para "MEOWTH: HEY! Cut"
	line "the talking and"
	cont "steal this kid's"
	cont "#MON already!"

	para "JESSIE: Ahahahaha!"
	line "Very well."
	done

JessieJamesWinLoss:
	text "TEAM ROCKET's blas-"
	line "ting off again!"
	done

ElderHouseRocketScript:
	opentext
	writetext ElderRocketText
	waitbutton
	closetext
	end

ElderRocketText:
	text "ROCKETS: Give us"
	line "all of the #MON"
	cont "you own!"
	done

SavedElderText:
	text "Thank you for sav-"
	line "ing me."

	para "I was nearly burg-"
	line "led by those foul"
	cont "TEAM ROCKETs!"

	para "The talking MEOWTH"
	line "had me convinced"
	cont "it was here to br-"
	cont "ing good fortune."

	para "I guess the search"
	line "for the MEOWTH of"
	cont "BOUNTY continues."

	para "If you happen to"
	line "find one, bring it"
	cont "to me, please!"

	para "Ah, it seems they"
	line "dropped this."
	cont "You can have it."
	done

ElderFarewellText:
	text "Farewell, young"
	line "trainer!"
	done

ELDER_HOUSE_ROCKET_MOVEMENT1:
	step UP
	turn_head LEFT
	step_end

ELDER_HOUSE_ROCKET_MOVEMENT2:
	step DOWN
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

GoldenIslandElderHouse_MapEventHeader:

.Warps: db 2
	warp_def $7, $3, 4, GOLDEN_ISLAND
	warp_def $7, $4, 4, GOLDEN_ISLAND

.XYTriggers: db 0

.Signposts: db 0

.PersonEvents: db 4
	person_event SPRITE_JESSIE, 4, 6, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ElderHouseRocketScript, EVENT_SAVED_CAT_ELDER
	person_event SPRITE_JAMES, 5, 5, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ElderHouseRocketScript, EVENT_SAVED_CAT_ELDER
	person_event SPRITE_CAT_MAN, 4, 5, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, GoldenIslandElderScript, -1
	person_event SPRITE_ROCKET_MEOWTH, 5, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ElderHouseRocketScript, EVENT_SAVED_CAT_ELDER