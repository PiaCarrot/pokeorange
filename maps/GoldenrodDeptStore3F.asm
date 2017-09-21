const_value set 2
	const GOLDENRODDEPTSTORE3F_CLERK

GoldenrodDeptStore3F_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

GoldenrodDeptStore3FDirectory:
	jumptext GoldenrodDeptStore3FDirectoryText

GoldenrodDeptStore3FElevatorButton:
	jumpstd elevatorbutton

GoldenrodDeptStore3FDirectoryText:
	text "For Victory"
	line "Seekers"

	para "3F BATTLE"
	line "   COLLECTION"
	done

GoldenrodDeptStore3F_MapEventHeader:

.Warps: db 3
	warp_def $0, $c, 1, GOLDENROD_DEPT_STORE_2F
	warp_def $0, $f, 2, GOLDENROD_DEPT_STORE_4F
	warp_def $0, $2, 1, GOLDENROD_DEPT_STORE_ELEVATOR

.XYTriggers: db 0

.Signposts: db 2
	signpost 0, 14, SIGNPOST_READ, GoldenrodDeptStore3FDirectory
	signpost 0, 3, SIGNPOST_READ, GoldenrodDeptStore3FElevatorButton

.PersonEvents: db 1
	person_event SPRITE_CLERK, 1, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
