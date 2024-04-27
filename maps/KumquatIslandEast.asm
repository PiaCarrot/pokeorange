const_value = 1
	const KUMQUAT_UMBRELLA_LEFT_1
	const KUMQUAT_UMBRELLA_RIGHT_1
	const KUMQUAT_UMBRELLA_LEFT_2
	const KUMQUAT_UMBRELLA_RIGHT_2
	const KUMQUAT_EAST_SUPERNERD
	const KUMQUAT_EAST_COOLTRAINER_F
	const KUMQUAT_EAST_SIGHTSEER_F_1
	const KUMQUAT_EAST_SIGHTSEER_F_2
	const KUMQUAT_EAST_FISHER
	const KUMQUAT_EAST_COOLTRAINER_M

KumquatIslandEast_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_KUMQUAT
	return

KumquatEastUmbrellaScript:
	end
	
KumquatEastSupernerd:
	jumptextfaceplayer KumquatEastSupernerdText
	
KumquatEastSupernerdText:
	text "There's a GAME"
	line "CORNER in this"
	cont "city. It's pretty"
	cont "rad."
	done
	
KumquatEastCooltrainerF:
	jumptext KumquatEastCooltrainerFText
	
KumquatEastCooltrainerFText:
	text "Ugh, can you,"
	line "like, go away?"
	
	para "I'm trying to tan"
	line "here!"
	done
	
KumquatEastSightseerF1:
	jumptextfaceplayer KumquatEastSightseerF1Text
	
KumquatEastSightseerF1Text:
	text "I'm staying at"
	line "the ORANGE CREW"
	cont "LUANA's hotel!"
	
	para "It's so ritzy!"
	done

KumquatEastSightseerF2:
	faceplayer
	opentext
	trade 4
	waitbutton
	closetext
	end

KumquatEastFisher:
	jumptextfaceplayer KumquatEastFisherText
	
KumquatEastFisherText:
	text "There's this old"
	line "PROF. who studies"
	cont "MAGIKARP."
	
	para "He said whoever"
	line "brings him the"
	cont "biggest one gets"
	cont "a special FISHING"
	cont "ROD."
	
	para "I've had no luck"
	line "here with my OLD"
	cont "ROD<...>"
	done
	
KumquatEastCooltrainerM:
	faceplayer
	opentext
	checkevent EVENT_KUMQUAT_COOLTRAINER_DRAGON_FANG
	iftrue .AlreadyGotDragonFang
	writetext KumquatEastCooltrainerMText1
	waitbutton
	verbosegiveitem MAGMARIZER
	iffalse KumquatEastCooltrainerMDoneScript
	closetext
	setevent EVENT_KUMQUAT_COOLTRAINER_DRAGON_FANG
	end
	
.AlreadyGotDragonFang:
	writetext KumquatEastCooltrainerMText2
	waitbutton
	closetext
	end
	
KumquatEastCooltrainerMDoneScript:
	closetext
	end
	
KumquatEastCooltrainerMText1:
	text "You seem strong."
	line "I need a break"
	cont "after the beatdown"
	cont "the GYM gave me."
	
	para "Take this."
	done
	
KumquatEastCooltrainerMText2:
	text "It might do some-"
	line "thing to a MAGMAR"
	cont "if you use it."
	done
	
KumquatIslandSign:
	jumptext KumquatIslandSignText
	
KumquatIslandSignText:
	text "KUMQUAT ISLAND"
	
	para "Dazzling jewel of"
	line "the ORANGE ISLANDS"
	done

KumquatIslandEast_MapEventHeader::

.Warps: db 4
	warp_def 15, 2, 1, KUMQUAT_HOTEL_LOBBY
	warp_def  9,  7, 1, KUMQUAT_HOUSE_1
	warp_def 13,  9, 1, KUMQUAT_HOUSE_2
	warp_def 15, 15, 1, KUMQUAT_CENTER

.CoordEvents: db 0

.BGEvents: db 1
	signpost  7, 17, SIGNPOST_READ, KumquatIslandSign

.ObjectEvents: db 10
	person_event SPRITE_UMBRELLA, 24, 8, SPRITEMOVEDATA_UMBRELLA_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KumquatEastUmbrellaScript, -1
	person_event SPRITE_UMBRELLA, 24, 9, SPRITEMOVEDATA_UMBRELLA_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KumquatEastUmbrellaScript, -1
	person_event SPRITE_UMBRELLA, 22, 14, SPRITEMOVEDATA_UMBRELLA_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KumquatEastUmbrellaScript, -1
	person_event SPRITE_UMBRELLA, 22, 15, SPRITEMOVEDATA_UMBRELLA_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, KumquatEastUmbrellaScript, -1
	person_event SPRITE_SUPER_NERD,  9, 16, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, KumquatEastSupernerd, -1
	person_event SPRITE_COOLTRAINER_F, 23, 16, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, (1 << MORN) | (1 << DAY), PAL_OW_RED, PERSONTYPE_SCRIPT, 0, KumquatEastCooltrainerF, -1
	person_event SPRITE_SIGHTSEER_F, 18,  6, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, KumquatEastSightseerF1, -1
	person_event SPRITE_SIGHTSEER_F, 17, 19, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, KumquatEastSightseerF2, -1
	person_event SPRITE_FISHER, 27, 18, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, KumquatEastFisher, -1
	person_event SPRITE_COOLTRAINER_M, 12,  6, SPRITEMOVEDATA_WANDER, 2, 0, -1, (1 << NITE), PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, KumquatEastCooltrainerM, -1
