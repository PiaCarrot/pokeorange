	db MUK ; 089

	db 105, 105,  75,  50,  65, 100
	;   hp  atk  def  spd  sat  sdf

	db POISON, DARK
	db 75 ; catch rate
	db NO_ITEM ; item 1
	db NUGGET ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn AMORPHOUS, AMORPHOUS ; egg groups

	; tmhm
	tmhm DARK_PULSE, VENOSHOCK, TOXIC, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, RETURN, SHADOW_BALL, DOUBLE_TEAM, GIGA_IMPACT, FLAMETHROWER, SLUDGE_BOMB, FIRE_BLAST, FACADE, REST, THIEF, ROCK_SLIDE, BODY_SLAM, SUBSTITUTE, SWAGGER, SLEEP_TALK, ATTRACT, POISON_JAB, THUNDERPUNCH, FIRE_PUNCH, ICE_PUNCH
	; end
