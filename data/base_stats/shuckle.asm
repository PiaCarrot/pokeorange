	db SHUCKLE ; 213

	db  20,  10, 230,  05,  10, 230
	;   hp  atk  def  spd  sat  sdf

	db BUG, ROCK
	db 190 ; catch rate
	db BERRY ; item 1
	db BERRY ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn INSECT, INSECT ; egg groups

	; tmhm
	tmhm VENOSHOCK, TOXIC, SUNNY_DAY, PROTECT, FRUSTRATION, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, EARTH_POWER, SLUDGE_BOMB, SANDSTORM, FACADE, REST, ATTRACT, FLASH, STRENGTH, ROCK_SMASH, HEADBUTT, SLEEP_TALK, SWAGGER, ENDURE, BUG_BITE
	; end
