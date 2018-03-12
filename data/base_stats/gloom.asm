	db GLOOM ; 044

	db  60,  65,  70,  40,  85,  75
	;   hp  atk  def  spd  sat  sdf

	db GRASS, POISON
	db 120 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn PLANT, PLANT ; egg groups

	; tmhm
	tmhm VENOSHOCK, TOXIC, BULLET_SEED, SUNNY_DAY, PROTECT, GIGA_DRAIN, SOLARBEAM, RETURN, DOUBLE_TEAM, SLUDGE_BOMB, DAZZLINGLEAM, FACADE, REST, SEED_BOMB, FLASH, CUT, SWORDS_DANCE, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
