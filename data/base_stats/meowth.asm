	db MEOWTH ; 052

	db  40,  45,  35,  90,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 255 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm WATER_PULSE, DARK_PULSE, TOXIC, SUNNY_DAY, WATER_GUN, PROTECT, RAIN_DANCE, FRUSTRATION, IRON_TAIL, THUNDERBOLT, THUNDER, RETURN, DIG, SHADOW_BALL, BUBBLEBEAM, DOUBLE_TEAM, SWIFT, AERIAL_ACE, FACADE, REST, ATTRACT, THIEF, SHADOW_CLAW, FLASH, CUT, HEADBUTT, SLEEP_TALK, SWAGGER, ENDURE
	; end
