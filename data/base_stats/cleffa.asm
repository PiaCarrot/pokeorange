	db CLEFFA ; 173

	db  50,  25,  28,  15,  45,  55
	;   hp  atk  def  spd  sat  sdf

	db FAIRY, FAIRY
	db 150 ; catch rate
	db 37 ; base exp
	db MYSTERYBERRY ; item 1
	db MOON_STONE ; item 2
	db 191 ; gender
	db 10 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db FAST ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; tmhm
	tmhm HEADBUTT, CURSE, TOXIC, ZAP_CANNON, SUNNY_DAY, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, BUBBLEBEAM, FRUSTRATION, SOLARBEAM, IRON_TAIL, RETURN, PSYCHIC, SHADOW_BALL, SWAGGER, SLEEP_TALK, FIRE_BLAST, REST, ATTRACT
	; end
