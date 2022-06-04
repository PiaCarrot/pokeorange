const_value = 1
	const MIKANPOKECENTER1F_NURSE
	const MIKANPOKECENTER1F_GAMEBOY_KID
	const MIKANPOKECENTER1F_GENTLEMAN
	const MIKANPOKECENTER1F_YOUNGSTER

MikanPokeCenter1F_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MikanPokeCenterNurse:
	jumpstd pokecenternurse

GameboyKidScript_0x69540:
	jumptextfaceplayer UnknownText_0x69809

GentlemanScript_0x69543:
	jumptextfaceplayer UnknownText_0x6983c

YoungsterScript_0x69546:
	jumptextfaceplayer UnknownText_0x698b8

UnknownText_0x69809:
	text "Don't interrupt me!"

	para "I'm playing #-"
	line "MON Trading Card"
	cont "Game 2!"

	para "GAH! Why do I al-"
	line "ways get TAILS?!"
	done

UnknownText_0x6983c:
	text "It was around half"
	line "a year ago."

	para "TEAM ROCKET was up"
	line "to no good with"
	cont "#MON."

	para "But justice pre-"
	line "vailed--a young"
	cont "kid broke 'em up."
	done

UnknownText_0x698b8:
	text "#MON are smart."
	line "They won't obey a"

	para "trainer they don't"
	line "respect."

	para "Without the right"
	line "BADGES, they"

	para "will just do as"
	line "they please."
	done

MikanPokeCenter1F_MapEventHeader::

.Warps: db 3
	warp_def 7, 4, 4, MIKAN_ISLAND
	warp_def 7, 5, 4, MIKAN_ISLAND
	warp_def 7, 0, 1, POKECENTER_2F

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 4
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MikanPokeCenterNurse, -1
	person_event SPRITE_GAMEBOY_KID, 5, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, GameboyKidScript_0x69540, -1
	person_event SPRITE_POKEFAN_M, 4, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GentlemanScript_0x69543, -1
	person_event SPRITE_BUG_BOY, 1, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x69546, -1
