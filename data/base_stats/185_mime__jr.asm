	db MIME__JR ; 185

	db  20, 25, 45,  60,  70,  90
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, FAIRY
	db 145 ; catch rate
	db 78 ; base exp
	db NO_ITEM ; item 1
	db MYSTERYBERRY ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; tmhm
	tmhm ICY_WIND, SLEEP_TALK, TOXIC, SUNNY_DAY, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, SOLARBEAM, THUNDERBOLT, THUNDER, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, HEADBUTT, REST, ATTRACT, THIEF, FLASH, SIGNAL_BEAM
	; end
