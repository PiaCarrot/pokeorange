	db GOLEM ; 076

	db  80, 120, 130,  45,  55,  65
	;   hp  atk  def  spd  sat  sdf

	db ROCK, ELECTRIC
	db 45 ; catch rate
	db NO_ITEM ; item 1
	db EVERSTONE ; item 2
	db FEMALE_50 ; gender
	db 15 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn INANIMATE, INANIMATE ; egg groups

	; tmhm
	tmhm TOXIC, SUNNY_DAY, HYPER_BEAM, PROTECT, THUNDERBOLT, THUNDER, EARTHQUAKE, RETURN, DOUBLE_TEAM, EARTH_POWER, GIGA_IMPACT, FLAMETHROWER, SANDSTORM, FIRE_BLAST, FACADE, REST, ROCK_SLIDE, THUNDERPUNCH, SUBSTITUTE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
