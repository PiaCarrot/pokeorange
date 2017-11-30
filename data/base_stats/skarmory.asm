	db SKARMORY ; 227

	db  65,  80, 140,  70,  40,  70
	;   hp  atk  def  spd  sat  sdf

	db STEEL, FLYING
	db 25 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 25 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db SLOW ; growth rate
	dn AVIAN, AVIAN ; egg groups

	; tmhm
	tmhm DARK_PULSE, TOXIC, SUNNY_DAY, PROTECT, FRUSTRATION, RETURN, DOUBLE_TEAM, SANDSTORM, SWIFT, AERIAL_ACE, FLASH_CANNON, FACADE, REST, ATTRACT, THIEF, STEEL_WING, FLASH, CUT, FLY, ROCK_SMASH, SLEEP_TALK, SWAGGER, ENDURE
	; end
