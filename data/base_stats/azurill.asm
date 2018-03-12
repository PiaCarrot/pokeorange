	db AZURILL ; 178

	db  50,  20,  40,  20,  20,  40
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FAIRY
	db 150 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_75 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db FAST ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; tmhm
	tmhm WATER_PULSE, TOXIC, HAIL, WHIRLPOOL, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, IRON_TAIL, RETURN, BUBBLEBEAM, DOUBLE_TEAM, FACADE, REST, SURF, WATERFALL, HEADBUTT, BODY_SLAM, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
