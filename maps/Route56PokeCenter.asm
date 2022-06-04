const_value = 1
	const ROUTE56_NURSE

Route56PokeCenter_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

Route56SightseerFScript:
	jumptextfaceplayer R56SightseerText

R56SightseerText:
	text "PINKAN ISLAND is"
	line "simply amazing!"

	para "I caught a PINK"
	line "PIKACHU there."
	cont "It's adorable!"
	done

Route56NurseScript:
	jumpstd pokecenternurse

Route56PokeCenter_MapEventHeader::

.Warps: db 2
	warp_def 7, 4, 1, ROUTE_56_WEST
	warp_def 7, 5, 1, ROUTE_56_WEST

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route56NurseScript, -1
	person_event SPRITE_SIGHTSEER_F, 5, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route56SightseerFScript, -1
