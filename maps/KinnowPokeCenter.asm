const_value set 2
	const KINNOW_NURSE
	
KinnowPokeCenter_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

KinnowNurseScript:
	jumpstd pokecenternurse
	
KinnowGameboyKidScript:
	jumptextfaceplayer KinnowGBKidText
	
KinnowGBKidText:
	text "Why are there no"
	line "trade centers?"
	
	para "There is one, in"
	line "TROVITOPOLIS."
	done

KinnowPokeCenter_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 3, 4, KINNOW_ISLAND
	warp_def 7, 4, 4, KINNOW_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_NURSE, 1, 3, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KinnowNurseScript, -1
	person_event SPRITE_GAMEBOY_KID, 5, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KinnowGameboyKidScript, -1

