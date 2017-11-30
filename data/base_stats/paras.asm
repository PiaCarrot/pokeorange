	db PARAS ; 046

	db  35,  70,  55,  25,  45,  55
	;   hp  atk  def  spd  sat  sdf

	db BUG, GRASS
	db 190 ; catch rate
	db TINYMUSHROOM ; item 1
	db BIG_MUSHROOM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn INSECT, PLANT ; egg groups

	; tmhm
	tmhm VENOSHOCK, TOXIC, BULLET_SEED, SUNNY_DAY, PROTECT, GIGA_DRAIN, FRUSTRATION, SOLARBEAM, RETURN, DIG, DOUBLE_TEAM, SLUDGE_BOMB, AERIAL_ACE, FACADE, REST, ATTRACT, THIEF, FLASH, CUT, ROCK_SMASH, SLEEP_TALK, SWAGGER, ENDURE, BUG_BITE
	; end
