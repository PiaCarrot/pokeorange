const_value = 1
	const MIKANONIXTRADEHOUSE_KYLE
	const MIKANONIXTRADEHOUSE_BRUNO
	const MIKANONIXTRADEHOUSE_TYROGUE_BALL

MikanOnixTradeHouse_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

Kyle:
	faceplayer
	opentext
	trade $1
	waitbutton
	closetext
	end

TyrogueGiftScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TYROGUE
	iftrue GotTyrogueAlreadyScript
	checkevent EVENT_BEAT_ORANGE_LEAGUE
	iftrue .postLeague
	writetext WantThisTyrogueText_preleague
	waitbutton
	jump .continueText
.postLeague
	writetext WantThisTyrogueText_postleague
	waitbutton
.continueText
	writetext WantThisTyrogueText2
	yesorno
	iffalse DontWantTyrogueScript
	writetext YouDoWantTyrogueText
	buttonsound
	waitsfx
	checkcode VAR_PARTYCOUNT
	if_equal $6, TyrogueNotEnoughRoomScript
	writetext TyrogueReceivedText
	playsound SFX_CAUGHT_MON
	waitsfx
	callasm _ASM_OnixTradeHouseRand
	iftrue .giveShinyTyrogue
	givepoke TYROGUE, 8, BLACKBELT
.continueGiving
	setevent EVENT_GOT_TYROGUE
	disappear MIKANONIXTRADEHOUSE_TYROGUE_BALL
	writetext AlreadyGotTyrogueText
	waitbutton
	closetext
	end

.giveShinyTyrogue
	givepoke TYROGUE, 8, BLACKBELT, SHINY_MASK
	jump .continueGiving

TyrogueNotEnoughRoomScript:
	writetext NotEnoughRoomForTyrogueText
	waitbutton
	closetext
	end

DontWantTyrogueScript:
	writetext DontWantTyrogueText
	waitbutton
	closetext
	end

GotTyrogueAlreadyScript:
	writetext AlreadyGotTyrogueText
	waitbutton
	closetext
	end
	
TyrogueBallScript:
	jumptext TyrogueBallText
	
TyrogueBallText:
	text "There's a #MON"
	line "inside!"
	done
	
TyrogueReceivedText:
	text "<PLAYER> received"
	line "TYROGUE!"
	done
	
NotEnoughRoomForTyrogueText:
	text "You don't have"
	line "enough room for"
	cont "TYROGUE."
	
	para "Please come back"
	line "when you have room"
	cont "in your party."
	done

YouDoWantTyrogueText:	
	text "I knew you'd be"
	line "the one!"

	para "OK, I'm counting"
	line "on you."

	para "Take good care of"
	line "it!"
	done
	
WantThisTyrogueText_preleague:
	text "Hello there!"
	
	para "You look ready to"
	line "challenge the"
	cont "ORANGE CREW."
	done

WantThisTyrogueText_postleague:
	text "Hello there!"
	
	para "The CHAMPION,"
	line "in my house!"
	
	para "May I have a bit"
	line "of your time,"
	cont "CHAMP?"
	done

WantThisTyrogueText2:
	text "I've had this"
	line "TYROGUE for the"
	cont "longuest time, but"
	cont "I can't decide"
	cont "what to evolve it"
	cont "into."
	
	para "I don't think I'm"
	line "apt to be its"
	cont "TRAINER anymore,"
	cont "it deserves some-"
	cont "one with strong"
	cont "conviction."
	
	para "Say, would you be"
	line "willing to be"
	cont "TYROGUE's TRAINER?"
	done
	
DontWantTyrogueText:
	text "You don't want to?"
	line "I understand."
	
	para "It was an unreaso-"
	line "nable request."
	done
	
AlreadyGotTyrogueText:
	text "Take good care of"
	line "TYROGUE."
	
	para "Regardless of what"
	line "it evolves into, I"
	cont "am sure you will"
	cont "make it a very"
	cont "strong #MON."
	done

_ASM_OnixTradeHouseRand:
	xor a
	ld [ScriptVar], a
	call Random
	ldh a, [hRandomAdd]
	;cp a, $1A ;10% chance
	cp a, $40 ;25% chance
	ret nc
	ld a, 1
	ld [ScriptVar], a
	ret

MikanOnixTradeHouse_MapEventHeader:

.Warps: db 2
	warp_def $7, $3, 5, MIKAN_ISLAND
	warp_def $7, $4, 5, MIKAN_ISLAND

.XYTriggers: db 0

.Signposts: db 0

.PersonEvents: db 3
	person_event SPRITE_COOLTRAINER_F, 5, 6, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Kyle, -1
	person_event SPRITE_BRUNO, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, TyrogueGiftScript, -1
	person_event SPRITE_POKE_BALL, 3, 3, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TyrogueBallScript, EVENT_GOT_TYROGUE
