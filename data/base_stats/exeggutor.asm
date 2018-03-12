	db EXEGGUTOR ; 103

	db  95,  105,  85,  45,  125,  75
	;   hp   atk   def  spd  sat   sdf

	db GRASS, DRAGON
	db 45 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db SLOW ; growth rate
	dn PLANT, PLANT ; egg groups

	; tmhm
	tmhm TOXIC, SUNNY_DAY, HYPER_BEAM, PROTECT, DRAGON_TAIL, SOLARBEAM, EARTHQUAKE, RETURN, PSYCHIC_M, DOUBLE_TEAM, GIGA_IMPACT, FLAMETHROWER, SLUDGE_BOMB, FACADE, REST, SEED_BOMB, THIEF, ZEN_HEADBUTT, SWORDS_DANCE, SUBSTITUTE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
