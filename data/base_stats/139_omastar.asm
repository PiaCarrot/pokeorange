	db OMASTAR ; 139

	db  70,  60, 125,  55, 115,  70
	;   hp  atk  def  spd  sat  sdf

	db ROCK, WATER
	db 45 ; catch rate
	db 173 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 31 ; gender
	db 30 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn AMPHIBIAN, INVERTEBRATE ; egg groups

	; tmhm
	tmhm WATER_PULSE, ICY_WIND, SLEEP_TALK, TOXIC, HAIL, WHIRLPOOL, WATER_GUN, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, RETURN, BUBBLEBEAM, DOUBLE_TEAM, SWAGGER, SANDSTORM, HEADBUTT, REST, ATTRACT, THIEF, SURF, ROCK_SMASH, DIVE, WATERFALL, ROCK_CLIMB
	; end
