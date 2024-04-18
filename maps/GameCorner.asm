const_value = 1
	const GAMECORNER_CLERK
	const GAMECORNER_POKEFAN_F
	const GAMECORNER_COOLTRAINER_F
	const GAMECORNER_POKEFAN_M3

GameCorner_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

GameCornerPokefanM3Script:
	faceplayer
	opentext
	writetext GameCornerPokefanM3Text
	waitbutton
	closetext
	spriteface GAMECORNER_POKEFAN_M3, RIGHT
	end

GameCornerCoinVendorScript:
	jumpstd gamecornercoinvendor

GameCornerItemVendorScript:
	faceplayer
	opentext
	writetext GameCornerPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse GameCornerPrizeVendor_NoCoinCaseScript
	writetext GameCornerPrizeVendorWhichPrizeText
GameCornerItemVendor_LoopScript: ; 056c36
	special Special_DisplayCoinCaseBalance
	loadmenudata GameCornerItemVendorMenuData
	verticalmenu
	closewindow
	if_equal $1, .TradeStone
	if_equal $2, .Upgrade
	if_equal $3, .DubiousDisc
	jump GameCornerPrizeVendor_CancelPurchaseScript

.TradeStone:
	checkcoins 1000
	if_equal $2, GameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext TRADE_STONE, $0
	writetext ItemPickedText
	waitbutton
	scall GameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GameCornerPrizeVendor_CancelPurchaseScript
	giveitem TRADE_STONE
	iffalse GameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 1000
	jump GameCornerItemVendor_FinishScript

.Upgrade:
	checkcoins 1000
	if_equal $2, GameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext UP_GRADE, $0
	writetext ItemPickedText
	waitbutton
	scall GameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GameCornerPrizeVendor_CancelPurchaseScript
	giveitem UP_GRADE
	iffalse GameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 1000
	jump GameCornerItemVendor_FinishScript

.DubiousDisc:
	checkcoins 1000
	if_equal $2, GameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext DUBIOUS_DISC, $0
	writetext ItemPickedText
	waitbutton
	scall GameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GameCornerPrizeVendor_CancelPurchaseScript
	giveitem DUBIOUS_DISC
	iffalse GameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 1000
	jump GameCornerItemVendor_FinishScript

GameCornerItemVendor_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext GameCornerPrizeVendorHereYouGoText
	waitbutton
	jump GameCornerItemVendor_LoopScript

GameCornerTMVendorScript:
	faceplayer
	opentext
	writetext GameCornerPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse GameCornerPrizeVendor_NoCoinCaseScript
	writetext GameCornerPrizeVendorWhichPrizeText
GameCornerTMVendor_LoopScript: ; 056c36
	special Special_DisplayCoinCaseBalance
	loadmenudata GameCornerTMVendorMenuData
	verticalmenu
	closewindow
	if_equal $1, .Thunder
	if_equal $2, .Blizzard
	if_equal $3, .FireBlast
	jump GameCornerPrizeVendor_CancelPurchaseScript

.Thunder:
	checkitem TM_THUNDER
	iftrue .AlreadyHaveTM
	checkcoins 5500
	if_equal $2, GameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext TM_THUNDER, $0
	writetext PickedThunderText
	waitbutton
	scall GameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GameCornerPrizeVendor_CancelPurchaseScript
	giveitem TM_THUNDER
	iffalse GameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 5500
	jump GameCornerTMVendor_FinishScript

.Blizzard:
	checkitem TM_BLIZZARD
	iftrue .AlreadyHaveTM
	checkcoins 5500
	if_equal $2, GameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext TM_BLIZZARD, $0
	writetext PickedBlizzardText
	waitbutton
	scall GameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GameCornerPrizeVendor_CancelPurchaseScript
	giveitem TM_BLIZZARD
	iffalse GameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 5500
	jump GameCornerTMVendor_FinishScript

.FireBlast:
	checkitem TM_FIRE_BLAST
	iftrue .AlreadyHaveTM
	checkcoins 5500
	if_equal $2, GameCornerPrizeVendor_NotEnoughCoinsScript
	itemtotext TM_FIRE_BLAST, $0
	writetext PickedFireBlastText
	waitbutton
	scall GameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GameCornerPrizeVendor_CancelPurchaseScript
	giveitem TM_FIRE_BLAST
	iffalse GameCornerPrizeMonVendor_NoRoomForPrizeScript
	takecoins 5500
	jump GameCornerTMVendor_FinishScript
	
