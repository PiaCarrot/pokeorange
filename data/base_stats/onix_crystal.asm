	db ONIX ; 095

	db  35,  45, 45,  70,  30,  160
	;   hp  atk  def  spd  sat  sdf

	db CRYSTAL, CRYSTAL
	db 45 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 25 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn INANIMATE, INANIMATE ; egg groups

	; tmhm
	tmhm DRAGON_PULSE, TOXIC, FISSURE, SUNNY_DAY, DRAGONBREATH, PROTECT, DRAGON_TAIL, IRON_TAIL, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, EARTH_POWER, SANDSTORM, FLASH_CANNON, FACADE, REST, ROCK_SLIDE, STRENGTH, ROCK_SMASH, ROCK_CLIMB, HEADBUTT, BODY_SLAM, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
