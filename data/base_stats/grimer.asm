	db GRIMER ; 088

	db  80,  80,  50,  25,  40,  50
	;   hp  atk  def  spd  sat  sdf

	db POISON, DARK
	db 190 ; catch rate
	db NO_ITEM ; item 1
	db NUGGET ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn AMORPHOUS, AMORPHOUS ; egg groups

	; tmhm
	tmhm VENOSHOCK, TOXIC, SUNNY_DAY, PROTECT, RAIN_DANCE, RETURN, SHADOW_BALL, DOUBLE_TEAM, FLAMETHROWER, SLUDGE_BOMB, FIRE_BLAST, FACADE, REST, THIEF, ROCK_SLIDE, BODY_SLAM, SUBSTITUTE, SWAGGER, SLEEP_TALK, ATTRACT, POISON_JAB, THUNDERPUNCH, FIRE_PUNCH, ICE_PUNCH
	; end
