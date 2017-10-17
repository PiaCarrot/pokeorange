	db QWILFISH ; 211

	db  65,  95,  85,  85,  55,  55
	;   hp  atk  def  spd  sat  sdf

	db WATER, POISON
	db 45 ; catch rate
	db 88 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FISH, FISH ; egg groups

	; tmhm
	tmhm WATER_PULSE, ICY_WIND, SLEEP_TALK, TOXIC, HAIL, WHIRLPOOL, WATER_GUN, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, RETURN, SHADOW_BALL, BUBBLEBEAM, DOUBLE_TEAM, SWAGGER, SLUDGE_BOMB, SWIFT, HEADBUTT, REST, ATTRACT, SURF, DIVE, WATERFALL, SIGNAL_BEAM, VENOSHOCK
	; end
