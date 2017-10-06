	db RATTATA ; 019

	db  30,  56,  35,  72,  25,  35
	;   hp  atk  def  spd  sat  sdf

	db DARK, NORMAL
	db 255 ; catch rate
	db 51 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 15 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm HEADBUTT, CURSE, TOXIC, SUNNY_DAY, BLIZZARD, ICY_WIND, PROTECT, ENDURE, BUBBLEBEAM, FRUSTRATION, IRON_TAIL, THUNDER, RETURN, DIG, SHADOW_BALL, SWAGGER, SLEEP_TALK, SWIFT, REST, ATTRACT, THIEF
	; end
