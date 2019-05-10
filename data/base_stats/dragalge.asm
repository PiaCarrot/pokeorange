	db DRAGALGE ; 203

	db  65,  75,  90,  44,  97,  123
	;   hp  atk  def  spd  sat  sdf

	db POISON, DRAGON
	db 55 ; catch rate
	db HEART_SCALE ; item 1
	db HEART_SCALE ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FISH, REPTILE ; egg groups

	; tmhm
	tmhm DRAGON_PULSE, WATER_PULSE, VENOSHOCK, TOXIC, HAIL, HYPER_BEAM, PROTECT, RAIN_DANCE, DRAGON_TAIL, IRON_TAIL, THUNDERBOLT, THUNDER, RETURN, SHADOW_BALL, DOUBLE_TEAM, GIGA_IMPACT, SLUDGE_BOMB, FACADE, REST, SURF, DIVE, WATERFALL, SUBSTITUTE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
