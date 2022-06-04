const_value = 1
	const MOROMART_CLERK

MoroMart_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MoroClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_MORO
	closetext
	end

MoroMart_MapEventHeader:

.Warps: db 2
	warp_def 7, 2, 7, MORO_ISLAND
	warp_def 7, 3, 7, MORO_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_CLERK, 3, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MoroClerkScript, -1
