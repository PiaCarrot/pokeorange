const_value set 2
	const CHERRYGROVEMART_CLERK
	const CHERRYGROVEMART_COOLTRAINER_M
	const CHERRYGROVEMART_YOUNGSTER

CherrygroveMart_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ClerkScript_0x19680a:
	opentext
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue UnknownScript_0x196817
	pokemart MARTTYPE_STANDARD, MART_CHERRYGROVE
	closetext
	end

UnknownScript_0x196817:
	pokemart MARTTYPE_STANDARD, MART_CHERRYGROVE_DEX
	closetext
	end

CooltrainerMScript_0x19681d:
	faceplayer
	opentext
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue UnknownScript_0x19682b
	writetext UnknownText_0x196834
	waitbutton
	closetext
	end

UnknownScript_0x19682b:
	writetext UnknownText_0x196873
	waitbutton
	closetext
	end

YoungsterScript_0x196831:
	jumptextfaceplayer UnknownText_0x1968a0

UnknownText_0x196834:
	text "Ah! The AC in"
	line "here feels good!"
	done

UnknownText_0x196873:
	text "Ah! The AC in"
	line "here feels good!"
	done

UnknownText_0x1968a0:
	text "Southeast of this"
	line "island is a city"
	cont "called TROVITO-"
	cont "POLIS."
	
	para "They have an huge"
	line "shopping center!"
	
	para "You can buy TMs,"
	line "STONES, and even"
	cont "#MON!"
	done

CherrygroveMart_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 1, CHERRYGROVE_CITY
	warp_def $7, $3, 1, CHERRYGROVE_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_CLERK, 3, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ClerkScript_0x19680a, -1
	person_event SPRITE_COOLTRAINER_F, 6, 7, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, 0, PERSONTYPE_SCRIPT, 0, CooltrainerMScript_0x19681d, -1
	person_event SPRITE_YOUNGSTER, 5, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x196831, -1
