const_value set 1
	const TROVITOPOLISDEPTSTORE5F_CLERK

TrovitopolisDeptStore5F_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

TrovitopolisDeptStore5FDirectory:
	jumptext TrovitopolisDeptStore5FDirectoryText

TrovitopolisDeptStore5FElevatorButton:
	jumpstd elevatorbutton

TrovitopolisDeptStore5FDirectoryText:
	text "Customize Your"
	line "#MON"

	para "5F TM CORNER"
	done

TrovitopolisDeptStore5F_MapEventHeader:

.Warps: db 3
	warp_def $0, $c, 1, TROVITOPOLIS_DEPT_STORE_4F
	warp_def $0, $f, 1, TROVITOPOLIS_DEPT_STORE_6F
	warp_def $0, $2, 1, TROVITOPOLIS_DEPT_STORE_ELEVATOR

.XYTriggers: db 0

.Signposts: db 2
	signpost 0, 14, SIGNPOST_READ, TrovitopolisDeptStore5FDirectory
	signpost 0, 3, SIGNPOST_READ, TrovitopolisDeptStore5FElevatorButton

.PersonEvents: db 1
	person_event SPRITE_CLERK, 5, 8, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
