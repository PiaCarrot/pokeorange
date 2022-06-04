const_value = 1
	
TrovitopolisHouse1_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

TrovitopolisBlackBeltScript:
	jumptextfaceplayer TrovitopolisBlackBeltText
	
TrovitopolisBlackBeltText:
	text "If you intend to"
	line "challenge RUDY of"
	cont "TROVITA GYM, I"
	cont "must warn you."
	
	para "His team is very"
	line "well rounded."
	
	para "His #MON are"
	line "trained by DANCE."
	cont "You may find them"
	cont "hard to hit in a"
	
	para "prolonged battle."
	line "I recommend you"
	cont "bring some"
	cont "X ACCURACY!"
	done
	
TrovitopolisPokeFanFScript:
	jumptextfaceplayer TrovitopolisPokeFanFText
	
TrovitopolisPokeFanFText:
	text "My husband trains"
	line "with GYM LEADER"
	cont "RUDY of TROVITA"
	cont "ISLAND."
	
	para "Isn't he so manly?"
	done

TrovitopolisHouse1_MapEventHeader::

.Warps: db 2
	warp_def 7, 2, 7, TROVITOPOLIS
	warp_def 7, 3, 7, TROVITOPOLIS

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 2
	person_event SPRITE_BLACK_BELT, 4, 5, SPRITEMOVEDATA_STANDING_LEFT, 2, 2, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, TrovitopolisBlackBeltScript, -1
	person_event SPRITE_POKEFAN_F, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 2, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TrovitopolisPokeFanFScript, -1
