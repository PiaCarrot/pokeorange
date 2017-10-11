	db MAGNETON ; 082

	db  50,  60,  95,  70, 120,  70
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, STEEL
	db 60 ; catch rate
	db 163 ; base exp
	db NO_ITEM ; item 1
	db METAL_COAT ; item 2
	db 255 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn INANIMATE, INANIMATE ; egg groups

	; tmhm
	tmhm SLEEP_TALK, TOXIC, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, THUNDERBOLT, THUNDER, RETURN, DOUBLE_TEAM, SWAGGER, SWIFT, ZAP_CANNON, REST, FLASH, SIGNAL_BEAM
	; end
