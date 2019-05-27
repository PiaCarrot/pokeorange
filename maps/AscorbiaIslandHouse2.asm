AscorbiaIslandHouse2_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

AscorbiaArtistLadyDayScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_ILLUSTRATOR_PIKACHU
	iftrue .AlreadyGotIllustratorPikachu
	writetext AscorbiaArtistLadyDayText
	waitbutton
	closetext
	end
	
.AlreadyGotIllustratorPikachu:
	writetext AscorbiaArtistLadyDayGotPikachuText
	waitbutton
	closetext
	end
	
AscorbiaArtistLadyDayText:
	text "Hello, dearie."
	
	para "Have you heard of"
	line "the amazing artist"
	cont "that lives here?"
	
	para "No one has claimed"
	line "to have ever seen"
	cont "them painting."
	done
	
AscorbiaArtistLadyDayGotPikachuText:
	text "Hello again, dear."
	
	para "How is PIKACHU"
	line "doing? I hope it"
	cont "gets out of its"
	cont "creative block."
	done

AscorbiaIslandHouse2_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 6, ASCORBIA_ISLAND
	warp_def 7, 3, 6, ASCORBIA_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_GRANNY, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, (1 << MORN) | (1 << DAY), 0, PERSONTYPE_SCRIPT, 0, AscorbiaArtistLadyDayScript, -1