.AlreadyHaveTM:
	writetext GameCornerAlreadyHaveTMText
	waitbutton
	closetext
	end

GameCornerPrizeVendor_ConfirmPurchaseScript:
	writetext GameCornerPrizeVendorConfirmPrizeText
	yesorno
	end

GameCornerTMVendor_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext GameCornerPrizeVendorHereYouGoText
	waitbutton
	jump GameCornerTMVendor_LoopScript

GameCornerPrizeVendor_NotEnoughCoinsScript:
	writetext GameCornerPrizeVendorNeedMoreCoinsText
	waitbutton
	closetext
	end

GameCornerPrizeMonVendor_NoRoomForPrizeScript:
	writetext GameCornerPrizeVendorNoMoreRoomText
	waitbutton
	closetext
	end

GameCornerPrizeVendor_CancelPurchaseScript:
	writetext GameCornerPrizeVendorQuitText
	waitbutton
	closetext
	end

GameCornerPrizeVendor_NoCoinCaseScript:
	writetext GameCornerPrizeVendorNoCoinCaseText
	waitbutton
	closetext
	end

GameCornerItemVendorMenuData:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 19 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "LINK CABLE   1000@"
	db "UP-GRADE     1000@"
	db "DUBIOUS DISC 1000@"
	db "CANCEL@"

GameCornerTMVendorMenuData:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 15 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "TM25    5500@"
	db "TM14    5500@"
	db "TM38    5500@"
	db "CANCEL@"


GameCornerPrizeMonVendorScript:
	faceplayer
	opentext
	writetext GameCornerPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse GameCornerPrizeVendor_NoCoinCaseScript
.loop
	writetext GameCornerPrizeVendorWhichPrizeText
	special Special_DisplayCoinCaseBalance
	loadmenudata .MenuDataHeader
	verticalmenu
	closewindow
	if_equal $1, .abra
	if_equal $2, .eevee
	if_equal $3, .cubone
	if_equal $4, .wobbuffet
	jump GameCornerPrizeVendor_CancelPurchaseScript

.abra
	checkcoins 2500
	if_equal $2, GameCornerPrizeVendor_NotEnoughCoinsScript
	checkcode VAR_PARTYCOUNT
	if_equal $6, GameCornerPrizeMonVendor_NoRoomForPrizeScript
	pokenamemem MIME__JR, $0
	scall GameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GameCornerPrizeVendorHereYouGoText
	waitbutton
	writebyte MIME__JR
	special Special_GameCornerPrizeMonCheckDex
	givepoke MIME__JR, 30
	takecoins 2500
	jump .loop

.cubone
	checkcoins 5000
	if_equal $2, GameCornerPrizeVendor_NotEnoughCoinsScript
	checkcode VAR_PARTYCOUNT
	if_equal $6, GameCornerPrizeMonVendor_NoRoomForPrizeScript
	pokenamemem KANGASKHAN, $0
	scall GameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GameCornerPrizeVendorHereYouGoText
	waitbutton
	writebyte KANGASKHAN
	special Special_GameCornerPrizeMonCheckDex
	givepoke KANGASKHAN, 35
	takecoins 5000
	jump .loop

.wobbuffet
	checkcoins 9999
	if_equal $2, GameCornerPrizeVendor_NotEnoughCoinsScript
	checkcode VAR_PARTYCOUNT
	if_equal $6, GameCornerPrizeMonVendor_NoRoomForPrizeScript
	pokenamemem PORYGON, $0
	scall GameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GameCornerPrizeVendorHereYouGoText
	waitbutton
	writebyte PORYGON
	special Special_GameCornerPrizeMonCheckDex
	givepoke PORYGON, 40
	takecoins 9999
	jump .loop

