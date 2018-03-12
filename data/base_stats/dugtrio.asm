	db DUGTRIO ; 051

	db  35,  100,  60, 110,  50,  70
	;   hp   atk   def spd   sat  sdf

	db GROUND, STEEL
	db 50 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm TOXIC, FISSURE, SUNNY_DAY, HYPER_BEAM, PROTECT, SHADOW_CLAW, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, EARTH_POWER, GIGA_IMPACT, SLUDGE_BOMB, SANDSTORM, AERIAL_ACE, FLASH_CANNON, FACADE, REST, THIEF, ROCK_SLIDE, TRI_ATTACK, SUBSTITUTE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
