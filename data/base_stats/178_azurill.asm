	db AZURILL ; 178

	db  50,  20,  40,  20,  20,  40
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FAIRY
	db 150 ; catch rate
	db 38 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 200 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db FAST ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; tmhm
	tmhm WATER_PULSE, ICY_WIND, SLEEP_TALK, TOXIC, HAIL, WHIRLPOOL, WATER_GUN, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, IRON_TAIL, RETURN, BUBBLEBEAM, DOUBLE_TEAM, SWAGGER, SWIFT, HEADBUTT, REST, ATTRACT, SURF, WATERFALL
	; end
