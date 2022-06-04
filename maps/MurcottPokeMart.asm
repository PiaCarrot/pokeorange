const_value = 1
	const MURCOTT_CLERK

MurcottPokeMart_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MurcottClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_MURCOTT
	closetext
	end
	
MurcottYoungsterScript:
	jumptextfaceplayer MurcottYoungsterText
	
MurcottYoungsterText:
	text "Hey, there."
	
	para "If you plan on"
	line "going to ROUTE 62,"
	cont "keep an eye out"
	cont "for SALANDIT."
	
	para "They can poison"
	line "your #MON!"
	done

MurcottPokeMart_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 6, MURCOTT_ISLAND
	warp_def 7, 3, 6, MURCOTT_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_CLERK, 3, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MurcottClerkScript, -1
	person_event SPRITE_YOUNGSTER, 6, 7, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, MurcottYoungsterScript, -1

