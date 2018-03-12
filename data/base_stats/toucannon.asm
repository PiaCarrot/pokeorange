	db TOUCANNON ; 157

	db  80,  120,  75, 60, 75,  75
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING
	db 45 ; catch rate
	db NO_ITEM ; item 1
	db GOLD_BERRY ; item 2
	db FEMALE_50 ; gender
	db 15 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn AVIAN, AVIAN ; egg groups

	; tmhm
	tmhm TOXIC, BULLET_SEED, SUNNY_DAY, PROTECT, RETURN, DOUBLE_TEAM, AERIAL_ACE, FLASH_CANNON, REST, SEED_BOMB, THIEF, STEEL_WING, FLY, ROCK_SMASH, SWORDS_DANCE, SUBSTITUTE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
