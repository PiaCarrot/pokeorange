const_value = 1
	const BROWN_CAT_MAN

GoldenIslandHouse2_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

CatManBrownScript:
	jumptextfaceplayer BrownCatManText

BrownCatManText:
	text "Meow! MEOWTH!"

	para "How was my MEOWTH"
	line "impression?"
	done

GoldenIslandHouse2_MapEventHeader::

.Warps: db 2
	warp_def 7, 3, 2, GOLDEN_ISLAND
	warp_def 7, 4, 2, GOLDEN_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_CAT_MAN, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 2, 2, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, CatManBrownScript, -1

