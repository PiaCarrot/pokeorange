	db DROWZEE ; 096

	db  60,  48,  45,  42,  43,  90
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC
	db 190 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn HUMANSHAPE, HUMANSHAPE ; egg groups

	; tmhm
	tmhm POWERUPPUNCH, TOXIC, SUNNY_DAY, PROTECT, RAIN_DANCE, FRUSTRATION, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, FACADE, REST, ATTRACT, THIEF, DAZZLINGLEAM, FLASH, FIRE_PUNCH, THUNDERPUNCH, ICE_PUNCH, DYNAMICPUNCH, HEADBUTT, ZEN_HEADBUTT, SLEEP_TALK, SWAGGER, ENDURE, SIGNAL_BEAM
	; end
