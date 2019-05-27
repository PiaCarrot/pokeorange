	db TRAPINCH ; 204

	db  45,  100,  45,  10,  45,  45
	;   hp  atk  def  spd  sat  sdf

	db GROUND, GROUND
	db 255 ; catch rate
	db NO_ITEM ; item 1
	db SOFT_SAND ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn INSECT, INSECT ; egg groups

	; tmhm
	tmhm TOXIC, FISSURE, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, SOLARBEAM, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, EARTH_POWER, SANDSTORM, FACADE, REST, ROCK_SLIDE, STRENGTH, ROCK_SMASH, HEADBUTT, BODY_SLAM, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT, BUG_BITE, SIGNAL_BEAM
	; end
