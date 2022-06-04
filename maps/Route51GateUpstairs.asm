const_value = 1
	const ROUTE51TANGELOJUNGLEGATE_COOLTRAINER_F

Route51GateUpstairs_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

CooltrainerFScript_0x197637:
	jumptextfaceplayer UnknownText_0x197661

UnknownText_0x197661:
	text "Oh, of all the"
	line "rotten luck! You"
	cont "can't go to MIKAN"
	cont "ISLAND unless you"
	cont "go through the"
	cont "JUNGLE!"
	done

TangeloBinoculars1:
	jumptext TangeloBinoculars1Text

TangeloBinoculars1Text:
	text "There are a lot of"
	line "trainers that are"
	cont "swimming in the"
	cont "ocean!"
	done

TangeloBinoculars2:
	jumptext TangeloBinoculars2Text

TangeloBinoculars2Text:
	text "A #MON center"
	line "is on the other"
	cont "side of the JUN-"
	cont "GLE."
	done

Route51GateUpstairs_MapEventHeader::

.Warps: db 1
	warp_def 3, 0, 5, ROUTE_51_TANGELO_JUNGLE_GATE

.CoordEvents: db 0

.BGEvents: db 2
	signpost 4, 4, SIGNPOST_UP, TangeloBinoculars1
	signpost 4, 6, SIGNPOST_UP, TangeloBinoculars2

.ObjectEvents: db 1
	person_event SPRITE_SIGHTSEER_F, 2, 5, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, CooltrainerFScript_0x197637, -1
