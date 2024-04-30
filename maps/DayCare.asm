const_value = 1
	const DAYCARE_GRAMPS
	const DAYCARE_GRANNY

DayCare_MapScriptHeader:

.MapTriggers: db 1
	maptrigger .AppearDayCareManScript

.MapCallbacks: db 1
	dbw MAPCALLBACK_OBJECTS, .EggCheckCallback

.AppearDayCareManScript
	checkflag ENGINE_DAYCARE_MAN_HAS_EGG
	iftrue .PutDayCareManOutside2
	end
.PutDayCareManOutside2
	checkflag EVENT_DAYCARE_MAN_OUTSIDE
	iftrue .end
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	disappear DAYCARE_GRAMPS
	special Special_FadeInQuickly
.end
	clearevent EVENT_DAYCARE_MAN_IN_DAYCARE
	setevent EVENT_DAYCARE_MAN_OUTSIDE
	dotrigger 1
	end

.EggCheckCallback:
	checkflag ENGINE_DAYCARE_MAN_HAS_EGG
	iftrue .PutDaycareManOutside
	clearevent EVENT_DAYCARE_MAN_IN_DAYCARE
	setevent EVENT_DAYCARE_MAN_OUTSIDE
	dotrigger 0
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
	writetext DayCareLadyText
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
	
DayCareLadyText:
	text "My husband and I"
	line "run this DAYCARE."
	
	para "We can look after"
	line "a #MON for you."
	done

DayCare_MapEventHeader::

.Warps: db 3
	warp_def 7, 4, 1, MURCOTT_ISLAND
	warp_def 7, 5, 1, MURCOTT_ISLAND
	warp_def  0,  4, 7, MURCOTT_ISLAND

.CoordEvents: db 0

.BGEvents: db 2
	signpost  1,  8, SIGNPOST_READ, DayCareBookshelf
	signpost  1,  9, SIGNPOST_READ, DayCareBookshelf

.ObjectEvents: db 2
	person_event SPRITE_GRAMPS, 2, 1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, DayCareManScript_Inside, EVENT_DAYCARE_MAN_IN_DAYCARE
	person_event SPRITE_GRANNY, 6, 2, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, DayCareLadyScript, -1

