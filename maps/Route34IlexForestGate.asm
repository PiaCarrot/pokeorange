const_value set 2
	const ROUTE34ILEXFORESTGATE_BUG_BOY

Route34IlexForestGate_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TeacherScript_0x62d63:
	jumptextfaceplayer UnknownText_0x62d9d

UnknownText_0x62d9d:
	text "You'll have to"
	line "cross the ocean"
	cont "to get to MIKAN"
	cont "ISLAND."
	done
	
Route34IlexForestGate_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $0, $4, 2, ROUTE_32
	warp_def $0, $5, 3, ROUTE_32
	warp_def $7, $4, 1, ILEX_FOREST
	warp_def $7, $5, 1, ILEX_FOREST

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 2
	person_event SPRITE_OFFICER, 3, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TeacherScript_0x62d63, -1
