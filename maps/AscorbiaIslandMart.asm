const_value = 1
	const ASCORBIA_CLERK

AscorbiaIslandMart_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

AscorbiaClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_ASCORBIA
	closetext
	end

AscorbiaIslandMart_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 7, ASCORBIA_ISLAND
	warp_def 7, 3, 7, ASCORBIA_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_CLERK, 3, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AscorbiaClerkScript, -1