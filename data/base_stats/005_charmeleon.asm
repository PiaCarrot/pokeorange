	db CHARMELEON ; 005

	db  58,  64,  58,  80,  80,  65
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE
	db 45 ; catch rate
	db 142 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_12_5 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn MONSTER, REPTILE ; egg groups

	; tmhm
	tmhm POWERUPPUNCH, DRAGON_PULSE, SLEEP_TALK, TOXIC, SUNNY_DAY, DRAGONBREATH, PROTECT, ENDURE, FRUSTRATION, IRON_TAIL, RETURN, DIG, DOUBLE_TEAM, SWAGGER, FLAMETHROWER, FIRE_BLAST, SWIFT, AERIAL_ACE, THUNDERPUNCH, HEADBUTT, REST, ATTRACT, FIRE_PUNCH, CUT, STRENGTH, ROCK_SMASH, DYNAMICPUNCH
	; end
