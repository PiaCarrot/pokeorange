const_value set 1

ShamoutiIsland_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_SHAMOUTI
	return

ShamoutiIsland_MapEventHeader::

.Warps: db 0
.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 0