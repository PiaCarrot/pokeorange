const_value = 1

HamlinIsland_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_HAMLIN
	return

HamlinIsland_MapEventHeader::

.Warps: db 0
.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 0