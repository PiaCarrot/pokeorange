const_value = 1
	const MORO_GATE_OFFICER

MoroRoute60Gate_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MoroOfficerScript:
	jumptextfaceplayer MoroOfficerText

MoroOfficerText:
	text "Hey there."

	para "From here, go west"
	line "to GOLDEN ISLAND."

	para "After that, you"
	line "can go south to"
	cont "various islands."
	done

MoroRoute60Gate_MapEventHeader::

.Warps: db 5
	warp_def 4, 0, 1, ROUTE_60
	warp_def 5, 0, 2, ROUTE_60
	warp_def 4, 9, 8, MORO_ISLAND
	warp_def 5, 9, 9, MORO_ISLAND
	warp_def 2, 1, 1, ROUTE_60_GATE_UPSTAIRS

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MoroOfficerScript, -1
