	db MIME__JR ; 185

	db  20, 25, 45,  60,  70,  90
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, FAIRY
	db 145 ; catch rate
	db 78 ; base exp
	db NO_ITEM ; item 1
	db MYSTERYBERRY ; item 2
	db 127 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; tmhm
	tmhm TOXIC, SUNNY_DAY, WATER_GUN, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, SOLARBEAM, THUNDERBOLT, THUNDER, RETURN, PSYCHIC, SHADOW_BALL, DOUBLE_TEAM, ICE_PUNCH, SWIFT, THUNDERPUNCH, HEADBUTT, ZAP_CANNON, REST, ATTRACT, THIEF, FIRE_PUNCH, DAZZLINGLEAM, FLASH, COMET_PUNCH, SIGNAL_BEAM, VENOSHOCK
	; end
