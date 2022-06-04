const_value = 1
	const MAYOR_OFFICE_RECEPTIONIST

MayorsOffice_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MayorReceptionistScript:
	faceplayer
	opentext
	checkevent EVENT_TROVITOPOLIS_CAN_GO_IN_MAYORS_OFFICE
	iftrue .ReceptionistLeaves
	writetext MayorReceptionistNoOneCanEnterText
	waitbutton
	closetext
	end
	
.ReceptionistLeaves:
	writetext MayorReceptionistLeavingText
	waitbutton
	closetext
	disappear MAYOR_OFFICE_RECEPTIONIST
	setevent EVENT_MAYORS_RECEPTIONIST_LEAVES
	special Special_FadeInQuickly
	end
	
MayorReceptionistNoOneCanEnterText:
	text "Um<...> I'm sorry."
	
	para "No one is allowed"
	line "in. Please come"
	cont "some other time."
	done
	
MayorReceptionistLeavingText:
	text "Um<...> I'm sorry."
	
	para "<...> <...> <...>"
	
	para "You're here to put"
	line "a stop to the"
	cont "mayor?"
	
	para "In that case<...>"
	line "Please! Go right"
	cont "ahead! If anyone"
	cont "asks, I was beat!"
	done

MayorsOffice_MapEventHeader::

.Warps: db 3
	warp_def 7, 2, 12, TROVITOPOLIS
	warp_def 7, 3, 12, TROVITOPOLIS
	warp_def 0, 2, 1, MAYORS_OFFICE_MEETING_ROOM

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_CLERK, 1, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, MayorReceptionistScript, EVENT_MAYORS_RECEPTIONIST_LEAVES

