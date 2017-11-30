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
	tmhm TOXIC, BULLET_SEED, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, FRUSTRATION, SOLARBEAM, RETURN, DOUBLE_TEAM, GIGA_IMPACT, SLUDGE_BOMB, FACADE, REST, ATTRACT, THIEF, FLASH, CUT, ROCK_SMASH, HEADBUTT, SLEEP_TALK, SWAGGER, ENDURE
	; end
