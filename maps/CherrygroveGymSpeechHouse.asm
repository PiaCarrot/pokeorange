const_value set 2
	const CHERRYGROVEGYMSPEECHHOUSE_POKEFAN_M
	const CHERRYGROVEGYMSPEECHHOUSE_BUG_CATCHER

CherrygroveGymSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

PokefanMScript_0x196ae1:
	jumptextfaceplayer UnknownText_0x196aea

BugCatcherScript_0x196ae4:
	jumptextfaceplayer UnknownText_0x196b65

CherrygroveGymSpeechHouseBookshelf:
	jumpstd picturebookshelf

UnknownText_0x196aea:
	text "Hm...That's a"
	line "great #MON"
	cont "that you have."
	
	para "Taking on the"
	line "ORANGE CREW won't"
	cont "be an easy task,"
	cont "though."
	done

UnknownText_0x196b65:
	text "Of all the ORANGE"
	line "CREW members, the"
	cont "strongest is DRAKE"
	cont "of PUMMELO ISLAND."
	done

CherrygroveGymSpeechHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 3, CHERRYGROVE_CITY
	warp_def $7, $3, 3, CHERRYGROVE_CITY

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, CherrygroveGymSpeechHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, CherrygroveGymSpeechHouseBookshelf

.PersonEvents:
	db 2
	person_event SPRITE_COOLTRAINER_M, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PokefanMScript_0x196ae1, -1
	person_event SPRITE_SIGHT_SEER, 5, 5, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BugCatcherScript_0x196ae4, -1
