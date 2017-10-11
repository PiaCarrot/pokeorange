	db LAPRAS ; 131

	db 130,  85,  80,  60,  85,  95
	;   hp  atk  def  spd  sat  sdf

	db WATER, ICE
	db 45 ; catch rate
	db 187 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 40 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db SLOW ; growth rate
	dn MONSTER, AMPHIBIAN ; egg groups

	; tmhm
	tmhm DRAGON_PULSE, WATER_PULSE, ICY_WIND, SLEEP_TALK, TOXIC, HAIL, WHIRLPOOL, FISSURE, WATER_GUN, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, SOLARBEAM, IRON_TAIL, THUNDERBOLT, THUNDER, RETURN, PSYCHIC_M, BUBBLEBEAM, DOUBLE_TEAM, SWAGGER, HEADBUTT, REST, ATTRACT, SURF, STRENGTH, ROCK_SMASH, DIVE, WATERFALL, SIGNAL_BEAM
	; end
