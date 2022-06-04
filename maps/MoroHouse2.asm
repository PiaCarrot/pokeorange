const_value = 1

MoroHouse2_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MoroSuperNerd:
	jumptextfaceplayer MoroSuperNerdText

MoroSuperNerdText:
	text "Whether you're a"
	line "tourist or a"
	cont "#MON trainer,"
	cont "check out the MORO"
	cont "ISLAND MUSEUM."
	done

MoroHouse2_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 6, MORO_ISLAND
	warp_def 7, 3, 6, MORO_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_SUPER_NERD, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, MoroSuperNerd, -1