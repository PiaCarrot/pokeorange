const_value = 1
	const MARSHADOW_VICTORY_ROAD_MISTERY_ROOM

VictoryRoadMysteryRoomMarshadowScript:	
	faceplayer
	opentext
	writetext MarshadowText
	cry MARSHADOW
	pause 15
	closetext
	writecode VAR_BATTLETYPE, BATTLETYPE_SNORLAX
	loadwildmon MARSHADOW, 50
	startbattle
	disappear MARSHADOW_VICTORY_ROAD_MISTERY_ROOM
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_VICTORY_ROAD_MARSHADOW_FOUGHT
	end
	
MarshadowText:
	text "Shadow!"
	done

VictoryRoadMysteryRoom_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

VictoryRoadMysteryRoom_MapEventHeader::

.Warps: db 1
	warp_def  7,  5, 5, VICTORY_ROAD_EAST

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_MARSHADOW,  2,  4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GRAY, 0, 0, VictoryRoadMysteryRoomMarshadowScript, EVENT_VICTORY_ROAD_MARSHADOW_FOUGHT
