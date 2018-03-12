	db TOGEPI ; 175

	db  35,  20,  65,  20,  40,  65
	;   hp  atk  def  spd  sat  sdf

	db FAIRY, FAIRY
	db 190 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_12_5 ; gender
	db 10 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db FAST ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; tmhm
	tmhm WATER_PULSE, TOXIC, SUNNY_DAY, PROTECT, RAIN_DANCE, SOLARBEAM, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, FLAMETHROWER, FIRE_BLAST, DAZZLINGLEAM, FACADE, REST, TRI_ATTACK, FLASH, ROCK_SMASH, HEADBUTT, ZEN_HEADBUTT, BODY_SLAM, COUNTER, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT, SIGNAL_BEAM
	; end
