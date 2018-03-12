	db PERSIAN ; 053

	db  65,  70,  60, 115,  65,  65
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 90 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm WATER_PULSE, DARK_PULSE, TOXIC, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, SHADOW_CLAW, IRON_TAIL, THUNDERBOLT, THUNDER, RETURN, DIG, SHADOW_BALL, BUBBLEBEAM, DOUBLE_TEAM, GIGA_IMPACT, AERIAL_ACE, FACADE, REST, SEED_BOMB, THIEF, FLASH, CUT, HEADBUTT, BODY_SLAM, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT, PLAY_ROUGH
	; end
