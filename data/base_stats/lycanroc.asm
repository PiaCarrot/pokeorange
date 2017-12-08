	db LYCANROC ; 160

	db  80, 117, 70,  110,  55,  70
	;   hp  atk  def  spd  sat  sdf

	db ROCK, ROCK
	db 90 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm TOXIC, BULLET_SEED, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, FRUSTRATION, IRON_TAIL, THUNDERBOLT, THUNDER, RETURN, DIG, DOUBLE_TEAM, GIGA_IMPACT, FACADE, REST, ATTRACT, THIEF, DAZZLINGLEAM, SLEEP_TALK, SWAGGER
	; end
