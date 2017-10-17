	db GOLEM ; 076

	db  80, 120, 130,  45,  55,  65
	;   hp  atk  def  spd  sat  sdf

	db ROCK, ELECTRIC
	db 45 ; catch rate
	db 223 ; base exp
	db NO_ITEM ; item 1
	db EVERSTONE ; item 2
	db FEMALE_50 ; gender
	db 15 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn INANIMATE, INANIMATE ; egg groups

	; tmhm
	tmhm SLEEP_TALK, TOXIC, SUNNY_DAY, HYPER_BEAM, PROTECT, FRUSTRATION, THUNDERBOLT, THUNDER, EARTHQUAKE, RETURN, DOUBLE_TEAM, SWAGGER, FLAMETHROWER, SANDSTORM, FIRE_BLAST, THUNDERPUNCH, REST, ATTRACT
	; end
