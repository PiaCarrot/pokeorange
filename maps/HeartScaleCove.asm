const_value = 1

HeartScaleCove_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

HeartScaleCoveHeartScale1:
	itemball HEART_SCALE

HeartScaleCoveHeartScale2:
	itemball HEART_SCALE

HeartScaleCove_Hidden_HeartScale1:
	dwb EVENT_HEART_SCALE_COVE_HIDDEN_HEART_SCALE_1, HEART_SCALE
	
HeartScaleCove_Hidden_HeartScale2:
	dwb EVENT_HEART_SCALE_COVE_HIDDEN_HEART_SCALE_2, HEART_SCALE

HeartScaleCove_Hidden_HeartScale3:
	dwb EVENT_HEART_SCALE_COVE_HIDDEN_HEART_SCALE_3, HEART_SCALE

HeartScaleCove_Hidden_HeartScale4:
	dwb EVENT_HEART_SCALE_COVE_HIDDEN_HEART_SCALE_4, HEART_SCALE

HeartScaleCove_Hidden_HeartScale5:
	dwb EVENT_HEART_SCALE_COVE_HIDDEN_HEART_SCALE_5, HEART_SCALE

HeartScaleCove_Hidden_HeartScale6:
	dwb EVENT_HEART_SCALE_COVE_HIDDEN_HEART_SCALE_6, HEART_SCALE

HeartScaleCove_MapEventHeader::

.Warps: db 3
	warp_def 15, 3, 1, ROUTE_64
	warp_def 13, 15, 9, ASCORBIA_ISLAND
	warp_def 23, 27, 10, ASCORBIA_ISLAND

.CoordEvents: db 0

.BGEvents: db 6
	signpost 11, 10, SIGNPOST_ITEM, HeartScaleCove_Hidden_HeartScale1
	signpost 10, 21, SIGNPOST_ITEM, HeartScaleCove_Hidden_HeartScale2
	signpost 19, 29, SIGNPOST_ITEM, HeartScaleCove_Hidden_HeartScale3
	signpost 17, 22, SIGNPOST_ITEM, HeartScaleCove_Hidden_HeartScale4
	signpost 17, 10, SIGNPOST_ITEM, HeartScaleCove_Hidden_HeartScale5
	signpost 13, 7, SIGNPOST_ITEM, HeartScaleCove_Hidden_HeartScale6

.ObjectEvents: db 2
	person_event SPRITE_POKE_BALL, 13, 21, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, HeartScaleCoveHeartScale1, EVENT_HEART_SCALE_COVE_HEART_SCALE_1
	person_event SPRITE_POKE_BALL, 4, 17, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, HeartScaleCoveHeartScale2, EVENT_HEART_SCALE_COVE_HEART_SCALE_2

