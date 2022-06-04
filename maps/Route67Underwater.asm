const_value = 1
	const ROUTE_67UW_POKE_BALL
	const ROUTE_67UW_POKE_BALL2
	const ROUTE_67UW_POKE_BALL3
	const ROUTE_67UW_POKE_BALL4
	const ROUTE_67UW_POKE_BALL5
	const ROUTE_67UW_SEASHELL

Route67Underwater_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_NEWMAP, .InitializeDiveMap

.InitializeDiveMap:
	divemap ROUTE_67, 0, 0
	return
	
Route67UnderwaterDragonFang:
	itemball DRAGON_FANG

Route67UnderwaterUltraBall:
	itemball ULTRA_BALL

Route67UnderwaterMaxPotion:
	itemball MAX_POTION

Route67UnderwaterElixir:
	itemball ELIXER

Route67UnderwaterKingsRock:
	itemball KINGS_ROCK
	
Route67UnderwaterSeashellScript:
	opentext
	checkitem SHELL_BOX
	iffalse .NoShellBox
	writetext FoundRoute67UnderwaterSeashell
	playsound SFX_DEX_FANFARE_140_169
	waitsfx
	closetext
	giveshells 1
	setevent EVENT_ROUTE_67_SEASHELL
	disappear ROUTE_67UW_SEASHELL
	end
	
.NoShellBox:
	writetext Route67UnderwaterNoShellBox
	waitbutton
	closetext
	end
	
Route67UnderwaterNoShellBox:
    text "What a pretty sea-"
    line "shell! It looks"
    cont "too fragile to"
    cont "go in my BAG."
    done
	
FoundRoute67UnderwaterSeashell:
	text "You found a rare"
	line "seashell!"
	done
	
Route67Underwater_MapEventHeader::

.Warps: db 0

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 6
	person_event SPRITE_POKE_BALL, 26, 57, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route67UnderwaterDragonFang, EVENT_ROUTE_67_UNDERWATER_DRAGON_FANG
	person_event SPRITE_POKE_BALL,  3, 25, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route67UnderwaterUltraBall, EVENT_ROUTE_67_UNDERWATER_ULTRA_BALL
	person_event SPRITE_POKE_BALL, 24, 28, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route67UnderwaterMaxPotion, EVENT_ROUTE_67_UNDERWATER_MAX_POTION
	person_event SPRITE_POKE_BALL,  6, 38, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route67UnderwaterElixir, EVENT_ROUTE_67_UNDERWATER_ELIXIR
	person_event SPRITE_POKE_BALL, 25,  4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route67UnderwaterKingsRock, EVENT_ROUTE_67_UNDERWATER_KINGS_ROCK
	person_event SPRITE_SEASHELL, 19, 42, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route67UnderwaterSeashellScript, EVENT_ROUTE_67_SEASHELL
