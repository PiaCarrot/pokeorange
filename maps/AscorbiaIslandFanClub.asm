const_value = 1
	const ASCORBIA_FAN_CLUB_PRESIDENT
	const ASCORBIA_FAN_CLUB_MEMBER_1
	const ASCORBIA_FAN_CLUB_MEMBER_2
	const ASCORBIA_FAN_CLUB_FEAROW
	const ASCORBIA_FAN_CLUB_MEMBER_3

AscorbiaIslandFanClub_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

AscorbiaFanClubPresidentScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM_19_FROM_FAN_CLUB
	iftrue .AlreadyGotTM19
	writetext AscorbiaFanClubPresidentText1
	yesorno
	iftrue .AscorbiaFanClubPresYes1
	writetext AscorbiaFanClubPresidentTextNo
	waitbutton
	closetext
	end
	
.AscorbiaFanClubPresYes1:
	writetext AscorbiaFanClubPresidentText2
	yesorno
	iftrue .AscorbiaFanClubPresYes2
	writetext AscorbiaFanClubPresidentTextNo
	waitbutton
	closetext
	end
	
.AscorbiaFanClubPresYes2:
	writetext AscorbiaFanClubPresidentText3
	yesorno
	iftrue .AscorbiaFanClubPresYes3
	writetext AscorbiaFanClubPresidentTextNo
	waitbutton
	closetext
	end
	
.AscorbiaFanClubPresYes3:
	writetext AscorbiaFanClubPresidentText4
	waitbutton
	verbosegiveitem TM_GIGA_DRAIN
	closetext
	setevent EVENT_GOT_TM_19_FROM_FAN_CLUB
	end
	
.AlreadyGotTM19:
	writetext AscorbiaFanClubPresidentText5
	waitbutton
	closetext
	end

AscorbiaFanClubPresidentText1:
	text "Hey there!"
	
	para "So, do you know"
	line "about EXEGGUTOR?"
	
	para "Don't you love how"
	line "long its neck is?"
	done
	
AscorbiaFanClubPresidentText2:
	text "Oh, yes! Yes! It's"
	line "magnificent."
	
	para "Now, tell me! What"
	line "about the fourth"
	cont "head on its tail?"
	
	para "Isn't it so cute?"
	done
	
AscorbiaFanClubPresidentText3:
	text "Isn't it though?"
	
	para "Now, tell me! Don't"
	line "you just love how"
	cont "green its fronds"
	cont "are?"
	done
	
AscorbiaFanClubPresidentText4:
	text "Oh, so green!"
	
	para "Thank you for tak-"
	line "ing the time to"
	cont "talk to me about"
	cont "EXEGGUTOR!"
	
	para "Here's a gift from"
	line "one #MON fan"
	cont "to another!"
	done
	
AscorbiaFanClubPresidentTextNo:
	text "Oh, I see. Sorry"
	line "to bother you."
	done
	
AscorbiaFanClubPresidentText5:
	text "Why, hello again!"
	line "I hope you meet"
	cont "many more #MON!"
	done
	
AscorbiaFanClubFearowScript:
	opentext
	writetext FearowText
	cry FEAROW
	waitbutton
	closetext
	end
	
FearowText:
	text "Fraaah!"
	done
	
AscorbiaFanClubRockerScript:
	jumptextfaceplayer AscorbiaFanClubRockerText
	
AscorbiaFanClubRockerText:
	text "FEAROW learns a"
	line "strong FLYING"
	cont "type move called"
	cont "DRILL PECK!"
	done
	
AscorbiaFanClubFisherScript:
	jumptextfaceplayer AscorbiaFanClubFisherText
	
AscorbiaFanClubFisherText:
	text "Do you know about"
	line "the LINK CABLE?"
	
	para "Some #MON only"
	line "evolve by trade,"
	cont "but LINK CABLE"
	cont "ignores that!"
	done
	
AscorbiaFanClubLassScript:
	jumptextfaceplayer AscorbiaFanClubLassText
	
AscorbiaFanClubLassText:
	text "Have you heard of"
	line "a MASTER BALL?"
	
	para "Apparently, if you"
	line "get one of those,"
	cont "you can catch any"
	cont "#MON!"
	
	para "If I had that, I'd"
	line "use it on a rare"
	cont "#MON like FEAR-"
	cont "OW or TENTACRUEL!"
	done

AscorbiaIslandFanClub_MapEventHeader::

.Warps: db 2
	warp_def 9, 15, 3, ASCORBIA_ISLAND
	warp_def 9, 16, 3, ASCORBIA_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 5
	person_event SPRITE_GENTLEMAN, 1, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AscorbiaFanClubPresidentScript, -1
	person_event SPRITE_FISHER, 4, 13, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AscorbiaFanClubFisherScript, -1
	person_event SPRITE_ROCKER, 7, 12, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AscorbiaFanClubRockerScript, -1
	person_event SPRITE_FEAROW, 8, 12, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BROWN, 0, 0, AscorbiaFanClubFearowScript, -1
	person_event SPRITE_LASS, 5, 18, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AscorbiaFanClubLassScript, -1

