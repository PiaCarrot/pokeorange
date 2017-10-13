const_value set 1
	const DAYCARE_GRAMPS
	const DAYCARE_GRANNY

DayCare_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 1
	dbw MAPCALLBACK_OBJECTS, .EggCheckCallback

.EggCheckCallback:
	checkflag ENGINE_DAYCARE_MAN_HAS_EGG
	iftrue .PutDaycareManOutside
	clearevent EVENT_DAYCARE_MAN_IN_DAYCARE
	setevent EVENT_DAYCARE_MAN_OUTSIDE
	return

.PutDaycareManOutside:
	setevent EVENT_DAYCARE_MAN_IN_DAYCARE
	clearevent EVENT_DAYCARE_MAN_OUTSIDE
	return

DayCareManScript_Inside:
	faceplayer
	opentext
	special Special_DayCareMan
	waitbutton
	closetext
	end

DayCareLadyScript:
	faceplayer
	opentext
	checkflag ENGINE_DAYCARE_MAN_HAS_EGG
	iftrue .HusbandWasLookingForYou
	special Special_DayCareLady
	waitbutton
	closetext
	end

.HusbandWasLookingForYou:
	writetext Text_GrampsLookingForYou
	waitbutton
	closetext
	end

DayCareBookshelf:
	jumpstd difficultbookshelf

Text_GrampsLookingForYou:
	text "Gramps was looking"
	line "for you."
	done

DayCare_MapEventHeader:

.Warps: db 4
	warp_def 7, 2, 1, MURCOTT_ISLAND
	warp_def 7, 3, 1, MURCOTT_ISLAND
	warp_def 5, 7, 2, MURCOTT_ISLAND
	warp_def 6, 7, 3, MURCOTT_ISLAND

.XYTriggers: db 0

.Signposts: db 2
	signpost 1, 0, SIGNPOST_READ, DayCareBookshelf
	signpost 1, 1, SIGNPOST_READ, DayCareBookshelf

.PersonEvents: db 2
	person_event SPRITE_GRAMPS, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, DayCareManScript_Inside, EVENT_DAYCARE_MAN_IN_DAYCARE
	person_event SPRITE_GRANNY, 3, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, DayCareLadyScript, -1
