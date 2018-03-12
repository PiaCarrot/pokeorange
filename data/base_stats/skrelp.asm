	db SKRELP ; 202

	db 50,  60,  60,  30,  60,  60
	;   hp  atk  def  spd  sat  sdf

	db POISON, WATER
	db 225 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FISH, REPTILE ; egg groups

	; tmhm
	tmhm DRAGON_PULSE, WATER_PULSE, VENOSHOCK, TOXIC, HAIL, PROTECT, RAIN_DANCE, IRON_TAIL, THUNDERBOLT, THUNDER, RETURN, SHADOW_BALL, DOUBLE_TEAM, SLUDGE_BOMB, FACADE, REST, SURF, DIVE, WATERFALL, SLEEP_TALK, SUBSTITUTE, PLAY_ROUGH, ATTRACT, SWAGGER
	; end
