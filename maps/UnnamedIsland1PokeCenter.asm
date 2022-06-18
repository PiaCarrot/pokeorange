const_value = 1
	const UNNAMEDISLAND_NURSE
	const UNNAMEDISLAND_SLOUCH
	const UNNAMEDISLAND_MISTY

UnnamedIsland1PokeCenter_MapScriptHeader:

.MapTriggers: db 2
	maptrigger .Trigger0
	maptrigger .Trigger1

.MapCallbacks: db 0

.Trigger0:
	checkflag ENGINE_SEA_RUBY_BADGE
	iffalse .MistyNotActiveYet
	priorityjump .UnnamedIslandMistyScript
	end
	
.MistyNotActiveYet:
	end

.Trigger1:
	end

.UnnamedIslandMistyScript:
	applymovement PLAYER, UnnamedPokeCenter1FPlayerMovement1
	spriteface UNNAMEDISLAND_MISTY, DOWN
	playmusic MUSIC_RS_LOOK_LASS
	showemote EMOTE_SHOCK, UNNAMEDISLAND_MISTY, 15
	pause 10
	opentext
	writetext UnnamedMistyText1
	waitbutton
	verbosegiveitem POKE_FLUTE
	writetext UnnamedMistyText2
	waitbutton
	closetext
	spriteface PLAYER, DOWN
	applymovement UNNAMEDISLAND_MISTY, UnnamedPokeCenter1FMistyMovement
	playsound SFX_EXIT_BUILDING
	disappear UNNAMEDISLAND_MISTY
	dotrigger $1
	waitsfx
	special Special_FadeOutMusic
	playmusic MUSIC_POKEMON_CENTER
	end

UnnamedIslandNurseScript:
	jumpstd pokecenternurse

UnnamedIslandSlouchScript:
	opentext
	writetext UnnamedIslandSlouchText
	waitbutton
	closetext
	end

UnnamedIslandSlouchText:
	text "If you go east of"
	line "KINNOW ISLAND, you"
	cont "can find the path"
	cont "to the 7 GRAPE-"
	cont "FRUIT ISLANDS."
	done

UnnamedPokeCenter1FMistyMovement:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

UnnamedPokeCenter1FPlayerMovement1:
	step UP
	step UP
	step UP
	step_end

UnnamedMistyText1:
	text "Oh, hello there."

	para "Was I in your way?"
	line "I'm so sorry!"

	para  "<...> <...> <...>"

	para "Say, I can't put"
	line "my finger on it,"
	cont "but you remind me"
	cont "of someone."

	para "The name's MISTY."
	line "I'm a gym leader"
	cont "from the KANTO"
	cont "region."

	para "<...> <...> <...>"

	para "So, your name is"
	line "<PLAYER>!"

	para "I have a feeling"
	line "we'll meet again."
	cont "Take this, a gift"
	cont "from me to you."
	done

UnnamedMistyText2:
	text "Well, I must be"
	line "off, now. It was"
	cont "nice meeting you!"
	done

UnnamedIsland1PokeCenter_MapEventHeader::

.Warps: db 2
	warp_def 7, 4, 5, NAVEL_ISLAND
	warp_def 7, 5, 5, NAVEL_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 3
	person_event SPRITE_NURSE, 1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, UnnamedIslandNurseScript, -1
	person_event SPRITE_PC_SLOUCH, 4, 0, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, UnnamedIslandSlouchScript, -1
	person_event SPRITE_MISTY, 3, 4, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1,  (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_UNNAMED_POKE_CENTER_MISTY
