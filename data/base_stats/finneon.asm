	db FINNEON ; 167

	db  49,  49,  56,  66,  49,  61
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER
	db 190 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 15 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db SLIGHTLY_FAST ; growth rate
	dn FISH, FISH ; egg groups

	; tmhm
	tmhm WATER_PULSE, TOXIC, HAIL, WHIRLPOOL, WATER_GUN, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, FRUSTRATION, RETURN, DOUBLE_TEAM, SWIFT, FACADE, REST, ATTRACT, FLASH, SURF, DIVE, WATERFALL, SLEEP_TALK, SWAGGER, ENDURE, SIGNAL_BEAM
	; end
