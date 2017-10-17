	db GOLBAT ; 042

	db  75,  80,  70,  90,  65,  75
	;   hp  atk  def  spd  sat  sdf

	db POISON, FLYING
	db 90 ; catch rate
	db 159 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 15 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn AVIAN, AVIAN ; egg groups

	; tmhm
	tmhm SLEEP_TALK, TOXIC, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, GIGA_DRAIN, ENDURE, FRUSTRATION, RETURN, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLUDGE_BOMB, SWIFT, AERIAL_ACE, REST, ATTRACT, THIEF, STEEL_WING, FLY, VENOSHOCK
	; end
