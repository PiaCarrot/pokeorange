	db FEAROW ; 022

	db  65,  90,  65, 100,  61,  61
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING
	db 90 ; catch rate
	db 162 ; base exp
	db NO_ITEM ; item 1
	db SHARP_BEAK ; item 2
	db 127 ; gender
	db 15 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn AVIAN, AVIAN ; egg groups

	; tmhm
	tmhm CURSE, TOXIC, SUNNY_DAY, HYPER_BEAM, PROTECT, ENDURE, FRUSTRATION, RETURN, SWAGGER, SLEEP_TALK, SWIFT, REST, ATTRACT, THIEF, STEEL_WING, FLY
	; end
