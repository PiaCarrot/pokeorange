	db SUNKERN ; 191

	db  30,  30,  30,  30,  30,  30
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS
	db 235 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn PLANT, PLANT ; egg groups

	; tmhm
	tmhm TOXIC, BULLET_SEED, SUNNY_DAY, PROTECT, GIGA_DRAIN, FRUSTRATION, SOLARBEAM, RETURN, DOUBLE_TEAM, EARTH_POWER, SLUDGE_BOMB, FACADE, REST, ATTRACT, FLASH, CUT, SLEEP_TALK, SWAGGER, ENDURE
	; end
