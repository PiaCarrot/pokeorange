	db VENUSAUR ; 003

	db  80,  82,  83,  80, 100, 100
	;   hp  atk  def  spd  sat  sdf

	db GRASS, POISON
	db 45 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_12_5 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn MONSTER, PLANT ; egg groups

	; tmhm
	tmhm VENOSHOCK, TOXIC, BULLET_SEED, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, SOLARBEAM, EARTHQUAKE, RETURN, DOUBLE_TEAM, GIGA_IMPACT, SLUDGE_BOMB, FACADE, REST, SEED_BOMB, FLASH, CUT, STRENGTH, ROCK_SMASH, ROCK_CLIMB, HEADBUTT, SWORDS_DANCE, BODY_SLAM, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
