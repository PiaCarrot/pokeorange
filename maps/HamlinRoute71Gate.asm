const_value = 1
	const HAMLIN_ROUTE_71_GATE_OFFICER

HamlinRoute71Gate_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

HamlinRoute71OfficerScript:
	jumptextfaceplayer HamlinRoute71OfficerText

HamlinRoute71OfficerText:
	text "Hello!"
	line "Once you cross"
	cont "the bridge, the"
	cont "city of HAMLIN is"
	cont "just past!"
	done

HamlinRoute71Gate_MapEventHeader:

.Warps: db 4
	warp_def $0, $4, 1, HAMLIN_BRIDGE
	warp_def $0, $5, 2, HAMLIN_BRIDGE
	warp_def $7, $4, 1, ROUTE_71_EAST
	warp_def $7, $5, 1, ROUTE_71_EAST

.XYTriggers: db 0

.Signposts: db 0

.PersonEvents: db 1
	person_event SPRITE_OFFICER, 3, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, HamlinRoute71OfficerScript, -1
