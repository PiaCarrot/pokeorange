const_value = 1
	const GRAPEFRUIT_ROCK1
	const GRAPEFRUIT_ROCK2
	const GRAPEFRUIT_ROCK3

SevenGrapefruitsUnderwater_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .InitializeDiveMap

.InitializeDiveMap:
	divemap SEVEN_GRAPEFRUITS, 2, 0
	return
	
GrapefruitUnderwaterHpUp:
	itemball HP_UP

GrapefruitRock:
	jumpstd smashrock
	
GrapefruitHiddenLureBall:
	dwb EVENT_GRAPEFRUIT_LURE_BALL, LURE_BALL
	
GrapefruitHiddenStardust:
	dwb EVENT_GRAPEFRUIT_STARDUST, STARDUST
	
SevenGrapefruitsUnderwater_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 2
	signpost 34, 38, SIGNPOST_ITEM, GrapefruitHiddenLureBall
	signpost 15, 4, SIGNPOST_ITEM, GrapefruitHiddenStardust

.ObjectEvents: db 4
	person_event SPRITE_ROCK, 31, 8, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GrapefruitRock, -1
	person_event SPRITE_ROCK, 32, 6, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GrapefruitRock, -1
	person_event SPRITE_ROCK, 35, 9, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GrapefruitRock, -1
	person_event SPRITE_POKE_BALL, 13, 35, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, GrapefruitUnderwaterHpUp, EVENT_GRAPEFRUIT_HP_UP

