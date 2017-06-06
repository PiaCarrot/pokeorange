const_value set 2
	const ELMSLAB_ELM
	const ELMSLAB_ELMS_AIDE
	const ELMSLAB_POKE_BALL1
	const ELMSLAB_POKE_BALL2
	const ELMSLAB_POKE_BALL3

ElmsLab_MapScriptHeader:
.MapTriggers:
	db 5

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1
	maptrigger .Trigger2
	maptrigger .Trigger4
	maptrigger .Trigger5

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_OBJECTS, .Callback_MoveElm

.Trigger0:
	priorityjump ElmsLab_AutowalkUpToElm
	end

.Trigger1:
	end

.Trigger2:
	end

.Trigger4:
	end

.Trigger5:
	end

.Callback_MoveElm:
	checktriggers
	iftrue .Skip
	moveperson ELMSLAB_ELM, $1, $4
.Skip:
	return

ElmsLab_AutowalkUpToElm:
	applymovement PLAYER, ElmsLab_WalkUpToElmMovement
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	spriteface ELMSLAB_ELM, RIGHT
	opentext
	writetext ElmText_Intro
	jump ElmsLab_ElmGetsEmail

ElmsLab_ElmGetsEmail:
	buttonsound
	waitbutton
	closetext
	playsound SFX_GLASS_TING
	pause 30
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 10
	spriteface ELMSLAB_ELM, DOWN
	opentext
	writetext ElmText_GotAnEmail
	waitbutton
	closetext
	opentext
	spriteface ELMSLAB_ELM, RIGHT
	writetext ElmText_MissionFromMrPokemon
	waitbutton
	closetext
	opentext
	special Special_SetDayOfWeek
	closetext
	applymovement ELMSLAB_ELM, ElmsLab_TurnDown
	pause 40
	applymovement ELMSLAB_ELM, ElmsLab_ElmToDefaultPositionMovement1
	spriteface PLAYER, UP
	applymovement ELMSLAB_ELM, ElmsLab_ElmToDefaultPositionMovement2
	spriteface PLAYER, RIGHT
	opentext
	writetext ElmText_ChooseAPokemon
	waitbutton
	dotrigger $1
	closetext
	end

LabTryToLeaveScript:
	spriteface ELMSLAB_ELM, DOWN
	opentext
	writetext LabWhereGoingText
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x78f70
	end

CyndaquilPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	spriteface ELMSLAB_ELM, DOWN
	refreshscreen $0
	pokepic CHARMANDER
	cry CHARMANDER
	waitbutton
	closepokepic
	opentext
	writetext TakeCyndaquilText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL1
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem CHARMANDER, $0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke CHARMANDER, 10, BERRY
	closetext
	checkcode VAR_FACING
	if_equal RIGHT, ElmDirectionsScript
	applymovement PLAYER, AfterCyndaquilMovement
	jump ElmDirectionsScript

TotodilePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	spriteface ELMSLAB_ELM, DOWN
	refreshscreen $0
	pokepic SQUIRTLE
	cry SQUIRTLE
	waitbutton
	closepokepic
	opentext
	writetext TakeTotodileText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL2
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem SQUIRTLE, $0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke SQUIRTLE, 10, BERRY
	closetext
	applymovement PLAYER, AfterTotodileMovement
	jump ElmDirectionsScript

ChikoritaPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	spriteface ELMSLAB_ELM, DOWN
	refreshscreen $0
	pokepic BULBASAUR
	cry BULBASAUR
	waitbutton
	closepokepic
	opentext
	writetext TakeChikoritaText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	writetext ChoseStarterText
	buttonsound
	waitsfx
	pokenamemem BULBASAUR, $0
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke BULBASAUR, 10, BERRY
	closetext
	applymovement PLAYER, AfterChikoritaMovement
	jump ElmDirectionsScript

DidntChooseStarterScript:
	writetext DidntChooseStarterText
	waitbutton
	closetext
	end

ElmDirectionsScript:
	spriteface PLAYER, UP
	opentext
	writetext ElmDirectionsText1
	waitbutton
	closetext
	spriteface ELMSLAB_ELM, LEFT
	opentext
	writetext ElmDirectionsText2
	waitbutton
	closetext
	spriteface ELMSLAB_ELM, DOWN
	opentext
	writetext ElmDirectionsText3
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	waitbutton
	closetext
	setevent EVENT_GOT_A_POKEMON_FROM_ELM
	dotrigger $5
	domaptrigger NEW_BARK_TOWN, $1
	end

ProfElmScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_GS_BALL_FROM_TRACEY
	iftrue .GoOn
	writetext ElmDescribesMrPokemonText
	waitbutton
	closetext
	end
	
.GoOn:
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .FinalIvyText
	setevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	writetext IvyAdventureText
	waitbutton
	closetext
	end
	
.FinalIvyText:
	writetext FinalIvyText
	waitbutton
	closetext
	end

LookAtElmPokeBallScript:
	opentext
	writetext ElmPokeBallText
	waitbutton
	closetext
	end

ElmsLabHealingMachine:
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .CanHeal
	writetext ElmsLabHealingMachineText1
	waitbutton
	closetext
	end

.CanHeal:
	writetext ElmsLabHealingMachineText2
	yesorno
	iftrue ElmsLabHealingMachine_HealParty
	closetext
	end

ElmsLabHealingMachine_HealParty:
	special HealParty
	playmusic MUSIC_NONE
	writebyte 1 ; Machine is in Elm's Lab
	special HealMachineAnim
	pause 30
	special RestartMapMusic
	closetext
	end

;ElmAfterTheftScript:
;	writetext ElmAfterTheftText1
;	checkitem GS_BALL
;	iffalse ElmAfterTheftDoneScript
;	buttonsound
;	writetext ElmAfterTheftText2
;	waitbutton
;	scall ElmJumpBackScript1
;	writetext ElmAfterTheftText3
;	waitbutton
;	scall ElmJumpBackScript2
;	writetext ElmAfterTheftText4
;	buttonsound
;	writetext ElmAfterTheftText5
;	buttonsound
;	setevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
;	setflag ENGINE_BUG_CONTEST_ON
;	domaptrigger ROUTE_29, $1
;	clearevent EVENT_ROUTE_30_YOUNGSTER_JOEY
;	setevent EVENT_ROUTE_30_BATTLE
;	writetext ElmAfterTheftText6
;	waitbutton
;	closetext
;	dotrigger $6
;	end

ElmJumpBackScript1:
	closetext
	checkcode VAR_FACING
	if_equal DOWN, ElmJumpDownScript
	if_equal UP, ElmJumpUpScript
	if_equal LEFT, ElmJumpLeftScript
	if_equal RIGHT, ElmJumpRightScript
	end

ElmJumpBackScript2:
	closetext
	checkcode VAR_FACING
	if_equal DOWN, ElmJumpUpScript
	if_equal UP, ElmJumpDownScript
	if_equal LEFT, ElmJumpRightScript
	if_equal RIGHT, ElmJumpLeftScript
	end

ElmJumpUpScript:
	applymovement ELMSLAB_ELM, ElmJumpUpMovement
	opentext
	end

ElmJumpDownScript:
	applymovement ELMSLAB_ELM, ElmJumpDownMovement
	opentext
	end

ElmJumpLeftScript:
	applymovement ELMSLAB_ELM, ElmJumpLeftMovement
	opentext
	end

ElmJumpRightScript:
	applymovement ELMSLAB_ELM, ElmJumpRightMovement
	opentext
	end

AideScript_WalkPotions1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	spriteface PLAYER, DOWN
	scall AideScript_GivePotions
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkPotions2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	spriteface PLAYER, DOWN
	scall AideScript_GivePotions
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GivePotions:
	opentext
	writetext AideText_GiveYouPotions
	buttonsound
	itemtotext POKE_BALL, $1
	scall AideScript_ReceiveTheBalls
	giveitem POKE_BALL, 10
	writetext AideText_ExplainBalls
	buttonsound
	itemnotify
	closetext
	dotrigger $2
	end

AideScript_ReceiveTheBalls:
	jumpstd receiveitem
	end

ElmsAideScript:
	faceplayer
	opentext
	writetext AideText_ExplainBalls
	waitbutton
	closetext
	end

ElmsLabTravelTip1:
	jumptext ElmsLabTravelTip1Text

ElmsLabTravelTip2:
	jumptext ElmsLabTravelTip2Text

ElmsLabTravelTip3:
	jumptext ElmsLabTravelTip3Text

ElmsLabTravelTip4:
	jumptext ElmsLabTravelTip4Text

ElmsLabTrashcan:
	jumptext ElmsLabTrashcanText

ElmsLabPC:
	jumptext ElmsLabPCText

ElmsLabBookshelf:
	jumpstd difficultbookshelf

