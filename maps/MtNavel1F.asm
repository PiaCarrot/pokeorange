MtNavel1F_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

MtNavel1FBoulder:
	jumpstd strengthboulder

MtNavel1F_MapEventHeader::

.Warps: db 4
	warp_def 25, 5, 1, NAVEL_ISLAND
	warp_def 7, 25, 2, NAVEL_ISLAND
	warp_def 17, 19, 1, MT_NAVEL_2F
	warp_def 9, 19, 2, MT_NAVEL_2F

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_BOULDER, 6, 21, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MtNavel1FBoulder, -1
