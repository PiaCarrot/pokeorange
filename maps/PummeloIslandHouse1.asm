const_value = 1

PummeloIslandHouse1_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

PummeloHouse1BlackbeltScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_PROTECTOR
	iftrue .AlreadyGotProtector
	writetext PummeloHouse1BlackbeltScriptText1
	waitbutton
	verbosegiveitem PROTECTOR
	iffalse PummeloHouse1BlackbeltDoneScript
	setevent EVENT_GOT_PROTECTOR
	closetext
	end
	
.AlreadyGotProtector:
	writetext PummeloHouse1BlackbeltScriptText2
	waitbutton
	closetext
	end
	
PummeloHouse1BlackbeltDoneScript:
	closetext
	end
	
PummeloHouse1BlackbeltScriptText1:
	text "Hah! Hua! Hee!"
	line "You!"
	cont "You are strong,"
	cont "like a RHYDON!"
	
	para "But you could be"
	line "even stronger!"
	cont "Take this!"
	done
	
PummeloHouse1BlackbeltScriptText2:
	text "Try to use that on"
	line "RHYDON."
	done

PummeloIslandHouse1_MapEventHeader:

.Warps: db 2
	warp_def $7, $3, 5, PUMMELO_ISLAND
	warp_def $7, $4, 5, PUMMELO_ISLAND

.XYTriggers: db 0

.Signposts: db 0

.PersonEvents: db 1
	person_event SPRITE_BLACK_BELT, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PummeloHouse1BlackbeltScript, -1