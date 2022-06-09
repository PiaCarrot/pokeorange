const_value = 1
	const SHAMOUTI_SHRINE_SLOWKING
	const SHAMOUTI_SHRINE_MELODY
	const SHAMOUTI_SHRINE_LUGIA

ShamoutiShrine_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

ShamoutiShrineSlowkingScript:
	opentext
	checkevent EVENT_MELODY_SENDS_YOU_TO_SHRINE
	iftrue .SlowkingWarp
	writetext ShamoutiShrineSlowkingText1
	cry SLOWKING
	waitbutton
	closetext
	end
	
.SlowkingWarp
	writetext ShamoutiShrineSlowkingText2
	yesorno
	iftrue .YesToSlowkingWarp
	closetext
	end
	
.YesToSlowkingWarp
	closetext
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp AIRSHIP_OUTSIDE, 8, 14
	end
	
MelodyShrine:
	checkevent EVENT_LUGIA_FOUGHT
	iftrue .AlreadyFoughtLugia
	faceplayer
	opentext
	writetext OrbCheckText
	waitbutton
	checkitem ELECTRIC_ORB
	iffalse .NeedMoreOrbs
	checkitem ICE_ORB
	iffalse .NeedMoreOrbs
	checkitem FIRE_ORB
	iffalse .NeedMoreOrbs
	writetext ReadyToSummonLugiaText
	yesorno
	iftrue .SummonLugia
	closetext
	end
	
.NeedMoreOrbs:
	writetext NeedMoreOrbsText
	waitbutton
	closetext
	spriteface SHAMOUTI_SHRINE_MELODY, UP
	end
	
.SummonLugia:
	closetext
	applymovement PLAYER, ShamoutiShrinePlayerMovement1
	spriteface PLAYER, RIGHT
	applymovement SHAMOUTI_SHRINE_MELODY, ShamoutiShrineMelodyMovement1
	spriteface SHAMOUTI_SHRINE_MELODY, UP
	applymovement PLAYER, ShamoutiShrinePlayerMovement2
	special Special_FadeOutMusic
	pause 15
	playsound SFX_GLASS_TING
	pause 15
	playsound SFX_GLASS_TING
	pause 15
	playsound SFX_GLASS_TING
	pause 30
	playsound SFX_STRENGTH
	earthquake 50
	opentext
	writetext SummonLugiaText
	waitbutton
	closetext
	playmusic MUSIC_LUGIAS_SONG_2000
	pause 30
	playsound SFX_STRENGTH
	earthquake 50
	pause 30
	playsound SFX_STRENGTH
	earthquake 50
	pause 30
	playsound SFX_STRENGTH
	earthquake 50
	pause 15
	opentext
	writetext LugiaCryText
	cry LUGIA
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	clearevent EVENT_LUGIA_APPEARS
	appear SHAMOUTI_SHRINE_LUGIA
	applymovement SHAMOUTI_SHRINE_LUGIA, LugiaShamoutiShrineMovement
	writecode VAR_BATTLETYPE, BATTLETYPE_LUGIA
	loadwildmon LUGIA, 70
	startbattle
	disappear SHAMOUTI_SHRINE_LUGIA
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_LUGIA_FOUGHT
	setevent EVENT_LUGIA_APPEARS
	takeitem ELECTRIC_ORB
	takeitem ICE_ORB
	takeitem FIRE_ORB
	end
	
.AlreadyFoughtLugia
	faceplayer
	opentext
	checkevent EVENT_ENTERED_KANTO
	iftrue .BeenGoneAWhile
	writetext LugiaAlreadyFoughtText
	waitbutton
	closetext
	playmusic MUSIC_LUGIAS_SONG_2000
	end
	
.BeenGoneAWhile
	writetext BeenGoneAWhileText
	waitbutton
	closetext
	playmusic MUSIC_LUGIAS_SONG_2000
	end
	
ShamoutiShrinePlayerMovement1:
	step LEFT
	step_end
	
ShamoutiShrineMelodyMovement1:
	step DOWN
	step RIGHT
	step_end
	
ShamoutiShrinePlayerMovement2:
	step RIGHT
	step UP
	step UP
	step_end
	
LugiaShamoutiShrineMovement:
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	step_end

OrbCheckText:
	text "MELODY: You're"
	line "back!"
	
	para "Quickly, now, show"
	line "me the treasures!"
	
	para "<...>"
	done
	
NeedMoreOrbsText:
	text "It looks like you"
	line "are missing some"
	cont "of the treasures!"
	
	para "Quickly, go back"
	line "to the islands and"
	cont "get them!"
	done
	
ReadyToSummonLugiaText:
	text "Great, you have"
	line "all of them!"
	
	para "Are you ready?"
	done
	
SummonLugiaText:
	text "MELODY: Ok, I'm"
	line "going to play the"
	cont "sea god's song"
	cont "now! Get ready!"
	done
	
ShamoutiShrineText:
	jumptext ShamoutiShrineText1
	
ShamoutiShrineText1:
	text "The gods of fire,"
	line "lightning and ice"
	cont "must never be"
	cont "disturbed."
	
	para "Else, Heaven and"
	line "Earth will be"
	cont "angered and the"
	cont "world will face"
	cont "destruction."
	
	para "The god of the"
	line "sea will appear"
	cont "to stop it, but"
	cont "will not prevent"
	cont "the destruction."
	
	para "Harmony will only"
	line "be possible when"
	cont "a powerful trainer"
	cont "appears."
	done
	
ShamoutiShrineSlowkingText1:
	text "Yaaaaawn."
	done
	
ShamoutiShrineSlowkingText2:
	text "It's getting a"
	line "bit chilly, isn't"
	cont "it? I could use"
	cont "some pants."
	
	para "Ah, the flying"
	line "castle up there?"
	
	para "I can teleport"
	line "you there, if you"
	cont "would like?"
	
	para "I can't guarantee"
	line "that you will"
	cont "be in the safest"
	cont "place up there."
	done
	
LugiaAlreadyFoughtText:
	text "MELODY: Thank you"
	line "for saving us,"
	cont "<PLAYER>!"
	
	para "Now that the"
	line "prophecy has come"
	cont "full circle, I"
	cont "guess you'll be"
	cont "leaving soon<...>"
	
	para "Make sure you come"
	line "visit, I'll play"
	cont "my ocarina for you"
	cont "anytime!"
	done
	
BeenGoneAWhileText:
	text "MELODY: Hey,"
	line "<PLAYER>! Nice of"
	cont "you to drop by."
	
	para "That airship is"
	line "still up in the"
	cont "sky there. Hope"
	cont "that guy isn't up"
	cont "to anything shady."
	done
	
LugiaCryText:
	text "Gyaaaaaaah!"
	done

ShamoutiShrine_MapEventHeader::

.Warps: db 1
	warp_def $11, $6, 2, SHAMOUTI_CAVE
	
.CoordEvents: db 0

.BGEvents: db 1
	signpost  8, 11, SIGNPOST_READ, ShamoutiShrineText

.ObjectEvents: db 3
	person_event SPRITE_SLOWKING, 14, 11, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_RED, 0, 0, ShamoutiShrineSlowkingScript, -1
	person_event SPRITE_JASMINE, 10, 11, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, MelodyShrine, EVENT_MELODY_AT_SHRINE
	person_event SPRITE_LUGIA,  4, 11, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_BLUE, 0, 0, 0, EVENT_LUGIA_APPEARS
