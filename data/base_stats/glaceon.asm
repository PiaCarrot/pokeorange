	db GLACEON ; 194

	db  65,  60,  110,  65,  130,  95
	;   hp  atk  def  spd  sat  sdf

	db ICE, ICE
	db 45 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_12_5 ; gender
	db 35 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm WATER_PULSE, TOXIC, HAIL, SUNNY_DAY, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, IRON_TAIL, RETURN, DIG, SHADOW_BALL, DOUBLE_TEAM, GIGA_IMPACT, FACADE, REST, STRENGTH, ROCK_SMASH, HEADBUTT, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT, SIGNAL_BEAM
	; end

