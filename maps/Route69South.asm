Route69South_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

VictoryRoadSign:
	jumptext VictoryRoadSignText
	
VictoryRoadSignText:
	text "ROUTE 69"
	line "VICTORY ROAD"
	done

Route69SouthUltraBall:
	itemball ULTRA_BALL

Route69SouthFullRestore:
	itemball FULL_RESTORE

Route69SouthMaxEther:
	itemball MAX_ETHER

Route69South_MapEventHeader::

.Warps: db 15
	warp_def 41, 23, 1, VICTORY_ROAD_F1
	warp_def 39, 21, 2, VICTORY_ROAD_F1
	warp_def 39, 17, 3, VICTORY_ROAD_F1
	warp_def 35, 21, 1, VICTORY_ROAD_F2
	warp_def 35, 16, 2, VICTORY_ROAD_F2
	warp_def 33, 23, 3, VICTORY_ROAD_F2
	warp_def 25, 31, 1, VICTORY_ROAD_EAST
	warp_def 31, 18, 1, VICTORY_ROAD_F3
	warp_def 13, 22, 2, VICTORY_ROAD_F3
	warp_def 23, 18, 3, VICTORY_ROAD_F3
	warp_def 27, 11, 4, VICTORY_ROAD_F3
	warp_def 11,  5, 1, VICTORY_ROAD_EXIT_ROOM
	warp_def  7, 12, 2, VICTORY_ROAD_EXIT_ROOM
	warp_def 31,  6, 5, VICTORY_ROAD_F3
	warp_def  5, 17, 1, ROUTE_69_NORTH

.CoordEvents: db 0

.BGEvents: db 1
	signpost 44, 22, SIGNPOST_READ, VictoryRoadSign

.ObjectEvents: db 3
	person_event SPRITE_POKE_BALL, 68,  6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route69SouthUltraBall, EVENT_ROUTE_69_SOUTH_ULTRA_BALL
	person_event SPRITE_POKE_BALL, 19, 10, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route69SouthFullRestore, EVENT_ROUTE_69_SOUTH_FULL_RESTORE
	person_event SPRITE_POKE_BALL, 29, 34, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route69SouthMaxEther, EVENT_ROUTE_69_SOUTH_MAX_ETHER


