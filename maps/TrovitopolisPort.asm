const_value = 1
	const TROVITOPOLIS_PORT_SAILOR_1
	const TROVITOPOLIS_PORT_LORELEI
	const TROVITOPOLIS_PORT_LANCE
	const TROVITOPOLIS_PORT_TRACEY

TrovitopolisPort_MapScriptHeader:

.MapTriggers:
	db 2

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1

.MapCallbacks:
	db 0

.Trigger0:
	priorityjump LoreleiLanceTraceyPortScript
	end

.Trigger1:
	end

LoreleiLanceTraceyPortScript:
	applymovement PLAYER, PlayerTrovitopolisPortMovement
	opentext
	writetext LoreleiLancePortText1
	waitbutton
	closetext
	spriteface TROVITOPOLIS_PORT_LORELEI, DOWN
	applymovement TROVITOPOLIS_PORT_LANCE, LanceTrovitopolisPortMovement1
	spriteface PLAYER, RIGHT
	showemote EMOTE_SHOCK, TROVITOPOLIS_PORT_LANCE, 15
	opentext
	writetext LancePortText
	waitbutton
	closetext
	applymovement TROVITOPOLIS_PORT_LANCE, LanceTrovitopolisPortMovement2
	playsound SFX_EXIT_BUILDING
	disappear TROVITOPOLIS_PORT_LANCE
	spriteface PLAYER, UP
	opentext
	writetext LoreleiPortText1
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	clearevent EVENT_TRACEY_TROVITOPOLIS_PORT
	appear TROVITOPOLIS_PORT_TRACEY
	spriteface PLAYER, DOWN
	showemote EMOTE_QUESTION, TROVITOPOLIS_PORT_LORELEI, 15
	pause 20
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement TROVITOPOLIS_PORT_TRACEY, TraceyTrovitopolisPortMovement1
	playmusic MUSIC_TRACEY_ENCOUNTER
	opentext
	writetext TraceyPortText1
	waitbutton
	closetext
	applymovement TROVITOPOLIS_PORT_LORELEI, LoreleiTrovitopolisPortMovement1
	opentext
	writetext LoreleiPortText2
	waitbutton
	spriteface TROVITOPOLIS_PORT_TRACEY, RIGHT
	writetext TraceyPortText2
	waitbutton
	closetext 
	applymovement TROVITOPOLIS_PORT_LORELEI, LoreleiTraceyPortMovement
	disappear TROVITOPOLIS_PORT_LORELEI
	playsound SFX_EXIT_BUILDING
	spriteface TROVITOPOLIS_PORT_TRACEY, UP
	opentext
	writetext TraceyPortText3
	waitbutton
	closetext
	applymovement TROVITOPOLIS_PORT_TRACEY, LoreleiTraceyPortMovement
	disappear TROVITOPOLIS_PORT_TRACEY
	playsound SFX_EXIT_BUILDING
	special RestartMapMusic
	setevent EVENT_TRACEY_TROVITOPOLIS_PORT
	setevent EVENT_TROVITOPOLIS_CAN_GO_IN_MAYORS_OFFICE
	domaptrigger TROVITOPOLIS_PORT, $1
	end

TrovitopolisPortSailorScript:
	faceplayer
	opentext
	checkevent EVENT_TROVITOPOLIS_SAVED
	iftrue .TrovitopolisSaved
	writetext TrovitopolisPortNotWorkingText
	waitbutton
	closetext
	end

.TrovitopolisSaved:
	writetext TrovitopolisPortSailorText
	yesorno
	iftrue .ToTrovita
	closetext
	end
	
.ToTrovita:
	writetext TrovitopolisSailorAhoyText
	waitbutton
	closetext
	spriteface TROVITOPOLIS_PORT_SAILOR_1, UP
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear TROVITOPOLIS_PORT_SAILOR_1
	waitsfx
	applymovement PLAYER, TrovitopolisSailorMovement
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	appear TROVITOPOLIS_PORT_SAILOR_1
	warp TROVITA_PORT, 11, 7 ;TROVITA_PORT
	end

TrovitopolisSailorMovement:
	step UP
	step_end
	
LoreleiLancePortText1:
	text "<...> <...> <...>"
	
	para "???: I'm sorry,"
	line "LANCE. My decision"
	cont "is final."
	
	para "LANCE: You can't"
	line "just quit the"
	cont "ELITE FOUR like"
	cont "this without a"
	
	para "good reason,"
	line "LORELEI!"
	
	para "LORELEI: <...>"
	line "I'm staying here"
	cont "on MANDARIN SOUTH"
	cont "for a bit, before"
	
	para "returning to my"
	line "home on FOUR"
	cont "ISLAND. Goodbye,"
	cont "LANCE."
	
	para "LANCE: Sigh<...>"
	done
	
