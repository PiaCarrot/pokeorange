const_value = 1
	const DANNYS_HOUSE_SHELL_BOX

DannysHouse_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

DannysHouseShellBoxScript:
	itemball SHELL_BOX

DannysHouse_MapEventHeader::

.Warps: db 2
	warp_def 7, 3, 6, NAVEL_ISLAND
	warp_def 7, 4, 6, NAVEL_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_POKE_BALL,  3,  3, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, DannysHouseShellBoxScript, EVENT_DANNYS_HOUSE_SHELL_BOX
