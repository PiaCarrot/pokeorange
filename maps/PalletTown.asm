const_value = 1
	const PALLETTOWN_TEACHER
	const PALLETTOWN_FISHER

PalletTown_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	;setflag ENGINE_FLYPOINT_PALLET
	return

TeacherScript_0x1ac6d5:
	jumptextfaceplayer UnknownText_0x1ac6e7

FisherScript_0x1ac6d8:
	jumptextfaceplayer UnknownText_0x1ac720

OaksLabSign:
	jumptext OaksLabSignText

PalletTownSign:
	jumptext PalletTownSignText

RedsHouseSign:
	jumptext RedsHouseSignText

BluesHouseSign:
	jumptext BluesHouseSignText

YellowsHouseSign:
	jumptext YellowsHouseSignText

UnknownText_0x1ac6e7:
	text "I'm raising #-"
	line "MON too."

	para "They serve as my"
	line "private guards."
	done

UnknownText_0x1ac720:
	text "Technology is"
	line "incredible!"

	para "You can now trade"
	line "#MON across"
	cont "time like e-mail."
	done

PalletTownSignText:
	text "PALLET TOWN"

	para "A Tranquil Setting"
	line "of Peace & Purity"
	done

OaksLabSignText:
	text "OAK #MON"
	line "RESEARCH LAB"
	done

RedsHouseSignText:
	text "RED'S HOUSE"
	done

BluesHouseSignText:
	text "BLUE'S HOUSE"
	done

YellowsHouseSignText:
	text "YELLOW'S HOUSE"
	done

PalletTown_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 5
	signpost 11, 13, SIGNPOST_READ, PalletTownSign
	signpost 17, 23, SIGNPOST_READ, OaksLabSign
	signpost 7, 5, SIGNPOST_READ, RedsHouseSign
	signpost 5, 21, SIGNPOST_READ, BluesHouseSign
	signpost 15, 3, SIGNPOST_READ, YellowsHouseSign

.ObjectEvents: db 2
	person_event SPRITE_TEACHER, 7, 2, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TeacherScript_0x1ac6d5, -1
	person_event SPRITE_FISHER, 6, 16, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FisherScript_0x1ac6d8, -1

