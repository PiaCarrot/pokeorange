	db LANTURN ; 171

	db 125,  58,  58,  67,  76,  76
	;   hp  atk  def  spd  sat  sdf

	db WATER, ELECTRIC
	db 75 ; catch rate
	db 156 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db SLOW ; growth rate
	dn FISH, FISH ; egg groups

	; tmhm
	tmhm TOXIC, ZAP_CANNON, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, BUBBLEBEAM, FRUSTRATION, THUNDER, RETURN, SWAGGER, SLEEP_TALK, REST, ATTRACT, SURF, WATERFALL
	; end
