const_value = 1
	const TROVITOPOLISDEPTSTORE2F_CLERK1
	const TROVITOPOLISDEPTSTORE2F_CLERK2

TrovitopolisDeptStore2F_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

TrovitopolisDeptStore2FDirectory:
	jumptext TrovitopolisDeptStore2FDirectoryText

TrovitopolisDeptStore2FElevatorButton:
	jumpstd elevatorbutton

TrovitopolisDeptStore2FDirectoryText:
	text "Your Travel"
	line "Companion"

	para "2F TRAINER'S"
	line "   MARKET"
	done

TrovitopolisPokeballMartScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_TROVITOPOLIS_POKEBALL
	closetext
	end

TrovitopolisTrainerMartScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_TROVITOPOLIS_TRAINER
	closetext
	end

TrovitopolisDeptStore2F_MapEventHeader:

.Warps: db 3
	warp_def $0, $c, 1, TROVITOPOLIS_DEPT_STORE_3F
	warp_def $0, $f, 3, TROVITOPOLIS_DEPT_STORE_1F
	warp_def $0, $2, 1, TROVITOPOLIS_DEPT_STORE_ELEVATOR

.XYTriggers: db 0

.Signposts: db 2
	signpost 0, 14, SIGNPOST_READ, TrovitopolisDeptStore2FDirectory
	signpost 0, 3, SIGNPOST_READ, TrovitopolisDeptStore2FElevatorButton

.PersonEvents: db 2
	person_event SPRITE_CLERK, 5, 13, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TrovitopolisPokeballMartScript, -1
	person_event SPRITE_CLERK, 6, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TrovitopolisTrainerMartScript, -1
