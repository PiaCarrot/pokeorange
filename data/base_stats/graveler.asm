	db GRAVELER ; 075

	db  55,  95, 115,  35,  45,  45
	;   hp  atk  def  spd  sat  sdf

	db ROCK, ELECTRIC
	db 120 ; catch rate
	db NO_ITEM ; item 1
	db EVERSTONE ; item 2
	db FEMALE_50 ; gender
	db 15 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn INANIMATE, INANIMATE ; egg groups

	; tmhm
	tmhm TOXIC, SUNNY_DAY, PROTECT, THUNDERBOLT, THUNDER, EARTHQUAKE, RETURN, DOUBLE_TEAM, EARTH_POWER, FLAMETHROWER, SANDSTORM, FIRE_BLAST, FACADE, REST, ROCK_SLIDE, THUNDERPUNCH, SUBSTITUTE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
