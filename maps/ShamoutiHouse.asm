const_value = 1

ShamoutiHouse_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

MelodyShamouti:
	checkevent EVENT_SHAMOUTI_QUEST_STARTED
	iftrue .PlayLugiaSong
	jumptextfaceplayer MelodyText1
	end
	
.PlayLugiaSong
	faceplayer
	opentext
	checkevent EVENT_BEAT_LAWRENCE_ICE_ISLAND
	iftrue .GoToSlowking
	writetext MelodyText2
	waitbutton
	closetext
	playmusic MUSIC_LUGIAS_SONG_2000
	end

.GoToSlowking
	checkevent EVENT_MELODY_SENDS_YOU_TO_SHRINE
	iftrue .AlreadySpokeToMelody
	writetext MelodyText3
	waitbutton
	closetext
	setevent EVENT_MELODY_SENDS_YOU_TO_SHRINE
	end
	
.AlreadySpokeToMelody
	writetext MelodyText4
	waitbutton
	closetext
	end

MelodyText1:
	text "MELODY: Are you"
	line "here for the"
	cont "Legend Festival?"
	
	para "My father is"
	line "celebrating at"
	cont "the house behind"
	cont "this one."
	
	para "You should go see"
	line "him."
	done
	
MelodyText2:
	text "MELODY: So you're "
	line "going to play the"
	cont "role of trainer in"
	cont "the festival?"
	
	para "All you gotta do"
	line "is go to the 3"
	cont "islands, grab the"
	cont "treasures, and"
	cont "place them on the"
	cont "shrine. Then I'll"
	cont "do the rest by"
	cont "playing the song"
	cont "of the sea god."
	
	para "Wanna hear it? It"
	line "goes like this<...>"
	done
	
MelodyText3:
	text "MELODY: So, the"
	line "prophecy has come"
	cont "true? Someone has"
	cont "disturbed the gods"
	cont "of the islands."
	
	para "If we don't do"
	line "something fast,"
	cont "who knows what"
	cont "will happen!"
	
	para "It can't be a"
	line "coincidence that"
	cont "you came to us."
	
	para "<...>"
	
	para "You can't get up"
	line "to the castle in"
	cont "the sky?"
	
	para "There's a guardian"
	line "at the shrine that"
	cont "might be able to"
	cont "help with that."
	
	para "Go speak with it,"
	line "and when you get"
	cont "back, meet me at"
	cont "the shrine with"
	cont "those treasures."
	
	para "If that intruder"
	line "really thinks the"
	cont "gods are the three"
	cont "treasures, then he"
	cont "is dumber than he"
	cont "lets on. I'm sure"
	cont "you can do this!"
	done
	
MelodyText4:
	text "You can't get up"
	line "to the castle in"
	cont "the sky?"
	
	para "There's a guardian"
	line "at the shrine that"
	cont "might be able to"
	cont "help with that."
	
	para "Go speak with it,"
	line "and when you get"
	cont "back, meet me at"
	cont "the shrine with"
	cont "those treasures."
	
	para "If that intruder"
	line "really thinks the"
	cont "gods are the three"
	cont "treasures, then he"
	cont "is dumber than he"
	cont "lets on. I'm sure"
	cont "you can do this!"
	done

ShamoutiHouse_MapEventHeader:

.Warps: db 2
	warp_def $7, $3, 1, SHAMOUTI_ISLAND
	warp_def $7, $4, 1, SHAMOUTI_ISLAND

.XYTriggers: db 0

.Signposts: db 0

.PersonEvents: db 1
	person_event SPRITE_JASMINE,  3,  2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, MelodyShamouti, EVENT_BEAT_LAWRENCE
