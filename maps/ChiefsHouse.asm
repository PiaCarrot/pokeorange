const_value = 1

ChiefsHouse_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

ShamoutiChiefScript:
	faceplayer
	opentext
	checkevent EVENT_SHAMOUTI_QUEST_STARTED
	iftrue .AcceptedShamoutiQuest
	writetext ShamoutiChiefText1
	waitbutton
	closetext
	setevent EVENT_SHAMOUTI_QUEST_STARTED
	special FadeOutPalettes
	warp AIRSHIP_CUTSCENE, 5, 21
	end
	
.AcceptedShamoutiQuest
	checkevent EVENT_LUGIA_FOUGHT
	iftrue .RockClimbScript
	writetext ShamoutiChiefText2
	waitbutton
	closetext
	end
	
.RockClimbScript
	checkevent EVENT_RECEIVED_ROCK_CLIMB
	iftrue .AlreadyGotRockClimb
	writetext ShamoutiChiefText3
	waitbutton
	verbosegiveitem HM_ROCK_CLIMB
	waitbutton
	writetext ShamoutiChiefText4
	waitbutton
	closetext
	setevent EVENT_RECEIVED_ROCK_CLIMB
	end
	
.AlreadyGotRockClimb
	writetext ShamoutiChiefText4
	waitbutton
	closetext
	end

ShamoutiChiefText2:
	text "If you'd like more"
	line "details, please go"
	cont "to my home just"
	cont "outside of this"
	cont "building. My grand"
	cont "kid will handle"
	cont "the rest."
	
	para "I will let the"
	line "GUARD on the beach"
	cont "know to let you"
	cont "through."
	done

ShamoutiChiefText1:
	text "CHIEF: Ah, are you"
	line "a tourist?"
	
	para "<...>"
	
	para "CHIEF: So, your"
	line "name is <PLAYER>,"
	cont "and you are the"
	cont "current CHAMPION"
	
	para "of the ORANGE"
	line "CREW!"
	
	para "What wondrous"
	line "timing!"
	cont "You see, every"
	cont "year we hold a"
	
	para "festival in honor"
	line "of our guardians,"
	cont "the gods of fire,"
	cont "ice, lightning,"
	cont "and the sea."
	
	para "They protect us,"
	line "nay, the entire"
	cont "world!"
	
	para "Anyway, in the"
	line "legends, should"
	cont "the gods be dis-"
	cont "turbed, it is"
	cont "said only a great"
	cont "trainer can bring"
	cont "balance back to"
	cont "the world."
	
	para "Now, we'd normally"
	line "let any trainer"
	cont "do the part, but"
	cont "there's been some"
	cont "sightings of a big"
	cont "flying castle as"
	cont "of late."
	
	para "I'm worried about"
	line "the guardian gods!"
	cont "Please look into"
	cont "this, CHAMPION!"
	
	para "If you'd like more"
	line "details, please go"
	cont "to the home just"
	cont "outside of this"
	cont "building. My grand"
	cont "kid will handle"
	cont "the rest."
	
	para "I will let the"
	line "GUARD on the beach"
	cont "know to let you"
	cont "through."
	done

ShamoutiChiefText3:
	text "I can't thank you"
	line "enough, <PLAYER>!"
	
	para "The prophecy is"
	line "fulfilled, and"
	cont "all is well."
	
	para "Of course, I have"
	line "a reward for your"
	cont "troubles."
	done

ShamoutiChiefText4:
	text "That HM will let"
	line "you scale all"
	cont "kinds of walls!"
	
	para "I'm sure it will"
	line "come in handy!"
	done


ChiefSage1Script:
	jumptext ChiefSage1Text
	
ChiefSage1Text:
	text "<...>And she says"
	line "'No, but I have"
	cont "KRABBYs!' Wahaha!"
	done
	
ChiefSage2Script:
	jumptext ChiefSage2Text
	
ChiefSage2Text:
	text "Hehehe<...>"
	line "KRABBYs<...>"
	done

ChiefsHouse_MapEventHeader:

.Warps: db 2
	warp_def $7, $1, 4, SHAMOUTI_ISLAND
	warp_def $7, $2, 4, SHAMOUTI_ISLAND

.XYTriggers: db 0

.Signposts: db 0

.PersonEvents: db 3
	person_event SPRITE_GRAMPS,  4, 11, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ShamoutiChiefScript, -1
	person_event SPRITE_SAGE,  3,  2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ChiefSage1Script, -1
	person_event SPRITE_SAGE,  4,  5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ChiefSage2Script, -1
