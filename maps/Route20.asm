const_value set 2

Route20_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

CinnabarGymSign:
	jumptext CinnabarGymSignText

CinnabarGymSignText:
	text "What does this"
	line "sign say?"

	para "CINNABAR GYM"
	line "LEADER: BLAINE"
	done

Route20_MapEventHeader:: db 0, 0

.Warps: db 1
	warp_def 7, 38, 1, SEAFOAM_GYM

.CoordEvents: db 0

.BGEvents: db 1
	signpost 11, 37, SIGNPOST_READ, CinnabarGymSign

.ObjectEvents: db 0
