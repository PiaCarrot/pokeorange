	db CHINGLING ; 163

	db  45,  30,  50,  45,  65,  50
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC
	db 120 ; catch rate
	db 57 ; base exp
	db NO_ITEM ; item 1
	db PSNCUREBERRY ; item 2
	db 127 ; gender
	db 15 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db FAST ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; tmhm
	tmhm ICY_WIND, SLEEP_TALK, TOXIC, HAIL, SUNNY_DAY, WATER_GUN, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, IRON_TAIL, THUNDERBOLT, RETURN, PSYCHIC, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SANDSTORM, SWIFT, REST, ATTRACT, DAZZLINGLEAM, FLASH, SIGNAL_BEAM, VENOSHOCK
	; end
