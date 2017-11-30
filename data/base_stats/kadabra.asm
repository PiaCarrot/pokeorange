	db KADABRA ; 064

	db  40,  35,  30, 105, 120,  70
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC
	db 100 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_25 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn HUMANSHAPE, HUMANSHAPE ; egg groups

	; tmhm
	tmhm TOXIC, SUNNY_DAY, PROTECT, RAIN_DANCE, FRUSTRATION, IRON_TAIL, RETURN, DIG, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, FACADE, REST, ATTRACT, THIEF, DAZZLINGLEAM, FLASH, FIRE_PUNCH, THUNDERPUNCH, ICE_PUNCH, DYNAMICPUNCH, HEADBUTT, ZEN_HEADBUTT, SLEEP_TALK, SWAGGER, ENDURE, SIGNAL_BEAM
	; end
