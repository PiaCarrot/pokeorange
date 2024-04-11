const_value = 1
	const ROUTE61_NERD
	const ROUTE61_ITEM1
	const ROUTE61_ITEM2
	const ROUTE61_ITEM3

Route61_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 1
	dbw MAPCALLBACK_TILES, Route61BridgeCallback

Route61BridgeCallback:
	checktriggers
	iftrue .underfoot
	callasm Route61_OverheadBridgeAsm
	return

.underfoot:
	callasm Route61_UnderfootBridgeAsm
	return

Route61BridgeOverheadTrigger:
	callasm Route61_OverheadBridgeAsm
	endbridgetrigger wRoute61Trigger, $0

Route61BridgeUnderfootTrigger:
	callasm Route61_UnderfootBridgeAsm
	endbridgetrigger wRoute61Trigger, $1

Route61_OverheadBridgeAsm:
	changebridgeblock 44, 36, $b9, ROUTE_61
	changebridgeblock 44, 38, $b5, ROUTE_61
	changebridgeblock 44, 40, $b5, ROUTE_61
	changebridgeblock 44, 42, $b4, ROUTE_61
	changebridgeblock 44, 44, $b4, ROUTE_61
	changebridgeblock 44, 46, $b4, ROUTE_61
	changebridgeblock 44, 48, $ba, ROUTE_61
	endbridgeblocks

Route61_UnderfootBridgeAsm:
	changebridgeblock 44, 36, $c0, ROUTE_61
	changebridgeblock 44, 38, $c1, ROUTE_61
	changebridgeblock 44, 40, $c1, ROUTE_61
	changebridgeblock 44, 42, $c1, ROUTE_61
	changebridgeblock 44, 44, $c1, ROUTE_61
	changebridgeblock 44, 46, $c1, ROUTE_61
	changebridgeblock 44, 48, $c2, ROUTE_61
	endbridgeblocks

TrainerPokemaniacKusato:
	trainer EVENT_BEAT_POKEMANIAC_KUSATO, POKEMANIAC, KUSATO, PokemaniacKusatoSeenText, PokemaniacKusatoWinText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext PokemaniacKusatoAfterText
	waitbutton
	closetext
	end

PokemaniacKusatoSeenText:
	text "Would it be rude"
	line "if I poisoned"
	cont "your party in a"
	cont "#MON battle?"
	done

PokemaniacKusatoWinText:
	text "My POISON #MON!"
	done

PokemaniacKusatoAfterText:
	text "I'll let you in"
	line "on a tip."

	para "You can find a"
	line "SALANDIT on ROUTE"
	cont "62."
	done

Route6lRareCandy:
	itemball RARE_CANDY

Route61MaxPotion:
	itemball MAX_POTION

Route61MaxElixer:
	itemball MAX_ELIXER

Route61Sign:
	jumptext Route61SignText

Route61SignText:
	text "ROUTE 61"

	para "EAST to MURCOTT"
	line "WEST to MANDARIN"
	cont "ISLAND SOUTH"
	done

Route61_MapEventHeader::

.Warps: db 1
	warp_def 5, 31, 7, GOLDEN_ISLAND_GATE_HOUSE

.CoordEvents: db 14
	xy_trigger 0, 36, 44, Route61BridgeUnderfootTrigger
	xy_trigger 0, 36, 45, Route61BridgeUnderfootTrigger
	xy_trigger 1, 43, 46, Route61BridgeOverheadTrigger
	xy_trigger 1, 42, 46, Route61BridgeOverheadTrigger
	xy_trigger 1, 47, 43, Route61BridgeOverheadTrigger
	xy_trigger 1, 46, 43, Route61BridgeOverheadTrigger
	xy_trigger 1, 45, 43, Route61BridgeOverheadTrigger
	xy_trigger 1, 44, 43, Route61BridgeOverheadTrigger
	xy_trigger 1, 43, 43, Route61BridgeOverheadTrigger
	xy_trigger 1, 47, 46, Route61BridgeOverheadTrigger
	xy_trigger 1, 46, 46, Route61BridgeOverheadTrigger
	xy_trigger 1, 45, 46, Route61BridgeOverheadTrigger
	xy_trigger 1, 44, 46, Route61BridgeOverheadTrigger
	xy_trigger 1, 42, 43, Route61BridgeOverheadTrigger

.BGEvents: db 1
	signpost 42, 38, SIGNPOST_READ, Route61Sign

.ObjectEvents: db 4
	person_event SPRITE_SUPER_NERD, 11, 50, SPRITEMOVEDATA_SPINCLOCKWISE, 1, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_TRAINER, 3, TrainerPokemaniacKusato, -1
	person_event SPRITE_POKE_BALL, 37, 18, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route6lRareCandy, EVENT_ROUTE_61_RARE_CANDY
	person_event SPRITE_POKE_BALL,  6, 48, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route61MaxPotion, EVENT_ROUTE_61_MAX_POTION
	person_event SPRITE_POKE_BALL, 50, 45, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route61MaxElixer, EVENT_ROUTE_61_MAX_ELIXER

