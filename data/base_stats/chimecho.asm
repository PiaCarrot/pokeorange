	db CHIMECHO ; 164

	db 75,  50,  80,  65,  95,  90
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC
	db 45 ; catch rate
	db NO_ITEM ; item 1
	db PSNCUREBERRY ; item 2
	db FEMALE_50 ; gender
	db 15 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db FAST ; growth rate
	dn AMORPHOUS, AMORPHOUS ; egg groups

	; tmhm
	tmhm TOXIC, SUNNY_DAY, PROTECT, RAIN_DANCE, FRUSTRATION, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, FACADE, REST, ATTRACT, DAZZLINGLEAM, FLASH, ZEN_HEADBUTT, SLEEP_TALK, SWAGGER, ENDURE, SIGNAL_BEAM
	; end
