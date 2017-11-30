	db RAICHU ; 026

	db  60,  90,  55, 110,  90,  80
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC
	db 75 ; catch rate
	db NO_ITEM ; item 1
	db BERRY ; item 2
	db FEMALE_50 ; gender
	db 10 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FIELD, FAIRYEGG ; egg groups

	; tmhm
	tmhm TOXIC, HYPER_BEAM, PROTECT, RAIN_DANCE, FRUSTRATION, IRON_TAIL, THUNDERBOLT, THUNDER, RETURN, DIG, DOUBLE_TEAM, GIGA_IMPACT, SWIFT, FACADE, REST, ATTRACT, THIEF, FLASH, STRENGTH, ROCK_SMASH, THUNDERPUNCH, DYNAMICPUNCH, HEADBUTT, SLEEP_TALK, SWAGGER, ENDURE, SIGNAL_BEAM
	; end
