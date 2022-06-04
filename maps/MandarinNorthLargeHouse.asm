const_value = 1
	const MANDARINNORTHLARGEHOUSE_OLDMAN

MandarinNorthLargeHouse_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MandarinNorthOldManScript:
	jumptextfaceplayer MandarinNorthOldManText

MandarinNorthOldManText:
	text "Used to be lots of"
	line "people here."

	para "Tourism died down"
	line "on the southwest"
	cont "ORANGE ISLANDS in"
	cont "recent years."

	para "Now, it's just us"
	line "and the #MON."
	done

MandarinNorthLargeHouse_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 4, MANDARIN_NORTH
	warp_def 7, 3, 4, MANDARIN_NORTH

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_GRAMPS, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 2, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MandarinNorthOldManScript, -1
