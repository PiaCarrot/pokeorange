	db KABUTO ; 140

	db  30,  80,  90,  55,  55,  45
	;   hp  atk  def  spd  sat  sdf

	db ROCK, WATER
	db 45 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_12_5 ; gender
	db 30 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn AMPHIBIAN, INVERTEBRATE ; egg groups

	; tmhm
	tmhm WATER_PULSE, TOXIC, HAIL, WHIRLPOOL, WATER_GUN, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, GIGA_DRAIN, FRUSTRATION, RETURN, DIG, BUBBLEBEAM, DOUBLE_TEAM, EARTH_POWER, SANDSTORM, AERIAL_ACE, FACADE, REST, ATTRACT, THIEF, SURF, ROCK_SMASH, WATERFALL, SLEEP_TALK, SWAGGER, ENDURE
	; end