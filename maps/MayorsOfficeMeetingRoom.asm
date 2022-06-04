const_value = 1
	const MAYORS_OFFICE_MAYOR
	const MAYORS_OFFICE_JESSIE
	const MAYORS_OFFICE_JAMES
	const MAYORS_OFFICE_BUTCH
	const MAYORS_OFFICE_CASSIDY
	const MAYORS_OFFICE_TRACEY
	const MAYORS_OFFICE_LORELEI

MayorsOfficeMeetingRoom_MapScriptHeader:

.MapTriggers:
	db 2

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1

.MapCallbacks:
	db 0

.Trigger0:
	priorityjump MayorOfficeMeetingRoomScript
	end

.Trigger1:
	end
	
MayorOfficeMeetingRoomScript:
	playmusic MUSIC_MEET_JESSIE_JAMES
	spriteface MAYORS_OFFICE_BUTCH, DOWN
	spriteface MAYORS_OFFICE_CASSIDY, DOWN
	spriteface MAYORS_OFFICE_JESSIE, DOWN
	spriteface MAYORS_OFFICE_JAMES, DOWN
	applymovement PLAYER, MayorsOfficeMovement1
	opentext
	writetext MayorMeetingText1
	waitbutton
	spriteface MAYORS_OFFICE_JAMES, LEFT
	spriteface MAYORS_OFFICE_JESSIE, LEFT
	spriteface MAYORS_OFFICE_BUTCH, RIGHT
	spriteface MAYORS_OFFICE_CASSIDY, RIGHT
	writetext MayorMeetingText2
	waitbutton
	spriteface MAYORS_OFFICE_MAYOR, UP
	spriteface MAYORS_OFFICE_LORELEI, RIGHT
	spriteface MAYORS_OFFICE_BUTCH, DOWN
	spriteface MAYORS_OFFICE_CASSIDY, DOWN
	spriteface MAYORS_OFFICE_JESSIE, DOWN
	spriteface MAYORS_OFFICE_JAMES, DOWN
	writetext MayorMeetingText3
	waitbutton
	spriteface MAYORS_OFFICE_LORELEI, UP
	spriteface MAYORS_OFFICE_MAYOR, DOWN
	writetext MayorMeetingText4
	waitbutton
	closetext
	applymovement MAYORS_OFFICE_MAYOR, MayorMovement1
	applymovement MAYORS_OFFICE_LORELEI, LoreleiMovement1
	opentext
	writetext MayorMeetingText5 
	waitbutton
	closetext
	applymovement MAYORS_OFFICE_JAMES, JamesMovement1
	spriteface PLAYER, RIGHT
;battle stuff
	winlosstext JamesWinLoss, 0
	loadtrainer JAMES, JAMES_1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_MEET_JESSIE_JAMES
	applymovement MAYORS_OFFICE_JAMES, JamesMovement2
	applymovement MAYORS_OFFICE_JESSIE, JessieMovement1
	opentext
	writetext MayorMeetingText6
	waitbutton
	closetext
	winlosstext JessieWinLoss, 0
	loadtrainer JESSIE, JESSIE_1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_MEET_JESSIE_JAMES
	applymovement MAYORS_OFFICE_JAMES, JamesMovement3
	spriteface PLAYER, DOWN
	opentext
	writetext MayorMeetingText7
	waitbutton
	closetext
	clearevent EVENT_TRACEY_TROVITOPOLIS_PORT
	appear MAYORS_OFFICE_TRACEY
	pause 20
	playsound SFX_ENTER_DOOR
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement MAYORS_OFFICE_TRACEY, TraceyOfficeMovement1
	spriteface PLAYER, LEFT
	opentext
	writetext MayorMeetingText8
	waitbutton
	closetext
	spriteface MAYORS_OFFICE_TRACEY, LEFT
	spriteface PLAYER, RIGHT
	applymovement MAYORS_OFFICE_CASSIDY, CassidyOfficeMovement1
	applymovement MAYORS_OFFICE_BUTCH, ButchOfficeMovement1
	setevent EVENT_TRACEY_TROVITOPOLIS_PORT
