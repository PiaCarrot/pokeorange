	db PSYDUCK ; 054

	db  50,  52,  48,  55,  65,  50
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER
	db 190 ; catch rate
	db 64 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn AMPHIBIAN, FIELD ; egg groups

	; tmhm
	tmhm POWERUPPUNCH, WATER_PULSE, ICY_WIND, SLEEP_TALK, TOXIC, HAIL, WHIRLPOOL, WATER_GUN, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, IRON_TAIL, RETURN, DIG, PSYCHIC_M, BUBBLEBEAM, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SWIFT, AERIAL_ACE, HEADBUTT, REST, ATTRACT, FLASH, SURF, STRENGTH, ROCK_SMASH, DIVE, WATERFALL, DYNAMICPUNCH, SIGNAL_BEAM
	; end
