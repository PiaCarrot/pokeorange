	db DODUO ; 084

	db  35,  85,  45,  75,  35,  35
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING
	db 190 ; catch rate
	db 62 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn AVIAN, AVIAN ; egg groups

	; tmhm
	tmhm SLEEP_TALK, TOXIC, SUNNY_DAY, PROTECT, ENDURE, FRUSTRATION, RETURN, DOUBLE_TEAM, SWAGGER, SWIFT, AERIAL_ACE, REST, ATTRACT, THIEF, STEEL_WING, FLY
	; end
