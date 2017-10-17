	db HITMONLEE ; 106

	db  50, 120,  53,  87,  35, 110
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING
	db 45 ; catch rate
	db 159 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db ALL_MALE ; gender
	db 25 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn HUMANSHAPE, HUMANSHAPE ; egg groups

	; tmhm
	tmhm POWERUPPUNCH, SLEEP_TALK, TOXIC, SUNNY_DAY, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, EARTHQUAKE, RETURN, DOUBLE_TEAM, SWAGGER, SWIFT, HEADBUTT, REST, ATTRACT, THIEF, STRENGTH, ROCK_SMASH, ROCK_CLIMB, MACH_PUNCH, DYNAMICPUNCH
	; end
