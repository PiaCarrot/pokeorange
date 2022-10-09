	db MEOWTH ; 052

	db  40,  35,  35,  90,  50,  40
	;   hp  atk  def  spd  sat  sdf

	db DARK, DARK
	db 255 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm WATER_PULSE, DARK_PULSE, TOXIC, SUNNY_DAY, PROTECT, RAIN_DANCE, SHADOW_CLAW, IRON_TAIL, THUNDERBOLT, THUNDER, RETURN, DIG, SHADOW_BALL, BUBBLEBEAM, DOUBLE_TEAM, AERIAL_ACE, FACADE, REST, SEED_BOMB, THIEF, FLASH, CUT, HEADBUTT, BODY_SLAM, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
