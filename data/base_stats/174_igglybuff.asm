	db IGGLYBUFF ; 174

	db  90,  30,  15,  15,  40,  20
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FAIRY
	db 170 ; catch rate
	db 42 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 191 ; gender
	db 10 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db FAST ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; tmhm
	tmhm WATER_PULSE, ICY_WIND, SLEEP_TALK, TOXIC, SUNNY_DAY, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, SOLARBEAM, RETURN, DIG, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, FLAMETHROWER, FIRE_BLAST, HEADBUTT, REST, ATTRACT, FLASH
	; end
