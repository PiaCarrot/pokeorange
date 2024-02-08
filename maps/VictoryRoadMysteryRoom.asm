const_value = 1
	const MEWTWO_VICTORY_ROAD_MISTERY_ROOM

VictoryRoadMysteryRoomMewtwoScript:	
	faceplayer
	opentext
	writetext MewtwoText
	cry MEWTWO
	pause 15
	closetext
	writecode VAR_BATTLETYPE, BATTLETYPE_SNORLAX
	loadwildmon MEWTWO, 70
	startbattle
	disappear MEWTWO_VICTORY_ROAD_MISTERY_ROOM
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_VICTORY_ROAD_MEWTWO_FOUGHT
	end
	
MewtwoText:
	text "Mew!"
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
	person_event SPRITE_MEWTWO,  2,  4, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_SILVER, 0, 0, VictoryRoadMysteryRoomMewtwoScript, EVENT_VICTORY_ROAD_MEWTWO_FOUGHT
