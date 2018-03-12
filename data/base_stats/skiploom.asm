	db SKIPLOOM ; 188

	db  55,  45,  50,  80,  45,  65
	;   hp  atk  def  spd  sat  sdf

	db GRASS, FLYING
	db 120 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn FAIRYEGG, PLANT ; egg groups

	; tmhm
	tmhm TOXIC, BULLET_SEED, SUNNY_DAY, PROTECT, GIGA_DRAIN, SOLARBEAM, RETURN, DOUBLE_TEAM, DAZZLINGLEAM, AERIAL_ACE, FACADE, REST, SEED_BOMB, FLASH, HEADBUTT, SWORDS_DANCE, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
