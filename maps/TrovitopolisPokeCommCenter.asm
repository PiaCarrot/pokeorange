const_value set 1
	const TROVITOPOLIS_NURSE

TrovitopolisPokeCommCenter_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

TrovitopolisNurseScript:
	jumpstd pokecenternurse
	
TrovitopolisPokeCommLassScript:
	jumptextfaceplayer TrovitopolisPokeCommLassText
	
TrovitopolisPokeCommLassText:
	text "Hey! You can trade"
	line "and battle other"
	cont "people upstairs!"
	done

TrovitopolisPokeCommRockerScript:
	jumptextfaceplayer TrovitopolisPokeCommRockerText
	
TrovitopolisPokeCommRockerText:
	text "THE FACILITY THERE"
	line "CAN'T BE USED NOW."
	
	para "IT WILL FEEL GOOD"
	line "TO GO TO THE HEAR-"
	cont "SAID PLACE EARLIER"
	
	para "<...>"
	
	para "I sorry. I come"
	line "from VIETNAMESE"
	cont "JOHTO region."
	done

TrovitopolisPokeCommTeacherScript:
	jumptextfaceplayer TrovitopolisPokeCommTeacherText
	
TrovitopolisPokeCommTeacherText:
	text "Hmm, a mobile"
	line "system set up for"
	cont "trainers."
	
	para "Might be time for"
	line "me to get one of"
	cont "those cute new"
	cont "flip phones!"
	done
	
TrovitopolisPokeCommScientist1Script:
	jumptext TrovitopolisPokeCommScientist1Text
	
TrovitopolisPokeCommScientist1Text:
	text "<...>"
	
	para "SUKIYAMI: Gah!"
	
	para "No! I deleted all"
	line "of the SAVE data!"
	
	para "AIZAWA is going to"
	line "kill me<...>"
	done
	
TrovitopolisPokeCommScientist2Script:
	jumptext TrovitopolisPokeCommScientist2Text
	
TrovitopolisPokeCommScientist2Text:
	text "<...>"
	
	para "RANGI: Hmm<...>"
	
	para "Polished Crystal"
	line "5.0, now with Z"
	cont "MOVES, MEGAS, and"
	cont "ASH GRENINJA!"
	
	para "Download it off"
	line "GITHUB!"
	done
	
PokeCommSign:
	jumptext PokeCommSignText
	
PokeCommSignText:
	text "ADMIN ROOM"
	
	para "Warning!"
	line "Our staff like to"
	cont "ramble on about"
	cont "things that don't"
	
	para "make sense!"
	done
	
APSign:
	jumptext APSignText
	
APSignText:
	text "ANCIENT PLATINUM"
	line "COMING SOON"
	done
	
PokeCommMachineSign:
	jumptext PokeCommMachineSignText
	
PokeCommMachineSignText:
	text "There's a lot of"
	line "news articles!"
	
	para "Maybe one day I'll"
	line "bother to read"
	cont "some<...>"
	done

TrovitopolisPokeCommCenter_MapEventHeader::

.Warps: db 6
	warp_def 21, 6, 1, TROVITOPOLIS
	warp_def 21, 7, 1, TROVITOPOLIS
	warp_def 12, 0, 5, TROVITOPOLIS_POKE_COMM_CENTER
	warp_def 21, 0, 1, POKECENTER_2F
	warp_def 7, 0, 3, TROVITOPOLIS_POKE_COMM_CENTER
	warp_def 7, 1, 3, TROVITOPOLIS_POKE_COMM_CENTER

.CoordEvents: db 0

.BGEvents: db 18
	signpost 15, 2, SIGNPOST_READ, PokeCommSign
	signpost 2, 6, SIGNPOST_READ, APSign
	signpost 10, 19, SIGNPOST_READ, PokeCommMachineSign
	signpost 11, 19, SIGNPOST_READ, PokeCommMachineSign
	signpost 12, 19, SIGNPOST_READ, PokeCommMachineSign
	signpost 13, 19, SIGNPOST_READ, PokeCommMachineSign
	signpost 14, 19, SIGNPOST_READ, PokeCommMachineSign
	signpost 15, 19, SIGNPOST_READ, PokeCommMachineSign
	signpost 17, 18, SIGNPOST_READ, PokeCommMachineSign
	signpost 17, 17, SIGNPOST_READ, PokeCommMachineSign
	signpost 17, 16, SIGNPOST_READ, PokeCommMachineSign
	signpost 17, 15, SIGNPOST_READ, PokeCommMachineSign
	signpost 15, 14, SIGNPOST_READ, PokeCommMachineSign
	signpost 14, 14, SIGNPOST_READ, PokeCommMachineSign
	signpost 13, 14, SIGNPOST_READ, PokeCommMachineSign
	signpost 12, 14, SIGNPOST_READ, PokeCommMachineSign
	signpost 11, 14, SIGNPOST_READ, PokeCommMachineSign
	signpost 10, 14, SIGNPOST_READ, PokeCommMachineSign

.ObjectEvents: db 6
	person_event SPRITE_NURSE, 13, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TrovitopolisNurseScript, -1
	person_event SPRITE_LASS, 17, 4, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TrovitopolisPokeCommLassScript, -1
	person_event SPRITE_ROCKER, 9, 21, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 1, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TrovitopolisPokeCommRockerScript, -1
	person_event SPRITE_TEACHER, 18, 10, SPRITEMOVEDATA_STANDING_UP, 0, 1, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TrovitopolisPokeCommTeacherScript, -1
	person_event SPRITE_SCIENTIST, 5, 6, SPRITEMOVEDATA_STANDING_UP, 0, 1, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, TrovitopolisPokeCommScientist1Script, -1
	person_event SPRITE_SCIENTIST, 3, 3, SPRITEMOVEDATA_STANDING_UP, 0, 1, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, TrovitopolisPokeCommScientist2Script, -1

