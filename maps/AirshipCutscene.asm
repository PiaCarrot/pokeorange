const_value = 1

AirshipCutscene_MapScriptHeader::

.Triggers: db 1

	dw .Trigger0, 0
	dw .Trigger1, 0

.Callbacks: db 0

.Trigger0:
	priorityjump AirshipCutscene
.Trigger1
	end

AirshipCutscene:
	applymovement PLAYER, AirshipCutsceneHidePersonMovement
	applymovement PLAYER, AirshipCutsceneHidePersonMovement2
	special FadeOutPalettes
	warp AIRSHIP_INTERIOR, 10, 15
	end

AirshipCutsceneHidePersonMovement:
	hide_person
	step_end
AirshipCutsceneHidePersonMovement2:
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

AirshipCutscene_MapEventHeader::

.Warps: db 0
.CoordEvents: db 0
.BGEvents: db 0

.ObjectEvents: db 0