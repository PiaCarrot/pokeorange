const_value set 1
	const KUMQUATWEST_BOATTOP
	const KUMQUATWEST_BOATBOTTOM
	const KUMQUATWEST_UMBRELLA1
	const KUMQUATWEST_UMBRELLA2
	const KUMQUATWEST_SAILOR1
	const KUMQUATWEST_SAILOR2
	const KUMQUATWEST_FISHER1
	const KUMQUATWEST_SIGHTSEER1
	
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
;	warp SHAMOUTI_ISLAND, 1, 1
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

KumquatIslandWest_MapEventHeader::

.Warps: db 1
	warp_def 17, 12, 2, GAME_CORNER

.CoordEvents: db 0

.BGEvents: db 1
	signpost 18, 14, SIGNPOST_READ, GameCornerSign


.ObjectEvents: db 8
	person_event SPRITE_SAILBOAT_TOP, 28, 14, SPRITEMOVEDATA_SAILBOAT_TOP, 0, 0, -1, -1, PAL_OW_TREE, PERSONTYPE_SCRIPT, 0, KumquatWestUmbrellas, -1
	person_event SPRITE_SAILBOAT_BOTTOM, 28, 14, SPRITEMOVEDATA_SAILBOAT_BOTTOM, 0, 0, -1, -1, PAL_OW_TREE, PERSONTYPE_SCRIPT, 0, KumquatWestUmbrellas, -1
	person_event SPRITE_UMBRELLA, 22, 22, SPRITEMOVEDATA_UMBRELLA_LEFT, 0, 0, -1, -1, PAL_OW_ROCK, PERSONTYPE_SCRIPT, 0, KumquatWestUmbrellas, -1
	person_event SPRITE_UMBRELLA, 22, 23, SPRITEMOVEDATA_UMBRELLA_RIGHT, 0, 0, -1, -1, PAL_OW_ROCK, PERSONTYPE_SCRIPT, 0, KumquatWestUmbrellas, -1
	person_event SPRITE_SAILOR, 27, 14, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, KumquatWestShamoutiSailor, -1
	person_event SPRITE_SAILOR, 10, 17, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, KumquatWestSailor, -1
	person_event SPRITE_FISHER, 4, 27, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, KumquatWestFisher, -1
	person_event SPRITE_SIGHTSEER_F, 23, 24, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, (1 << MORN) | (1 << DAY), PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, KumquatWestSightseer, -1

