const_value = 1
	const HAMLIN_BRIDGE_GATE_OFFICER

HamlinBridgeGate_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

HamlinBridgeOfficerScript:
	jumptextfaceplayer HamlinBridgeOfficerText

HamlinBridgeOfficerText:
	text "Hmm?"
	
	para "Are you <PLAYER>?"
	line "Some kid was in"
	cont "here talking about"
	cont "you earlier."
	
	para "Looked just like"
	line "you, too!"
	done

HamlinBridgeGate_MapEventHeader:

.Warps: db 4
	warp_def $0, $4, 1, HAMLIN_ISLAND
	warp_def $0, $5, 2, HAMLIN_ISLAND
	warp_def $7, $4, 3, HAMLIN_BRIDGE
	warp_def $7, $5, 4, HAMLIN_BRIDGE

.XYTriggers: db 0

.Signposts: db 0

.PersonEvents: db 1
	person_event SPRITE_OFFICER, 3, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, HamlinBridgeOfficerScript, -1
