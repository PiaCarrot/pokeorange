	db TYROGUE ; 236

	db  35,  35,  35,  35,  35,  35
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING
	db 75 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db ALL_MALE ; gender
	db 25 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; tmhm
	tmhm TOXIC, SUNNY_DAY, PROTECT, RAIN_DANCE, FRUSTRATION, EARTHQUAKE, RETURN, DOUBLE_TEAM, SWIFT, FACADE, REST, ATTRACT, THIEF, STRENGTH, ROCK_SMASH, MACH_PUNCH, HEADBUTT, SLEEP_TALK, SWAGGER, ENDURE
	; end
