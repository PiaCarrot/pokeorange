	db RATICATE ; 020

	db  75,  71,  70,  77,  40,  80
	;   hp  atk  def  spd  sat  sdf

	db DARK, NORMAL
	db 90 ; catch rate
	db 145 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 15 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm HEADBUTT, TOXIC, SUNNY_DAY, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, ENDURE, BUBBLEBEAM, FRUSTRATION, IRON_TAIL, THUNDER, RETURN, DIG, SHADOW_BALL, SWAGGER, SLEEP_TALK, SWIFT, REST, ATTRACT, THIEF, CUT, STRENGTH
	; end
