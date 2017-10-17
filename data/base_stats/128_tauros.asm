	db TAUROS ; 128

	db  75, 100,  95, 110,  40,  70
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 45 ; catch rate
	db 172 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db ALL_MALE ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db SLOW ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm WATER_PULSE, ICY_WIND, SLEEP_TALK, TOXIC, WHIRLPOOL, FISSURE, SUNNY_DAY, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, SOLARBEAM, IRON_TAIL, THUNDERBOLT, THUNDER, EARTHQUAKE, RETURN, DOUBLE_TEAM, SWAGGER, FLAMETHROWER, SANDSTORM, FIRE_BLAST, HEADBUTT, REST, ATTRACT, SURF, STRENGTH, ROCK_SMASH, ROCK_CLIMB
	; end
