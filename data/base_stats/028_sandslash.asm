	db SANDSLASH ; 028

	db  75, 100, 110,  65,  45,  55
	;   hp  atk  def  spd  sat  sdf

	db GROUND, GROUND
	db 90 ; catch rate
	db 158 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm SLEEP_TALK, TOXIC, FISSURE, SUNNY_DAY, HYPER_BEAM, PROTECT, ENDURE, FRUSTRATION, IRON_TAIL, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SANDSTORM, SWIFT, AERIAL_ACE, HEADBUTT, REST, ATTRACT, THIEF, CUT, STRENGTH, ROCK_SMASH, ROCK_CLIMB, DYNAMICPUNCH
	; end
