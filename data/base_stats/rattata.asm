	db RATTATA ; 019

	db  30,  56,  35,  72,  25,  35
	;   hp  atk  def  spd  sat  sdf

	db DARK, NORMAL
	db 255 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 15 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm DARK_PULSE, TOXIC, SUNNY_DAY, WATER_GUN, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, FRUSTRATION, IRON_TAIL, THUNDERBOLT, THUNDER, RETURN, DIG, SHADOW_BALL, BUBBLEBEAM, DOUBLE_TEAM, SWIFT, FACADE, REST, ATTRACT, THIEF, SHADOW_CLAW, CUT, ROCK_SMASH, HEADBUTT, ZEN_HEADBUTT, SLEEP_TALK, SWAGGER, ENDURE
	; end
