	db DRAGONITE ; 149

	db  91, 134,  95,  80, 100, 100
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, FLYING
	db 45 ; catch rate
	db 270 ; base exp
	db NO_ITEM ; item 1
	db DRAGON_SCALE ; item 2
	db 127 ; gender
	db 40 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db SLOW ; growth rate
	dn AMPHIBIAN, REPTILE ; egg groups

	; tmhm
	tmhm HEADBUTT, TOXIC, ZAP_CANNON, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, BUBBLEBEAM, FRUSTRATION, IRON_TAIL, DRAGONBREATH, THUNDER, RETURN, ICE_PUNCH, SWAGGER, SLEEP_TALK, SANDSTORM, FIRE_BLAST, SWIFT, THUNDERPUNCH, REST, ATTRACT, STEEL_WING, FIRE_PUNCH, FLY, SURF, STRENGTH, WATERFALL
	; end
