const_value set 2

MoroHouse2_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0
	
MoroHouse2_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 7, 2, 6, MORO_ISLAND
	warp_def 7, 3, 6, MORO_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 0