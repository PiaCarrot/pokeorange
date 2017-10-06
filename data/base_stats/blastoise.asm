	db BLASTOISE ; 009

	db  79,  83, 100,  78,  85, 105
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER
	db 45 ; catch rate
	db 210 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 31 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn MONSTER, AMPHIBIAN ; egg groups

	; tmhm
	tmhm HEADBUTT, CURSE, ROLLOUT, TOXIC, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, BUBBLEBEAM, FRUSTRATION, IRON_TAIL, EARTHQUAKE, RETURN, DIG, ICE_PUNCH, SWAGGER, SLEEP_TALK, REST, ATTRACT, SURF, STRENGTH, WATERFALL
	; end
