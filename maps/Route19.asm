const_value set 1

Route19_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

Route19Sign:
	jumptext Route19SignText

CarefulSwimmingSign:
	jumptext CarefulSwimmingSignText

Route19SignText:
	text "ROUTE 19"

	para "FUCHSIA CITY -"
	line "SEAFOAM ISLANDS"
	done

CarefulSwimmingSignText:
	text "Please be careful"
	line "if you are swim-"
	cont "ming to SEAFOAM"
	cont "ISLANDS."

	para "FUCHSIA POLICE"
	done

Route19_MapEventHeader:

.Warps: db 1
	warp_def $3, $7, 1, ROUTE_19___FUCHSIA_GATE

.XYTriggers: db 0

.Signposts: db 2
	signpost 13, 11, SIGNPOST_READ, Route19Sign
	signpost 1, 11, SIGNPOST_READ, CarefulSwimmingSign

.PersonEvents: db 0
