	db KINGDRA ; 230

	db  75,  95,  95,  85,  95,  95
	;   hp  atk  def  spd  sat  sdf

	db WATER, DRAGON
	db 45 ; catch rate
	db 207 ; base exp
	db NO_ITEM ; item 1
	db DRAGON_SCALE ; item 2
	db 127 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn AMPHIBIAN, REPTILE ; egg groups

	; tmhm
	tmhm HEADBUTT, TOXIC, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, BUBBLEBEAM, FRUSTRATION, DRAGONBREATH, RETURN, SWAGGER, SLEEP_TALK, SWIFT, REST, ATTRACT, SURF, WATERFALL
	; end
