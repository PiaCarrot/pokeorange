	db OMANYTE ; 138

	db  35,  40, 100,  35,  90,  55
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
	tmhm WATER_PULSE, TOXIC, HAIL, WHIRLPOOL, WATER_GUN, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, FRUSTRATION, RETURN, BUBBLEBEAM, DOUBLE_TEAM, EARTH_POWER, SANDSTORM, FACADE, REST, ATTRACT, THIEF, SURF, ROCK_SMASH, DIVE, WATERFALL, HEADBUTT, SLEEP_TALK, SWAGGER, ENDURE
	; end
