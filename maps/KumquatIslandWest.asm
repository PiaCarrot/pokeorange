const_value = 1
	const KUMQUATWEST_BOATTOP
	const KUMQUATWEST_BOATBOTTOM
	const KUMQUATWEST_UMBRELLA1
	const KUMQUATWEST_UMBRELLA2
	const KUMQUATWEST_SAILOR1
	const KUMQUATWEST_SAILOR2
	const KUMQUATWEST_FISHER1
	const KUMQUATWEST_SIGHTSEER1
	const KUMQUATWEST_COOLTRAINER_F_1
	const KUMQUATWEST_COOLTRAINER_M_1
	const KUMQUATWEST_COOLTRAINER_F_2
	const KUMQUATWEST_SUPERNERD
	
KumquatIslandWest_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

KumquatWestUmbrellas:
	end
	
KumquatWestShamoutiSailor:
	faceplayer
	checkevent EVENT_BEAT_ORANGE_LEAGUE
	iftrue .ToShamouti
	opentext
	writetext KumquatWestShamoutiSailorText
	waitbutton
	closetext
	end
	
.ToShamouti
	opentext
	writetext KumquatWestShamoutiSailorText2
	yesorno
	iftrue .OffWeGo
	closetext
	end
	
.OffWeGo
	writetext KumquatWestShamoutiSailorText3
	waitbutton
	closetext
	warp SHAMOUTI_ISLAND, 13, 21
	end
	
KumquatWestShamoutiSailorText:
	text "I run a ferry to"
	line "SHAMOUTI ISLAND."
	
	para "Sadly, the sea is"
	line "a bit rough right"
	cont "now, so I can't"
	cont "take you there."
	done
	
KumquatWestShamoutiSailorText2:
	text "You're just in"
	line "time, kid!"
	
	para "I'm about to set"
	line "sail for SHAMOUTI"
	cont "ISLAND. Want to"
	cont "come along?"
	done
	
KumquatWestShamoutiSailorText3:
	text "Off we go!"
	done
	
KumquatWestSailor:
	jumptextfaceplayer KumquatWestSailorText
	
KumquatWestSailorText:
	text "I just came from"
	line "VERMILION CITY."
	
	para "Let me tell you,"
	line "the resorts here"
	cont "can't be beat!"
	done
	
KumquatWestFisher:
	faceplayer
	checkevent EVENT_GOT_COIN_CASE
	iftrue .AlreadyGotCoinCase
	opentext 
	writetext KumquatWestFisherText2
	waitbutton
	verbosegiveitem COIN_CASE
	closetext
	setevent EVENT_GOT_COIN_CASE
	end

.AlreadyGotCoinCase
	opentext
	writetext KumquatWestFisherText
	waitbutton
	closetext
	end
	
KumquatWestFisherText:
	text "Maybe you'll have"
	line "better luck."
	done
	
KumquatWestFisherText2:
	text "I lost all my"
	line "cash playing at"
	cont "the GAME CORNER."
	
	para "I don't need this"
	line "anymore. Take it."
	done
	
KumquatWestSightseer:
	jumptextfaceplayer KumquatWestSightseerText
	
KumquatWestSightseerText:
	text "What do you want?"
	line "I'm soaking up"
	cont "some sun here!"
	done
	
GameCornerSign:
	jumptext GameCornerSignText
	
GameCornerSignText:
	text "GAME CORNER"
	
	para "Hit it big for"
	line "awesome prizes!"
	done
	
KumquatWestSuperNerd:
	faceplayer
	opentext
	checkcoins 5000
	if_equal $2, .DontHaveCoinsforPPUP
	special Special_DisplayCoinCaseBalance
	writetext KumquatWestSuperNerdText2
	yesorno
	iftrue .WantPPUP
	writetext KumquatWestSuperNerdText3
	waitbutton
	closetext
	end
	
.DontHaveCoinsforPPUP:
	writetext KumquatWestSuperNerdText1
	waitbutton
	closetext
	end
	
.WantPPUP:
	playsound SFX_TRANSACTION
	waitsfx
	verbosegiveitem PP_UP
	writetext KumquatWestSuperNerdText4
	waitbutton
	closetext
	takecoins 5000
	end

