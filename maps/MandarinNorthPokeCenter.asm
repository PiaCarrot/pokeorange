const_value = 1
	const MANDARINNORTH_NURSE
	const MANDARINNORTH_TRAINER

MandarinNorthPokeCenter_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MandarinNoNurseScript:
	jumpstd pokecenternurse

MandarinNorthCooltrainerMScript:
	jumptextfaceplayer MandarinNorthCooltrainerMText

MandarinNorthCooltrainerMText:
	text "I came here to"
	line "stock up on GREAT"
	cont "BALLS."

	para "The #MON on"
	line "the waters past"
	cont "here are harder"
	cont "to capture."
	done

MandarinNorthPokeCenter_MapEventHeader::

.Warps: db 2
	warp_def 7, 4, 1, MANDARIN_NORTH
	warp_def 7, 5, 1, MANDARIN_NORTH

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MandarinNoNurseScript, -1
	person_event SPRITE_COOLTRAINER_M, 4, 6, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MandarinNorthCooltrainerMScript, -1
