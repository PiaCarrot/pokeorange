Route64_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

Route64_HiddenHeartScale1:
	dwb EVENT_ROUTE_64_HIDDEN_HEART_SCALE_1, HEART_SCALE
	
Route64_HiddenHeartScale2:
	dwb EVENT_ROUTE_64_HIDDEN_HEART_SCALE_2, HEART_SCALE
	
Route64_HiddenHeartScale3:
	dwb EVENT_ROUTE_64_HIDDEN_HEART_SCALE_3, HEART_SCALE
	
Route64_HiddenHeartScale4:
	dwb EVENT_ROUTE_64_HIDDEN_HEART_SCALE_4, HEART_SCALE
	
Route64UltraBall:
	itemball ULTRA_BALL

Route64Sign:
	jumptext Route64SignText
	
Route64SignText:
	text "ROUTE 64"
	done

Route64_MapEventHeader::

.Warps: db 1
	warp_def 17, 28, 1, HEART_SCALE_COVE

.CoordEvents: db 0

.BGEvents: db 5
	signpost 21, 30, SIGNPOST_ITEM, Route64_HiddenHeartScale1
	signpost 21, 26, SIGNPOST_ITEM, Route64_HiddenHeartScale2
	signpost 15, 12, SIGNPOST_ITEM, Route64_HiddenHeartScale3
	signpost 7, 20, SIGNPOST_ITEM, Route64_HiddenHeartScale4
	signpost 19, 23, SIGNPOST_READ, Route64Sign

.ObjectEvents: db 1
	person_event SPRITE_POKE_BALL, 4, 36, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route64UltraBall, EVENT_ROUTE_64_ULTRA_BALL

