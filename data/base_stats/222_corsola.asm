	db CORSOLA ; 222

	db  65,  55,  95,  35,  65,  95
	;   hp  atk  def  spd  sat  sdf

	db WATER, ROCK
	db 60 ; catch rate
	db 144 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 191 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db FAST ; growth rate
	dn AMPHIBIAN, INVERTEBRATE ; egg groups

	; tmhm
	tmhm WATER_PULSE, ICY_WIND, SLEEP_TALK, TOXIC, HAIL, WHIRLPOOL, SUNNY_DAY, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, EARTHQUAKE, RETURN, DIG, PSYCHIC_M, SHADOW_BALL, BUBBLEBEAM, DOUBLE_TEAM, SWAGGER, SANDSTORM, HEADBUTT, REST, ATTRACT, SURF, STRENGTH, ROCK_SMASH
	; end
