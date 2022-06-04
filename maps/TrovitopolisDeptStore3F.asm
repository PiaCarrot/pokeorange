const_value = 1
	const TROVITOPOLISDEPTSTORE3F_CLERK

TrovitopolisDeptStore3F_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

TrovitopolisDeptStore3FDirectory:
	jumptext TrovitopolisDeptStore3FDirectoryText

TrovitopolisDeptStore3FElevatorButton:
	jumpstd elevatorbutton

TrovitopolisDeptStore3FDirectoryText:
	text "For Victory"
	line "Seekers"

	para "3F BATTLE"
	line "   COLLECTION"
	done
	
TrovitopolisBattleMartScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_SUNBURST3
	closetext
	end

TrovitopolisDeptStore3F_MapEventHeader:

.Warps: db 3
	warp_def $0, $c, 1, TROVITOPOLIS_DEPT_STORE_2F
	warp_def $0, $f, 2, TROVITOPOLIS_DEPT_STORE_4F
	warp_def $0, $2, 1, TROVITOPOLIS_DEPT_STORE_ELEVATOR

.XYTriggers: db 0

.Signposts: db 2
	signpost 0, 14, SIGNPOST_READ, TrovitopolisDeptStore3FDirectory
	signpost 0, 3, SIGNPOST_READ, TrovitopolisDeptStore3FElevatorButton

.PersonEvents: db 1
	person_event SPRITE_CLERK, 1, 6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TrovitopolisBattleMartScript, -1
