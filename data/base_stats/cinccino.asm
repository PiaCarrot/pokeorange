	db CINCCINO ; 160

	db  75, 95, 60,  115,  65,  60
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 60 ; catch rate
	db 165 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 128 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db FAST ; growth rate
	dn MONSTER, AMPHIBIAN ; egg groups

	; tmhm
	tmhm HEADBUTT, CURSE, TOXIC, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, IRON_TAIL, EARTHQUAKE, RETURN, DIG, ICE_PUNCH, SWAGGER, SLEEP_TALK, REST, ATTRACT, CUT, SURF, STRENGTH
	; end
