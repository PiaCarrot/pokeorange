const_value set 1

ShamoutiIsland_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_SHAMOUTI
	return
	
ShamoutiKimonoGirl1Script:
	jumptextfaceplayer ShamoutiKimonoGirl1ScriptText
	
ShamoutiKimonoGirl1ScriptText:
	text "These lights are"
	line "in honor of the"
	cont "god of the sea!"
	done
	
ShamoutiKimonoGirl2Script:
	jumptextfaceplayer ShamoutiKimonoGirl2ScriptText
	
ShamoutiKimonoGirl2ScriptText:
	text "Every summer, we"
	line "give honor to the"
	cont "guardian deities"
	cont "of SHAMOUTI!"
	done
	
ShamoutiKimonoGirl3Script:
	jumptextfaceplayer ShamoutiKimonoGirl3ScriptText


ShamoutiKimonoGirl3ScriptText:
	text "ARTICUNO, ZAPDOS,"
	line "MOLTRES."
	
	para "Those are the gods"
	line "of ice, lightning,"
	cont "and fire!"
	
	para "There is a fourth"
	line "god, but I don't"
	cont "know its name."
	done
	
ShamoutiSage1Script:
	jumptextfaceplayer ShamoutiSage1ScriptText

ShamoutiSage1ScriptText:
	text "The bamboo leaves"
	line "rustle, shakin'"
	cont "away in the eaves!"
	
	para "Hic! The stars"
	line "twinkle, gold and"
	cont "silver grains of"
	cont "sand<...>"
	
	para "ZZZ<...>"
	
	para "He appears to have"
	line "fallen asleep"
	cont "while singing."
	done
	
ShamoutiSage2Script:
	jumptextfaceplayer ShamoutiSage2ScriptText

ShamoutiSage2ScriptText:
	text "I brewed a special"
	line "batch of sake for"
	cont "this festival<...>"
	
	para "Hic!"
	
	para "It's good<...>"
	done	

ShamoutiSage3Script:
	jumptextfaceplayer ShamoutiSage3ScriptText

ShamoutiSage3ScriptText:
	text "A tourist at this"
	line "time of the year!"
	
	para "You're just in"
	line "time for the"
	cont "Legend Festival!"
	
	para "We were looking"
	line "for a trainer to"
	cont "fill the role of"
	cont "our tradition."
	
	para "Interested?"
	line "Go see the CHIEF"
	cont "on the north side"
	cont "of town."
	done
	
ShamoutiBlackbelt1Script:
	jumptextfaceplayer ShamoutiBlackbelt1ScriptText

ShamoutiBlackbelt1ScriptText:
	text "This cave leads"
	line "to the SHAMOUTI"
	cont "SHRINE."
	
	para "Pay your respects,"
	line "if you've got the"
	cont "time!"
	done
	
ShamoutiBlackbelt2Script:
	jumptextfaceplayer ShamoutiBlackbelt2ScriptText

ShamoutiBlackbelt2ScriptText:
	text "So many lights!"
	line "We have to make"
	cont "a ton of paper"
	cont "lanterns every"
	cont "year!"
	done

ShamoutiIsland_MapEventHeader::

.Warps: db 0
.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 8
	person_event SPRITE_KIMONO_GIRL,  8, 24, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ShamoutiKimonoGirl1Script, -1
	person_event SPRITE_KIMONO_GIRL, 13, 23, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ShamoutiKimonoGirl2Script, -1
	person_event SPRITE_KIMONO_GIRL, 13, 22, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ShamoutiKimonoGirl3Script, -1
	person_event SPRITE_SAGE,  6, 28, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ShamoutiSage1Script, -1
	person_event SPRITE_SAGE,  6, 29, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ShamoutiSage2Script, -1
	person_event SPRITE_BLACK_BELT, 10, 14, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ShamoutiBlackbelt1Script, -1
	person_event SPRITE_BLACK_BELT, 14,  8, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ShamoutiBlackbelt2Script, -1
	person_event SPRITE_SAGE, 15, 14, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ShamoutiSage3Script, -1
