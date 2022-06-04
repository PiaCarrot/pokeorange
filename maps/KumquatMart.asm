const_value = 1
	const KUMQUATMART_CLERK

KumquatMart_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

KumquatClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_KUMQUAT
	closetext
	end

KumquatMart_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 4, KUMQUAT_ISLAND_WEST
	warp_def 7, 3, 4, KUMQUAT_ISLAND_WEST

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_CLERK, 3, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KumquatClerkScript, -1