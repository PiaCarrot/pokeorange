KumquatHotelElevator_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

KumquatHotelElevatorScript:
	opentext
	checkevent EVENT_POOL_MASTER_DEFEATED
	iftrue .elevator2
	writetext NeedPoolMasterText
	waitbutton
	closetext
	end
	
.elevator2
	checkevent EVENT_SUITE_MASTER_DEFEATED
	iftrue .elevator4
	elevator Elevator_kumquat2
	jump .elevatoranimation
	
.elevator4
	elevator Elevator_kumquat4
	jump .elevatoranimation
	
	
.elevatoranimation
	closetext
	iffalse .Done
	pause 5
	playsound SFX_ELEVATOR
	earthquake 60
	waitsfx
	end

.Done:
	end

Elevator_kumquat2:
	db 2 ; floors
	elevfloor _1F,  4, KUMQUAT_HOTEL_LOBBY
	elevfloor _2F,  1, KUMQUAT_HOTEL_SUITES
	db -1 ; end
	
Elevator_kumquat4:
	db 3 ; floors
	elevfloor _1F,  4, KUMQUAT_HOTEL_LOBBY
	elevfloor _2F,  1, KUMQUAT_HOTEL_SUITES
	elevfloor _3F,  1, KUMQUAT_HOTEL_GYM
	db -1 ; end
	
NeedPoolMasterText:
	text "I can't access any"
	line  "other floor yet."
	done

KumquatHotelElevator_MapEventHeader::

.Warps: db 2
	warp_def 3, 1, 4, KUMQUAT_HOTEL_LOBBY
	warp_def 3, 2, 4, KUMQUAT_HOTEL_LOBBY

.CoordEvents: db 0

.BGEvents: db 1
	signpost 0, 3, SIGNPOST_READ, KumquatHotelElevatorScript

.ObjectEvents: db 0

