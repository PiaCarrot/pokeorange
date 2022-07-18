const_value = 1

PiratesCove1F_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .InitializeDiveMap

.InitializeDiveMap:
	divemap PIRATES_COVE_UNDERWATER, 0, 0
	return
	
PiratesCove1F_MapEventHeader::

.Warps: db 1
	warp_def 17,  5, 1, PIRATES_COVE_2F

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 0