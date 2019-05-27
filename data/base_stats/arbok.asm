	db ARBOK ; 024

	db  60,  95,  69,  80,  65,  79
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON
	db 90 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FIELD, REPTILE ; egg groups

	; tmhm
	tmhm DARK_PULSE, VENOSHOCK, TOXIC, FISSURE, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, GIGA_DRAIN, DRAGON_TAIL, IRON_TAIL, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, GIGA_IMPACT, SLUDGE_BOMB, FACADE, REST, SEED_BOMB, THIEF, ROCK_SLIDE, STRENGTH, HEADBUTT, BODY_SLAM, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT, POISON_JAB
	; end