.eevee
	checkcoins 2500
	if_equal $2, GameCornerPrizeVendor_NotEnoughCoinsScript
	checkcode VAR_PARTYCOUNT
	if_equal $6, GameCornerPrizeMonVendor_NoRoomForPrizeScript
	pokenamemem EEVEE, $0
	scall GameCornerPrizeVendor_ConfirmPurchaseScript
	iffalse GameCornerPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GameCornerPrizeVendorHereYouGoText
	waitbutton
	writebyte EEVEE
	special Special_GameCornerPrizeMonCheckDex
	givepoke EEVEE, 30
	takecoins 2500
	jump .loop


.MenuDataHeader:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 17 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "MIME JR.   2500@"
	db "EEVEE      2500@"
	db "KANGASKHAN 5000@"
	db "PORYGON    9999@"

GameCornerPokefanFScript:
	faceplayer
	opentext
	writetext GameCornerPokefanFText
	waitbutton
	closetext
	spriteface GAMECORNER_POKEFAN_F, LEFT
	end

GameCornerCooltrainerFScript:
	jumptextfaceplayer GameCornerCooltrainerFText

GameCornerSlotsMachineScript:
	random 6
	if_equal 0, GameCornerLuckySlotsMachineScript
	refreshscreen
	writebyte FALSE
	special Special_SlotMachine
	closetext
	end

GameCornerLuckySlotsMachineScript:
	refreshscreen
	writebyte TRUE
	special Special_SlotMachine
	closetext
	end

GameCornerCardFlipMachineScript:
	refreshscreen
	special Special_CardFlip
	closetext
	end

GameCornerPrizeVendorIntroText:
	text "Welcome!"

	para "We exchange your"
	line "game coins for"
	cont "fabulous prizes!"
	done

GameCornerPrizeVendorWhichPrizeText:
	text "Which prize would"
	line "you like?"
	done

GameCornerPrizeVendorConfirmPrizeText:
	text_from_ram StringBuffer3
	text "."
	line "Is that right?"
	done

GameCornerPrizeVendorHereYouGoText:
	text "Here you go!"
	done

GameCornerPrizeVendorNeedMoreCoinsText:
	text "Sorry! You need"
	line "more coins."
	done

GameCornerPrizeVendorNoMoreRoomText:
	text "Sorry. You can't"
	line "carry any more."
	done

GameCornerPrizeVendorQuitText:
	text "OK. Please save"
	line "your coins and"
	cont "come again!"
	done

GameCornerPrizeVendorNoCoinCaseText:
	text "Oh? You don't have"
	line "a COIN CASE."
	done

GameCornerPokefanFText:
	text "Slots is where the"
	line "big money is at."
	cont "I ought to try out"
	cont "those new machines"
	cont "they installed."
	done

GameCornerCooltrainerFText:
	text "I won a PORYGON"
	line "with my coins!"
	done

GameCornerPokefanM3Text:
	text "Hmm<...>"
	
	para "I dropped some"
	line "coins earlier."
	done
	
GameCornerAlreadyHaveTMText:
	text "I'm sorry, but you"
	line "already own that"
	cont "TM."
	done
	
GameCorner10Coins:
	checkevent EVENT_GAME_CORNER_HIDDEN_10_COINS
	iftrue .AlreadyGot10Coins
	opentext
	writetext GameCorner10CoinsText
	waitbutton
	checkitem COIN_CASE
	iffalse FloorCoinsNoCoinCaseScript
	waitsfx
	playsound SFX_TRANSACTION
	givecoins 10
	closetext
	setevent EVENT_GAME_CORNER_HIDDEN_10_COINS
	end
	
.AlreadyGot10Coins
	end
	
GameCorner20Coins:
	checkevent EVENT_GAME_CORNER_HIDDEN_20_COINS
	iftrue .AlreadyGot20Coins
	opentext
	writetext GameCorner20CoinsText
	waitbutton
	checkitem COIN_CASE
	iffalse FloorCoinsNoCoinCaseScript
	waitsfx
	playsound SFX_TRANSACTION
	givecoins 20
	closetext
	setevent EVENT_GAME_CORNER_HIDDEN_20_COINS
	end
	
.AlreadyGot20Coins
	end
	
GameCorner50Coins:
	checkevent EVENT_GAME_CORNER_HIDDEN_50_COINS
	iftrue .AlreadyGot50Coins
	opentext
	writetext GameCorner50CoinsText
	waitbutton
	checkitem COIN_CASE
	iffalse FloorCoinsNoCoinCaseScript
	waitsfx
	playsound SFX_TRANSACTION
	givecoins 50
	closetext
	setevent EVENT_GAME_CORNER_HIDDEN_50_COINS
	end
	
