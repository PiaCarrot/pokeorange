	db MAGNEZONE ; 247

	db  70,  70,  115,  60,  130,  90
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, STEEL
	db 30 ; catch rate
	db NO_ITEM ; item 1
	db METAL_COAT ; item 2
	db GENDERLESS ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn INANIMATE, INANIMATE ; egg groups

	; tmhm
	tmhm TOXIC, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, FRUSTRATION, THUNDERBOLT, THUNDER, RETURN, DOUBLE_TEAM, GIGA_IMPACT, SWIFT, FLASH_CANNON, FACADE, ZAP_CANNON, REST, FLASH, SLEEP_TALK, SWAGGER, ENDURE, SIGNAL_BEAM
	; end
