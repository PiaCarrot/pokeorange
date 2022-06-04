const_value = 1
	const PUMMELO_GATE_OFFICER

PummeloRoute70Gate_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

PummeloRoute70GateScript:
	jumptextfaceplayer PummeloRoute70GateText

PummeloRoute70GateText:
	text "Oh, CHAMPION!"
	
	para "The road is clear!"
	line "There were some"
	cont "pirates, but they"
	cont "went back to their"
	
	para "hideout!"
	done

PummeloRoute70Gate_MapEventHeader::

.Warps: db 5
	warp_def 4, 0, 13, PUMMELO_ISLAND
	warp_def 5, 0, 14, PUMMELO_ISLAND
	warp_def 4, 9, 1, ROUTE_70
	warp_def 5, 9, 2, ROUTE_70
	warp_def 2, 1, 1, ROUTE_70_GATE_UPSTAIRS

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, PummeloRoute70GateScript, -1
