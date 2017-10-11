	db MEOWTH ; 052

	db  40,  45,  35,  90,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 255 ; catch rate
	db 58 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm WATER_PULSE, ICY_WIND, SLEEP_TALK, TOXIC, SUNNY_DAY, WATER_GUN, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, IRON_TAIL, THUNDERBOLT, THUNDER, RETURN, DIG, SHADOW_BALL, BUBBLEBEAM, DOUBLE_TEAM, SWAGGER, SWIFT, AERIAL_ACE, HEADBUTT, REST, ATTRACT, THIEF, FLASH, CUT
	; end
