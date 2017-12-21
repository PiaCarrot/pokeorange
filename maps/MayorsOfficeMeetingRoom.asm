const_value set 1
	const MAYORS_OFFICE_MAYOR
	const MAYORS_OFFICE_JESSIE
	const MAYORS_OFFICE_JAMES
	const MAYORS_OFFICE_BUTCH
	const MAYORS_OFFICE_CASSIDY
	const MAYORS_OFFICE_TRACEY
	const MAYORS_OFFICE_LORELEI

MayorsOfficeMeetingRoom_MapScriptHeader:

.MapTriggers:
	db 2

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1

.MapCallbacks:
	db 0

.Trigger0:
	priorityjump MayorOfficeMeetingRoomScript
	end

.Trigger1:
	end
	
MayorOfficeMeetingRoomScript:
	end

MayorsOfficeMeetingRoom_MapEventHeader::

.Warps: db 2
	warp_def 9, 15, 3, MAYORS_OFFICE
	warp_def 9, 16, 3, MAYORS_OFFICE

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 7
	person_event SPRITE_MAYOR, 6, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_JESSIE, 4, 18, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_JAMES, 5, 18, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_ROCKET, 4, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_ROCKET_GIRL, 5, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_TRACEY, 9, 15, SPRITEMOVEDATA_STANDING_UP, 0, 1, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_TRACEY_TROVITOPOLIS_PORT
	person_event SPRITE_LORELEI, 7, 15, SPRITEMOVEDATA_STANDING_UP, 0, 1, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1

