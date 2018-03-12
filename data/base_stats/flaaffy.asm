	db FLAAFFY ; 180

	db  70,  55,  55,  45,  80,  60
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC
	db 120 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn MONSTER, FIELD ; egg groups

	; tmhm
	tmhm POWERUPPUNCH, TOXIC, PROTECT, RAIN_DANCE, IRON_TAIL, THUNDERBOLT, THUNDER, RETURN, DOUBLE_TEAM, FACADE, REST, FLASH, STRENGTH, ROCK_SMASH, FIRE_PUNCH, THUNDERPUNCH, DYNAMICPUNCH, HEADBUTT, COUNTER, SLEEP_TALK, SUBSTITUTE, BODY_SLAM, ATTRACT, SWAGGER, ENDURE, SIGNAL_BEAM
	; end
