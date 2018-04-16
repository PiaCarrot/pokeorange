const_value set 1
	const MANDARINUNDERGROUND_ENGINEER1
	const MANDARINUNDERGROUND_ENGINEER2

MandarinUndergroundBF1_MapScriptHeader::

.MapTriggers: db 0

.MapCallbacks: db 0

MandarinUndergroundBF1_MapEventHeader::

.Warps: db 3
	warp_def 4, 3, 3, MANDARIN_UNDERGROUND_ENTRANCE
	warp_def 2, 11, 1, MANDARIN_UNDERGROUND_BF2
	warp_def 12, 6, 4, MANDARIN_UNDERGROUND_ENTRANCE

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_SUPER_NERD, 7, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 2, ObjectEvent, -1
	person_event SPRITE_SUPER_NERD, 1, 5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 2, ObjectEvent, -1
