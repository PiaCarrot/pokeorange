const_value set 1
	const MURCOTT_NURSE
	const MURCOTT_SLOUCH

MurcottPokeCenter_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MurcottNurseScript:
	jumpstd pokecenternurse

MurcottSlouchScript:
	opentext
	writetext MurcottSlouchText
	waitbutton
	closetext
	end

MurcottSlouchText:
	text "Go upstairs in a"
	line "GATEHOUSE and look"
	cont "into the binocul-"
	cont "ars."
	done
	
MurcottSightseerScript:
	jumptextfaceplayer MurcottSightseerText
	
MurcottSightseerText:
	text "The southern is-"
	line "lands are rather"
	cont "quaint, don't you"
	cont "think?"
	
	para "I can't wait until"
	line "I get to KUMQUAT"
	cont "or TROVITOPOLIS."
	
	para "Huge malls, five-"
	line "star hotels, and"
	cont "the best beaches!"
	done
	
MurcottPokeCenter_MapEventHeader::

.Warps: db 2
	warp_def 7, 4, 7, MURCOTT_ISLAND
	warp_def 7, 5, 7, MURCOTT_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MurcottNurseScript, -1
	person_event SPRITE_PC_SLOUCH, 4, 0, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MurcottSlouchScript, -1
	person_event SPRITE_SIGHTSEER_F, 6, 7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MurcottSightseerScript, -1

