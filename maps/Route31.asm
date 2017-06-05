const_value set 2
	const ROUTE31_YOUNGSTER
	const ROUTE31_BUG_CATCHER
	const ROUTE31_FRUIT_TREE
	const ROUTE31_POKE_BALL1
	const ROUTE31_POKE_BALL2

Route31_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

	; callbacks

TrainerBug_catcherWade1:
	trainer EVENT_BEAT_BUG_CATCHER_WADE, BUG_CATCHER, 4, Bug_catcherWade1SeenText, Bug_catcherWade1BeatenText, 2, .Script

.Script:
	end_if_just_battled
	opentext
	writetext Bug_catcherWade1AfterText
	waitbutton
	closetext
	end

Route31YoungsterScript:
	jumptextfaceplayer Route31YoungsterText

Route31Sign:
	jumptext Route31SignText

Route31FruitTree:
	fruittree FRUITTREE_ROUTE_31

Route31Potion:
	itemball POTION

Route31PokeBall:
	itemball POKE_BALL

Bug_catcherWade1SeenText:
	text "My BEEDRILL is"
	line "sure to beat you!"
	done

Bug_catcherWade1BeatenText:
	text "BEEDRILL!"
	done

Bug_catcherWade1AfterText:
	text "Listen, BUG-type"
	line "#MON evolve"
	cont "very quickly."
	done

Route31YoungsterText:
	text "TANGELO JUNGLE is"
	line "pretty hard to get"
	cont "through."
	
	para "It's full of tricky"
	line "paths and #MON."
	done

Route31SignText:
	text "ROUTE 51"

	para "TANGELO JUNGLE"
	done
	
Route31_MapEventHeader:: db 0, 0

.Warps: db 2
	warp_def 2, 12, 3, ROUTE_31_VIOLET_GATE
	warp_def 3, 12, 4, ROUTE_31_VIOLET_GATE

.CoordEvents: db 0

.BGEvents: db 1
	signpost 6, 10, SIGNPOST_READ, Route31Sign

.ObjectEvents: db 5
	person_event SPRITE_YOUNGSTER, 19, 14, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route31YoungsterScript, -1
	person_event SPRITE_BUG_CATCHER, 4, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 1, TrainerBug_catcherWade1, -1
	person_event SPRITE_FRUIT_TREE, 21, 17, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route31FruitTree, -1
	person_event SPRITE_POKE_BALL, 21, 25, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route31Potion, EVENT_ROUTE_31_POTION
	person_event SPRITE_POKE_BALL, 6, 21, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route31PokeBall, EVENT_ROUTE_31_POKE_BALL

