Route67_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

Route67Sign:
	jumptext Route67SignText
	
Route67SignText:
	text "ROUTE 67"
	done
	
Route67SeedBomb:
	itemball TM_SEED_BOMB
	
Route67PPUp:
	itemball PP_UP
	
Route67FullRestore:
	itemball FULL_RESTORE
	
Route67HiddenGrapefruit:
	dwb EVENT_ROUTE_67_HIDDEN_GRAPEFRUIT, SWEET_ORANGE
	
Route67HiddenMaxRevive:
	dwb EVENT_ROUTE_67_HIDDEN_MAX_REVIVE, MAX_REVIVE

Route67_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 3
	signpost  4, 54, SIGNPOST_READ, Route67Sign
	signpost 16, 37, SIGNPOST_ITEM, Route67HiddenGrapefruit
	signpost 25, 22, SIGNPOST_ITEM, Route67HiddenMaxRevive

.ObjectEvents: db 3
	person_event SPRITE_POKE_BALL, 18, 57, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route67SeedBomb, EVENT_ROUTE_67_SEED_BOMB
	person_event SPRITE_POKE_BALL, 20,  7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route67PPUp, EVENT_ROUTE_67_PP_UP
	person_event SPRITE_POKE_BALL,  9, 14, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route67FullRestore, EVENT_ROUTE_67_FULL_RESTORE

