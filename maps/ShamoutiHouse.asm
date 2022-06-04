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
	writetext MelodyText2
	waitbutton
	closetext
	playmusic MUSIC_LUGIAS_SONG_2000
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
	

ShamoutiHouse_MapEventHeader:

.Warps: db 2
	warp_def $7, $3, 1, SHAMOUTI_ISLAND
	warp_def $7, $4, 1, SHAMOUTI_ISLAND

.XYTriggers: db 0

.Signposts: db 0

.PersonEvents: db 1
	person_event SPRITE_JASMINE,  3,  2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, MelodyShamouti, EVENT_BEAT_LAWRENCE
