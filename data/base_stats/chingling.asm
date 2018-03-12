	db CHINGLING ; 163

	db  45,  30,  50,  45,  65,  50
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC
	db 120 ; catch rate
	db NO_ITEM ; item 1
	db PSNCUREBERRY ; item 2
	db FEMALE_50 ; gender
	db 15 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db FAST ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; tmhm
	tmhm TOXIC, SUNNY_DAY, PROTECT, RAIN_DANCE, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, DAZZLINGLEAM, FACADE, REST, FLASH, ZEN_HEADBUTT, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT, SIGNAL_BEAM
	; end
