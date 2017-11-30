	db HITMONLEE ; 106

	db  50, 120,  53,  87,  35, 110
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING
	db 45 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db ALL_MALE ; gender
	db 25 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn HUMANSHAPE, HUMANSHAPE ; egg groups

	; tmhm
	tmhm POWERUPPUNCH, TOXIC, SUNNY_DAY, PROTECT, RAIN_DANCE, FRUSTRATION, EARTHQUAKE, RETURN, DOUBLE_TEAM, SWIFT, FACADE, REST, ATTRACT, THIEF, STRENGTH, ROCK_SMASH, ROCK_CLIMB, MACH_PUNCH, DYNAMICPUNCH, HEADBUTT, POISON_JAB, SLEEP_TALK, SWAGGER, ENDURE
	; end
