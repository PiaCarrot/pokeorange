const_value = 1

Route71Underwater_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .InitializeDiveMap

.InitializeDiveMap:
	divemap ROUTE_71, 0, 0
	return
	
Route71Underwater_MapEventHeader::

.Warps: db 1
	warp_def  5, 35, 1, PIRATES_COVE_UNDERWATER

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_SAILOR, 12, 39, SPRITEMOVEDATA_STANDING_UP, 2, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, 0, -1
