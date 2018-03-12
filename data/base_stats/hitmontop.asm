	db HITMONTOP ; 237

	db  50,  95,  95,  70,  35, 110
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
	tmhm TOXIC, SUNNY_DAY, PROTECT, RAIN_DANCE, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SANDSTORM, AERIAL_ACE, FACADE, REST, THIEF, ROCK_SLIDE, STRENGTH, ROCK_SMASH, MACH_PUNCH, HEADBUTT, BODY_SLAM, COUNTER, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
