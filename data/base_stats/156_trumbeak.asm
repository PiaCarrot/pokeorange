	db TRUMBEAK ; 156

	db  55,  85,  50,  75,  40,  50
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING
	db 120 ; catch rate
	db 124 ; base exp
	db NO_ITEM ; item 1
	db GOLD_BERRY ; item 2
	db 127 ; gender
	db 15 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn AVIAN, AVIAN ; egg groups

	; tmhm
	tmhm SLEEP_TALK, TOXIC, BULLET_SEED, SUNNY_DAY, PROTECT, FRUSTRATION, RETURN, DOUBLE_TEAM, SWAGGER, AERIAL_ACE, REST, ATTRACT, THIEF, STEEL_WING, FLY, ROCK_SMASH
	; end
