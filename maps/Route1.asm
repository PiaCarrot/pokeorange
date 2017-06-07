const_value set 2

Route1_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

Route1Sign:
	jumptext Route1SignText

Route1SignText:
	text "ROUTE 1"

	para "PALLET TOWN -"
	line "VIRIDIAN CITY"
	done

Route1_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 0

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 27, 7, SIGNPOST_READ, Route1Sign

.PersonEvents:
	db 0
