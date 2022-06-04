const_value = 1
	const ROUTE51TANGELOJUNGLEGATE_OFFICER

Route51TangeloJungleGate_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

OfficerScript_0x197634:
	jumptextfaceplayer UnknownText_0x19763a

UnknownText_0x19763a:
	text "Hi there!"
	line "Be careful in"
	cont "TANGELO JUNGLE."
	done

Route51TangeloJungleGate_MapEventHeader::

.Warps: db 5
	warp_def 4, 0, 2, TANGELO_JUNGLE
	warp_def 5, 0, 3, TANGELO_JUNGLE
	warp_def 4, 9, 1, ROUTE_51
	warp_def 5, 9, 2, ROUTE_51
	warp_def 2, 1, 1, ROUTE_51_GATE_UPSTAIRS

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, OfficerScript_0x197634, -1
