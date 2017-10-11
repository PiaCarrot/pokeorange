	db GRIMER ; 088

	db  80,  80,  50,  25,  40,  50
	;   hp  atk  def  spd  sat  sdf

	db POISON, DARK
	db 190 ; catch rate
	db 65 ; base exp
	db NO_ITEM ; item 1
	db NUGGET ; item 2
	db 127 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn AMORPHOUS, AMORPHOUS ; egg groups

	; tmhm
	tmhm SLEEP_TALK, TOXIC, SUNNY_DAY, PROTECT, RAIN_DANCE, FRUSTRATION, RETURN, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, FLAMETHROWER, SLUDGE_BOMB, FIRE_BLAST, REST, ATTRACT, THIEF, VENOSHOCK
	; end
