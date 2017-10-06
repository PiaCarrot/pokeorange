	db DROWZEE ; 096

	db  60,  48,  45,  42,  43,  90
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC
	db 190 ; catch rate
	db 102 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn HUMANSHAPE, HUMANSHAPE ; egg groups

	; tmhm
	tmhm HEADBUTT, TOXIC, ZAP_CANNON, SUNNY_DAY, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, RETURN, PSYCHIC, SHADOW_BALL, ICE_PUNCH, SWAGGER, SLEEP_TALK, THUNDERPUNCH, REST, ATTRACT, FIRE_PUNCH
	; end
