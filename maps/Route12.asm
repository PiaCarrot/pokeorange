const_value set 2

Route12_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

Route12Sign:
	jumptext Route12SignText

FishingSpotSign:
	jumptext FishingSpotSignText

Route12SignText:
	text "ROUTE 12"

	para "NORTH TO LAVENDER"
	line "TOWN"
	done

FishingSpotSignText:
	text "FISHING SPOT"
	done

Route12_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 1
	warp_def $21, $b, 1, ROUTE_12_SUPER_ROD_HOUSE

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 27, 11, SIGNPOST_READ, Route12Sign
	signpost 9, 13, SIGNPOST_READ, FishingSpotSign

.PersonEvents:
	db 0
