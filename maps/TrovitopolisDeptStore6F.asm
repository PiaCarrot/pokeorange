const_value = 1
	const DEPT_STORE_6F_COOLTRAINER

TrovitopolisDeptStore6F_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

TrovitopolisVendingMachine:
	opentext
	writetext TrovitopolisVendingText
.Start:
	special PlaceMoneyTopRight
	loadmenudata .MenuData
	verticalmenu
	closewindow
	if_equal $1, .FreshWater
	if_equal $2, .SodaPop
	if_equal $3, .Lemonade
	closetext
	end

.FreshWater:
	checkmoney $0, 200
	if_equal $2, .NotEnoughMoney
	giveitem FRESH_WATER
	iffalse .NotEnoughSpace
	takemoney $0, 200
	itemtotext FRESH_WATER, $0
	jump .VendItem

.SodaPop:
	checkmoney $0, 300
	if_equal $2, .NotEnoughMoney
	giveitem SODA_POP
	iffalse .NotEnoughSpace
	takemoney $0, 300
	itemtotext SODA_POP, $0
	jump .VendItem

.Lemonade:
	checkmoney $0, 350
	if_equal $2, .NotEnoughMoney
	giveitem LEMONADE
	iffalse .NotEnoughSpace
	takemoney $0, 350
	itemtotext LEMONADE, $0
	jump .VendItem

.VendItem:
	pause 10
	playsound SFX_ENTER_DOOR
	writetext TrovitopolisClangText
	buttonsound
	itemnotify
	jump .Start

.NotEnoughMoney:
	writetext TrovitopolisVendingNoMoneyText
	waitbutton
	jump .Start

.NotEnoughSpace:
	writetext TrovitopolisVendingNoSpaceText
	waitbutton
	jump .Start

.MenuData:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 19 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "FRESH WATER  ¥200@"
	db "SODA POP     ¥300@"
	db "LEMONADE     ¥350@"
	db "CANCEL@"

TrovitopolisDeptStore6FDirectory:
	jumptext TrovitopolisDeptStore6FDirectoryText

TrovitopolisDeptStore6FElevatorButton:
	jumpstd elevatorbutton

TrovitopolisVendingText:
	text "A vending machine!"
	line "Here's the menu."
	done

TrovitopolisClangText:
	text "Clang! A can of"
	line "@"
	text_from_ram StringBuffer3
	text $55
	db "popped out!"
	done

TrovitopolisVendingNoMoneyText:
	text "Oops, not enough"
	line "money."
	done

TrovitopolisVendingNoSpaceText:
	text "There's no more"
	line "room for stuff."
	done

TrovitopolisDeptStore6FDirectoryText:
	text "Take a Break from"
	line "Shopping!"

	para "6F TRANQUIL SQUARE"
	done
	
DeptStore6FCooltrainerScript:
	jumptextfaceplayer DeptStore6FCooltrainerText
	
DeptStore6FCooltrainerText:
	text "I bought an EGG"
	line "off the lady on"
	cont "the roof."
	
	para "I wonder what it"
	line "will hatch into?"
	done

TrovitopolisDeptStore6F_MapEventHeader::

.Warps: db 3
	warp_def 0, 15, 2, TROVITOPOLIS_DEPT_STORE_5F
	warp_def 0, 2, 1, TROVITOPOLIS_DEPT_STORE_ELEVATOR
	warp_def 0, 13, 1, TROVITOPOLIS_DEPT_STORE_ROOF

.CoordEvents: db 0

.BGEvents: db 6
	signpost 0, 14, SIGNPOST_READ, TrovitopolisDeptStore6FDirectory
	signpost 0, 3, SIGNPOST_READ, TrovitopolisDeptStore6FElevatorButton
	signpost 1, 8, SIGNPOST_UP, TrovitopolisVendingMachine
	signpost 1, 9, SIGNPOST_UP, TrovitopolisVendingMachine
	signpost 1, 10, SIGNPOST_UP, TrovitopolisVendingMachine
	signpost 1, 11, SIGNPOST_UP, TrovitopolisVendingMachine

.ObjectEvents: db 1
	person_event SPRITE_COOLTRAINER_F, 4, 9, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, DeptStore6FCooltrainerScript, -1

