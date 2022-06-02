const_value set 1

ShamoutiShrine_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 0

ShamoutiShrineSlowkingScript:
	opentext
	writetext ShamoutiShrineSlowkingText1
	cry SLOWKING
	waitbutton
	closetext
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

ShamoutiShrine_MapEventHeader::

.Warps: db 0
.CoordEvents: db 0

.BGEvents: db 1
	signpost  8, 11, SIGNPOST_READ, ShamoutiShrineText

.ObjectEvents: db 1
	person_event SPRITE_SLOWKING, 14, 11, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_RED, 0, 0, ShamoutiShrineSlowkingScript, -1