ElmsLab_WalkUpToElmMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step_end
	
ElmsLab_TurnDown:
	turn_head DOWN
	step_end

MovementData_0x78f70:
	step UP
	step_end

AideWalksRight1:
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksRight2:
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksLeft1:
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

AideWalksLeft2:
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

ElmJumpUpMovement:
	fix_facing
	big_step UP
	remove_fixed_facing
	step_end

ElmJumpDownMovement:
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

ElmJumpLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	step_end

ElmJumpRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end

ElmsLab_ElmToDefaultPositionMovement1:
	step UP
	step_end

ElmsLab_ElmToDefaultPositionMovement2:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	turn_head DOWN
	step_end

AfterCyndaquilMovement:
	step LEFT
	step UP
	turn_head UP
	step_end

AfterTotodileMovement:
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

AfterChikoritaMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end
	
IvyAdventureText:
	text "<......>"
	
	para "IVY: This is..."
	
	para "<PLAYER>, this"
	line "is an important"
	cont "item."
	
	para "The GS BALL. I"
	line "don't know what it"
	cont "does or who even"
	
	para "made it. I had it"
	line "sent to PROF. OAK"
	cont "in PALLET TOWN."
	
	para "It seems he didn't"
	line "know either."
	
	para "There's a man who"
	line "could possibly un-"
	cont "cover its secret."
	
	para "His name's SAMSON."
	line "He's PROF. OAK's"
	cont "cousin, who is"
	
	para "currently visiting"
	line "on HAMLIN ISLAND."
	
	para "Since you're taking"
	line "on the ORANGE CREW"
	cont "I'd like to ask"
	
	para "you to deliver it"
	line "to him."
	
	para "I can only count"
	line "on you."
	done
	
FinalIvyText:
	text "IVY: I can only"
	line "count on you."
	done
	
ElmText_Intro:
	text "IVY: <PLAYER>!"
	line "There you are!"

	para "Today is the day"
	line "you begin your"
	cont "#MON journey."

	para "As a #MON"
	line "PROFESSOR, I'll"
	cont "give you a tool"

	para "known as a"
	line "#DEX. It will"
	cont "record data of"

	para "#MON you meet."

	para "So!"

	para "I'd like you to"
	line "take a #MON"

	para "that I recently"
	line "caught."
	done

ElmText_GotAnEmail:
	text "Oh, hey! I got an"
	line "e-mail!"

	para $56, $56, $56
	line "Hm… Uh-huh…"

	para "Okay…"
	done

ElmText_MissionFromMrPokemon:
	text "I'll need to write"
	line "back..."

	para "Uh... Do you know"
	line "what day it is?"
	done

ElmText_ChooseAPokemon:
	text "I want you to"
	line "raise one of the"

	para "#MON contained"
	line "in these BALLS."

	para "You'll be that"
	line "#MON's first"
	cont "partner, <PLAYER>!"

	para "Go on. Pick one!"
	done

ElmText_LetYourMonBattleIt:
	text "If a wild #MON"
	line "appears, let your"
	cont "#MON battle it!"
	done

LabWhereGoingText:
	text "IVY: Wait! Where"
	line "are you going?"
	done

TakeCyndaquilText:
	text "IVY: You'll take"
	line "CHARMANDER, the"
	cont "fire #MON?"
	done

TakeTotodileText:
	text "IVY: Do you want"
	line "SQUIRTLE, the"
	cont "water #MON?"
	done

TakeChikoritaText:
	text "IVY: So, you like"
	line "BULBASAUR, the"
	cont "grass #MON?"
	done

DidntChooseStarterText:
	text "IVY: Think it over"
	line "carefully."

	para "Your partner is"
	line "important."
	done

ChoseStarterText:
	text "IVY: I think"
	line "that's a great"
	cont "#MON too!"
	done

ReceivedStarterText:
	text "<PLAYER> received"
	line "@"
	text_from_ram StringBuffer3
	text "!"
	done

ElmDirectionsText1:
	text "Go to the west"
	line "end of VALENCIA"
	cont "to find the port."
	
	para "You can catch a"
	line "boat there to"
	cont "TANGELO ISLAND."
	done

ElmDirectionsText2:
	text "If your #MON is"
	line "hurt, you should"

	para "heal it with this"
	line "machine."

	para "Feel free to use"
	line "it anytime."
	done

ElmDirectionsText3:
	text "<PLAYER>, here"
	line "is your #DEX!"
	done

