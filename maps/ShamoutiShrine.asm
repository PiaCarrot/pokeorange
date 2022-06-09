const_value = 1

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

ShamoutiShrine_MapEventHeader::

.Warps: db 1
	warp_def $11, $6, 2, SHAMOUTI_CAVE
	
.CoordEvents: db 0

.BGEvents: db 1
	signpost  8, 11, SIGNPOST_READ, ShamoutiShrineText

.ObjectEvents: db 1
	person_event SPRITE_SLOWKING, 14, 11, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_RED, 0, 0, ShamoutiShrineSlowkingScript, -1
