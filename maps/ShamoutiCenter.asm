const_value = 1
	const SHAMOUTI_NURSE

ShamoutiCenter_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

ShamoutiNurseScript:
	jumpstd pokecenternurse

ShamoutiCenter_MapEventHeader::

.Warps: db 2
	warp_def 7, 4, 2, SHAMOUTI_ISLAND
	warp_def 7, 5, 2, SHAMOUTI_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ShamoutiNurseScript, -1