Underground_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

UndergroundHiddenFullRestore:
	dwb EVENT_UNDERGROUND_HIDDEN_FULL_RESTORE, FULL_RESTORE


UndergroundHiddenXSpecial:
	dwb EVENT_UNDERGROUND_HIDDEN_X_SPECIAL, X_SPECIAL


Underground_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 0

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 9, 3, SIGNPOST_ITEM, UndergroundHiddenFullRestore
	signpost 19, 1, SIGNPOST_ITEM, UndergroundHiddenXSpecial

.PersonEvents:
	db 0
