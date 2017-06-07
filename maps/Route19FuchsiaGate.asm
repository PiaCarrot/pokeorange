const_value set 2
	const ROUTE19FUCHSIAGATE_OFFICER

Route19FuchsiaGate_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

OfficerScript_0x1ab3f6:
	jumptextfaceplayer UnknownText_0x1ab40a

UnknownText_0x1ab40a:
	text "CINNABAR's volcano"
	line "erupted."

	para "It hurled boulders"
	line "that cut off ROUTE"
	cont "19 indefinitely."

	para "I wonder if the"
	line "people of CINNABAR"
	cont "are safe<...>"
	done

Route19FuchsiaGate_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $4, 1, ROUTE_19
	warp_def $7, $5, 1, ROUTE_19

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_OFFICER, 4, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OfficerScript_0x1ab3f6, -1
