	db SUNFLORA ; 192

	db  75,  75,  55,  30, 105,  85
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS
	db 120 ; catch rate
	db 149 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn PLANT, PLANT ; egg groups

	; tmhm
	tmhm SLEEP_TALK, TOXIC, BULLET_SEED, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, ENDURE, FRUSTRATION, SOLARBEAM, RETURN, DOUBLE_TEAM, SWAGGER, SLUDGE_BOMB, REST, ATTRACT, FLASH, CUT
	; end
