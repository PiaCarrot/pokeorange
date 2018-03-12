	db HAPPINY ; 241

	db  100,  5, 5, 30,  15,  65
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 130 ; catch rate
	db NO_ITEM ; item 1
	db LUCKY_EGG ; item 2
	db ALL_FEMALE ; gender
	db 40 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db FAST ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; tmhm
	tmhm WATER_PULSE, TOXIC, HAIL, SUNNY_DAY, PROTECT, RAIN_DANCE, SOLARBEAM, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, FLAMETHROWER, FIRE_BLAST, FACADE, REST, FLASH, HEADBUTT, ZEN_HEADBUTT, COUNTER, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
