	db SEAKING ; 119

	db  80,  92,  65,  68,  65,  80
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER
	db 60 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FISH, FISH ; egg groups

	; tmhm
	tmhm WATER_PULSE, TOXIC, HAIL, WHIRLPOOL, WATER_GUN, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, FRUSTRATION, RETURN, BUBBLEBEAM, DOUBLE_TEAM, GIGA_IMPACT, SWIFT, FACADE, REST, ATTRACT, SURF, DIVE, WATERFALL, POISON_JAB, SLEEP_TALK, SWAGGER, ENDURE, SIGNAL_BEAM
	; end
