const_value = 1
	const SEVENGRAPEFRUITS_BIG_SNORLAX
	const SEVENGRAPEFRUITS_WORKER
	const SEVENGRAPEFRUITS_ITEM_ULTRABALL
	const SEVENGRAPEFRUITS_ITEM_PROTEIN
	const SEVENGRAPEFRUITS_SEASHELL

SevenGrapefruits_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .InitializeDiveMap

.InitializeDiveMap:
	divemap SEVEN_GRAPEFRUITS_UNDERWATER, -2, 0
	return

GrapefruitWarehouseSign:
	jumptext GrapefruitWarehouseSignText
	
GrapefruitsSnorlax::
    checkitem POKE_FLUTE
    iffalse noflute
    opentext
    writetext GrapefruitIslandsSnorlaxTextHaveFlute
    yesorno
    iffalse dontuseflute
GrapefruitIslandsPlayedFluteForSnorlax::
    writetext GrapefruitIslandsSnorlaxTextUseFlute
    playsound SFX_POKEFLUTE2
    waitsfx
    writetext GrapefruitIslandsSnorlaxTextWakeUp
    waitbutton
	cry SNORLAX
	closetext
	writecode VAR_BATTLETYPE, BATTLETYPE_SNORLAX
	loadwildmon SNORLAX, 30
    startbattle
    if_equal $2, DidntBeatSnorlaxGrapefruitIslands
    disappear SEVENGRAPEFRUITS_BIG_SNORLAX
    reloadmapafterbattle
    opentext
    writetext GrapefruitIslandsSnorlaxTextSnorlaxGone
    waitbutton
    closetext
    setevent EVENT_SEVEN_GRAPEFRUITS_SNORLAX
    end
    
dontuseflute:
    closetext
    end
    
noflute:
    opentext
    writetext SnorlaxIsSleepingText
    waitbutton
    closetext
    end
    
DidntBeatSnorlaxGrapefruitIslands:
    reloadmapafterbattle
    opentext
    writetext GrapefruitIslandsSnorlaxTextRanAway
    waitbutton
    closetext
    end

GrapefruitsCooltrainer:
	faceplayer
	opentext
	checkevent EVENT_SEVEN_GRAPEFRUITS_SNORLAX
	iftrue .SnorlaxGone
	writetext GrapefruitWorkerText
	waitbutton
	closetext
	end

.SnorlaxGone:
	writetext GrapefruitWorkerHappyText
	waitbutton
	closetext
	end

GrapefruitUltraBall:
	itemball ULTRA_BALL

GrapefruitProtein:
	itemball PROTEIN

GrapefruitHiddenRareCandy:
	dwb EVENT_GRAPEFRUIT_RARE_CANDY, RARE_CANDY

GrapefruitWorkerText:
	text "Oh no!"

	para "This SNORLAX is"
	line "eating all of our"
	cont "GRAPEFRUITs!"

	para "Oh, whatever will"
	line "we do?"
	done

GrapefruitWorkerHappyText:
	text "Thank you for get-"
	line "ting rid of that"
	cont "SNORLAX!"
	done

SnorlaxIsSleepingText:
	text "SNORLAX is snoring"
	line "peacefully<...>"
	done

GrapefruitIslandsSnorlaxTextHaveFlute:
	text "SNORLAX is snoring"
	line "peacefully<...>"
	
	para "Want to use the"
	line "# FLUTE?"
	done
	
GrapefruitIslandsSnorlaxTextUseFlute:
	text "<PLAYER> used the"
	line "# FLUTE!"
	done

GrapefruitIslandsSnorlaxTextWakeUp:
	text "<...>"

	para "SNORLAX scratches"
	line "its behind<...>"

	para "<...>"

	para "SNORLAX groans."
	line "Five more minutes."

	para "<...>"

	para "SNORLAX stops sno-"
	line "ring<...>"

	para "<...>"

	para "SNORLAX woke up!"
	done
	
GrapefruitIslandsSnorlaxTextSnorlaxGone:
	text "The path is now"
	line "open!"
	done

GrapefruitIslandsSnorlaxTextRanAway:
	text "SNORLAX ran away!"
	done

GrapefruitWarehouseSignText:
	text "GRAPEFRUIT for"
	line "sale!"

	para "Welcome to the"
	line "7 GRAPEFRUIT"
	cont "ISLANDS!"
	done
	
SevenGrapefruitsSeashellScript:
	opentext
	checkitem SHELL_BOX
	iffalse .NoShellBox
	giveshells 1
	writetext FoundSevenGrapefruitsSeashell
	playsound SFX_DEX_FANFARE_140_169
	waitsfx
	closetext
	disappear SEVENGRAPEFRUITS_SEASHELL
	setevent EVENT_SEVENGRAPEFRUITS_ISLAND_SEASHELL
	end
	
.NoShellBox:
	writetext SevenGrapefruitsNoShellBox
	waitbutton
	closetext
	end
	
SevenGrapefruitsNoShellBox:
    text "What a pretty sea-"
    line "shell! It looks"
    cont "too fragile to"
    cont "go in my BAG."
    done
	
FoundSevenGrapefruitsSeashell:
	text "You found a rare"
	line "seashell!"
	done

SevenGrapefruits_MapEventHeader::

.Warps: db 1
	warp_def 27, 35, 1, GRAPEFRUIT_STORE

.CoordEvents: db 0

.BGEvents: db 2
	signpost 22, 7, SIGNPOST_ITEM, GrapefruitHiddenRareCandy
	signpost 28, 32, SIGNPOST_READ, GrapefruitWarehouseSign

.ObjectEvents: db 5
	person_event SPRITE_BIG_SNORLAX, 38, 20, SPRITEMOVEDATA_SNORLAX, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GrapefruitsSnorlax, EVENT_SEVEN_GRAPEFRUITS_SNORLAX
	person_event SPRITE_COOLTRAINER_F, 38, 19, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GrapefruitsCooltrainer, -1
	person_event SPRITE_POKE_BALL, 25, 33, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, GrapefruitUltraBall, EVENT_GRAPEFRUIT_ULTRA_BALL
	person_event SPRITE_POKE_BALL, 15, 20, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, GrapefruitProtein, EVENT_GRAPEFRUIT_PROTEIN
	person_event SPRITE_SEASHELL, 41,  4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SevenGrapefruitsSeashellScript, EVENT_SEVENGRAPEFRUITS_ISLAND_SEASHELL

