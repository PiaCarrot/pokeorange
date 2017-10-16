	db FLAAFFY ; 180

	db  70,  55,  55,  45,  80,  60
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC
	db 120 ; catch rate
	db 128 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn MONSTER, FIELD ; egg groups

	; tmhm
	tmhm POWERUPPUNCH, SLEEP_TALK, TOXIC, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, IRON_TAIL, THUNDERBOLT, THUNDER, RETURN, DOUBLE_TEAM, SWAGGER, SWIFT, THUNDERPUNCH, HEADBUTT, REST, ATTRACT, FIRE_PUNCH, FLASH, STRENGTH, ROCK_SMASH, DYNAMICPUNCH, SIGNAL_BEAM
	; end
