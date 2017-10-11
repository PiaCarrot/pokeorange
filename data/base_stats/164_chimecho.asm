	db CHIMECHO ; 164

	db 75,  50,  80,  65,  95,  90
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC
	db 45 ; catch rate
	db 159 ; base exp
	db NO_ITEM ; item 1
	db PSNCUREBERRY ; item 2
	db 127 ; gender
	db 15 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db FAST ; growth rate
	dn AMORPHOUS, AMORPHOUS ; egg groups

	; tmhm
	tmhm ICY_WIND, SLEEP_TALK, TOXIC, SUNNY_DAY, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, REST, ATTRACT, DAZZLINGLEAM, FLASH, SIGNAL_BEAM
	; end
