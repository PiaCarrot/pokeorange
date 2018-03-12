	db HOPPIP ; 187

	db  35,  35,  40,  50,  35,  55
	;   hp  atk  def  spd  sat  sdf

	db GRASS, FLYING
	db 255 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn FAIRYEGG, PLANT ; egg groups

	; tmhm
	tmhm TOXIC, BULLET_SEED, SUNNY_DAY, PROTECT, GIGA_DRAIN, SOLARBEAM, RETURN, DOUBLE_TEAM, DAZZLINGLEAM, AERIAL_ACE, FACADE, REST, SEED_BOMB, FLASH, HEADBUTT, SWORDS_DANCE, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
