	db BEEDRILL ; 015

	db  65,  80,  40,  75,  45,  80
	;   hp  atk  def  spd  sat  sdf

	db BUG, POISON
	db 45 ; catch rate
	db 159 ; base exp
	db NO_ITEM ; item 1
	db POISON_BARB ; item 2
	db 127 ; gender
	db 15 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn INSECT, INSECT ; egg groups

	; tmhm
	tmhm CURSE, TOXIC, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, ENDURE, FRUSTRATION, RETURN, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, SWIFT, REST, ATTRACT, CUT
	; end
