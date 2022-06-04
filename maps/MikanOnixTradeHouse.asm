const_value = 1
	const MIKANONIXTRADEHOUSE_KYLE

MikanOnixTradeHouse_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

Kyle:
	faceplayer
	opentext
	trade $1
	waitbutton
	closetext
	end

MikanOnixTradeHouse_MapEventHeader:

.Warps: db 2
	warp_def $7, $3, 5, MIKAN_ISLAND
	warp_def $7, $4, 5, MIKAN_ISLAND

.XYTriggers: db 0

.Signposts: db 0

.PersonEvents: db 1
	person_event SPRITE_COOLTRAINER_F, 5, 6, SPRITEMOVEDATA_WALK_UP_DOWN, 2, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Kyle, -1
