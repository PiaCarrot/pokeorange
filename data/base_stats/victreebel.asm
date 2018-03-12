	db VICTREEBEL ; 071

	db  80, 105,  65,  70, 100,  70
	;   hp  atk  def  spd  sat  sdf

	db GRASS, POISON
	db 45 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn PLANT, PLANT ; egg groups

	; tmhm
	tmhm VENOSHOCK, TOXIC, BULLET_SEED, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, SOLARBEAM, RETURN, DOUBLE_TEAM, GIGA_IMPACT, SLUDGE_BOMB, FACADE, REST, SEED_BOMB, THIEF, FLASH, CUT, SWORDS_DANCE, BODY_SLAM, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT, POISON_JAB, BUG_BITE
	; end