KumquatWestSuperNerdText1:
	text "Sigh<...>"
	line "You don't have"
	cont "what I'm looking"
	cont "for."
	done
	
KumquatWestSuperNerdText2:
	text "I smell coins!"
	line "How about it?"
	cont "For 5000 coins,"
	cont "I'll give you a"
	cont "precious PP UP."
	done
	
KumquatWestSuperNerdText3:
	text "Aw<...>"
	done
	
KumquatWestSuperNerdText4:
	text "Oh yes! Coins are"
	line "the best!"
	done
	
KumquatWestCooltrainerF2:
	jumptextfaceplayer KumquatWestCooltrainerF2Text
	
KumquatWestCooltrainerF2Text:
	text "LUANA is the gym"
	line "leader here."
	
	para "Her ALAKAZAM packs"
	line "a PSYCHIC punch!"
	done

KumquatWestCooltrainerM:
	jumptextfaceplayer KumquatWestCooltrainerMText
	
KumquatWestCooltrainerMText:
	text "I hear the ORANGE"
	line "CREW leader has a"
	cont "strong DRAGON-type"
	cont "#MON."
	done

KumquatWestCooltrainerF1:
	jumptextfaceplayer KumquatWestCooltrainerF1Text
	
KumquatWestCooltrainerF1Text:
	text "<...>"
	
	para "I think my team is"
	line "pretty well bal-"
	cont "anced."
	
	para "All my friends got"
	line "stomped by LUANA."
	done

KumquatIslandWest_MapEventHeader::

.Warps: db 4
	warp_def 17, 12, 2, GAME_CORNER
	warp_def  3, 24, 1, KUMQUAT_HOUSE_3
	warp_def  5, 19, 1, KUMQUAT_HOUSE_4
	warp_def  9, 11, 1, KUMQUAT_MART

.CoordEvents: db 0

.BGEvents: db 1
	signpost 18, 14, SIGNPOST_READ, GameCornerSign


.ObjectEvents: db 12
	person_event SPRITE_SAILBOAT_TOP, 28, 12, SPRITEMOVEDATA_SAILBOAT_TOP, 0, 0, -1, -1, PAL_OW_TREE, PERSONTYPE_SCRIPT, 0, KumquatWestUmbrellas, -1
	person_event SPRITE_SAILBOAT_BOTTOM, 28, 12, SPRITEMOVEDATA_SAILBOAT_BOTTOM, 0, 0, -1, -1, PAL_OW_TREE, PERSONTYPE_SCRIPT, 0, KumquatWestUmbrellas, -1
	person_event SPRITE_UMBRELLA, 22, 22, SPRITEMOVEDATA_UMBRELLA_LEFT, 0, 0, -1, -1, PAL_OW_ROCK, PERSONTYPE_SCRIPT, 0, KumquatWestUmbrellas, -1
	person_event SPRITE_UMBRELLA, 22, 23, SPRITEMOVEDATA_UMBRELLA_RIGHT, 0, 0, -1, -1, PAL_OW_ROCK, PERSONTYPE_SCRIPT, 0, KumquatWestUmbrellas, -1
	person_event SPRITE_COOLTRAINER_F, 27, 12, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, KumquatWestShamoutiSailor, -1
	person_event SPRITE_SAILOR, 10, 17, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, KumquatWestSailor, -1
	person_event SPRITE_FISHER, 4, 27, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, KumquatWestFisher, -1
	person_event SPRITE_SIGHTSEER_F, 23, 24, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, (1 << MORN) | (1 << DAY), PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, KumquatWestSightseer, -1
	person_event SPRITE_COOLTRAINER_F, 11,  8, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, KumquatWestCooltrainerF1, -1
	person_event SPRITE_COOLTRAINER_M, 12, 22, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, KumquatWestCooltrainerM, -1
	person_event SPRITE_COOLTRAINER_F, 20,  7, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, KumquatWestCooltrainerF2, -1
	person_event SPRITE_SUPER_NERD, 16, 20, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, (1 << NITE), PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, KumquatWestSuperNerd, -1


