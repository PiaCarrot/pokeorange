const_value set 2
	const KINNOWMART_CLERK

KinnowMart_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

KinnowClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_MANDARIN_NORTH
	closetext
	end

KinnowMart_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 2, 5, KINNOW_ISLAND
	warp_def 7, 3, 5, KINNOW_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_CLERK, 3, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KinnowClerkScript, -1
