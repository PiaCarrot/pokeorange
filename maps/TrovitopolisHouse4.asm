const_value = 1
	const TROVITOPOLIS_EEVEE_LASS
	const TROVITOPOLIS_EEVEE_BALL
	
TrovitopolisHouse4_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

EeveeGiftScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_EEVEE
	iftrue GotEeveeAlreadyScript
	writetext WantThisEeveeText
	yesorno
	iffalse DontWantEeveeScript
	writetext YouDoWantEeveeText
	buttonsound
	waitsfx
	checkcode VAR_PARTYCOUNT
	if_equal $6, NotEnoughRoomScript
	writetext UnknownText_0x54dae
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke EEVEE, 20
	setevent EVENT_GOT_EEVEE
	disappear TROVITOPOLIS_EEVEE_BALL
	writetext AlreadyGotEeveeText
	waitbutton
	closetext
	end

NotEnoughRoomScript:
	writetext NotEnoughRoomForEeveeText
	waitbutton
	closetext
	end

DontWantEeveeScript:
	writetext DontWantEeveeText
	waitbutton
	closetext
	end

GotEeveeAlreadyScript:
	writetext AlreadyGotEeveeText
	waitbutton
	closetext
	end
	
EeveeBall:
	jumptext EeveeBallText
	
EeveeBallText:
	text "There's a #MON"
	line "inside!"
	done
	
UnknownText_0x54dae:
	text "<PLAYER> received"
	line "EEVEE!"
	done
	
NotEnoughRoomForEeveeText:
	text "You don't have"
	line "enough room for"
	cont "EEVEE."
	
	para "Please come back"
	line "when you have room"
	cont "in your party."
	done

YouDoWantEeveeText:	
	text "I knew you'd be"
	line "the one!"

	para "OK, I'm counting"
	line "on you."

	para "Take good care of"
	line "it!"
	done
	
WantThisEeveeText:
	text "Hello!"
	
	para "You seem like a"
	line "decent #MON"
	cont "TRAINER."
	
	para "I found this EEVEE"
	line "in an alleyway."
	
	para "I can't take care"
	line "of it, but maybe"
	cont "you can? It needs"
	cont "a good home!"
	done
	
DontWantEeveeText:
	text "You don't want it?"
	line "I understand."
	
	para "It was an unreaso-"
	line "nable request."
	done
	
AlreadyGotEeveeText:
	text "Take good care of"
	line "that EEVEE. I hear"
	cont "it can EVOLVE into"
	cont "many #MON."
	done

TrovitopolisHouse4_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 10, TROVITOPOLIS
	warp_def 7, 3, 10, TROVITOPOLIS

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_LASS, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, EeveeGiftScript, -1
	person_event SPRITE_POKE_BALL, 3, 3, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, EeveeBall, EVENT_GOT_EEVEE