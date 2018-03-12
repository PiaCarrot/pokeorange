	db FLAREON ; 136

	db  65, 130,  60,  65,  95, 110
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE
	db 45 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_12_5 ; gender
	db 35 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm TOXIC, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, IRON_TAIL, RETURN, DIG, SHADOW_BALL, DOUBLE_TEAM, GIGA_IMPACT, FLAMETHROWER, FIRE_BLAST, FACADE, REST, STRENGTH, ROCK_SMASH, HEADBUTT, BODY_SLAM, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
