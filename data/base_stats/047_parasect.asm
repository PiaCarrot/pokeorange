	db PARASECT ; 047

	db  60,  95,  80,  30,  60,  80
	;   hp  atk  def  spd  sat  sdf

	db BUG, GRASS
	db 75 ; catch rate
	db 142 ; base exp
	db TINYMUSHROOM ; item 1
	db BIG_MUSHROOM ; item 2
	db 127 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn INSECT, PLANT ; egg groups

	; tmhm
	tmhm SLEEP_TALK, TOXIC, BULLET_SEED, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, ENDURE, FRUSTRATION, SOLARBEAM, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLUDGE_BOMB, AERIAL_ACE, REST, ATTRACT, THIEF, FLASH, CUT, ROCK_SMASH, BUG_BITE, VENOSHOCK
	; end
