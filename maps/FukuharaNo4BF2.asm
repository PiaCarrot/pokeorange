const_value = 1
	const FUKUHARA_BF2_ITEMBALL_SUPER_REPEL
	const FUKUHARA_BF2_ITEMBALL_RARE_CANDY
	const FUKUHARA_BF2_ITEMBALL_TRADE_STONE
	const FUKUHARA_BF2_BUTCH_1
	const FUKUHARA_BF2_BUTCH_2

FukuharaNo4BF2_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

FukuharaBF2SuperRepel:
	itemball SUPER_REPEL

FukuharaBF2RareCandy:
	itemball RARE_CANDY

FukuharaBF2TradeStone:
	itemball TRADE_STONE
	
FukuharaBF2Butch1Script:
	faceplayer
	showemote EMOTE_SHOCK, FUKUHARA_BF2_BUTCH_1, 15
	opentext
	writetext FukuharaBF2ButchText1
	waitbutton
	closetext
	applymovement FUKUHARA_BF2_BUTCH_1, FukuharaBF2ButchMovement1
	disappear FUKUHARA_BF2_BUTCH_1
	setevent EVENT_FUKUHARA_BF2_BUTCH_1
	end
	
FukuharaBF2ButchText1:
	text "BUTCH: Gah!"
	line "Not you again!"
	
	para "<...>"
	
	para "You're gonna stop"
	line "us? Wait, that's"
	cont "not my name!"
	
	para "Erm, I gotta go!"
	done
	
FukuharaBF2ButchMovement1:
	run_step RIGHT
	run_step DOWN
	run_step DOWN
	run_step DOWN
	run_step DOWN
	run_step DOWN
	step_end
	
FukuharaBF2Butch2Script:
	faceplayer
	opentext
    writetext FukuharaBF2ButchText2
	waitbutton
	closetext
	winlosstext FukuharaButchWinLoss, 0
	setlasttalked FUKUHARA_BF2_BUTCH_2
	loadtrainer BUTCH, 2
	startbattle
	playmapmusic
	reloadmapafterbattle
	opentext
	writetext FukuharaBF2ButchText3
	waitbutton
	closetext
	applymovement FUKUHARA_BF2_BUTCH_2, FukuharaBF2ButchMovement1
	disappear FUKUHARA_BF2_BUTCH_2
	setevent EVENT_BEAT_BUTCH_FUKUHARA_4
	end
	
FukuharaBF2ButchText2:
	text "BOTCH: I can't let"
	line "you pass! Orders"
	cont "from CASSIDY!"
	done
	
FukuharaButchWinLoss:
	text "The name's not"
	line "BOTCH! It's BUTCH!"
	done
	
FukuharaBF2ButchText3:
	text "BUTCH: I've gotta"
	line "get CASSIDY!"
	
	para "Dang kids!"
	done

FukuharaNo4BF2_MapEventHeader::

.Warps: db 2
	warp_def 7, 9, 2, FUKUHARA_NO_4_BF1
	warp_def 35, 25, 1, FUKUHARA_NO_4_BF3

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 5
	person_event SPRITE_POKE_BALL, 29, 37, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, FukuharaBF2SuperRepel, EVENT_FUKUHARA_BF2_SUPER_REPEL
	person_event SPRITE_POKE_BALL, 37, 6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, FukuharaBF2RareCandy, EVENT_FUKUHARA_BF2_RARE_CANDY
	person_event SPRITE_POKE_BALL, 2, 30, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, FukuharaBF2TradeStone, EVENT_FUKUHARA_BF2_TRADE_STONE
	person_event SPRITE_ROCKET, 14, 11, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FukuharaBF2Butch1Script, EVENT_FUKUHARA_BF2_BUTCH_1
	person_event SPRITE_ROCKET, 27, 31, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, FukuharaBF2Butch2Script, EVENT_BEAT_BUTCH_FUKUHARA_4

