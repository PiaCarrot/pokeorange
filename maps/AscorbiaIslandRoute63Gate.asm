const_value = 1
	const ASCORBIA_GATE_OFFICER

AscorbiaIslandRoute63Gate_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

AscorbiaOfficerScript:
	jumptextfaceplayer AscorbiaOfficerText

AscorbiaOfficerText:
	text "There isn't much"
	line "going on around"
	cont "these parts."
	
	para "I've heard of some"
	line "TEAM ROCKETS show-"
	cont "ing themselves"
	cont "around the ORANGE"
	cont "ISLANDS, though."
	done
	
AscorbiaGateGuyScript:
	jumptextfaceplayer AscorbiaGateGuyText
	
AscorbiaGateGuyText:
	text "That island breeze"
	line "is something that"
	cont "I'll never get"
	cont "tired of!"
	
	para "Listen, kiddo."
	line "From here you'll"
	cont "see a lot of hills"
	cont "and mountains!"
	done

AscorbiaIslandRoute63Gate_MapEventHeader:

.Warps: db 4
	warp_def $0, $4, 1, ASCORBIA_ISLAND
	warp_def $0, $5, 2, ASCORBIA_ISLAND
	warp_def $7, $4, 1, ROUTE_63_NORTH_SOUTH
	warp_def $7, $5, 1, ROUTE_63_NORTH_SOUTH

.XYTriggers: db 0

.Signposts: db 0

.PersonEvents: db 2
	person_event SPRITE_OFFICER, 3, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, AscorbiaOfficerScript, -1
	person_event SPRITE_POKEFAN_M, 4, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, AscorbiaGateGuyScript, -1
