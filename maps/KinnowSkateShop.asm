KinnowSkateShop_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

SkateShopClerkScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SKATEBOARD
	iftrue SkateboardObtainedAlready
	writetext DoYouWantOneText
	yesorno
	iffalse DontWantOne
	writetext HereYouGoText
	buttonsound
	waitsfx
	giveitem SKATEBOARD
	writetext PlayerGotSkateboardText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_SKATEBOARD
SkateboardObtainedAlready:
	writetext AlreadyHaveASkateboardText
	waitbutton
	closetext
	end

DontWantOne:
	writetext NoThankYouText
	waitbutton
	closetext
	end

DoYouWantOneText:
	text "Hey there, kid!"

	para "Looking for some"
	line "spare parts?"
	cont "New wheels?"

	para "<...><...>"

	para "You don't have a"
	line "SKATEBOARD? Well,"
	cont "why didn't you say"
	cont "so?"

	para "You want one? It's"
	line "on me."
	done

HereYouGoText:
	text "Rad!"

	para "Here you go, kid!"
	done

PlayerGotSkateboardText:
	text "<PLAYER> got a"
	line "SKATEBOARD."
	done

AlreadyHaveASkateboardText:
	text "Looking rad, kid!"

	para "Now you can roll"
	line "around in style!"
	done

NoThankYouText:
	text "No sweat, kid!"

	para "Come back if you"
	line "change your mind!"
	done

KinnowSkateShop_MapEventHeader::

.Warps: db 2
	warp_def 7, 6, 7, KINNOW_ISLAND
	warp_def 7, 7, 7, KINNOW_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_CLERK, 2, 9, SPRITEMOVEDATA_STANDING_LEFT, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SkateShopClerkScript, -1
