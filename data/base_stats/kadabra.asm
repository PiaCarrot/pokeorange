	db KADABRA ; 064

	db  40,  35,  30, 105, 120,  70
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC
	db 100 ; catch rate
	db 145 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 63 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn HUMANSHAPE, HUMANSHAPE ; egg groups

	; tmhm
	tmhm HEADBUTT, CURSE, TOXIC, ZAP_CANNON, SUNNY_DAY, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, RETURN, DIG, PSYCHIC, SHADOW_BALL, ICE_PUNCH, SWAGGER, SLEEP_TALK, THUNDERPUNCH, REST, ATTRACT, THIEF, FIRE_PUNCH
	; end
