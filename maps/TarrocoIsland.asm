const_value = 1

TarrocoIsland_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 2
	dbw MAPCALLBACK_TILES, TarrocoIslandBridgeCallback
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_HAMLIN
	return
	
TarrocoIslandBridgeCallback:
	checktriggers
	iftrue .underfoot
	callasm TarrocoIsland_OverheadBridgeAsm
	return

.underfoot:
	callasm TarrocoIsland_UnderfootBridgeAsm
	return

TarrocoIslandBridgeOverheadTrigger:
	callasm TarrocoIsland_OverheadBridgeAsm
	endbridgetrigger wTarrocoIslandTrigger, $0

TarrocoIslandBridgeUnderfootTrigger:
	callasm TarrocoIsland_UnderfootBridgeAsm
	endbridgetrigger wTarrocoIslandTrigger, $1

TarrocoIsland_OverheadBridgeAsm:
	changebridgeblock 30, 8, $ed, TARROCO_ISLAND
	changebridgeblock 30, 10, $c1, TARROCO_ISLAND
	changebridgeblock 30, 12, $c1, TARROCO_ISLAND
	changebridgeblock 30, 14, $c1, TARROCO_ISLAND
	changebridgeblock 30, 16, $c2, TARROCO_ISLAND
	endbridgeblocks

TarrocoIsland_UnderfootBridgeAsm:
	changebridgeblock 30, 8, $eb, TARROCO_ISLAND
	changebridgeblock 30, 10, $4c, TARROCO_ISLAND
	changebridgeblock 30, 12, $4c, TARROCO_ISLAND
	changebridgeblock 30, 14, $4c, TARROCO_ISLAND
	changebridgeblock 30, 16, $ba, TARROCO_ISLAND
	endbridgeblocks
	
TarrocoBetaEndScript:
	faceplayer
	opentext
	writetext TarrocoBetaEndScriptText
	yesorno
	iftrue .TarrocoBetaEndScript_teleport
	writetext TarrocoBetaEndScriptNoteleportText
	waitbutton
	closetext
	end

.TarrocoBetaEndScript_teleport:
	closetext
	warp KUMQUAT_ISLAND_WEST, 12, 26
	end

TarrocoBetaEndScriptText:
	text "PIACRT: Thanks for"
	line "playing ORANGE!"
	cont "The beta is over,"
	cont "and we are hard at"
	cont "work on a new base"
	cont "to make the game"
	cont "even better."
	
	para "If you haven't"
	line "gone to SHAMOUTI"
	cont "ISLAND yet, there's"
	cont "a whole quest for"
	cont "you! Go get on the"
	cont "boat at KUMQUAT!"
	para "Do you want me to"
	line "teleport you"
	cont "there?"
	done

TarrocoBetaEndScriptNoteleportText:
	text "I see, you have"
	line "your own means."
	
	para "There's not much"
	line "on this island,"
	cont "but you might be"
	cont "in for a surprise."
	done

TarrocoStub:
	end

TarrocoIslandCelebiScript:
	faceplayer
	opentext
	checkevent EVENT_TARROCO_CELEBI_FOUGHT
	iftrue .celebifought
	writetext CelebiText
	waitbutton
	cry CELEBI
	pause 15
	closetext
	writecode VAR_BATTLETYPE, BATTLETYPE_SNORLAX
	loadwildmon CELEBI, 50
	startbattle
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_TARROCO_CELEBI_FOUGHT
	end

.celebifought:
	writetext CelebiFoughtText
	cry CELEBI
	pause 15
	writetext CelebiFoughtText2
	waitbutton
	closetext
	end

CelebiText:
	text "What a peculiar"
	line "old shrine..."
	
	para "There seems to be"
	line "an inscription:"
	
	para "        GS"
	
	para "Where have I seen"
	line "that symbol?"
	
	para "Mmm... Oh right!"
	line "The GS Ball!"

	para "It seems there's"
	line "also a slot in it,"
	cont "it is suspiciously"
	cont "about the same"
	cont "size as the GS"
	cont "Ball..."
	
	
	para "<PLAYER> put"
	line "the GS Ball in"
	cont "the shrine."
	
	done

CelebiFoughtText:
	text "I just had a"
	line "deja vu..."
	done
CelebiFoughtText2:
	text "What was that?"
	done

TarrocoIsland_MapEventHeader::

.Warps: db 0
.CoordEvents: db 2
	xy_trigger 1, 15, 14, TarrocoIslandBridgeOverheadTrigger
	xy_trigger 0, 15, 15, TarrocoIslandBridgeUnderfootTrigger

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_GYM_GUY, 26, 14, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TarrocoBetaEndScript, -1
	person_event SPRITE_SHRINE1,  4, 40, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, TarrocoStub, -1
	person_event SPRITE_SHRINE2,  5, 40, SPRITEMOVEDATA_ITEM_TREE , 0, 0, -1, -1, PAL_OW_BROWN, 0, 0, TarrocoIslandCelebiScript, -1
