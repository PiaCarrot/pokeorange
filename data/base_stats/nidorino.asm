	db NIDORINO ; 033

	db  61,  72,  57,  65,  55,  55
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON
	db 120 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db ALL_MALE ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn MONSTER, FIELD ; egg groups

	; tmhm
	tmhm WATER_PULSE, VENOSHOCK, TOXIC, SUNNY_DAY, WATER_GUN, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, FRUSTRATION, IRON_TAIL, THUNDERBOLT, THUNDER, RETURN, DIG, BUBBLEBEAM, DOUBLE_TEAM, SLUDGE_BOMB, FACADE, REST, ATTRACT, THIEF, SHADOW_CLAW, CUT, STRENGTH, ROCK_SMASH, HEADBUTT, POISON_JAB, SLEEP_TALK, SWAGGER, ENDURE
	; end
