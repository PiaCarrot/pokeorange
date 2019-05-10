	db MAREANIE ; 214

	db  50, 53,  62,  45,  43,  52
	;   hp  atk  def  spd  sat  sdf

	db POISON, WATER
	db 190 ; catch rate
	db HEART_SCALE ; item 1
	db POISON_BARB ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn INVERTEBRATE, INVERTEBRATE ; egg groups

	; tmhm
	tmhm VENOSHOCK, TOXIC, HAIL, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, RETURN, DOUBLE_TEAM, SLUDGE_BOMB, FACADE, REST, SURF, SUBSTITUTE, SWAGGER, SLEEP_TALK, ATTRACT, POISON_JAB
	; end
