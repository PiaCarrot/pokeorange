const_value set 2
	const UNNAMEDISLAND_NURSE
	const UNNAMEDISLAND_SLOUCH
	
UnnamedIsland1PokeCenter_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

UnnamedIslandNurseScript:
	jumpstd pokecenternurse
	
UnnamedIslandSlouchScript:
	opentext
	writetext UnnamedIslandSlouchText
	waitbutton
	closetext
	end
	
UnnamedIslandSlouchText:
	text "This island is a"
	line "part of the KINNOW"
	cont "ISLANDS, but has"
	cont "no official name."
	done

UnnamedIsland1PokeCenter_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 4, 1, UNNAMED_ISLAND_1
	warp_def 7, 5, 1, UNNAMED_ISLAND_1

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, UnnamedIslandNurseScript, -1
	person_event SPRITE_PC_SLOUCH, 4, 0, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, UnnamedIslandSlouchScript, -1

