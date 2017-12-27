const_value set 1

TrovitopolisDeptStoreRoof_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

DeptOldLadyRoofScript:
	faceplayer
	opentext
	checkevent EVENT_BOUGHT_TOGEPI_EGG
	iftrue .SoldOut
	writetext DeptOldLadyText1
	special PlaceMoneyTopRight
	yesorno
	iffalse .RefusedDeptStoreRoof
	checkmoney $0, 2000
	if_equal $2, NotEnoughMoneyDeptRoofText
	checkcode VAR_PARTYCOUNT
	if_equal PARTY_LENGTH, .PartyFull
	giveegg TOGEPI, 5
	stringtotext .eggname, $1
	waitsfx
	playsound SFX_TRANSACTION
	takemoney $0, 2000
	special PlaceMoneyTopRight
	writetext PleasureDoingBusinessDeptStoreText
	waitbutton
	setevent EVENT_BOUGHT_TOGEPI_EGG
	closetext
	end
	
.SoldOut:
	writetext AlreadyBoughtTogepiEggText
	waitbutton
	closetext
	end
	
.PartyFull:
	writetext DeptRoofPartyFullText
	waitbutton
	closetext
	end
	
.RefusedDeptStoreRoof:
	writetext RefusedDeptStoreLadyText
	waitbutton
	closetext
	end
	
.eggname
	db "EGG@"
	
AlreadyBoughtTogepiEggText:
	text "I'm all sold out!"
	done

DeptOldLadyText1:
	text "I sell very rare"
	line "#MON EGGs."
	
	para "I have one more!"
	line "It can be yours"
	cont "for only ¥2000!"
	cont "How about it?"
	done
	
NotEnoughMoneyDeptRoofText:
	text "You don't have"
	line "enough money!"
	done
	
DeptRoofPartyFullText:
	text "You don't have"
	line "enough room!"
	done
	
RefusedDeptStoreLadyText:
	text "Very well, then."
	done
	
PleasureDoingBusinessDeptStoreText:
	text "Pleasure doing"
	line "business with you."
	done

TrovitopolisDeptStoreRoof_MapEventHeader::

.Warps: db 1
	warp_def 1, 9, 3, TROVITOPOLIS_DEPT_STORE_6F

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_GRANNY, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, DeptOldLadyRoofScript, -1

