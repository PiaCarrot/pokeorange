const_value = 1
	const KINNOWTRADEHOUSE_ARMON

KinnowTradeHouse_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

Armon:
	faceplayer
	opentext
	trade $0
	waitbutton
	closetext
	end

KinnowTradeHouse_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 1, KINNOW_ISLAND
	warp_def 7, 3, 1, KINNOW_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_COOLTRAINER_M, 4, 5, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Armon, -1
