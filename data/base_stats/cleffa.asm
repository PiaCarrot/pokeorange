	db CLEFFA ; 173

	db  50,  25,  28,  15,  45,  55
	;   hp  atk  def  spd  sat  sdf

	db FAIRY, FAIRY
	db 150 ; catch rate
	db MYSTERYBERRY ; item 1
	db MOON_STONE ; item 2
	db FEMALE_75 ; gender
	db 10 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db FAST ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; tmhm
	tmhm WATER_PULSE, TOXIC, SUNNY_DAY, PROTECT, RAIN_DANCE, SOLARBEAM, IRON_TAIL, RETURN, DIG, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, FLAMETHROWER, FIRE_BLAST, FACADE, REST, FLASH, HEADBUTT, ZEN_HEADBUTT, BODY_SLAM, COUNTER, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT, SIGNAL_BEAM
	; end
