const_value = 1
	const KINNOWCHARCOALHOUSE_BLACKBELT

KinnowCharcoalHouse_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

KinnowCharcoalScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_CHARCOAL
	iftrue .AlreadyGotCharcoal
    writetext GiveCharcoalText
	verbosegiveitem CHARCOAL
	iffalse KinnowCharcoalDoneScript
	setevent EVENT_GOT_CHARCOAL
	closetext
	end

.AlreadyGotCharcoal:
    writetext GotCharcoalText
	waitbutton
	closetext
	end
	
KinnowCharcoalDoneScript:
	closetext
	end

GiveCharcoalText:
	text "Yes!"

	para "I see you have a"
	line "knack at being a"
	cont "#MON Trainer!"

	para "Take this, it will"
	line "help you."
	done

GotCharcoalText:
	text "CHARCOAL increases"
	line "the power of FIRE-"
	cont "TYPE #MON."
	done

KinnowCharcoalHouse_MapEventHeader::

.Warps: db 2
	warp_def 7, 3, 3, KINNOW_ISLAND
	warp_def 7, 4, 3, KINNOW_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_BLACK_BELT, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 2, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, KinnowCharcoalScript, -1
