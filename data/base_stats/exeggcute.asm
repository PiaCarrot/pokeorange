	db EXEGGCUTE ; 102

	db  60,  40,  80,  40,  60,  45
	;   hp  atk  def  spd  sat  sdf

	db GRASS, PSYCHIC
	db 90 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db SLOW ; growth rate
	dn PLANT, PLANT ; egg groups

	; tmhm
	tmhm TOXIC, BULLET_SEED, SUNNY_DAY, PROTECT, GIGA_DRAIN, SOLARBEAM, RETURN, PSYCHIC_M, DOUBLE_TEAM, SLUDGE_BOMB, FACADE, REST, SEED_BOMB, THIEF, FLASH, STRENGTH, SWORDS_DANCE, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
