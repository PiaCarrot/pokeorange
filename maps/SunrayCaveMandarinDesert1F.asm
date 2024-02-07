const_value = 1
	const KECLEON_MANDARIN_DESERT_CAVE
	const MEWTWO_MANDARIN_DESERT_CAVE

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

MandarinCaveMewtwoScript:	
	faceplayer
	opentext
	writetext MewtwoText
	cry MEWTWO
	pause 15
	closetext
	writecode VAR_BATTLETYPE, BATTLETYPE_SNORLAX
	loadwildmon MEWTWO, 70
	startbattle
	disappear MEWTWO_MANDARIN_DESERT_CAVE
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_SUNRAY_CAVE_1F_MEWTWO_FOUGHT
	end
	
MewtwoText:
	text "Mew!"
	done

SunrayCaveMandarinDesert1F_MapEventHeader::

.Warps: db 4
	warp_def 19, 7, 1, MANDARIN_DESERT
	warp_def 3, 3, 4, TROVITOPOLIS
	warp_def 19, 19, 4, SUNRAY_CAVE_MANDARIN_DESERT_1F
	warp_def 11, 29, 3, SUNRAY_CAVE_MANDARIN_DESERT_1F

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_INVISIBLE, 3, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, InvisibleForceScript, -1
	person_event SPRITE_MEWTWO,  2, 30, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_SILVER, 0, 0, MandarinCaveMewtwoScript, EVENT_SUNRAY_CAVE_1F_MEWTWO_FOUGHT
