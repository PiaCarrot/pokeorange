	db MR__MIME ; 122

	db  40,  45,  65,  90, 100, 120
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, FAIRY
	db 45 ; catch rate
	db 136 ; base exp
	db NO_ITEM ; item 1
	db MYSTERYBERRY ; item 2
	db 127 ; gender
	db 25 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn HUMANSHAPE, HUMANSHAPE ; egg groups

	; tmhm
	tmhm HEADBUTT, CURSE, TOXIC, ZAP_CANNON, SUNNY_DAY, HYPER_BEAM, PROTECT, ENDURE, FRUSTRATION, SOLARBEAM, THUNDER, RETURN, PSYCHIC, SHADOW_BALL, ICE_PUNCH, SWAGGER, SLEEP_TALK, THUNDERPUNCH, REST, ATTRACT, THIEF, FIRE_PUNCH
	; end
