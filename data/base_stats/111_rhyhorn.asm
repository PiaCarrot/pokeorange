	db RHYHORN ; 111

	db  80,  85,  95,  25,  30,  30
	;   hp  atk  def  spd  sat  sdf

	db GROUND, ROCK
	db 120 ; catch rate
	db 69 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db SLOW ; growth rate
	dn MONSTER, FIELD ; egg groups

	; tmhm
	tmhm SLEEP_TALK, TOXIC, FISSURE, SUNNY_DAY, WATER_GUN, HYPER_BEAM, DRAGONBREATH, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, IRON_TAIL, THUNDERBOLT, THUNDER, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SWAGGER, FLAMETHROWER, SANDSTORM, FIRE_BLAST, SWIFT, HEADBUTT, ZAP_CANNON, REST, ATTRACT, THIEF, CUT, STRENGTH, ROCK_SMASH, ROCK_CLIMB, BUG_BITE, VENOSHOCK
	; end
