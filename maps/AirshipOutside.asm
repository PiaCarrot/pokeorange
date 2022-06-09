const_value = 1
	const AIRSHIP_OUTSIDE_RING

AirshipOutside_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

AirshipOutsideCaptureRingScript:
	opentext
	writetext AirshipOutsideCaptureRingScriptText
	yesorno
	iftrue .WarpInsideAirship
	closetext
	end
	
.WarpInsideAirship
	checkevent EVENT_ENTERED_ONCE_ALREADY
	iftrue .WarpToABetterSpot
	closetext
	setevent EVENT_ENTERED_ONCE_ALREADY
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp AIRSHIP_INTERIOR, 6, 6
	end
	
.WarpToABetterSpot
	closetext
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp AIRSHIP_INTERIOR, 10, 8
	end

AirshipOutsideCaptureRingScriptText:
	text "It should take me"
	line "inside. Use it?"
	done

AirshipOutside_MapEventHeader::

.Warps: db 0
.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_CAPTURE_RING, 40, 16, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, AirshipOutsideCaptureRingScript, -1
