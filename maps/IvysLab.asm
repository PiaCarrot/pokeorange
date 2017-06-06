const_value set 2
	const IVYSLAB_IVY
	const IVYSLAB_IVYS_AIDE
	const IVYSLAB_POKE_BALL1
	const IVYSLAB_POKE_BALL2
	const IVYSLAB_POKE_BALL3

IvysLab_MapScriptHeader:
.MapTriggers:
	db 1

	; triggers
	maptrigger .Trigger0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_OBJECTS, .Callback_MoveIvy

.Trigger0:
	priorityjump IvysLab_AutowalkUpToIvy
	end

.Callback_MoveIvy:
	checktriggers
	iftrue .Skip
	moveperson IVYSLAB_IVY, $1, $4
.Skip:
	return

IvysLab_AutowalkUpToIvy:
	applymovement PLAYER, IvysLab_WalkUpToIvyMovement
	showemote EMOTE_SHOCK, IVYSLAB_IVY, 15
	spriteface IVYSLAB_IVY, RIGHT
	opentext
	writetext IvyText_Intro
	jump IvysLab_IvyGetsEmail

IvysLab_IvyGetsEmail:
	buttonsound
	waitbutton
	closetext
	playsound SFX_GLASS_TING
	pause 30
	showemote EMOTE_SHOCK, IVYSLAB_IVY, 10
	spriteface IVYSLAB_IVY, DOWN
	opentext
	writetext IvyText_GotAnEmail
	waitbutton
	closetext
	opentext
	spriteface IVYSLAB_IVY, RIGHT
	writetext IvyText_MissionFromMrPokemon
	waitbutton
	closetext
	opentext
	special Special_SetDayOfWeek
	closetext
	applymovement IVYSLAB_IVY, IvysLab_TurnDown
	pause 40
	applymovement IVYSLAB_IVY, IvysLab_IvyToDefaultPositionMovement1
	spriteface PLAYER, UP
	applymovement IVYSLAB_IVY, IvysLab_IvyToDefaultPositionMovement2
	spriteface PLAYER, RIGHT
	opentext
	writetext IvyText_ChooseAPokemon
	waitbutton
	dotrigger $1
	closetext
	end

LabTryToLeaveScript:
	spriteface IVYSLAB_IVY, DOWN
	opentext
	writetext LabWhereGoingText
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x78f70
	end

CyndaquilPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_IVY
	iftrue LookAtIvyPokeBallScript
	spriteface IVYSLAB_IVY, DOWN
	refreshscreen $0
	pokepic CHARMANDER
	cry CHARMANDER
	waitbutton
	closepokepic
	opentext
	writetext TakeCyndaquilText
	yesorno
	iffalse DidntChooseStarterScript
	disappear IVYSLAB_POKE_BALL1
	setevent EVENT_GOT_CHARMANDER_FROM_IVY
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
	if_equal RIGHT, IvyDirectionsScript
	applymovement PLAYER, AfterCyndaquilMovement
	jump IvyDirectionsScript

TotodilePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_IVY
	iftrue LookAtIvyPokeBallScript
	spriteface IVYSLAB_IVY, DOWN
	refreshscreen $0
	pokepic SQUIRTLE
	cry SQUIRTLE
	waitbutton
	closepokepic
	opentext
	writetext TakeTotodileText
	yesorno
	iffalse DidntChooseStarterScript
	disappear IVYSLAB_POKE_BALL2
	setevent EVENT_GOT_SQUIRTLE_FROM_IVY
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
	jump IvyDirectionsScript

ChikoritaPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_IVY
	iftrue LookAtIvyPokeBallScript
	spriteface IVYSLAB_IVY, DOWN
	refreshscreen $0
	pokepic BULBASAUR
	cry BULBASAUR
	waitbutton
	closepokepic
	opentext
	writetext TakeChikoritaText
	yesorno
	iffalse DidntChooseStarterScript
	disappear IVYSLAB_POKE_BALL3
	setevent EVENT_GOT_BULBASAUR_FROM_IVY
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
	jump IvyDirectionsScript

DidntChooseStarterScript:
	writetext DidntChooseStarterText
	waitbutton
	closetext
	end

IvyDirectionsScript:
	spriteface PLAYER, UP
	opentext
	writetext IvyDirectionsText1
	waitbutton
	closetext
	spriteface IVYSLAB_IVY, LEFT
	opentext
	writetext IvyDirectionsText2
	waitbutton
	closetext
	spriteface IVYSLAB_IVY, DOWN
	opentext
	writetext IvyDirectionsText3
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	waitbutton
	closetext
	setevent EVENT_GOT_A_POKEMON_FROM_IVY
	dotrigger $5
	domaptrigger VALENCIA_ISLAND, $1
	end

ProfIvyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_GS_BALL_FROM_TRACEY
	iftrue .GoOn
	writetext IvyDescribesMrPokemonText
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

LookAtIvyPokeBallScript:
	opentext
	writetext IvyPokeBallText
	waitbutton
	closetext
	end

IvysLabHealingMachine:
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_IVY
	iftrue .CanHeal
	writetext IvysLabHealingMachineText1
	waitbutton
	closetext
	end

.CanHeal:
	writetext IvysLabHealingMachineText2
	yesorno
	iftrue IvysLabHealingMachine_HealParty
	closetext
	end

IvysLabHealingMachine_HealParty:
	special HealParty
	playmusic MUSIC_NONE
	writebyte 1 ; Machine is in Ivy's Lab
	special HealMachineAnim
	pause 30
	special RestartMapMusic
	closetext
	end

IvysLabWindow:
	jumptext IvysLabWindowText

IvyJumpBackScript1:
	closetext
	checkcode VAR_FACING
	if_equal DOWN, IvyJumpDownScript
	if_equal UP, IvyJumpUpScript
	if_equal LEFT, IvyJumpLeftScript
	if_equal RIGHT, IvyJumpRightScript
	end

IvyJumpBackScript2:
	closetext
	checkcode VAR_FACING
	if_equal DOWN, IvyJumpUpScript
	if_equal UP, IvyJumpDownScript
	if_equal LEFT, IvyJumpRightScript
	if_equal RIGHT, IvyJumpLeftScript
	end

IvyJumpUpScript:
	applymovement IVYSLAB_IVY, IvyJumpUpMovement
	opentext
	end

IvyJumpDownScript:
	applymovement IVYSLAB_IVY, IvyJumpDownMovement
	opentext
	end

IvyJumpLeftScript:
	applymovement IVYSLAB_IVY, IvyJumpLeftMovement
	opentext
	end

IvyJumpRightScript:
	applymovement IVYSLAB_IVY, IvyJumpRightMovement
	opentext
	end

AideScript_WalkPotions1:
	applymovement IVYSLAB_IVYS_AIDE, AideWalksRight1
	spriteface PLAYER, DOWN
	scall AideScript_GivePotions
	applymovement IVYSLAB_IVYS_AIDE, AideWalksLeft1
	end

AideScript_WalkPotions2:
	applymovement IVYSLAB_IVYS_AIDE, AideWalksRight2
	spriteface PLAYER, DOWN
	scall AideScript_GivePotions
	applymovement IVYSLAB_IVYS_AIDE, AideWalksLeft2
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

IvysAideScript:
	faceplayer
	opentext
	writetext AideText_ExplainBalls
	waitbutton
	closetext
	end

IvysLabTravelTip1:
	jumptext IvysLabTravelTip1Text

IvysLabTravelTip2:
	jumptext IvysLabTravelTip2Text

IvysLabTravelTip3:
	jumptext IvysLabTravelTip3Text

IvysLabTravelTip4:
	jumptext IvysLabTravelTip4Text

IvysLabTrashcan:
	jumptext IvysLabTrashcanText

IvysLabPC:
	jumptext IvysLabPCText

IvysLabBookshelf:
	jumpstd difficultbookshelf

IvysLab_WalkUpToIvyMovement:
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

IvysLab_TurnDown:
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

IvyJumpUpMovement:
	fix_facing
	big_step UP
	remove_fixed_facing
	step_end

IvyJumpDownMovement:
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

IvyJumpLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	step_end

IvyJumpRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end

IvysLab_IvyToDefaultPositionMovement1:
	step UP
	step_end

IvysLab_IvyToDefaultPositionMovement2:
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

IvyText_Intro:
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

IvyText_GotAnEmail:
	text "Oh, hey! I got an"
	line "e-mail!"

	para $56, $56, $56
	line "Hm… Uh-huh…"

	para "Okay…"
	done

IvyText_MissionFromMrPokemon:
	text "I'll need to write"
	line "back..."

	para "Uh... Do you know"
	line "what day it is?"
	done

IvyText_ChooseAPokemon:
	text "I want you to"
	line "raise one of the"

	para "#MON contained"
	line "in these BALLS."

	para "You'll be that"
	line "#MON's first"
	cont "partner, <PLAYER>!"

	para "Go on. Pick one!"
	done

