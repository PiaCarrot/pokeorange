const_value set 2

IcePathB2FBlackthornSide_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

IcePathB2FBlackthornSide_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $f, $3, 8, ICE_PATH_B1F
	warp_def $3, $3, 2, ICE_PATH_B3F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 0
