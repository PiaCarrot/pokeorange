const_value set 2
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
	trade $2
	waitbutton
	closetext
	end
	
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
	
	para "JAMES: But first<...>"
	
	para "Prepare the world"
	line "for devastation!"
	
	para "To unite all"
	line "peoples within our"
	cont "nation!"
	
	para "<...> <...> <...>"
	
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
	person_event SPRITE_ELDER, 4, 5, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, GoldenIslandElderScript, -1
	person_event SPRITE_ROCKET_MEOWTH, 5, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ElderHouseRocketScript, EVENT_SAVED_CAT_ELDER