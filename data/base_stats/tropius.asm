	db TROPIUS ; 152

	db  99,  68,  83,  51,  72,  87
	;   hp  atk  def  spd  sat  sdf

	db GRASS, FLYING
	db 200 ; catch rate
	db GOLD_BERRY ; item 1
	db GOLD_BERRY ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db SLOW ; growth rate
	dn MONSTER, PLANT ; egg groups

	; tmhm
	tmhm DRAGON_PULSE, TOXIC, BULLET_SEED, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, SOLARBEAM, EARTHQUAKE, RETURN, DOUBLE_TEAM, GIGA_IMPACT, AERIAL_ACE, FACADE, REST, SEED_BOMB, STEEL_WING, FLASH, CUT, FLY, STRENGTH, ROCK_SMASH, HEADBUTT, SWORDS_DANCE, BODY_SLAM, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
