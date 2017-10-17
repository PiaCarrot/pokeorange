WreckedShipUnsunk_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .InitializeDiveMap

.InitializeDiveMap:
	divemap WRECKED_SHIP_UNDERWATER, 0, 0
	return

WreckedShipUnsunk_MapEventHeader::

.Warps: db 3
	warp_def 15, 18, 3, WRECKED_SHIP_UNSUNK
	warp_def 9, 4, 1, WRECKED_SHIP_UNSUNK
	warp_def 9, 5, 1, WRECKED_SHIP_UNSUNK

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 0