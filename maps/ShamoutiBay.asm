const_value = 1
	const SHAMOUTI_BOATTOP
	const SHAMOUTI_BOATBOTTOM

ShamoutiBay_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

ShamoutiBayBoat:
	jumptext ShamoutiBayBoatText

ShamoutiBayBoatText:
	text "It's the boat that"
	line "brought you here."
	done

ShamoutiBay_MapEventHeader::

.Warps: db 1
	warp_def $9, $7, 1, SHAMOUTI_BAY_HOUSE

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_SAILBOAT_TOP, 16,  8, SPRITEMOVEDATA_SAILBOAT_TOP, 0, 0, -1, -1, PAL_OW_TREE, PERSONTYPE_SCRIPT, 0, ShamoutiBayBoat, -1
	person_event SPRITE_SAILBOAT_BOTTOM, 16,  8, SPRITEMOVEDATA_SAILBOAT_BOTTOM, 0, 0, -1, -1, PAL_OW_TREE, PERSONTYPE_SCRIPT, 0, ShamoutiBayBoat, -1
