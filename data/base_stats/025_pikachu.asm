	db PIKACHU ; 025

	db  35,  55,  40,  90,  50,  50
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC
	db 190 ; catch rate
	db 112 ; base exp
	db NO_ITEM ; item 1
	db BERRY ; item 2
	db FEMALE_50 ; gender
	db 10 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FIELD, FAIRYEGG ; egg groups

	; tmhm
	tmhm SLEEP_TALK, TOXIC, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, IRON_TAIL, THUNDERBOLT, THUNDER, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SWIFT, THUNDERPUNCH, HEADBUTT, REST, ATTRACT, FLASH, STRENGTH, ROCK_SMASH, DYNAMICPUNCH, SIGNAL_BEAM
	; end
