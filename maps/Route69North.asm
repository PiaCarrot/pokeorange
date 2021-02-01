Route69North_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

Route69ZenHeadbuttTutor:
	faceplayer
	opentext
	writetext GivePlayerZenHeadbuttText
	yesorno
	iffalse .TutorRefused
	writebyte ZEN_HEADBUTT
	writetext Text_ZenHeadbuttTutorClear
	special Special_MoveTutor
	if_equal $0, .TeachMove
.TutorRefused
	writetext Text_ZenHeadbuttTutorRefused
	waitbutton
	closetext
	end

.TeachMove
	writetext Text_ZenHeadbuttTutorTaught
	waitbutton
	closetext
	end

GivePlayerZenHeadbuttText:
	text "What am I doing?"
	
	para "Finding my inner"
	line "balance, that's"
	cont "what!"
	
	para "By headbutting"
	line "this mountain, I'm"
	cont "opening my mind."
	
	para "It's not for us"
	line "humans, though."
	cont "I can teach your"
	cont "#MON to use"
	
	para "ZEN HEADBUTT if"
	line "you would like?"
	done
	
Text_ZenHeadbuttTutorTaught:
	text "ZEN HEADBUTT is"
	line "a PSYCHIC attack"
	cont "that can sometimes"
	cont "cause the enemy to"
	
	para "flinch!"
	done
	
Text_ZenHeadbuttTutorRefused:
	text "Tell me if you"
	line "change your mind!"
	done
	
Text_ZenHeadbuttTutorClear:
	text ""
	done

Route69North_MapEventHeader::

.Warps: db 2
	warp_def 27,  5, 1, ROUTE_69_GATE
	warp_def 27,  6, 2, ROUTE_69_GATE

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 1
	person_event SPRITE_POKEFAN_M, 14,  8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route69ZenHeadbuttTutor, -1
