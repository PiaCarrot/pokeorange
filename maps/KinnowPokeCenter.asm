const_value set 2
	const KINNOW_NURSE
	
KinnowPokeCenter_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

KinnowNurseScript:
	jumpstd pokecenternurse

KinnowPokeCenter_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 3, 4, KINNOW_ISLAND
	warp_def 7, 4, 4, KINNOW_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_NURSE, 1, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KinnowNurseScript, -1
