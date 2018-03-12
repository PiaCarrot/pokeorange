	db ZUBAT ; 041

	db  40,  45,  35,  55,  30,  40
	;   hp  atk  def  spd  sat  sdf

	db POISON, FLYING
	db 255 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 15 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn AVIAN, AVIAN ; egg groups

	; tmhm
	tmhm VENOSHOCK, TOXIC, SUNNY_DAY, PROTECT, RAIN_DANCE, GIGA_DRAIN, RETURN, SHADOW_BALL, DOUBLE_TEAM, SLUDGE_BOMB, AERIAL_ACE, FACADE, REST, THIEF, STEEL_WING, FLY, ZEN_HEADBUTT, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
