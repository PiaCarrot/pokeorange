const_value = 1
	const TANGELOEVOLUTIONSPEECHHOUSE_LASS
	const TANGELOEVOLUTIONSPEECHHOUSE_YOUNGSTER

TangeloEvolutionSpeechHouse_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

YoungsterScript_0x196cb2:
	faceplayer
	opentext
	writetext UnknownText_0x196cc3
	waitbutton
	closetext
	end

LassScript_0x196cb9:
	faceplayer
	opentext
	writetext UnknownText_0x196cfc
	waitbutton
	closetext
	end

TangeloEvolutionSpeechHouseBookshelf:
	jumpstd magazinebookshelf

UnknownText_0x196cc3:
	text "TANGELO ISLAND is"
	line "on the far western"
	cont "side of the ORANGE"
	cont "ARCHIPELAGO."

	para "Only by boat or by"
	line "using a strong WA-"
	cont "TER #MON can"
	cont "you explore it."
	done

UnknownText_0x196cfc:
	text "There are several"
	line "islands that have"
	cont "not been explored."

	para "Some just aren't"
	line "habitable. Some"
	cont "are protected so"
	cont "wild #MON can"
	cont "live freely."
	done

TangeloEvolutionSpeechHouse_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 4, TANGELO_ISLAND
	warp_def 7, 3, 4, TANGELO_ISLAND

.CoordEvents: db 0

.BGEvents: db 2
	signpost 1, 0, SIGNPOST_READ, TangeloEvolutionSpeechHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, TangeloEvolutionSpeechHouseBookshelf

.ObjectEvents: db 2
	person_event SPRITE_LASS, 3, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LassScript_0x196cb9, -1
	person_event SPRITE_YOUNGSTER, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x196cb2, -1
