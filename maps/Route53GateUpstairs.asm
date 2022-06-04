const_value = 1

Route53GateUpstairs_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MikanBinoculars1:
	jumptext MikanBinoculars1Text

MikanBinoculars1Text:
	text "Wow! A lot of"
	line "MAGIKARP are trav-"
	cont "eling in a school."
	done

MikanBinoculars2:
	jumptext MikanBinoculars2Text

MikanBinoculars2Text:
	text "Hmm<...>"

	para "This one doesn't"
	line "work!"
	done

Route53GateUpstairs_MapEventHeader::

.Warps: db 1
	warp_def 3, 0, 5, MIKAN_ISLAND_ROUTE_53_GATE

.CoordEvents: db 0

.BGEvents: db 2
	signpost 4, 4, SIGNPOST_UP, MikanBinoculars1
	signpost 4, 6, SIGNPOST_UP, MikanBinoculars2

.ObjectEvents: db 0
