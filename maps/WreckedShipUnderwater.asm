WreckedShipUnderwater_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .InitializeDiveMap

.InitializeDiveMap:
	divemap WRECKED_SHIP_UNSUNK, 0, 0
	return

WreckedShipUnderwater_MapEventHeader::

.Warps: db 7
	warp_def 21, 4, 1, WRECKED_SHIP
	warp_def 21, 5, 1, WRECKED_SHIP
	warp_def 16, 3, 4, WRECKED_SHIP_UNDERWATER
	warp_def 8, 5, 3, WRECKED_SHIP_UNDERWATER
	warp_def 15, 18, 6, WRECKED_SHIP_UNDERWATER
	warp_def 7, 18, 5, WRECKED_SHIP_UNDERWATER
	warp_def 7, 19, 5, WRECKED_SHIP_UNDERWATER

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 0

