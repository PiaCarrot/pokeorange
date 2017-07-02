const_value set 2
	const KINNOWISLANDROUTE57GATE_OFFICER

KinnowIslandRoute57Gate_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

KinnowOfficerScript:
	jumptextfaceplayer KinnowOfficerText

KinnowOfficerText:
	text "Be careful out"
	line "there, kid."

	para "If you're headed"
	line "to NAVEL ISLAND,"
	cont "stock up on FULL"
	cont "HEAL."
	done

KinnowIslandRoute57Gate_MapEventHeader:: db 0, 0

.Warps: db 4
	warp_def 4, 0, 8, KINNOW_ISLAND
	warp_def 5, 0, 9, KINNOW_ISLAND
	warp_def 4, 9, 1, ROUTE_57
	warp_def 5, 9, 2, ROUTE_57

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, KinnowOfficerScript, -1