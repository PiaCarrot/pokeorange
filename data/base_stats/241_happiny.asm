	db HAPPINY ; 241

	db  100,  5, 5, 30,  15,  65
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 130 ; catch rate
	db 255 ; base exp
	db NO_ITEM ; item 1
	db LUCKY_EGG ; item 2
	db 254 ; gender
	db 40 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db FAST ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; tmhm
	tmhm WATER_PULSE, ICY_WIND, SLEEP_TALK, TOXIC, HAIL, SUNNY_DAY, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, SOLARBEAM, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, FLAMETHROWER, FIRE_BLAST, HEADBUTT, REST, ATTRACT, FLASH
	; end
