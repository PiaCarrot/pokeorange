	db DRAGALGE ; 203

	db  65,  75,  90,  44,  97,  123
	;   hp  atk  def  spd  sat  sdf

	db POISON, DRAGON
	db 55 ; catch rate
	db 173 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FISH, REPTILE ; egg groups

	; tmhm
	tmhm DRAGON_PULSE, WATER_PULSE, ICY_WIND, SLEEP_TALK, TOXIC, HAIL, WATER_GUN, HYPER_BEAM, PROTECT, RAIN_DANCE, FRUSTRATION, IRON_TAIL, THUNDERBOLT, THUNDER, RETURN, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLUDGE_BOMB, REST, ATTRACT, SURF, DIVE, WATERFALL, VENOSHOCK
	; end
