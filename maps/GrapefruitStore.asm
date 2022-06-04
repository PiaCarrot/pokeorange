const_value = 1
	const GRAPEFRUIT_LASS
	const GRAPEFRUIT_VENDOR

GrapefruitStore_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

GrapefruitLassScript:
	jumptextfaceplayer GrapefruitLassText

GrapefruitSalesmanScript:
	faceplayer
	opentext
	writetext UnknownText_0x1900b0
	special PlaceMoneyTopRight
	yesorno
	iffalse UnknownScript_0x190072
	checkmoney $0, 300
	if_equal $2, UnknownScript_0x19006c
	giveitem SWEET_ORANGE
	iffalse UnknownScript_0x190078
	waitsfx
	playsound SFX_TRANSACTION
	takemoney $0, 300
	special PlaceMoneyTopRight
	writetext UnknownText_0x19014a
	waitbutton
	closetext
	end
	
UnknownScript_0x19006c:
	writetext UnknownText_0x19015b
	waitbutton
	closetext
	end

UnknownScript_0x190072:
	writetext UnknownText_0x190178
	waitbutton
	closetext
	end

UnknownScript_0x190078:
	writetext UnknownText_0x190188
	waitbutton
	closetext
	end
	
UnknownText_0x1900b0:
	text "Hiya, kid!"

	para "Want to buy one of"
	line "our famous GRAPE-"
	cont "FRUITS? It's only"
	cont "¥300!"
	done

UnknownText_0x19014a:
	text "Good! Savor it!"
	done

UnknownText_0x19015b:
	text "You don't have"
	line "enough money."
	done

UnknownText_0x190178:
	text "Oh, fine then<...>"
	done

UnknownText_0x190188:
	text "You don't have"
	line "room for this."
	done

GrapefruitLassText:
	text "The GRAPEFRUIT"
	line "grown here are so"
	cont "tasty!"
	done

GrapefruitStore_MapEventHeader::

.Warps: db 2
	warp_def 5, 1, 1, SEVEN_GRAPEFRUITS
	warp_def 5, 2, 1, SEVEN_GRAPEFRUITS

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_LASS, 2, 2, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, GrapefruitLassScript, -1
	person_event SPRITE_YOUNGSTER, 5, 5, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GrapefruitSalesmanScript, -1
