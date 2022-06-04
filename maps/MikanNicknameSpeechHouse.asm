const_value = 1
	const MIKANNICKNAMESPEECHHOUSE_TEACHER
	const MIKANNICKNAMESPEECHHOUSE_BIRD

MikanNicknameSpeechHouse_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

TeacherScript_0x693e9:
	faceplayer
	checkevent EVENT_GOT_OLD_ROD
	iftrue .GotRod
	opentext
	writetext UnknownText_0x693fa
	waitbutton
	verbosegiveitem OLD_ROD
	setevent EVENT_GOT_OLD_ROD
	closetext
	end

.GotRod:
	opentext
	writetext RodText
	waitbutton
	closetext
	end

BirdScript_0x693ef:
	faceplayer
	opentext
	writetext UnknownText_0x6947c
	cry SHELLDER
	waitbutton
	closetext
	end

UnknownText_0x693fa:
	text "I can sense you"
	line "have a knack at"
	cont "SEAFARING."

	para "Here, take this."
	line "One of my older"
	cont "RODs."
	done

RodText:
	text "How goes the fish-"
	line "ing?"
	done

UnknownText_0x6947c:
	text "SHELLDER: Krrkrr!"
	done

MikanNicknameSpeechHouse_MapEventHeader:

.Warps: db 2
	warp_def $7, $3, 3, MIKAN_ISLAND
	warp_def $7, $4, 3, MIKAN_ISLAND

.XYTriggers: db 0

.Signposts: db 0

.PersonEvents: db 2
	person_event SPRITE_FISHING_GURU, 3, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TeacherScript_0x693e9, -1
	person_event SPRITE_SHELLDER, 2, 5, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_PURPLE, 0, 0, BirdScript_0x693ef, -1
