	db TANGELA ; 114

	db  65,  55, 115,  60, 100,  40
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS
	db 45 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn PLANT, PLANT ; egg groups

	; tmhm
	tmhm TOXIC, BULLET_SEED, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, SOLARBEAM, RETURN, DOUBLE_TEAM, GIGA_IMPACT, SLUDGE_BOMB, FACADE, REST, SEED_BOMB, THIEF, FLASH, CUT, ROCK_SMASH, HEADBUTT, SWORDS_DANCE, BODY_SLAM, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
