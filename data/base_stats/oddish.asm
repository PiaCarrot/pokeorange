	db ODDISH ; 043

	db  45,  50,  55,  30,  75,  65
	;   hp  atk  def  spd  sat  sdf

	db GRASS, POISON
	db 255 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn PLANT, PLANT ; egg groups

	; tmhm
	tmhm VENOSHOCK, TOXIC, BULLET_SEED, SUNNY_DAY, PROTECT, GIGA_DRAIN, SOLARBEAM, RETURN, DOUBLE_TEAM, SLUDGE_BOMB, DAZZLINGLEAM, FACADE, REST, SEED_BOMB, FLASH, CUT, SWORDS_DANCE, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
