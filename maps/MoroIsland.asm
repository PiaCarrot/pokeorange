MoroIsland_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

.Scripts:

MoroFattyScript:
	jumptextfaceplayer MoroFattyText
	
MoroFattyText:
	text "Technology is just"
	line "amazing!"
	
	para "Hm? You're asking"
	line "if I'm from VALEN-"
	cont "CIA ISLAND?"
	
	para "I'm not, why?"
	done
	
MoroCooltrainerMScript:
	jumptextfaceplayer MoroCooltrainerMText
	
MoroCooltrainerMText:
	text "Ever been to GOL-"
	line "DEN ISLAND?"
	
	para "There are a bunch"
	line "of crazy MEOWTH"
	cont "lovers there!"
	done
	
MoroCooltrainerFScript:
	jumptextfaceplayer MoroCooltrainerFText
	
MoroCooltrainerFText:
	text "I found the cutest"
	line "#MON on ROUTE"
	cont "60!"
	done

MoroIsland_MapEventHeader:: db 0, 0

.Warps: db 1
	warp_def 19, 16, 1, MORO_ISLAND_MUSEUM

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_COOLTRAINER_M, 21, 20, SPRITEMOVEDATA_STANDING_UP, 0, 1, -1, -2, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MoroCooltrainerMScript, -1
	person_event SPRITE_COOLTRAINER_F, 20, 10, SPRITEMOVEDATA_STANDING_UP, 0, 1, -1, -2, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, MoroCooltrainerFScript, -1
	person_event SPRITE_FISHER, 14, 17, SPRITEMOVEDATA_STANDING_UP, 0, 1, -1, -2, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MoroFattyScript, -1

