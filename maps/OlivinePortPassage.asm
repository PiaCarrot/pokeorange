const_value set 2

OlivinePortPassage_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

PokefanMScript_0x76fac:
	jumptextfaceplayer UnknownText_0x76faf

UnknownText_0x76faf:
	text "FAST SHIP S.S.AQUA"
	line "sails to KANTO on"

	para "Mondays and Fri-"
	line "days."
	done

OlivinePortPassage_MapEventHeader:: db 0, 0

.Warps: db 5
	warp_def 6, 16, 1, ROUTE_29
	warp_def 6, 17, 1, ROUTE_29
	warp_def 2, 17, 4, OLIVINE_PORT_PASSAGE
	warp_def 14, 3, 3, OLIVINE_PORT_PASSAGE
	warp_def 2, 3, 1, VALENCIA_PORT

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 0