IvyText_LetYourMonBattleIt:
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

IvyDirectionsText1:
	text "Go to the west"
	line "end of VALENCIA"
	cont "to find the port."

	para "You can catch a"
	line "boat there to"
	cont "TANGELO ISLAND."
	done

IvyDirectionsText2:
	text "If your #MON is"
	line "hurt, you should"

	para "heal it with this"
	line "machine."

	para "Feel free to use"
	line "it anytime."
	done

IvyDirectionsText3:
	text "<PLAYER>, here"
	line "is your #DEX!"
	done

GotIvysNumberText:
	text "<PLAYER> got IVY's"
	line "phone number."
	done

IvyDescribesMrPokemonText:
	text "Best of luck,"
	line "<PLAYER>!"
	done

IvyPokeBallText:
	text "It contains a"
	line "#MON caught by"
	cont "PROF.IVY."
	done

IvysLabHealingMachineText1:
	text "I wonder what this"
	line "does?"
	done

IvysLabHealingMachineText2:
	text "Would you like to"
	line "heal your #MON?"
	done

IvysLabSignpostText_Egg:
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

IvysLabWindowText:
	text "The window's open."

	para "An ocean breeze"
	line "is blowing in."
	done

IvysLabTravelTip1Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 1:"

	para "Press START to"
	line "open the MENU."
	done

IvysLabTravelTip2Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 2:"

	para "Record your trip"
	line "with SAVE!"
	done

IvysLabTravelTip3Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 3:"

	para "Open your PACK and"
	line "press SELECT to"
	cont "move items."
	done

IvysLabTravelTip4Text:
	text "<PLAYER> opened a"
	line "book."

	para "Travel Tip 4:"

	para "Check your #MON"
	line "moves. Press the"

	para "A Button to switch"
	line "moves."
	done

IvysLabTrashcanText:
	text "The wrapper from"
	line "the snack PROF.IVY"
	cont "ate is in there…"
	done

IvysLabPCText:
	text "REGIONAL VARIETY"
	line "OF #MON"

	para "…It says on the"
	line "screen…"
	done

IvysLab_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 11, 4, 1, VALENCIA_ISLAND
	warp_def 11, 5, 1, VALENCIA_ISLAND

.CoordEvents: db 4
	xy_trigger 1, 6, 4, 0, LabTryToLeaveScript, 0, 0
	xy_trigger 1, 6, 5, 0, LabTryToLeaveScript, 0, 0
	xy_trigger 5, 8, 4, 0, AideScript_WalkPotions1, 0, 0
	xy_trigger 5, 8, 5, 0, AideScript_WalkPotions2, 0, 0

.BGEvents: db 16
	signpost 1, 2, SIGNPOST_READ, IvysLabHealingMachine
	signpost 0, 5, SIGNPOST_READ, IvysLabWindow
	signpost 1, 6, SIGNPOST_READ, IvysLabBookshelf
	signpost 1, 7, SIGNPOST_READ, IvysLabBookshelf
	signpost 1, 8, SIGNPOST_READ, IvysLabBookshelf
	signpost 1, 9, SIGNPOST_READ, IvysLabBookshelf
	signpost 7, 0, SIGNPOST_READ, IvysLabTravelTip1
	signpost 7, 1, SIGNPOST_READ, IvysLabTravelTip2
	signpost 7, 2, SIGNPOST_READ, IvysLabTravelTip3
	signpost 7, 3, SIGNPOST_READ, IvysLabTravelTip4
	signpost 7, 6, SIGNPOST_READ, IvysLabBookshelf
	signpost 7, 7, SIGNPOST_READ, IvysLabBookshelf
	signpost 7, 8, SIGNPOST_READ, IvysLabBookshelf
	signpost 7, 9, SIGNPOST_READ, IvysLabBookshelf
	signpost 3, 9, SIGNPOST_READ, IvysLabTrashcan
	signpost 5, 1, SIGNPOST_DOWN, IvysLabPC

.ObjectEvents: db 5
	person_event SPRITE_ELM, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, PAL_OW_PINK, ProfIvyScript, -1
	person_event SPRITE_COOLTRAINER_F, 9, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, IvysAideScript, EVENT_IVYS_AIDE_IN_LAB
	person_event SPRITE_POKE_BALL, 3, 6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_IVYS_LAB
	person_event SPRITE_POKE_BALL, 3, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_IVYS_LAB
	person_event SPRITE_POKE_BALL, 3, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_IVYS_LAB
