const_value = 1
	const PUMMELO_CLERK
	const PUMMELO_CLERK_OFFICER

PummeloMart_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

PummeloClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_PUMMELO
	closetext
	end
	
PummeloClerkGiftScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_ITEMFINDER
	iftrue .AlreadyGotItemfinder
	writetext PummeloClerkGiftScriptText1
	waitbutton
	verbosegiveitem ITEMFINDER
	setevent EVENT_GOT_ITEMFINDER
	closetext
	end
	
.AlreadyGotItemfinder:
	writetext PummeloClerkGiftScriptText2
	waitbutton
	closetext
	end

PummeloClerkGiftScriptText1:
	text "Trainers leave"
	line "litter all over"
	cont "the place. Be a"
	cont "dear and help us"
	
	para "clean up the"
	line "ARCHIPELAGO with"
	cont "this?"
	done
	
PummeloClerkGiftScriptText2:
	text "The ITEMFINDER"
	line "will help you see"
	cont "HIDDEN items."
	done

PummeloMart_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 12, PUMMELO_ISLAND
	warp_def 7, 3, 12, PUMMELO_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_CLERK, 3, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PummeloClerkScript, -1
	person_event SPRITE_OFFICER, 5, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PummeloClerkGiftScript, -1