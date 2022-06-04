const_value = 1
	const UNNAMED_ISLAND_3_POLITOED_1
	const UNNAMED_ISLAND_3_POLITOED_2
	const UNNAMED_ISLAND_3_POLITOED_3

UnnamedIsland3_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

UnnamedIsland3Politoed1:
	opentext
	writetext PolitoedCryText
	cry POLITOED
	waitbutton
	closetext
	applymovement UNNAMED_ISLAND_3_POLITOED_1, PolitoedMovement1
	playsound SFX_JUMP_OVER_LEDGE
	waitsfx
	applymovement UNNAMED_ISLAND_3_POLITOED_1, PolitoedMovement1
	playsound SFX_JUMP_OVER_LEDGE
	waitsfx
	applymovement UNNAMED_ISLAND_3_POLITOED_1, PolitoedMovement1
	playsound SFX_JUMP_OVER_LEDGE
	waitsfx	
	applymovement UNNAMED_ISLAND_3_POLITOED_1, PolitoedMovement1
	playsound SFX_JUMP_OVER_LEDGE
	waitsfx
	disappear UNNAMED_ISLAND_3_POLITOED_1
	appear UNNAMED_ISLAND_3_POLITOED_2
	end
	
UnnamedIsland3Politoed2:
	opentext
	writetext PolitoedCryText
	cry POLITOED
	waitbutton
	closetext
	applymovement UNNAMED_ISLAND_3_POLITOED_2, PolitoedMovement2
	playsound SFX_JUMP_OVER_LEDGE
	waitsfx
	applymovement UNNAMED_ISLAND_3_POLITOED_2, PolitoedMovement2
	playsound SFX_JUMP_OVER_LEDGE
	waitsfx
	applymovement UNNAMED_ISLAND_3_POLITOED_2, PolitoedMovement2
	playsound SFX_JUMP_OVER_LEDGE
	waitsfx
	disappear UNNAMED_ISLAND_3_POLITOED_2
	appear UNNAMED_ISLAND_3_POLITOED_3
	end
	
UnnamedIsland3Politoed3:
	opentext
	writetext PolitoedCryText
	cry POLITOED
	waitbutton
	closetext
	writecode VAR_BATTLETYPE, BATTLETYPE_SHINY
	loadwildmon POLITOED, 50
    startbattle
    if_equal $2, DidntBeatPolitoedUnnamedIsland3
    disappear UNNAMED_ISLAND_3_POLITOED_3
    reloadmapafterbattle
	opentext
	verbosegiveitem SALVEYO_WEED
    waitbutton
    closetext
	end
	
DidntBeatPolitoedUnnamedIsland3:
    reloadmapafterbattle
    opentext
	verbosegiveitem SALVEYO_WEED
    waitbutton
    closetext
    end
	
PolitoedCryText:
	text "Buhbeebuu!"
	done

PolitoedMovement1:
	fix_facing
	jump_step RIGHT
	remove_fixed_facing
	step_end
	
PolitoedMovement2:
	fix_facing
	jump_step DOWN
	remove_fixed_facing
	step_end

UnnamedIsland3AerialAce:
	itemball TM_AERIAL_ACE
	
UnnamedIsland3MaxRevive:
	itemball MAX_REVIVE

UnnamedIsland3HiddenStarPiece:
	dwb EVENT_UNNAMED_ISLAND_3_HIDDEN_STAR_PIECE, STAR_PIECE
	
UnnamedIsland3HiddenHyperPotion:
	dwb EVENT_UNNAMED_ISLAND_3_HIDDEN_HYPER_POTION, HYPER_POTION

UnnamedIsland3_MapEventHeader::

.Warps: db 1
	warp_def 25, 29, 1, UNNAMED_ISLAND_3_HOUSE

.CoordEvents: db 0

.BGEvents: db 2
	signpost 33, 32, SIGNPOST_ITEM, UnnamedIsland3HiddenStarPiece
	signpost 27, 24, SIGNPOST_ITEM, UnnamedIsland3HiddenHyperPotion

.ObjectEvents: db 5
	person_event SPRITE_POLITOED, 12,  9, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BLUE, 0, 0, UnnamedIsland3Politoed1, EVENT_UNNAMED_ISLAND_POLITOED_1
	person_event SPRITE_POLITOED, 12, 29, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BLUE, 0, 0, UnnamedIsland3Politoed2, EVENT_UNNAMED_ISLAND_POLITOED_2
	person_event SPRITE_POLITOED, 30,  8, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BLUE, 0, 0, UnnamedIsland3Politoed3, EVENT_UNNAMED_ISLAND_POLITOED_3
	person_event SPRITE_POKE_BALL,  4,  4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, UnnamedIsland3AerialAce, EVENT_UNNAMED_ISLAND_AERIAL_ACE
	person_event SPRITE_POKE_BALL, 25, 12, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, UnnamedIsland3MaxRevive, EVENT_UNNAMED_ISLAND_MAX_REVIVE


