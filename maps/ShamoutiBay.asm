const_value = 1
	const SHAMOUTI_BOATTOP
	const SHAMOUTI_BOATBOTTOM
	const SHAMOUTI_BAY_SEASHELL
	const SHAMOUTI_BAY_TRADE_STONE

ShamoutiBay_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

ShamoutiBaySeashellScript:
	opentext
	checkitem SHELL_BOX
	iffalse .NoShellBox
	writetext FoundShamoutiBaySeashell
	playsound SFX_DEX_FANFARE_140_169
	waitsfx
	waitbutton
	closetext
	giveshells 1
	setevent EVENT_SHAMOUTI_BAY_SEASHELL
	disappear SHAMOUTI_BAY_SEASHELL
	end
	
.NoShellBox:
	writetext ShamoutiBayNoShellBox
	waitbutton
	closetext
	end

ShamoutiBayBoat:
	jumptext ShamoutiBayBoatText

ShamoutiBayBoatText:
	text "It's the boat that"
	line "brought you here."
	done
	
ShamoutiBayNoShellBox:
    text "What a pretty sea-"
    line "shell! It looks"
    cont "too fragile to"
    cont "go in my BAG."
    done
	
FoundShamoutiBaySeashell:
	text "You found a rare"
	line "seashell!"
	done

ShamoutiBayTradestone:
	itemball TRADE_STONE

ShamoutiBay_MapEventHeader::

.Warps: db 1
	warp_def $9, $7, 1, SHAMOUTI_BAY_HOUSE

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 4
	person_event SPRITE_SAILBOAT_TOP, 16,  8, SPRITEMOVEDATA_SAILBOAT_TOP, 0, 0, -1, -1, PAL_OW_TREE, PERSONTYPE_SCRIPT, 0, ShamoutiBayBoat, -1
	person_event SPRITE_SAILBOAT_BOTTOM, 16,  8, SPRITEMOVEDATA_SAILBOAT_BOTTOM, 0, 0, -1, -1, PAL_OW_TREE, PERSONTYPE_SCRIPT, 0, ShamoutiBayBoat, -1
	person_event SPRITE_SEASHELL, 23, 39, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ShamoutiBaySeashellScript, EVENT_SHAMOUTI_BAY_SEASHELL
	person_event SPRITE_POKE_BALL, 22, 17, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, ShamoutiBayTradestone, EVENT_SHAMOUTI_BAY_TRADE_STONE

