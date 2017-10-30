Route61_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

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
	
Route61_MapEventHeader::

.Warps: db 1
	warp_def 5, 31, 7, GOLDEN_ISLAND_GATE_HOUSE

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_SUPER_NERD, 14, 46, SPRITEMOVEDATA_SPINCLOCKWISE, 1, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_TRAINER, 3, TrainerPokemaniacKusato, -1
	person_event SPRITE_POKE_BALL, 52, 10, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route6lRareCandy, EVENT_ROUTE_61_RARE_CANDY
	person_event SPRITE_POKE_BALL, 12, 49, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route61MaxPotion, EVENT_ROUTE_61_MAX_POTION

