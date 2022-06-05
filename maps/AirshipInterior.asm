const_value = 1

AirshipInterior_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

ControlPanelAirship:
	warp AIRSHIP_OUTSIDE, 8, 14
	end

AirshipInterior_MapEventHeader::

.Warps: db 0
.CoordEvents: db 0

.BGEvents: db 1
	signpost  2, 10, SIGNPOST_READ, ControlPanelAirship

.ObjectEvents: db 0