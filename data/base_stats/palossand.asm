	db PALOSSAND ; 217

	db  85, 75,  110,  35,  100,  75
	;   hp  atk  def  spd  sat  sdf

	db GHOST, GROUND
	db 60 ; catch rate
	db NO_ITEM ; item 1
	db SPELL_TAG ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn AMORPHOUS, AMORPHOUS ; egg groups

	; tmhm
	tmhm TOXIC, PROTECT, GIGA_DRAIN, EARTHQUAKE, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, EARTH_POWER, GIGA_IMPACT, SLUDGE_BOMB, SANDSTORM, FACADE, REST, ROCK_SLIDE, SUBSTITUTE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
