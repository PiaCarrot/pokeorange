const_value = 1
	const SHAMOUTIMART_CLERK

ShamoutiMart_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

ClerkScript_Shamouti:
	opentext
	pokemart MARTTYPE_STANDARD, MART_PUMMELO
	closetext
	end

ShamoutiMart_MapEventHeader:

.Warps: db 2
	warp_def $7, $2, 3, SHAMOUTI_ISLAND
	warp_def $7, $3, 3, SHAMOUTI_ISLAND

.XYTriggers: db 0

.Signposts: db 0

.PersonEvents: db 1
	person_event SPRITE_CLERK, 3, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ClerkScript_Shamouti, -1