	db TRUMBEAK ; 156

	db  58,  64,  58,  80,  80,  65
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE
	db 45 ; catch rate
	db 142 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 31 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm SLEEP_TALK, TOXIC, BULLET_SEED, SUNNY_DAY, PROTECT, FRUSTRATION, RETURN, DOUBLE_TEAM, SWAGGER, AERIAL_ACE, REST, ATTRACT, THIEF, STEEL_WING, FLY, ROCK_SMASH
	; end
