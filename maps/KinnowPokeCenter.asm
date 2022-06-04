const_value = 1
	const KINNOW_NURSE
	const KINNOW_GB_KID
	const KINNOW_SLOUCH

KinnowPokeCenter_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

KinnowNurseScript:
	jumpstd pokecenternurse

KinnowGameboyKidScript:
	jumptextfaceplayer KinnowGBKidText

KinnowSlouchScript:
	opentext
	writetext KinnowSlouchText
	waitbutton
	closetext
	end

KinnowSlouchText:
	text "There are several"
	line "uninhabited islan-"
	cont "ds."

	para "You may find rare"
	line "#MON there."
	done

KinnowGBKidText:
	text "Why are there no"
	line "trade centers?"

	para "There is one, in"
	line "TROVITOPOLIS."
	done

KinnowPokeCenter_MapEventHeader::

.Warps: db 2
	warp_def 7, 4, 4, KINNOW_ISLAND
	warp_def 7, 5, 4, KINNOW_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KinnowNurseScript, -1
	person_event SPRITE_GAMEBOY_KID, 5, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KinnowGameboyKidScript, -1
	person_event SPRITE_PC_SLOUCH, 4, 0, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KinnowSlouchScript, -1
