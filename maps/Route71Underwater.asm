const_value = 1

Route71Underwater_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .InitializeDiveMap

.InitializeDiveMap:
	divemap ROUTE_71, -6, 2
	return
	
Route71Underwater_MapEventHeader::

.Warps: db 1
	warp_def 5, 9, 1, PIRATES_COVE_UNDERWATER

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 0