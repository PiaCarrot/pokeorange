const_value set 2
	const GOLDENRODDEPTSTORE5F_CLERK

GoldenrodDeptStore5F_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

GoldenrodDeptStore5FDirectory:
	jumptext GoldenrodDeptStore5FDirectoryText

GoldenrodDeptStore5FElevatorButton:
	jumpstd elevatorbutton

GoldenrodDeptStore5FDirectoryText:
	text "Customize Your"
	line "#MON"

	para "5F TM CORNER"
	done

GoldenrodDeptStore5F_MapEventHeader:

.Warps: db 3
	warp_def $0, $c, 1, GOLDENROD_DEPT_STORE_4F
	warp_def $0, $f, 1, GOLDENROD_DEPT_STORE_6F
	warp_def $0, $2, 1, GOLDENROD_DEPT_STORE_ELEVATOR

.XYTriggers: db 0

.Signposts: db 2
	signpost 0, 14, SIGNPOST_READ, GoldenrodDeptStore5FDirectory
	signpost 0, 3, SIGNPOST_READ, GoldenrodDeptStore5FElevatorButton

.PersonEvents: db 1
	person_event SPRITE_CLERK, 5, 8, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
