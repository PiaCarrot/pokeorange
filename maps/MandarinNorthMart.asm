const_value = 1
	const MANDARINNORTHMART_CLERK
	const MANDARINNORTHMART_GRANNY

MandarinNorthMart_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MandarinNorthClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_MANDARIN_NORTH
	closetext
	end

MandarinNorthGrannyScript:
	jumptextfaceplayer MandarinNorthGrannyText

MandarinNorthGrannyText:
	text "They started to"
	line "carry GREAT BALLS"
	cont "here to attract"
	cont "trainers."

	para "Seems it worked!"
	line "Kekekekeke<...>"
	done

MandarinNorthMart_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 6, MANDARIN_NORTH
	warp_def 7, 3, 6, MANDARIN_NORTH

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_CLERK, 3, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MandarinNorthClerkScript, -1
	person_event SPRITE_GRANNY, 2, 7, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MandarinNorthGrannyScript, -1
