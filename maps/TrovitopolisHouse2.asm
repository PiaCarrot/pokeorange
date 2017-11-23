const_value set 1
	
TrovitopolisHouse2_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

TrovitopolisHouse2_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 8, TROVITOPOLIS
	warp_def 7, 3, 8, TROVITOPOLIS

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_POKEFAN_F, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 2, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TrovitopolisPokeFanFScript, -1