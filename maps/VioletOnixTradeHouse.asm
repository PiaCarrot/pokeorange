const_value set 2
	const VIOLETONIXTRADEHOUSE_KYLE

VioletOnixTradeHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

Kyle:
	faceplayer
	opentext
	trade $1
	waitbutton
	closetext
	end

VioletOnixTradeHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $3, 5, VIOLET_CITY
	warp_def $7, $4, 5, VIOLET_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_COOLTRAINER_F, 5, 6, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Kyle, -1
