const_value = 1
	const MANDARINUNDERGROUND_ENGINEER3
	const MANDARINUNDERGROUND_SUPER_POTION
	const MANDARINUNDERGROUND_TRAP_VOLTORB

MandarinUndergroundBF2_MapScriptHeader::

.MapTriggers: db 2
	maptrigger .Trigger0
	maptrigger .Trigger1

.MapCallbacks: db 0

.Trigger0:
	end

.Trigger1:
	end

ExplodingTrap1:
	checkevent EVENT_EXPLODING_TRAP_1
	iftrue NoExplodingTrap
	scall KoffingExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_1
	end

ExplodingTrap2:
	checkevent EVENT_EXPLODING_TRAP_2
	iftrue NoExplodingTrap
	scall VoltorbExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_2
	end

ExplodingTrap3:
	checkevent EVENT_EXPLODING_TRAP_3
	iftrue NoExplodingTrap
	scall GeodudeExplodingTrap
	reloadmapafterbattle
	setevent EVENT_EXPLODING_TRAP_3
	end
	
VoltorbExplodingTrap:
	special FadeOutPalettes
	cry GRIMER
	special FadeInPalettes
	setlasttalked -1
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon GRIMER, 15
	startbattle
	end

GeodudeExplodingTrap:
	special FadeOutPalettes
	cry GEODUDE
	special FadeInPalettes
	setlasttalked -1
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon GEODUDE, 15
	startbattle
	end

KoffingExplodingTrap:
	special FadeOutPalettes
	cry KOFFING
	special FadeInPalettes
	setlasttalked -1
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	loadwildmon KOFFING, 15
	startbattle
	end

NoExplodingTrap:
	end

MandarinUndergroundPC:
	jumptext MandarinUndergroundPCText

MandarinUndergroundStatue:
	jumptext MandarinUndergroundStatueText

MandarinUndergroundPCText:
	text "JESSIE and JAMES"

	para "We have set up"
	line "operations on a"
	cont "quiet island."

	para "We expect to"
	line "round up all the"
	cont "#MON here soon."

	para "BUTCH and CASSIDY"
	done

MandarinUndergroundStatueText:
	text "A commemorative"
	line "statue of TEAM"
	cont "ROCKET's revival."

	para "Oh no!"
	done

; Engineer Kobe
TrainerEngineerKobe:
	trainer EVENT_BEAT_ENGINEER_KOBE, ENGINEER, KOBE, EngineerKobeSeenText, EngineerKobeWinText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext EngineerKobeAfterText
	waitbutton
	closetext
	end
	
EngineerKobeSeenText:
	text "Hey, I'm laying"
	line "out wires there!"
	done
	
EngineerKobeWinText:
	text "It's dangerous!"
	done
	
EngineerKobeAfterText:
	text "Kinda weird those"
	line "SILPH CO. guys had"
	cont "us add all these"
	cont "spinning panels."
	
	para "Made my head spin"
	line "installing them,"
	cont "that's for sure!"
	done
	
MandarinUndergroundSuperPotion:
	itemball SUPER_POTION

MandarinUndergroundTrapVoltorbScript:	
	opentext
	writetext TrapVoltrobText
	cry VOLTORB
	pause 15
	closetext
	writecode VAR_BATTLETYPE, BATTLETYPE_SNORLAX
	loadwildmon VOLTORB, 15
	startbattle
	disappear MANDARINUNDERGROUND_TRAP_VOLTORB
	reloadmapafterbattle
	playmapmusic
	end
	
TrapVoltrobText:
	text "Bzzzt!"
	done

MandarinUndergroundBF2_MapEventHeader::

.Warps: db 4
	warp_def 2, 3, 2, MANDARIN_UNDERGROUND_BF1
	warp_def 2, 17, 1, MANDARIN_UNDERGROUND_BF3
	warp_def 4, 14, 4, MANDARIN_UNDERGROUND_ENTRANCE
	warp_def 22, 7, 4, MANDARIN_UNDERGROUND_ENTRANCE

.CoordEvents: db 3
	xy_trigger 0, 21, 16, ExplodingTrap1
	xy_trigger 0, 17, 16, ExplodingTrap2
	xy_trigger 0, 11, 16, ExplodingTrap3

.BGEvents: db 2
	signpost 1, 11, SIGNPOST_READ, MandarinUndergroundPC
	signpost 1, 12, SIGNPOST_READ, MandarinUndergroundStatue

.ObjectEvents: db 3
	person_event SPRITE_SUPER_NERD, 1, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 3, TrainerEngineerKobe, -1
	person_event SPRITE_POKE_BALL, 16, 13, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, MandarinUndergroundSuperPotion, EVENT_MANDARIN_UNDERGROUND_SUPER_POTION
	person_event SPRITE_POKE_BALL,  1,  8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, 0, 0, MandarinUndergroundTrapVoltorbScript, -1

