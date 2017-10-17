	db RAICHU ; 026

	db  60,  90,  55, 110,  90,  80
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC
	db 75 ; catch rate
	db 218 ; base exp
	db NO_ITEM ; item 1
	db BERRY ; item 2
	db FEMALE_50 ; gender
	db 10 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FIELD, FAIRYEGG ; egg groups

	; tmhm
	tmhm SLEEP_TALK, TOXIC, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, IRON_TAIL, THUNDERBOLT, THUNDER, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SWIFT, THUNDERPUNCH, HEADBUTT, REST, ATTRACT, THIEF, FLASH, STRENGTH, ROCK_SMASH, DYNAMICPUNCH, SIGNAL_BEAM
	; end
