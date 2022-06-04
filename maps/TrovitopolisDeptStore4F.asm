const_value = 1
	const TROVITOPOLISDEPTSTORE4F_CLERK

TrovitopolisDeptStore4F_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

TrovitopolisDeptStore4FDirectory:
	jumptext TrovitopolisDeptStore4FDirectoryText

TrovitopolisDeptStore4FElevatorButton:
	jumpstd elevatorbutton

TrovitopolisDeptStore4FDirectoryText:
	text "Let Us Pump Up"
	line "Your #MON!"

	para "4F MEDICINE BOX"
	done
	
TrovitopolisMedicineMartScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_TROVITOPOLIS_MEDICINE
	closetext
	end

TrovitopolisDeptStore4F_MapEventHeader:

.Warps: db 3
	warp_def $0, $c, 1, TROVITOPOLIS_DEPT_STORE_5F
	warp_def $0, $f, 2, TROVITOPOLIS_DEPT_STORE_3F
	warp_def $0, $2, 1, TROVITOPOLIS_DEPT_STORE_ELEVATOR

.XYTriggers: db 0

.Signposts: db 2
	signpost 0, 14, SIGNPOST_READ, TrovitopolisDeptStore4FDirectory
	signpost 0, 3, SIGNPOST_READ, TrovitopolisDeptStore4FElevatorButton

.PersonEvents: db 1
	person_event SPRITE_CLERK, 5, 13, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TrovitopolisMedicineMartScript, -1
