const_value = 1

TarrocoIsland_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_TILES, TarrocoIslandBridgeCallback
	
TarrocoIslandBridgeCallback:
	checktriggers
	iftrue .underfoot
	callasm TarrocoIsland_OverheadBridgeAsm
	return

.underfoot:
	callasm TarrocoIsland_UnderfootBridgeAsm
	return

TarrocoIslandBridgeOverheadTrigger:
	callasm TarrocoIsland_OverheadBridgeAsm
	endbridgetrigger wTarrocoIslandTrigger, $0

TarrocoIslandBridgeUnderfootTrigger:
	callasm TarrocoIsland_UnderfootBridgeAsm
	endbridgetrigger wTarrocoIslandTrigger, $1

TarrocoIsland_OverheadBridgeAsm:
	changebridgeblock 30, 8, $ed, TARROCO_ISLAND
	changebridgeblock 30, 10, $c1, TARROCO_ISLAND
	changebridgeblock 30, 12, $c1, TARROCO_ISLAND
	changebridgeblock 30, 14, $c1, TARROCO_ISLAND
	changebridgeblock 30, 16, $c2, TARROCO_ISLAND
	endbridgeblocks

TarrocoIsland_UnderfootBridgeAsm:
	changebridgeblock 30, 8, $eb, TARROCO_ISLAND
	changebridgeblock 30, 10, $4c, TARROCO_ISLAND
	changebridgeblock 30, 12, $4c, TARROCO_ISLAND
	changebridgeblock 30, 14, $4c, TARROCO_ISLAND
	changebridgeblock 30, 16, $ba, TARROCO_ISLAND
	endbridgeblocks

TarrocoIsland_MapEventHeader::

.Warps: db 0
.CoordEvents: db 2
	xy_trigger 1, 15, 14, TarrocoIslandBridgeOverheadTrigger 
	xy_trigger 0, 15, 15, TarrocoIslandBridgeUnderfootTrigger

.BGEvents: db 0

.ObjectEvents: db 0