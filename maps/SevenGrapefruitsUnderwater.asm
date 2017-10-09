const_value set 1

SevenGrapefruitsUnderwater_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .InitializeDiveMap

.InitializeDiveMap:
	divemap SEVEN_GRAPEFRUITS, 2, 0
	return

SevenGrapefruitsUnderwater_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 0
