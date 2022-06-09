const_value = 1
	const AIRSHIP_INTERIOR_LAWRENCE

AirshipInterior_MapScriptHeader::

.Triggers: db 1

	dw .Trigger0, 0
	dw .Trigger1, 0

.Trigger0:
	priorityjump AirshipInteriorCutscene
.Trigger1
	end

AirshipInteriorCutscene:
	applymovement PLAYER, AirshipInteriorHidePersonMovement
	applymovement PLAYER, AirshipInteriorHidePersonMovement2
	opentext
	writetext LawrenceCutsceneMonologue
	waitbutton
	spriteface AIRSHIP_INTERIOR_LAWRENCE, DOWN
	writetext LawrenceCutsceneMonologue2
	waitbutton
	closetext
	domaptrigger AIRSHIP_INTERIOR, $1
	warp CHIEFS_HOUSE, 11, 5
	end

AirshipInteriorHidePersonMovement:
	hide_person
	step_end
AirshipInteriorHidePersonMovement2:
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end
	
LawrenceCutsceneMonologue:
	text "Capture of MOLTRES"
	line "confirmed. Moving"
	cont "toward LIGHTNING"
	cont "ISLAND for target"
	cont "2: ZAPDOS."
	
	para "???: Soon, the"
	line "legendary bird"
	cont "#MON will be"
	cont "in the palm of"
	
	para "of my hand."
	done
	
LawrenceCutsceneMonologue2:
	text "???: Then I'm"
	line "going to acquire"
	cont "you, LUGIA<...>"
	
	para "Hahahahaha<...>"
	
	para "A fine addition"
	line "to my collection,"
	cont "indeed<...>"
	done
	

.Callbacks: db 0

ControlPanelAirship:
	warp ICE_ISLAND, 15, 31
	end

AirshipInterior_MapEventHeader::

.Warps: db 0
.CoordEvents: db 0

.BGEvents: db 1
	signpost  2, 10, SIGNPOST_READ, ControlPanelAirship

.ObjectEvents: db 8	
	person_event SPRITE_LAWRENCE,  3, 10, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, 0, -1
