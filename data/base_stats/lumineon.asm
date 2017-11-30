	db LUMINEON ; 168

	db  69,  69,  76,  91,  69,  86
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER
	db 75 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 15 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db SLIGHTLY_FAST ; growth rate
	dn FISH, FISH ; egg groups

	; tmhm
	tmhm WATER_PULSE, TOXIC, HAIL, WHIRLPOOL, WATER_GUN, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, FRUSTRATION, RETURN, DOUBLE_TEAM, GIGA_IMPACT, SWIFT, FACADE, REST, ATTRACT, FLASH, SURF, DIVE, WATERFALL, SLEEP_TALK, SWAGGER, ENDURE, SIGNAL_BEAM
	; end
