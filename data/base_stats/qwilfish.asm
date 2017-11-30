	db QWILFISH ; 211

	db  65,  95,  85,  85,  55,  55
	;   hp  atk  def  spd  sat  sdf

	db WATER, POISON
	db 45 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FISH, FISH ; egg groups

	; tmhm
	tmhm WATER_PULSE, VENOSHOCK, TOXIC, HAIL, WHIRLPOOL, WATER_GUN, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, FRUSTRATION, RETURN, SHADOW_BALL, BUBBLEBEAM, DOUBLE_TEAM, SLUDGE_BOMB, SWIFT, FACADE, REST, ATTRACT, SURF, DIVE, WATERFALL, HEADBUTT, POISON_JAB, SLEEP_TALK, SWAGGER, ENDURE, SIGNAL_BEAM
	; end
