	db VOLTORB ; 100

	db  40,  30,  50, 100,  55,  55
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC
	db 190 ; catch rate
	db 103 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 255 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn INANIMATE, INANIMATE ; egg groups

	; tmhm
	tmhm HEADBUTT, TOXIC, ZAP_CANNON, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, THUNDER, RETURN, SWAGGER, SLEEP_TALK, SWIFT, REST
	; end
