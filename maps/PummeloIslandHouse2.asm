const_value = 1

PummeloIslandHouse2_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

PummeloHouse2GrampsScript:
	jumptextfaceplayer PummeloHouse2GrampsScriptText

PummeloHouse2LassScript:
	jumptextfaceplayer PummeloHouse2LassScriptText
	
PummeloHouse2GrampsScriptText:
	text "When I was a young"
	line "lad, I was adrift"
	cont "at sea. I washed"
	cont "up on a mysterious"
	
	para "island, and there"
	line "was a strange"
	cont "tower. The folk"
	cont "there saved me and"
	
	para "that's why I'm"
	line "here today!"
	done

PummeloHouse2LassScriptText:
	text "Grandpa tells a"
	line "lot of stories."
	cont "Don't mind him if"
	cont "it's unbelievable."
	done

PummeloIslandHouse2_MapEventHeader:

.Warps: db 2
	warp_def $7, $3, 6, PUMMELO_ISLAND
	warp_def $7, $4, 6, PUMMELO_ISLAND

.XYTriggers: db 0

.Signposts: db 0

.PersonEvents: db 2
	person_event SPRITE_GRAMPS, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PummeloHouse2GrampsScript, -1
		person_event SPRITE_LASS, 4, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PummeloHouse2LassScript, -1