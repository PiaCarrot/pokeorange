const_value = 1
	const KECLEON_MANDARIN_DESERT_CAVE

SunrayCaveMandarinDesert1F_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

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
;   setevent EVENT_MANDARIN_CAVE_KECLEON_DEFEATED
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

SunrayCaveMandarinDesert1F_MapEventHeader::

.Warps: db 2
	warp_def 19, 7, 1, MANDARIN_DESERT
	warp_def 3, 3, 4, TROVITOPOLIS

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_INVISIBLE, 3, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, InvisibleForceScript, -1

