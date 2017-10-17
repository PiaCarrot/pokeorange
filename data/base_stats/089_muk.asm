	db MUK ; 089

	db 105, 105,  75,  50,  65, 100
	;   hp  atk  def  spd  sat  sdf

	db POISON, DARK
	db 75 ; catch rate
	db 175 ; base exp
	db NO_ITEM ; item 1
	db NUGGET ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn AMORPHOUS, AMORPHOUS ; egg groups

	; tmhm
	tmhm SLEEP_TALK, TOXIC, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, FRUSTRATION, RETURN, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, FLAMETHROWER, SLUDGE_BOMB, FIRE_BLAST, REST, ATTRACT, THIEF, VENOSHOCK
	; end
