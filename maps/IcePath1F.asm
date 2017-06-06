const_value set 2

IcePath1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

IcePath1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $5, $25, 1, ICE_PATH_B1F
	warp_def $d, $25, 7, ICE_PATH_B1F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 0
