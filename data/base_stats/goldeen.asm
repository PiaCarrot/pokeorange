	db GOLDEEN ; 118

	db  45,  67,  60,  63,  35,  50
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER
	db 225 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FISH, FISH ; egg groups

	; tmhm
	tmhm WATER_PULSE, TOXIC, HAIL, WHIRLPOOL, WATER_GUN, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, FRUSTRATION, RETURN, BUBBLEBEAM, DOUBLE_TEAM, SWIFT, FACADE, REST, ATTRACT, SURF, DIVE, WATERFALL, POISON_JAB, SLEEP_TALK, SWAGGER, ENDURE, SIGNAL_BEAM
	; end
