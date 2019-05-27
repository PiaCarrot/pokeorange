	db ARCANINE ; 059

	db  90, 110,  80,  95, 100,  80
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE
	db 75 ; catch rate
	db BURNT_BERRY ; item 1
	db BURNT_BERRY ; item 2
	db FEMALE_25 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db SLOW ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm DRAGON_PULSE, TOXIC, SUNNY_DAY, HYPER_BEAM, DRAGONBREATH, PROTECT, SOLARBEAM, IRON_TAIL, RETURN, DIG, DOUBLE_TEAM, GIGA_IMPACT, FLAMETHROWER, FIRE_BLAST, AERIAL_ACE, FACADE, REST, THIEF, STRENGTH, ROCK_SMASH, ROCK_CLIMB, HEADBUTT, BODY_SLAM, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
