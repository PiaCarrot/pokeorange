	db BELLSPROUT ; 069

	db  50,  75,  35,  40,  70,  30
	;   hp  atk  def  spd  sat  sdf

	db GRASS, POISON
	db 255 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn PLANT, PLANT ; egg groups

	; tmhm
	tmhm VENOSHOCK, TOXIC, BULLET_SEED, SUNNY_DAY, PROTECT, GIGA_DRAIN, FRUSTRATION, SOLARBEAM, RETURN, DOUBLE_TEAM, SLUDGE_BOMB, FACADE, REST, ATTRACT, THIEF, FLASH, CUT, POISON_JAB, SLEEP_TALK, SWAGGER, ENDURE
	; end
