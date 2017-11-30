	db LEAFEON ; 193

	db  65,  110,  130,  95,  60,  65
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS
	db 45 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_12_5 ; gender
	db 35 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm TOXIC, BULLET_SEED, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, GIGA_DRAIN, FRUSTRATION, SOLARBEAM, IRON_TAIL, RETURN, DIG, SHADOW_BALL, DOUBLE_TEAM, GIGA_IMPACT, SWIFT, AERIAL_ACE, FACADE, REST, ATTRACT, FLASH, STRENGTH, ROCK_SMASH, HEADBUTT, SLEEP_TALK, SWAGGER, ENDURE
	; end
