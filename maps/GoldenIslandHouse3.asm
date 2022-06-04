const_value = 1
	const GOLDEN_ISLAND_ITEMBALL_QUICK_CLAW

GoldenIslandHouse3_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

GoldenIslandQuickClaw:
	itemball QUICK_CLAW

GoldenIslandHouse3_MapEventHeader:

.Warps: db 2
	warp_def $7, $3, 3, GOLDEN_ISLAND
	warp_def $7, $4, 3, GOLDEN_ISLAND

.XYTriggers: db 0

.Signposts: db 0

.PersonEvents: db 1
	person_event SPRITE_POKE_BALL, 3, 3, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, GoldenIslandQuickClaw, EVENT_GOLDEN_ISLAND_QUICK_CLAW