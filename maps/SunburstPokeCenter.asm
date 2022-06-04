const_value = 1
	const SUNBURST_NURSE
	const SUNBURST_TRAINER

SunburstPokeCenter_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

SunburstNurseScript:
	jumpstd pokecenternurse

SunburstLassScript:
	jumptextfaceplayer SunburstLassText

SunburstLassText:
	text "There used to be a"
	line "man who lived here"
	cont "named MATEO."

	para "He used to make"
	line "glass sculptures"
	cont "in his shop on the"
	cont "small island west"
	cont "of here."

	para "He left because"
	line "business here died"
	cont "and customers quit"
	cont "coming."
	done

SunburstPokeCenter_MapEventHeader::

.Warps: db 2
	warp_def 7, 4, 2, SUNBURST_ISLAND
	warp_def 7, 5, 2, SUNBURST_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SunburstNurseScript, -1
	person_event SPRITE_LASS, 4, 6, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 2, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, SunburstLassScript, -1
