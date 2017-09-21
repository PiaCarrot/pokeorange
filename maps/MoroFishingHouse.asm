const_value set 2

MoroFishingHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0
	
MoroFishingHouse_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 2, 3, MORO_ISLAND
	warp_def 7, 3, 3, MORO_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 0