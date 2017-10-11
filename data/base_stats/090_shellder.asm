	db SHELLDER ; 090

	db  30,  65, 100,  40,  45,  25
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER
	db 190 ; catch rate
	db 61 ; base exp
	db PEARL ; item 1
	db BIG_PEARL ; item 2
	db 127 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db SLOW ; growth rate
	dn INVERTEBRATE, INVERTEBRATE ; egg groups

	; tmhm
	tmhm WATER_PULSE, ICY_WIND, SLEEP_TALK, TOXIC, HAIL, WHIRLPOOL, WATER_GUN, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, RETURN, BUBBLEBEAM, DOUBLE_TEAM, SWAGGER, SWIFT, REST, ATTRACT, SURF, DIVE
	; end
