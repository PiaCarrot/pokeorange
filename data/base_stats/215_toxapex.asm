	db TOXAPEX ; 215

	db  50,  63,  152, 35,  53,  142
	;   hp  atk  def  spd  sat  sdf

	db POISON, WATER
	db 75 ; catch rate
	db 173 ; base exp
	db NO_ITEM ; item 1
	db POISON_BARB ; item 2
	db 127 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn INVERTEBRATE, INVERTEBRATE ; egg groups

	; tmhm
	tmhm SLEEP_TALK, TOXIC, HAIL, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, FRUSTRATION, RETURN, DOUBLE_TEAM, SWAGGER, SLUDGE_BOMB, REST, ATTRACT, SURF, VENOSHOCK
	; end
