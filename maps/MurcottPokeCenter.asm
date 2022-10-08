const_value = 1
	const MURCOTT_NURSE
	const MURCOTT_SLOUCH

MurcottPokeCenter_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MurcottNurseScript:
	jumpstd pokecenternurse

MurcottSlouchScript:
	opentext
	writetext MurcottSlouchText
	waitbutton
	closetext
	end

MurcottSlouchText:
	text "Go upstairs in a"
	line "GATEHOUSE and look"
	cont "into the binocul-"
	cont "ars."
	done
	
MurcottSightseerScript:
	jumptextfaceplayer MurcottSightseerText
	
MurcottSightseerText:
	text "The southern is-"
	line "lands are rather"
	cont "quaint, don't you"
	cont "think?"
	
	para "I can't wait until"
	line "I get to KUMQUAT"
	cont "or TROVITOPOLIS."
	
	para "Huge malls, five-"
	line "star hotels, and"
	cont "the best beaches!"
	done
	
MurcottLuckyEggScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ORANGE_LEAGUE
	iftrue .CanGetLuckyEgg
	writetext MurcottCenterOldLadyText
	waitbutton
	closetext
	end
.CanGetLuckyEgg:
	checkevent EVENT_MURCOTT_LUCKY_EGG
	iftrue .AlreadyGotLuckyEgg
    writetext GiveLuckyEggText
	waitbutton
	verbosegiveitem LUCKY_EGG
	iffalse MurcottLuckyEggDoneScript
	setevent EVENT_MURCOTT_LUCKY_EGG
	closetext
	end

.AlreadyGotLuckyEgg:
    writetext GotLuckyEggText
	waitbutton
	closetext
	end

MurcottLuckyEggDoneScript:
	closetext
	end
	
GiveLuckyEggText:
	text "Oh! You look like"
	line "a hungry young"
	cont "trainer."
	
	para "Take this, I am"
	line "sure it will help!"
	done
	
GotLuckyEggText:
	text "I sure do love"
	line "scrambled eggs!"
	done
	
MurcottCenterOldLadyText:
	text "A trainer, eh?"
	line "You don't look"
	cont "like you need a"
	cont "good meal yet."
	
	para "Come see granny"
	line "when you're very"
	cont "hungry."
	done

MurcottPokeCenter_MapEventHeader::

.Warps: db 2
	warp_def 7, 4, 5, MURCOTT_ISLAND
	warp_def 7, 5, 5, MURCOTT_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 4
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MurcottNurseScript, -1
	person_event SPRITE_PC_SLOUCH, 4, 0, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MurcottSlouchScript, -1
	person_event SPRITE_SIGHTSEER_F, 6, 7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MurcottSightseerScript, -1
	person_event SPRITE_GRANNY, 5, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, MurcottLuckyEggScript, -1

