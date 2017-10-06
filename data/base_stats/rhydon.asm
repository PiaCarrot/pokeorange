	db RHYDON ; 112

	db 105, 130, 120,  40,  45,  45
	;   hp  atk  def  spd  sat  sdf

	db GROUND, ROCK
	db 60 ; catch rate
	db 204 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db SLOW ; growth rate
	dn MONSTER, FIELD ; egg groups

	; tmhm
	tmhm HEADBUTT, TOXIC, ZAP_CANNON, SUNNY_DAY, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, ENDURE, BUBBLEBEAM, FRUSTRATION, IRON_TAIL, THUNDER, EARTHQUAKE, RETURN, DIG, SWAGGER, SLEEP_TALK, SANDSTORM, FIRE_BLAST, THUNDERPUNCH, REST, ATTRACT, FIRE_PUNCH, SURF, STRENGTH
	; end
