const_value = 1
	const TROVITOPOLISDEPTSTORE1F_RECEPTIONIST

TrovitopolisDeptStore1F_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

ReceptionistScript_0x55981:
	jumptextfaceplayer UnknownText_0x55993

TrovitopolisDeptStore1FDirectory:
	jumptext TrovitopolisDeptStore1FDirectoryText

TrovitopolisDeptStore1FElevatorButton:
	jumpstd elevatorbutton

UnknownText_0x55993:
	text "Welcome to the"
	line "TROVITOPOLIS DEPT."
	cont "STORE."
	done

TrovitopolisDeptStore1FDirectoryText:
	text "1F SERVICE COUNTER"

	para "2F TRAINER'S"
	line "   MARKET"

	para "3F BATTLE"
	line "   COLLECTION"

	para "4F MEDICINE BOX"

	para "5F TM CORNER"

	para "6F TRANQUIL SQUARE"

	para "ROOFTOP LOOKOUT"
	done
	
DeptStore1FPokefanFScript:
	jumptextfaceplayer DeptStore1FPokefanFText
	
DeptStore1FPokefanFText:
	text "You can buy almost"
	line "anything in here!"
	done

TrovitopolisDeptStore1F_MapEventHeader::

.Warps: db 4
	warp_def 7, 7, 3, TROVITOPOLIS
	warp_def 7, 8, 3, TROVITOPOLIS
	warp_def 0, 15, 2, TROVITOPOLIS_DEPT_STORE_2F
	warp_def 0, 2, 1, TROVITOPOLIS_DEPT_STORE_ELEVATOR

.CoordEvents: db 0

.BGEvents: db 2
	signpost 0, 14, SIGNPOST_READ, TrovitopolisDeptStore1FDirectory
	signpost 0, 3, SIGNPOST_READ, TrovitopolisDeptStore1FElevatorButton

.ObjectEvents: db 2
	person_event SPRITE_RECEPTIONIST, 1, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ReceptionistScript_0x55981, -1
	person_event SPRITE_POKEFAN_F, 4, 3, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, DeptStore1FPokefanFScript, -1

