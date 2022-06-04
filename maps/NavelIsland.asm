const_value = 1
	const NAVEL_SEASHELL

NavelIsland_MapScriptHeader::

.MapTriggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.Trigger0:
	end

.Trigger1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_NAVEL
	return

NavelIslandSign:
	jumptext NavelIslandSignText

NavelIslandSignText:
	text "NAVEL ISLAND"

	para "GYM CHALLENGERS"
	line "only! MT.NAVEL is"
	cont "very dangerous!"
	done
	
NavelSeashellScript:
	opentext
	checkitem SHELL_BOX
	iffalse .NoShellBox
	writetext FoundNavelSeashell
	playsound SFX_DEX_FANFARE_140_169
	waitsfx
	closetext
	giveshells 1
	setevent EVENT_NAVEL_ISLAND_SEASHELL
	disappear NAVEL_SEASHELL
	end
	
.NoShellBox:
	writetext NavelNoShellBox
	waitbutton
	closetext
	end
	
NavelNoShellBox:
    text "What a pretty sea-"
    line "shell! It looks"
    cont "too fragile to"
    cont "go in my BAG."
    done
	
FoundNavelSeashell:
	text "You found a rare"
	line "seashell!"
	done

NavelIsland_MapEventHeader::

.Warps: db 6
	warp_def 21, 16, 1, MT_NAVEL_1F
	warp_def 9, 26, 2, MT_NAVEL_1F
	warp_def 27, 24, 3, MT_NAVEL_2F
	warp_def 15, 10, 4, MT_NAVEL_2F
	warp_def 21,  9, 1, UNNAMED_ISLAND_1_POKE_CENTER
	warp_def 29, 17, 1, DANNYS_HOUSE

.CoordEvents: db 0

.BGEvents: db 1
	signpost 24, 16, SIGNPOST_READ, NavelIslandSign

.ObjectEvents: db 1
	person_event SPRITE_SEASHELL, 14,  2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, NavelSeashellScript, EVENT_NAVEL_ISLAND_SEASHELL
