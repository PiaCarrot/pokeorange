const_value = 1
	const ROUTE52POKECENTER1F_NURSE
	const ROUTE52POKECENTER1F_FISHING_GURU
	const ROUTE52POKECENTER1F_COOLTRAINER_F

Route52PokeCenter1F_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

NurseScript_0x69b52:
	jumpstd pokecenternurse

FishingGuruScript_0x69b55:
	jumptextfaceplayer UnknownText_0x69b83

CooltrainerFScript_0x69b80:
	jumptextfaceplayer UnknownText_0x69cac

UnknownText_0x69b83:
	text "There are a lot"
	line "of TRAINERS on"
	cont "ROUTE 52."

	para "They're all tra-"
	line "ining to face"
	cont "CISSY of the"
	cont "ORANGE CREW."
	done

UnknownText_0x69cac:
	text "This PIKACHU I"
	line "caught in the"
	cont "TANGELO JUNGLE"
	cont "is amazing!"

	para "THUNDERSHOCK is"
	line "a great move"
	cont "against WATER-"
	cont "TYPE #MON."
	done

Route52PokeCenter1F_MapEventHeader::

.Warps: db 3
	warp_def 7, 4, 1, ROUTE_52
	warp_def 7, 5, 1, ROUTE_52
	warp_def 7, 0, 1, POKECENTER_2F

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, NurseScript_0x69b52, -1
	person_event SPRITE_COOLTRAINER_M, 4, 2, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FishingGuruScript_0x69b55, -1
	person_event SPRITE_COOLTRAINER_F, 5, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CooltrainerFScript_0x69b80, -1
