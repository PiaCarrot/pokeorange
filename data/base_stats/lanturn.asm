	db LANTURN ; 171

	db 125,  58,  58,  67,  76,  76
	;   hp  atk  def  spd  sat  sdf

	db WATER, ELECTRIC
	db 75 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db SLOW ; growth rate
	dn FISH, FISH ; egg groups

	; tmhm
	tmhm WATER_PULSE, TOXIC, HAIL, WHIRLPOOL, WATER_GUN, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, FRUSTRATION, THUNDERBOLT, THUNDER, RETURN, BUBBLEBEAM, DOUBLE_TEAM, GIGA_IMPACT, FACADE, REST, ATTRACT, DAZZLINGLEAM, FLASH, SURF, DIVE, WATERFALL, SLEEP_TALK, SWAGGER, ENDURE, SIGNAL_BEAM
	; end