; final battle
	winlosstext JessieJamesOfficeWinLoss, 0
	loadtrainer JESSIE_JAMES, JESSIE_AND_JAMES_1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_MEET_JESSIE_JAMES
	disappear MAYORS_OFFICE_CASSIDY
	disappear MAYORS_OFFICE_BUTCH
	disappear MAYORS_OFFICE_JESSIE
	disappear MAYORS_OFFICE_JAMES
	special Special_FadeInQuickly
	spriteface PLAYER, UP
	spriteface MAYORS_OFFICE_TRACEY, UP
	opentext
	writetext MayorMeetingText9
	waitbutton
	closetext
	spriteface MAYORS_OFFICE_LORELEI, DOWN
	opentext
	writetext MayorMeetingText10
	waitbutton
	closetext
	disappear MAYORS_OFFICE_MAYOR
	disappear MAYORS_OFFICE_LORELEI
	playsound SFX_EXIT_BUILDING
	special Special_FadeInQuickly
	setevent EVENT_TROVITOPOLIS_SAVED
	spriteface MAYORS_OFFICE_TRACEY, RIGHT
	spriteface PLAYER, LEFT
	opentext
	writetext MayorMeetingText11
	waitbutton
	closetext
	applymovement MAYORS_OFFICE_TRACEY, TraceyOfficeMovement2
	disappear MAYORS_OFFICE_TRACEY
	playsound SFX_EXIT_BUILDING
	playmapmusic
	domaptrigger MAYORS_OFFICE_MEETING_ROOM, $1
	clearevent EVENT_LORELEI_AT_TRAINER_SCHOOL
	end
	
MayorMeetingText1:
	text "MAYOR: And another"
	line "nuisance shows up!"
	
	para "This is my city,"
	line "and there's no way"
	cont "I'm gonna let some"
	cont "pests ruin that!"
	
	para "LORELEI: Pests?"
	line "Funny. Those four"
	cont "behind you look"
	cont "like the real"
	cont "pests to me."
	
	para "JAMES: Ooh!"
	line "That was rude,"
	cont "wasn't it, JESSIE?"
	
	para "JESSIE: Extremely."
	line "I think we'll have"
	cont "to teach her a"
	cont "lesson!"
	
	para "BUTCH: How about"
	line "we take her out,"
	cont "and you two can"
	cont "fight the kid?"
	
	para "CASSIDY: That brat"
	line "again! I say we"
	cont "all gang up on"
	cont "them!"
	done
	
MayorMeetingText2:
	text "JAMES: Say, that"
	line "reminds me<...>"
	
	para "Didn't you two"
	line "steal our motto?"
	
	para "BUTCH: Motto?"
	line "What in the world"
	cont "are you talking"
	cont "about?"
	
	para "JESSIE: That's"
	line "right! The kid"
	cont "knew our motto the"
	cont "last time we met."
	
	para "CASSIDY: This is"
	line "ridiculous."
	done
	
MayorMeetingText3:
	text "MAYOR: Would you"
	line "four idiots shut"
	cont "up already? You're"
	cont "making a fool out"
	
	para "of me!"
	
	para "LORELEI: <PLAYER>,"
	line "why did you come?"
	cont "Since you're here,"
	cont "I guess you should"
	
	para "make yourself"
	line "useful. I'll need"
	cont "you to hold off"
	cont "the ROCKETS while"
	
	para "I take care of the"
	line "MAYOR. Good luck!"
	done
	
MayorMeetingText4:
	text "MAYOR: Gah!"
	done
	
MayorMeetingText5:
	text "JAMES: Let's get"
	line "that dreadful"
	cont "twerp!"
	
	para "I'll take you on"
	line "first, brat!"
	done
	
JamesWinLoss:
	text "Ooh! Why are these"
	line "brats so strong?"
	done

MayorMeetingText6:
	text "JESSIE: You! I"
	line "haven't forgotten"
	cont "how you ruined our"
	cont "hustle on GOLDEN"
	
	para "ISLAND! Prepare"
	line "yourself!"
	done
	
