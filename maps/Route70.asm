Route70_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

Route70Sign:
	jumptext Route70SignText
	
Route70SignText:
	text "ROUTE 70"
	done
	
Route70HiddenPPMax:
	dwb EVENT_ROUTE_70_HIDDEN_PP_MAX, PP_MAX
	
Route70MaxRepel:
	itemball MAX_REPEL
	
Route70MaxRevive:
	itemball TRADE_STONE
	
Route70OfficerScript:
	jumptextfaceplayer Route70OfficerScriptText
	
Route70OfficerScriptText:
	text "CHAMPION!"
	line "The road is clear"
	cont "now, but please be"
	cont "careful. There are"
	
	para "PIRATES on these"
	line "waters!"
	done
	
TrainerPirateLackey1Script:
	trainer EVENT_BEAT_PIRATE_LACKEY_1, SCUZ, LACKEY_1, TrainerPirateLackey1SeenText, TrainerPirateLackey1BeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext TrainerPirateLackey1AfterText
	waitbutton
	closetext
	end

TrainerPirateLackey1SeenText:
	text "Yarr! Gimme yer"
	line "SURF HM! Or Else!"
	done

TrainerPirateLackey1BeatenText:
	text "I be stranded,"
	line "matey<...>"
	done

TrainerPirateLackey1AfterText:
	text "I won't be sellin'"
	line "out me mates! Off"
	cont "with ye!"
	done

Route70_MapEventHeader::

.Warps: db 2
	warp_def 16,  2, 3, PUMMELO_ROUTE_70_GATE
	warp_def 17,  2, 4, PUMMELO_ROUTE_70_GATE

.CoordEvents: db 0

.BGEvents: db 2
	signpost 19, 15, SIGNPOST_READ, Route70Sign
	signpost  2, 38, SIGNPOST_ITEM, Route70HiddenPPMax

.ObjectEvents: db 4
	person_event SPRITE_POKE_BALL, 19, 34, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route70MaxRepel, EVENT_ROUTE_70_MAX_REPEL
	person_event SPRITE_POKE_BALL,  7, 19, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route70MaxRevive, EVENT_ROUTE_70_MAX_REVIVE
	person_event SPRITE_OFFICER, 16, 10, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route70OfficerScript, -1
	person_event SPRITE_SAILOR, 18, 37, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 1, TrainerPirateLackey1Script, -1

