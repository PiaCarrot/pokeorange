const_value set 1
	const MURCOTT_CLERK

MurcottPokeMart_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MurcottClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_MURCOTT
	closetext
	end

MurcottPokeMart_MapEventHeader:

.Warps: db 2
	warp_def $7, $2, 8, MURCOTT_ISLAND
	warp_def $7, $3, 8, MURCOTT_ISLAND

.XYTriggers: db 0

.Signposts: db 0

.PersonEvents: db 3
	person_event SPRITE_CLERK, 3, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MurcottClerkScript, -1