LancePortText:
	text "LANCE: <...>"
	line "That look in your"
	cont "eyes<...>"
	
	para "Nevermind. Sorry"
	line "to bother you. You"
	cont "reminded me of"
	cont "someone."
	done
	
LoreleiPortText1:
	text "LORELEI: Hello. My"
	line "apologies for the"
	cont "disturbance that"
	cont "we caused."
	
	para "And your name?"
	
	para "<...> <...> <...>"
	
	para "LORELEI: So, your"
	line "name is <PLAYER>."
	cont "Well, I am LORELEI"
	cont "of the ELITE FOUR."
	
	para "Well, I was, but I"
	line "just officially"
	cont "retired. Haha."
	
	para "Anyways, if you do"
	line "need me for some-"
	cont "thing, I can be"
	cont "found at the"
	
	para "TRAINER SCHOOL in"
	line "the city."
	cont "I'll be taking my"
	cont "leave now."
	done
	
TraceyPortText1:
	text "TRACEY: <PLAYER>!"
	
	para "I finally found"
	line "you! There's big"
	cont "trouble in this"
	cont "city!"
	done
	
LoreleiPortText2:
	text "LORELEI: What is"
	line "going on here?"
	done
	
TraceyPortText2:
	text "TRACEY: It's TEAM"
	line "ROCKET! They are-"
	
	para "<...>"
	
	para "Wait, aren't you"
	line "LORELEI of the"
	cont "KANTO ELITE FOUR?"
	cont "What an honor!"
	
	para "LORELEI: Boy, get"
	line "back on topic."
	
	para "TRACEY: Oh, right!"
	line "TEAM ROCKET is"
	cont "working with the"
	cont "MAYOR in order to"
	
	para "TAX the citizens"
	line "and launder the"
	cont "money for their"
	cont "evil deeds!"
	
	para "We gotta stop 'em!"
	
	para "LORELEI: Okay."
	line "I'll head down"
	cont "there now."
	
	para "You two are still"
	line "still kids, don't"
	cont "you dare come!"
	cont "It's dangerous!"
	done
	
TraceyPortText3:
	text "TRACEY: As if!"
	
	para "I'm going too!"
	line "<PLAYER>! We can't"
	cont "let TEAM ROCKET"
	cont "have their way!"
	
	para "They steal #MON"
	line "and make people"
	cont "miserable!"
	
	para "I don't know why"
	line "they are here or"
	cont "how, but we must"
	cont "stop them!"
	done
	
TrovitopolisPortNotWorkingText:
	text "Sorry, kid. FERRY"
	line "isn't running."
	
	para "MAYOR just imposed"
	line "a new SAILOR TAX."
	cont "We have to pay to"
	cont "give free rides!"
	
	para "Not only that,"
	line "I've been seeing"
	cont "those TEAM ROCKET"
	cont "goons around."
	
	para "What's happening"
	line "to this city?"
	done

TrovitopolisPortSailorText:
	text "Now that we don't"
	line "have to pay the"
	cont "SAILOR's TAX, I"
	cont "can take you to"
	
	para "TROVITA ISLAND."
	line "You ready, kid?"
	done

TrovitopolisSailorAhoyText:
	text "Alright! Off we"
	line "go!"
	done
	
PlayerTrovitopolisPortMovement:
	step UP
	step UP
	step UP
	step_end
	
LanceTrovitopolisPortMovement1:
	step DOWN
	turn_head LEFT
	step_end
	
LanceTrovitopolisPortMovement2:
	step DOWN
	step DOWN
	step DOWN
	step_end
	
TraceyTrovitopolisPortMovement1:
	step UP
	step UP
	step_end
	
LoreleiTrovitopolisPortMovement1:
	step RIGHT
	step DOWN
	step DOWN
	turn_head LEFT
	step_end

LoreleiTraceyPortMovement:
	step DOWN
	step DOWN
	step_end

TrovitopolisPort_MapEventHeader::

.Warps: db 2
	warp_def 19, 10, 11, TROVITOPOLIS
	warp_def 19, 11, 11, TROVITOPOLIS

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 4
	person_event SPRITE_SAILOR, 6, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TrovitopolisPortSailorScript, -1
	person_event SPRITE_LORELEI, 15, 10, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TROVITOPOLIS_CAN_GO_IN_MAYORS_OFFICE
	person_event SPRITE_LANCE, 15, 11, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TROVITOPOLIS_CAN_GO_IN_MAYORS_OFFICE
	person_event SPRITE_TRACEY, 19, 10, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TRACEY_TROVITOPOLIS_PORT

