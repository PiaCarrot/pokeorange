	db TANGROWTH ; 245

	db 100,  100, 125,  50,  110, 50
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS
	db 30 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn PLANT, PLANT ; egg groups

	; tmhm
	tmhm TOXIC, BULLET_SEED, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, SOLARBEAM, EARTHQUAKE, RETURN, DOUBLE_TEAM, GIGA_IMPACT, SLUDGE_BOMB, AERIAL_ACE, FACADE, REST, SEED_BOMB, THIEF, ROCK_SLIDE, FLASH, CUT, STRENGTH, ROCK_SMASH, HEADBUTT, SWORDS_DANCE, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT, POISON_JAB
	; end
