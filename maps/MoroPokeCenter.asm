const_value = 1
	const MORO_NURSE
	const MORO_SLOUCH

MoroPokeCenter_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MoroNurseScript:
	jumpstd pokecenternurse

MoroSlouchScript:
	opentext
	writetext MoroSlouchText
	waitbutton
	closetext
	end

MoroSlouchText:
	text "Some say wrecked"
	line "ships are haunted"
	cont "by ghosts."
	done

MoroCenterPokefanMScript:
	jumptextfaceplayer MoroCenterPokefanText

MoroCenterPokefanText:
	text "Yawn<...>"

	para "Isn't SLOWPOKE"
	line "adorable?"
	done

MoroPokeCenter_MapEventHeader::

.Warps: db 2
	warp_def 7, 4, 2, MORO_ISLAND
	warp_def 7, 5, 2, MORO_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MoroNurseScript, -1
	person_event SPRITE_POKEFAN_M, 5, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MoroCenterPokefanMScript, -1
	person_event SPRITE_PC_SLOUCH, 4, 0, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MoroSlouchScript, -1
