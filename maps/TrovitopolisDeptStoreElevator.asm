TrovitopolisDeptStoreElevator_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MapTrovitopolisDeptStoreElevatorSignpost0Script:
	opentext
	elevator Elevator_0x566e0
	closetext
	iffalse .Done
	pause 5
	playsound SFX_ELEVATOR
	earthquake 60
	waitsfx
	end

.Done:
	end


Elevator_0x566e0:
	db 6 ; floors
	elevfloor _1F,  4, TROVITOPOLIS_DEPT_STORE_1F
	elevfloor _2F,  3, TROVITOPOLIS_DEPT_STORE_2F
	elevfloor _3F,  3, TROVITOPOLIS_DEPT_STORE_3F
	elevfloor _4F,  3, TROVITOPOLIS_DEPT_STORE_4F
	elevfloor _5F,  3, TROVITOPOLIS_DEPT_STORE_5F
	elevfloor _6F,  2, TROVITOPOLIS_DEPT_STORE_6F
	db -1 ; end


TrovitopolisDeptStoreElevator_MapEventHeader:

.Warps: db 2
	warp_def $3, $1, 255, TROVITOPOLIS_DEPT_STORE_1F
	warp_def $3, $2, 255, TROVITOPOLIS_DEPT_STORE_1F

.XYTriggers: db 0

.Signposts: db 1
	signpost 0, 3, SIGNPOST_READ, MapTrovitopolisDeptStoreElevatorSignpost0Script

.PersonEvents: db 0
