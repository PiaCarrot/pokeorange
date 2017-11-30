	db CLOYSTER ; 091

	db  50,  95, 180,  70,  85,  45
	;   hp  atk  def  spd  sat  sdf

	db WATER, ICE
	db 60 ; catch rate
	db PEARL ; item 1
	db BIG_PEARL ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db SLOW ; growth rate
	dn INVERTEBRATE, INVERTEBRATE ; egg groups

	; tmhm
	tmhm WATER_PULSE, TOXIC, HAIL, WHIRLPOOL, WATER_GUN, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, FRUSTRATION, RETURN, BUBBLEBEAM, DOUBLE_TEAM, GIGA_IMPACT, SWIFT, FACADE, REST, ATTRACT, SURF, DIVE, POISON_JAB, SLEEP_TALK, SWAGGER, ENDURE, SIGNAL_BEAM
	; end
