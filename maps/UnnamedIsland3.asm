const_value set 1
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
	


UnnamedIsland3_MapEventHeader::

.Warps: db 1
	warp_def 25, 29, 1, UNNAMED_ISLAND_3_HOUSE

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_POLITOED, 12,  9, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BLUE, 0, 0, UnnamedIsland3Politoed1, EVENT_UNNAMED_ISLAND_POLITOED_1
	person_event SPRITE_POLITOED, 12, 29, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BLUE, 0, 0, UnnamedIsland3Politoed2, EVENT_UNNAMED_ISLAND_POLITOED_2
	person_event SPRITE_POLITOED, 30,  8, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BLUE, 0, 0, UnnamedIsland3Politoed3, EVENT_UNNAMED_ISLAND_POLITOED_3

