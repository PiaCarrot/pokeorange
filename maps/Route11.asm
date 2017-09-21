const_value set 2

Route11_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

Route11Sign:
	jumptext Route11SignText

Route11SignText:
	text "ROUTE 11"
	done

Route11_MapEventHeader:

.Warps: db 0

.XYTriggers: db 0

.Signposts: db 1
	signpost 7, 3, SIGNPOST_READ, Route11Sign

.PersonEvents: db 0
