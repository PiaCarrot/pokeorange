	db PIDGEY ; 016

	db  40,  45,  40,  56,  35,  35
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING
	db 255 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 15 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn AVIAN, AVIAN ; egg groups

	; tmhm
	tmhm TOXIC, SUNNY_DAY, PROTECT, RAIN_DANCE, RETURN, DOUBLE_TEAM, AERIAL_ACE, FACADE, REST, THIEF, STEEL_WING, FLY, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