GotElmsNumberText:
	text "<PLAYER> got IVY's"
	line "phone number."
	done

ElmDescribesMrPokemonText:
	text "Best of luck,"
	line "<PLAYER>!"
	done

ElmPokeBallText:
	text "It contains a"
	line "#MON caught by"
	cont "PROF.IVY."
	done

ElmsLabHealingMachineText1:
	text "I wonder what this"
	line "does?"
	done

ElmsLabHealingMachineText2:
	text "Would you like to"
	line "heal your #MON?"
	done

ElmsLabSignpostText_Egg:
	text "It's the #MON"
	line "EGG being studied"
	cont "by PROF.IVY."
	done

AideText_GiveYouPotions:
	text "HOPE: <PLAYER>!"

	para "Use these on your"
	line "#DEX quest!"
	done


AideText_AlwaysBusy:
	text "There are only two"
	line "of us, so we're"
	cont "always busy."
	done

AideText_ExplainBalls:
	text "HOPE: To complete"
	line "the #DEX, you"
	cont "have to catch" 
	cont "#MON."

	para "Throw # BALLS"
	line "at wild #MON"
	cont "to get them."
	done

ElmsLabWindowText1:
	text "The window's open."

	para "A pleasant breeze"
	line "is blowing in."
	done

ElmsLabWindowText2:
	text "He broke in"
	line "through here!"
	done

ElmsLabTravelTip1Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 1:"

	para "Press START to"
	line "open the MENU."
	done

ElmsLabTravelTip2Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 2:"

	para "Record your trip"
	line "with SAVE!"
	done

ElmsLabTravelTip3Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 3:"

	para "Open your PACK and"
	line "press SELECT to"
	cont "move items."
	done

ElmsLabTravelTip4Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 4:"

	para "Check your #MON"
	line "moves. Press the"

	para "A Button to switch"
	line "moves."
	done

ElmsLabTrashcanText:
	text "The wrapper from"
	line "the snack PROF.IVY"
	cont "ate is in there…"
	done

ElmsLabPCText:
	text "REGIONAL VARIETY"
	line "OF #MON"

	para "…It says on the"
	line "screen…"
	done

ElmsLab_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 11, 4, 1, NEW_BARK_TOWN
	warp_def 11, 5, 1, NEW_BARK_TOWN

.CoordEvents: db 4
	xy_trigger 1, 6, 4, 0, LabTryToLeaveScript, 0, 0
	xy_trigger 1, 6, 5, 0, LabTryToLeaveScript, 0, 0
	xy_trigger 5, 8, 4, 0, AideScript_WalkPotions1, 0, 0
	xy_trigger 5, 8, 5, 0, AideScript_WalkPotions2, 0, 0

.BGEvents: db 15
	signpost 1, 2, SIGNPOST_READ, ElmsLabHealingMachine
	signpost 1, 6, SIGNPOST_READ, ElmsLabBookshelf
	signpost 1, 7, SIGNPOST_READ, ElmsLabBookshelf
	signpost 1, 8, SIGNPOST_READ, ElmsLabBookshelf
	signpost 1, 9, SIGNPOST_READ, ElmsLabBookshelf
	signpost 7, 0, SIGNPOST_READ, ElmsLabTravelTip1
	signpost 7, 1, SIGNPOST_READ, ElmsLabTravelTip2
	signpost 7, 2, SIGNPOST_READ, ElmsLabTravelTip3
	signpost 7, 3, SIGNPOST_READ, ElmsLabTravelTip4
	signpost 7, 6, SIGNPOST_READ, ElmsLabBookshelf
	signpost 7, 7, SIGNPOST_READ, ElmsLabBookshelf
	signpost 7, 8, SIGNPOST_READ, ElmsLabBookshelf
	signpost 7, 9, SIGNPOST_READ, ElmsLabBookshelf
	signpost 3, 9, SIGNPOST_READ, ElmsLabTrashcan
	signpost 5, 1, SIGNPOST_DOWN, ElmsLabPC

.ObjectEvents: db 5
	person_event SPRITE_ELM, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, PAL_OW_PINK, ProfElmScript, -1
	person_event SPRITE_COOLTRAINER_F, 9, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, ElmsAideScript, EVENT_ELMS_AIDE_IN_LAB
	person_event SPRITE_POKE_BALL, 3, 6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	person_event SPRITE_POKE_BALL, 3, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	person_event SPRITE_POKE_BALL, 3, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB

