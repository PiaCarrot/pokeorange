	db LUGIA ; 249

	db 106,  90, 130, 110,  90, 154
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, FLYING
	db 3 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db GENDERLESS ; gender
	db 120 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db SLOW ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; tmhm
	tmhm DRAGON_PULSE, WATER_PULSE, TOXIC, HAIL, WHIRLPOOL, SUNNY_DAY, ICE_BEAM, BLIZZARD, HYPER_BEAM, DRAGONBREATH, PROTECT, RAIN_DANCE, GIGA_DRAIN, DRAGON_TAIL, FRUSTRATION, IRON_TAIL, THUNDERBOLT, THUNDER, EARTHQUAKE, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, EARTH_POWER, GIGA_IMPACT, SANDSTORM, SWIFT, AERIAL_ACE, FACADE, REST, STEEL_WING, FLASH, FLY, SURF, STRENGTH, ROCK_SMASH, DIVE, WATERFALL, HEADBUTT, ZEN_HEADBUTT, SLEEP_TALK, SWAGGER, ENDURE, SIGNAL_BEAM
	; end
