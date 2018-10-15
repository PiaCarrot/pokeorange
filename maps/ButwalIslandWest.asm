ButwalIslandWest_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 2
	dbw MAPCALLBACK_NEWMAP, .InitializeDiveMap
	dbw MAPCALLBACK_TILES, ButwalIslandWestBridgeCallback

.InitializeDiveMap:
	divemap BUTWAL_ISLAND_UNDERWATER_WEST, -12, 2
	return
	
ButwalIslandWestBridgeCallback:
	checktriggers
	iftrue .underfoot
	callasm ButwalIslandWest_OverheadBridgeAsm
	return

.underfoot:
	callasm ButwalIslandWest_UnderfootBridgeAsm
	return

ButwalIslandWestBridgeOverheadTrigger:
	callasm ButwalIslandWest_OverheadBridgeAsm
	endbridgetrigger wButwalIslandWestTrigger, $0

ButwalIslandWestBridgeUnderfootTrigger:
	callasm ButwalIslandWest_UnderfootBridgeAsm
	endbridgetrigger wButwalIslandWestTrigger, $1

ButwalIslandWest_OverheadBridgeAsm:
	changebridgeblock 26, 4, $c0, BUTWAL_ISLAND_WEST
	changebridgeblock 26, 6, $c1, BUTWAL_ISLAND_WEST
	changebridgeblock 26, 8, $c1, BUTWAL_ISLAND_WEST
	changebridgeblock 26, 10, $c1, BUTWAL_ISLAND_WEST
	changebridgeblock 26, 12, $c2, BUTWAL_ISLAND_WEST
	endbridgeblocks

ButwalIslandWest_UnderfootBridgeAsm:
	changebridgeblock 26, 4, $b9, BUTWAL_ISLAND_WEST
	changebridgeblock 26, 6, $b4, BUTWAL_ISLAND_WEST
	changebridgeblock 26, 8, $b4, BUTWAL_ISLAND_WEST
	changebridgeblock 26, 10, $4c, BUTWAL_ISLAND_WEST
	changebridgeblock 26, 12, $ba, BUTWAL_ISLAND_WEST
	endbridgeblocks

ButwalIslandWest_MapEventHeader::

.Warps: db 0

.CoordEvents: db 3
	xy_trigger 1, 16, 26, ButwalIslandWestBridgeOverheadTrigger 
	xy_trigger 0, 17, 26, ButwalIslandWestBridgeUnderfootTrigger
	xy_trigger 0, 12, 30, ButwalIslandWestBridgeUnderfootTrigger

.BGEvents: db 0

.ObjectEvents: db 0

