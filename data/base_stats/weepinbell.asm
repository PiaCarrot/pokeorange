	db WEEPINBELL ; 070

	db  65,  90,  50,  55,  85,  45
	;   hp  atk  def  spd  sat  sdf

	db GRASS, POISON
	db 120 ; catch rate
	db 151 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn PLANT, PLANT ; egg groups

	; tmhm
	tmhm CURSE, TOXIC, SUNNY_DAY, PROTECT, GIGA_DRAIN, ENDURE, FRUSTRATION, SOLARBEAM, RETURN, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, REST, ATTRACT, CUT
	; end
