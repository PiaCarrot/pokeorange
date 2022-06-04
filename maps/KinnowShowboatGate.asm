const_value = 1
	const KINNOWSHOWBOATGATE_OFFICER

KinnowShowboatGate_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

KinnowShowboatOfficerScript:
	jumptextfaceplayer KinnowShowboatOfficerScriptText

KinnowShowboatOfficerScriptText:
	text "There's a boat"
	line "docked at shore."
	
	para "I heard there's"
	line "some really strong"
	cont "trainers on it."
	done

KinnowShowboatGate_MapEventHeader:

.Warps: db 4
	warp_def $0, $4, 10, KINNOW_ISLAND
	warp_def $0, $5, 11, KINNOW_ISLAND
	warp_def $7, $4, 1, KINNOW_SHOWBOAT
	warp_def $7, $5, 1, KINNOW_SHOWBOAT

.XYTriggers: db 0

.Signposts: db 0

.PersonEvents: db 1
	person_event SPRITE_OFFICER, 3, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, KinnowShowboatOfficerScript, -1
