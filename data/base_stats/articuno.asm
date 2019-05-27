	db ARTICUNO ; 144

	db  90,  85, 100,  85,  95, 125
	;   hp  atk  def  spd  sat  sdf

	db ICE, FLYING
	db 3 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db GENDERLESS ; gender
	db 80 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db SLOW ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; tmhm
	tmhm WATER_PULSE, TOXIC, HAIL, SUNNY_DAY, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, RETURN, BUBBLEBEAM, DOUBLE_TEAM, GIGA_IMPACT, SANDSTORM, AERIAL_ACE, FACADE, REST, STEEL_WING, FLY, ROCK_SMASH, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, SIGNAL_BEAM
	; end
