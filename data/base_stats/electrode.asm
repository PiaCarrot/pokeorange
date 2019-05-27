	db ELECTRODE ; 101

	db  60,  50,  70, 150,  80,  80
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC
	db 60 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db GENDERLESS ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn INANIMATE, INANIMATE ; egg groups

	; tmhm
	tmhm TOXIC, HYPER_BEAM, PROTECT, RAIN_DANCE, THUNDERBOLT, THUNDER, RETURN, DOUBLE_TEAM, GIGA_IMPACT, FACADE, REST, THIEF, FLASH, HEADBUTT, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, SIGNAL_BEAM
	; end
