const_value = 1

SunburstSouthHouse_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

SunburstGreenLassScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SHARP_BEAK
	iftrue .AlreadyGotSharpBeak
    writetext GiveSharpBeakText
	waitbutton
	verbosegiveitem SHARP_BEAK
	iffalse SunburstGreenLassDoneScript
	setevent EVENT_GOT_SHARP_BEAK
	closetext
	end

.AlreadyGotSharpBeak:
    writetext GotSharpBeakText
	waitbutton
	closetext
	end

SunburstGreenLassDoneScript:
	closetext
	end

SunburstBirdScript:
	faceplayer
	opentext
	writetext BirdText
	cry WINGULL
	waitbutton
	closetext
	end

GiveSharpBeakText:
	text "Bird-type #MON"
	line "are great."

	para "Here's something"
	line "to make them a"
	cont "bit stronger."
	done

GotSharpBeakText:
	text "SHARP BEAK will"
	line "increase damage"
	cont "from FLYING-type"
	cont "attacks."
	done

BirdText:
	text "Winnhaa!"
	done

SunburstSouthHouse_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 6, SUNBURST_ISLAND
	warp_def 7, 3, 6, SUNBURST_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_LASS, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 2, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SunburstGreenLassScript, -1
	person_event SPRITE_BIRD, 6, 5, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_BLUE, 0, 0, SunburstBirdScript, -1
