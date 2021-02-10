KinnowShowboat_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

KinnowShowboatSign:
	jumptext KinnowShowboatSignText
	
KinnowShowboatSignText:
	text "#MON SHOWBOAT"
	line "For the best"
	cont "challenge, come"
	cont "back after every"
	
	para "BADGE you get!"
	done

KinnowShowboat_MapEventHeader::

.Warps: db 3
	warp_def  5,  9, 3, KINNOW_SHOWBOAT_GATE
	warp_def  5, 17, 1, KINNOW_SHOWBOAT_HOUSE
	warp_def 11, 10, 1, KINNOW_SHOWBOAT_INSIDE

.CoordEvents: db 0

.BGEvents: db 1
	signpost  8,  8, SIGNPOST_READ, KinnowShowboatSign

.ObjectEvents: db 0

