const_value set 1
	const ASCORBIA_ISLAND_TEACHER
	const ASCORBIA_ISLAND_LASS
	const ASCORBIA_ISLAND_ROCKER
	const ASCORBIA_ISLAND_BLACK_BELT
	const ASCORBIA_ISLAND_FRUIT_TREE
	const ASCORBIA_ISLAND_TM_DRAGON_PULSE
	const ASCORBIA_ISLAND_MAX_REPEL
	const ASCORBIA_ISLAND_POLKADOT_BOW

AscorbiaIsland_MapScriptHeader:

.MapTriggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_ASCORBIA
	return

AscorbiaIslandFruitTreeScript:
	fruittree FRUITTREE_ASCORBIA_ISLAND
	
AscorbiaTMDragonPulse:
	itemball TM_DRAGON_PULSE
	
AscorbiaMaxRepel:
	itemball MAX_REPEL
	
AscorbiaPolkadotBow:
	itemball POLKADOT_BOW
	
AscorbiaTeacherScript:
	jumptextfaceplayer AscorbiaTeacherText
	
AscorbiaTeacherText:
	text "I think I got off"
	line "on the wrong port!"
	
	para "This isn't KUMQUAT"
	line "ISLAND!"
	done
	
AscorbiaLassScript:
	jumptextfaceplayer AscorbiaLassText
	
AscorbiaLassText:
	text "This is ASCORBIA"
	line "ISLAND! Isn't it"
	cont "super pretty?"
	
	para "The beach to the"
	line "west is beautiful!"
	done
	
AscorbiaRockerScript:
	jumptextfaceplayer AscorbiaRockerText
	
AscorbiaRockerText:
	text "There's a large"
	line "island west of"
	cont "here."
	
	para "I hear you need a"
	line "certain HM if you"
	cont "want to explore it"
	cont "fully."
	done

AscorbiaBlackBeltScript:
	jumptextfaceplayer AscorbiaBlackBeltText
	
AscorbiaBlackBeltText:
	text "I heard there's a"
	line "beautiful woman"
	cont "who paints at"
	cont "night time."
	
	para "I've never seen"
	line "her, though."
	done

AscorbiaIsland_MapEventHeader::

.Warps: db 8
	warp_def 31, 17, 1, ASCORBIA_ISLAND_ROUTE_63_GATE
	warp_def 31, 18, 2, ASCORBIA_ISLAND_ROUTE_63_GATE
	warp_def 5, 11, 1, ASCORBIA_ISLAND_FAN_CLUB
	warp_def 5, 35, 1, ASCORBIA_ISLAND_MOVE_RELEARNER
	warp_def 29, 5, 1, ASCORBIA_ISLAND_HOUSE_1
	warp_def 25, 27, 1, ASCORBIA_ISLAND_HOUSE_2
	warp_def 19, 11, 1, ASCORBIA_ISLAND_MART
	warp_def 25, 13, 1, ASCORBIA_ISLAND_CENTER

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 8
	person_event SPRITE_SIGHTSEER_F, 17, 16, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, AscorbiaTeacherScript, -1
	person_event SPRITE_LASS, 26, 17, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, AscorbiaLassScript, -1
	person_event SPRITE_ROCKER, 7, 4, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, AscorbiaRockerScript, -1
	person_event SPRITE_BLACK_BELT, 9, 26, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, AscorbiaBlackBeltScript, -1
	person_event SPRITE_FRUIT_TREE, 35, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AscorbiaIslandFruitTreeScript, -1
	person_event SPRITE_POKE_BALL, 26, 35, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, AscorbiaTMDragonPulse, EVENT_ASCORBIA_TM_DRAGON_PULSE
	person_event SPRITE_POKE_BALL, 4, 22, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, AscorbiaMaxRepel, EVENT_ASCORBIA_MAX_REPEL
	person_event SPRITE_POKE_BALL, 21, 39, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, AscorbiaPolkadotBow, EVENT_ASCORBIA_POLKADOT_BOW

