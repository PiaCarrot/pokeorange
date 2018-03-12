	db SHELLDER ; 090

	db  30,  65, 100,  40,  45,  25
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER
	db 190 ; catch rate
	db PEARL ; item 1
	db BIG_PEARL ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db SLOW ; growth rate
	dn INVERTEBRATE, INVERTEBRATE ; egg groups

	; tmhm
	tmhm WATER_PULSE, TOXIC, HAIL, WHIRLPOOL, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, RETURN, BUBBLEBEAM, DOUBLE_TEAM, FACADE, REST, TRI_ATTACK, SURF, DIVE, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
