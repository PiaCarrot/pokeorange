const_value set 2
	const ROUTE51TANGELOJUNGLEGATE_OFFICER
	const ROUTE51TANGELOJUNGLEGATE_COOLTRAINER_F

Route51TangeloJungleGate_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

OfficerScript_0x197634:
	jumptextfaceplayer UnknownText_0x19763a

CooltrainerFScript_0x197637:
	jumptextfaceplayer UnknownText_0x197661

UnknownText_0x19763a:
	text "Hi there!"
	line "Be careful in"
	cont "TANGELO JUNGLE."
	done

UnknownText_0x197661:
	text "Oh, of all the"
	line "rotten luck! You"
	cont "can't go to MIKAN"
	cont "ISLAND unless you"
	cont "go through the"
	cont "JUNGLE!"
	done

Route51TangeloJungleGate_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $4, $0, 2, TANGELO_JUNGLE
	warp_def $5, $0, 3, TANGELO_JUNGLE
	warp_def $4, $9, 1, ROUTE_51
	warp_def $5, $9, 2, ROUTE_51

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 2
	person_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, OfficerScript_0x197634, -1
	person_event SPRITE_SIGHT_SEER, 2, 1, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CooltrainerFScript_0x197637, -1
