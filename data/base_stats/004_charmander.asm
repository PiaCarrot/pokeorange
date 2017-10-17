	db CHARMANDER ; 004

	db  39,  52,  43,  65,  60,  50
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE
	db 45 ; catch rate
	db 62 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_12_5 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn MONSTER, REPTILE ; egg groups

	; tmhm
	tmhm POWERUPPUNCH, DRAGON_PULSE, SLEEP_TALK, TOXIC, SUNNY_DAY, DRAGONBREATH, PROTECT, ENDURE, FRUSTRATION, IRON_TAIL, RETURN, DIG, DOUBLE_TEAM, SWAGGER, FLAMETHROWER, FIRE_BLAST, SWIFT, AERIAL_ACE, THUNDERPUNCH, HEADBUTT, REST, ATTRACT, FIRE_PUNCH, CUT, STRENGTH, ROCK_SMASH, DYNAMICPUNCH
	; end
