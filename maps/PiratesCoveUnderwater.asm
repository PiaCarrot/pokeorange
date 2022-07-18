const_value = 1

PiratesCoveUnderwater_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .InitializeDiveMap

.InitializeDiveMap:
	divemap PIRATES_COVE_1F, 0, 0
	return
	
PiratesCoveUnderwater_MapEventHeader::

.Warps: db 1
	warp_def 17, 15, 1, ROUTE_71_UNDERWATER

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 0