.AlreadyGot50Coins
	end
	
GameCorner100Coins:
	checkevent EVENT_GAME_CORNER_HIDDEN_100_COINS
	iftrue .AlreadyGot100Coins
	opentext
	writetext GameCorner100CoinsText
	waitbutton
	checkitem COIN_CASE
	iffalse FloorCoinsNoCoinCaseScript
	waitsfx
	playsound SFX_TRANSACTION
	givecoins 100
	closetext
	setevent EVENT_GAME_CORNER_HIDDEN_100_COINS
	end
	
.AlreadyGot100Coins
	end
	
FloorCoinsNoCoinCaseScript:
	writetext FloorCoinsNoCoinCaseText
	waitbutton
	closetext
	end
	
FloorCoinsNoCoinCaseText:
	text "You don't have a"
	line "COIN CASE!"
	done
	
GameCorner10CoinsText:
	text "You found 10"
	line "coins! Nice!"
	done
	
GameCorner20CoinsText:
	text "You found 20"
	line "coins! Wow!"
	done
	
GameCorner50CoinsText:
	text "You found 50"
	line "coins! Cheers!"
	done
	
GameCorner100CoinsText:
	text "You found 100"
	line "coins! Lucky!"
	done
	
PickedFireBlastText:
	text "Ah, that one con-"
	line "tains FIRE BLAST."
	cont "Good choice!"
	done

PickedBlizzardText:
	text "Ah, that one con-"
	line "tains BLIZZARD."
	cont "Good choice!"
	done
	
PickedThunderText:
	text "Ah, that one con-"
	line "tains THUNDER."
	cont "Good choice!"
	done

ItemPickedText:
	text "Good choice!"
	done
	
GameCorner_MapEventHeader::

.Warps: db 2
	warp_def 11,  7, 1, KUMQUAT_ISLAND_WEST
	warp_def 11,  6, 1, KUMQUAT_ISLAND_WEST

.CoordEvents: db 0

.BGEvents: db 17
	signpost  8,  1, SIGNPOST_LEFT, GameCornerSlotsMachineScript
	signpost  9,  1, SIGNPOST_LEFT, GameCornerSlotsMachineScript
	signpost 11,  1, SIGNPOST_LEFT, GameCornerSlotsMachineScript
	signpost  5, 10, SIGNPOST_READ, GameCornerLuckySlotsMachineScript
	signpost  5, 11, SIGNPOST_READ, GameCornerLuckySlotsMachineScript
	signpost  5, 12, SIGNPOST_READ, GameCornerLuckySlotsMachineScript
	signpost  5, 13, SIGNPOST_READ, GameCornerLuckySlotsMachineScript
	signpost  8, 12, SIGNPOST_RIGHT, GameCornerCardFlipMachineScript
	signpost 10, 12, SIGNPOST_RIGHT, GameCornerCardFlipMachineScript
	signpost 11, 12, SIGNPOST_RIGHT, GameCornerCardFlipMachineScript
	signpost  1,  7, SIGNPOST_READ, GameCornerTMVendorScript
	signpost  1,  9, SIGNPOST_READ, GameCornerItemVendorScript
	signpost  1,  5, SIGNPOST_READ, GameCornerPrizeMonVendorScript
	signpost 10,  9, SIGNPOST_READ, GameCorner10Coins
	signpost  7, 13, SIGNPOST_READ, GameCorner20Coins
	signpost  8,  4, SIGNPOST_READ, GameCorner50Coins
	signpost  4,  8, SIGNPOST_READ, GameCorner100Coins


.ObjectEvents: db 4
	person_event SPRITE_CLERK,  4,  2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GameCornerCoinVendorScript, -1
	person_event SPRITE_LASS, 10,  2, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GameCornerPokefanFScript, -1
	person_event SPRITE_SUPER_NERD,  6,  6, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, GameCornerCooltrainerFScript, -1
	person_event SPRITE_POKEFAN_M,  9, 11, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GameCornerPokefanM3Script, -1