JessieWinLoss:
	text "Drat!"
	done
	
MayorMeetingText7:
	text "JAMES: There's"
	line "more where that"
	cont "came from! I just"
	cont "healed back up!"
	done
	
MayorMeetingText8:
	text "TRACEY: <PLAYER>!"
	line "I finally made it!"
	cont "Let's beat these"
	cont "ROCKET crooks!"
	
	para "BUTCH and CASSIDY:"
	line "Then you'll have"
	cont "to deal with us!"
	done
	
JessieJamesOfficeWinLoss:
	text "TEAM ROCKET's bla-"
	line "sting off again!"
	done
	
MayorMeetingText9:
	text "LORELEI: End of"
	line "the line, MAYOR."
	cont "Turn yourself in,"
	cont "or else!"
	
	para "MAYOR: Grr<...>"
	line "Useless ROCKETs!"
	cont "There goes my own"
	cont "personal crime"
	
	para "syndicate! I was"
	line "so close!"
	
	para "LORELEI: I know"
	line "an OFFICER JENNY"
	cont "that would love to"
	cont "talk about that."
	done
	
MayorMeetingText10:
	text "LORELEI: <PLAYER>,"
	line "TRACEY, thank you"
	cont "for the help!"
	
	para "I'll be escorting"
	line "the mayor to a"
	cont "police station."
	
	para "<PLAYER>, if you"
	line "need me, I can be"
	cont "found at the"
	cont "TRAINER SCHOOL."
	done
	
MayorMeetingText11:
	text "TRACEY: Well, my"
	line "job here is done!"
	
	para "<PLAYER>, I'm off"
	line "to the next town,"
	cont "ASCORBIA ISLAND."
	
	para "If we meet there,"
	line "I'll give you"
	cont "something really"
	cont "useful!"
	
	para "Anyway, seeya!"
	done

MayorsOfficeMovement1:
	step UP
	step RIGHT
	step UP
	step_end

MayorMovement1:
	step RIGHT
	turn_head LEFT
	step_end
	
LoreleiMovement1:
	step UP
	turn_head RIGHT
	step_end

JamesMovement1:
	step DOWN
	step DOWN
	step LEFT
	step_end

JamesMovement2:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end
	
JessieMovement1:
	step DOWN
	step DOWN
	step LEFT
	step DOWN
	turn_head LEFT
	step_end
	
JamesMovement3:
	step DOWN
	step LEFT
	step LEFT
	turn_head UP
	step_end
	
TraceyOfficeMovement1:
	step UP
	step UP
	turn_head RIGHT
	step_end
	
CassidyOfficeMovement1:
	step DOWN
	step DOWN
	step RIGHT
	step_end
	
ButchOfficeMovement1:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

TraceyOfficeMovement2:
	step DOWN
	step DOWN
	step_end

MayorsOfficeMeetingRoom_MapEventHeader::

.Warps: db 2
	warp_def 9, 15, 3, MAYORS_OFFICE
	warp_def 9, 16, 3, MAYORS_OFFICE

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 7
	person_event SPRITE_MAYOR, 6, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TROVITOPOLIS_SAVED
	person_event SPRITE_JESSIE, 4, 18, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TROVITOPOLIS_SAVED
	person_event SPRITE_JAMES, 5, 18, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TROVITOPOLIS_SAVED
	person_event SPRITE_ROCKET, 4, 13, SPRITEMOVEDATA_STANDING_RIGHT, 0, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TROVITOPOLIS_SAVED
	person_event SPRITE_ROCKET_GIRL, 5, 13, SPRITEMOVEDATA_STANDING_RIGHT, 0, 1, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TROVITOPOLIS_SAVED
	person_event SPRITE_TRACEY, 9, 15, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TRACEY_TROVITOPOLIS_PORT
	person_event SPRITE_LORELEI, 7, 15, SPRITEMOVEDATA_STANDING_UP, 0, 1, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TROVITOPOLIS_SAVED

