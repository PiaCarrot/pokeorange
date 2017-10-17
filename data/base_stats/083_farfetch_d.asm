	db FARFETCH_D ; 083

	db  52,  90,  55,  60,  58,  62
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING
	db 45 ; catch rate
	db 132 ; base exp
	db NO_ITEM ; item 1
	db STICK ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn AVIAN, FIELD ; egg groups

	; tmhm
	tmhm SLEEP_TALK, TOXIC, SUNNY_DAY, PROTECT, ENDURE, FRUSTRATION, IRON_TAIL, RETURN, DOUBLE_TEAM, SWAGGER, SWIFT, AERIAL_ACE, HEADBUTT, REST, ATTRACT, THIEF, STEEL_WING, CUT, FLY
	; end
