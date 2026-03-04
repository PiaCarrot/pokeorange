const_value = 1
	const TROVITA_ISLAND_MISTY
	const TROVITA_ISLAND_ROCK1
	const TROVITA_ISLAND_ROCK2
	const TROVITA_ISLAND_POKEBALL1
	const TROVITA_ISLAND_POKEBALL2
	const TROVITA_ISLAND_POKEBALL3
	const TROVITA_SEASHELL

TrovitaIsland_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

TrovitaRock:
	jumpstd smashrock
	
TrovitaRareCandy:
	itemball RARE_CANDY
	
TrovitaMaxRevive:
	itemball MAX_REVIVE
	
TrovitaFullRestore:
	;itemball FULL_RESTORE
	itemball METAL_COAT
	
TrovitaMistyScript:
	opentext
	writetext TrovitaMistyText1
	waitbutton
	closetext
	faceplayer
	playmusic MUSIC_RS_LOOK_LASS
	showemote EMOTE_SHOCK, TROVITA_ISLAND_MISTY, 15
	opentext
	writetext TrovitaMistyText2
	waitbutton
	verbosegiveitem HM_ROCK_SMASH
	writetext TrovitaMistyText3
	waitbutton
	closetext
	checkcode VAR_FACING
	if_equal UP, .TrovitaMistyWalksAround
	if_equal RIGHT, .TrovitaMistyWalksDown
	if_equal LEFT, .TrovitaMistyWalksDown
	
.TrovitaMistyWalksAround:
	applymovement TROVITA_ISLAND_MISTY, TrovitaMistyAroundMovement
	disappear TROVITA_ISLAND_MISTY
	setevent EVENT_GOT_HM_ROCK_SMASH
	special Special_FadeOutMusic
	playmusic MUSIC_CIANWOOD_CITY
	end
	
.TrovitaMistyWalksDown:
	applymovement TROVITA_ISLAND_MISTY, TrovitaMistyDownMovement
	disappear TROVITA_ISLAND_MISTY
	setevent EVENT_GOT_HM_ROCK_SMASH
	special Special_FadeOutMusic
	playmusic MUSIC_CIANWOOD_CITY
	end
	
TrovitaMistyDownMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end	

TrovitaMistyAroundMovement:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

TrovitaMistyText1:
	text "MISTY: Definitely"
	line "not my type<...>"
	done
	
TrovitaMistyText2:
	text "MISTY: Ah, hello!"
	line "Your name was"
	cont "<PLAYER>, right?"
	
	para "I see you're here"
	line "to challenge RUDY."
	
	para "Well, good luck!"
	line "Maybe if we meet"
	cont "again, we can"
	cont "have a battle!"
	
	para "Here, a gift from"
	line "me to you!"
	done
	
TrovitaMistyText3:
	text "MISTY: Well, I"
	line "must be off now!"
	cont "Nice to see you"
	cont "again!"
	done
	
TrovitaSeashellScript:
	opentext
	checkitem SHELL_BOX
	iffalse .NoShellBox
	writetext FoundTrovitaSeashell
	playsound SFX_DEX_FANFARE_140_169
	waitsfx
	closetext
	giveshells 1
	setevent EVENT_TROVITA_ISLAND_SEASHELL
	disappear TROVITA_SEASHELL
	end
	
.NoShellBox:
	writetext TrovitaNoShellBox
	waitbutton
	closetext
	end
	
TrovitaNoShellBox:
    text "What a pretty"
    line "SEASHELL! It looks"
    cont "too fragile to"
    cont "go in my BAG."
    done
	
FoundTrovitaSeashell:
	text "You found a rare"
	line "SEASHELL!"
	done
	
TrovitaIslandSign:
	jumptext TrovitaIslandSignText
	
TrovitaIslandSignText:
	text "TROVITA ISLAND"
	
	para "GYM up ahead!"
	done

TrovitaIsland_MapEventHeader::

.Warps: db 2
	warp_def 31, 39, 1, TROVITA_PORT
	warp_def 7, 22, 1, TROVITA_GYM

.CoordEvents: db 0

.BGEvents: db 1
	signpost 31, 35, SIGNPOST_READ, TrovitaIslandSign

.ObjectEvents: db 7
	person_event SPRITE_MISTY, 8, 22, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TrovitaMistyScript, EVENT_GOT_HM_ROCK_SMASH
	person_event SPRITE_ROCK, 7, 27, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TrovitaRock, -1
	person_event SPRITE_ROCK, 8, 26, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TrovitaRock, -1
	person_event SPRITE_POKE_BALL, 27, 35, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TrovitaRareCandy, EVENT_TROVITA_RARE_CANDY
	person_event SPRITE_POKE_BALL, 6, 14, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TrovitaMaxRevive, EVENT_TROVITA_MAX_REVIVE
	person_event SPRITE_POKE_BALL, 15, 10, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TrovitaFullRestore, EVENT_TROVITA_FULL_RESTORE
	person_event SPRITE_SEASHELL,  3,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, TrovitaSeashellScript, EVENT_TROVITA_ISLAND_SEASHELL

