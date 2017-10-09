const_value set 1

Route15_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

Route15Sign:
	jumptext Route15SignText

Route15SignText:
	text "ROUTE 15"

	para "FUCHSIA CITY -"
	line "LAVENDER TOWN"
	done

Route15_MapEventHeader:

.Warps: db 0

.XYTriggers: db 0

.Signposts: db 1
	signpost 9, 19, SIGNPOST_READ, Route15Sign

.PersonEvents: db 0
