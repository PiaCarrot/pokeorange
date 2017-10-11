	db PIDGEOTTO ; 017

	db  63,  60,  55,  71,  50,  50
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING
	db 120 ; catch rate
	db 122 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 15 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn AVIAN, AVIAN ; egg groups

	; tmhm
	tmhm TOXIC, SUNNY_DAY, PROTECT, ENDURE, FRUSTRATION, RETURN, SWAGGER, SLEEP_TALK, SWIFT, REST, ATTRACT, THIEF, STEEL_WING, FLY
	; end
