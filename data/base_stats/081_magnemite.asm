	db MAGNEMITE ; 081

	db  25,  35,  70,  45,  95,  55
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, STEEL
	db 190 ; catch rate
	db 65 ; base exp
	db NO_ITEM ; item 1
	db METAL_COAT ; item 2
	db 255 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn INANIMATE, INANIMATE ; egg groups

	; tmhm
	tmhm SLEEP_TALK, TOXIC, SUNNY_DAY, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, THUNDERBOLT, THUNDER, RETURN, DOUBLE_TEAM, SWAGGER, SWIFT, ZAP_CANNON, REST, FLASH, SIGNAL_BEAM
	; end
