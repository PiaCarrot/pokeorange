WreckedShip_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .InitializeDiveMap

.InitializeDiveMap:
	divemap ROUTE_60, 0, 0
	return

WreckedShip_MapEventHeader::

.Warps: db 1
	warp_def 4, 12, 1, WRECKED_SHIP_UNDERWATER

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 0

