const_value = 1
	const KECLEON_MANDARIN_DESERT_CAVE
	const SUNRAY_CROSS
	const MARSHADOW_MANDARIN_DESERT_CAVE

SunrayCaveMandarinDesert1F_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_OBJECTS, SunrayHideCrossCallback

SunrayHideCrossCallback:
	disappear SUNRAY_CROSS
	appear MARSHADOW_MANDARIN_DESERT_CAVE
	
	checkevent EVENT_CROSS_CORRUPTED_SUNRAY ;If this cave's event is done, hide Marshadow, unless already fought Cross at route 51
	iftrue .checkRoute51Cross
	return ;if the event isn't done, we are done
	
.checkRoute51Cross:
	checkevent EVENT_CROSS_CORRUPTED_FOUGHT ;if we haven't beat Cross at route 51, hide Marshadow
	iffalse .hideMarshadow

	checkevent EVENT_SUNRAY_CAVE_1F_MARSHADOW_FOUGHT ;if we already battled him, hide Marshadow
	iftrue .hideMarshadow
	return
	
.hideMarshadow:
	disappear MARSHADOW_MANDARIN_DESERT_CAVE
	return

InvisibleForceScript:
	opentext
	checkitem RAINBOW_WING ;temporary
	iftrue .KecleonBattle
	writetext InvisibleForceText
	waitbutton
	closetext
	end
	
.KecleonBattle:
	writetext RainbowWingReactsText
	waitbutton
	variablesprite SPRITE_INVISIBLE, SPRITE_ROCKET_MEOWTH ;todo - SPRITE_KECLEON
	special MapCallbackSprites_LoadUsedSpritesGFX
	writetext KecleonCryText
	pause 15
	cry KECLEON
	closetext
	loadwildmon KECLEON, 50
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	disappear KECLEON_MANDARIN_DESERT_CAVE
	reloadmapafterbattle
    setevent EVENT_MANDARIN_CAVE_KECLEON_FOUGHT
	end
	
RainbowWingReactsText:
	text "The RAINBOW WING"
	line "is reacting!"
	
	para "KECLEON revealed"
	line "itself!"
	done

KecleonCryText:
	text "Keku keku!"
	done

InvisibleForceText:
	text "An invisible force"
	line "blocks the way<...>"
	done

SunrayCaveCrossScript:
	checkevent EVENT_CROSS_CORRUPTED_SUNRAY
	iftrue .corruptedCross
	playmusic MUSIC_LOOK_GLADION
	appear SUNRAY_CROSS
	showemote EMOTE_SHOCK, PLAYER, 15
	spriteface PLAYER, DOWN
	pause 10
	applymovement SUNRAY_CROSS, SunrayCrossMovement1
	opentext
	writetext CrossSunrayText
	waitbutton
	closetext
	disappear SUNRAY_CROSS
	special Special_FadeInQuickly
	pause 20
	playmapmusic
	pause 10
	takeitem RAINBOW_WING
	setevent EVENT_CROSS_CORRUPTED_SUNRAY
	spriteface PLAYER, UP
	disappear MARSHADOW_MANDARIN_DESERT_CAVE
.corruptedCross:
	end

SunrayCrossMovement1:
	step UP
	step UP
	step UP
	step UP
	step_end

MandarinCaveMarshadowScript:	
	faceplayer
	opentext
	writetext MarshadowText
	cry MARSHADOW
	pause 15
	closetext
	writecode VAR_BATTLETYPE, BATTLETYPE_MARSHADOW
	loadwildmon MARSHADOW, 60
	startbattle
	disappear MARSHADOW_MANDARIN_DESERT_CAVE
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_SUNRAY_CAVE_1F_MARSHADOW_FOUGHT
	end
	
MarshadowText:
	text "Kuu!"
	done

CrossSunrayText:
	text "<PLAYER>! You have"
	line "something of mine."
	cont "Give it back!"

	para "You return the" 
	line "RAINBOW WING to"
	cont "CROSS."
	
	para "CROSS: Hahaha! You"
	line "are spineless."
	cont "CHAMPION of the"
	cont "dorks! I'll return" 
	cont "to the island we"
	cont "first met. I can"
	cont "feel HO-OH's power"
	cont "in the RAINBOW"
	cont "WING!"
	
	para "MARSHADOW: Kuu<...>"
	done

SunrayCaveMandarinDesert1F_MapEventHeader::

.Warps: db 4
	warp_def 19, 7, 1, MANDARIN_DESERT
	warp_def 3, 3, 4, TROVITOPOLIS
	warp_def 19, 19, 4, SUNRAY_CAVE_MANDARIN_DESERT_1F
	warp_def 11, 29, 3, SUNRAY_CAVE_MANDARIN_DESERT_1F

.CoordEvents: db 1
	xy_trigger 0,  3, 30, SunrayCaveCrossScript

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_INVISIBLE, 3, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, InvisibleForceScript, EVENT_MANDARIN_CAVE_KECLEON_FOUGHT
	person_event SPRITE_ROCKER,  8, 30, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_SUNRAY_CAVE_1F_CROSS_HS
	person_event SPRITE_MARSHADOW,  2, 30, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_GRAY, 0, 0, MandarinCaveMarshadowScript, EVENT_SUNRAY_CAVE_1F_MARSHADOW_HS
