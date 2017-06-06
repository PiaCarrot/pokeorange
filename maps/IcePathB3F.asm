const_value set 2

IcePathB3F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

IcePathB3F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $5, $3, 2, ICE_PATH_B2F_MAHOGANY_SIDE
	warp_def $5, $f, 2, ICE_PATH_B2F_BLACKTHORN_SIDE

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 0
