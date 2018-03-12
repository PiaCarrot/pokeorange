	db MANTYKE ; 225

	db  45,  20,  50,  50,  60,  120
	;   hp  atk  def  spd  sat  sdf

	db WATER, FLYING
	db 25 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db SLOW ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; tmhm
	tmhm WATER_PULSE, TOXIC, HAIL, WHIRLPOOL, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, EARTHQUAKE, RETURN, BUBBLEBEAM, DOUBLE_TEAM, AERIAL_ACE, FACADE, REST, ROCK_SLIDE, SURF, DIVE, WATERFALL, HEADBUTT, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT, SIGNAL_BEAM
	; end
