	db MOLTRES ; 146

	db  90, 100,  90,  90, 125,  85
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FLYING
	db 3 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db GENDERLESS ; gender
	db 80 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db SLOW ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; tmhm
	tmhm TOXIC, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, SOLARBEAM, RETURN, DOUBLE_TEAM, GIGA_IMPACT, FLAMETHROWER, SANDSTORM, FIRE_BLAST, AERIAL_ACE, FACADE, REST, STEEL_WING, FLY, ROCK_SMASH, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK
	; end
