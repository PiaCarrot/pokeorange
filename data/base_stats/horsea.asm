	db HORSEA ; 116

	db  30,  40,  70,  60,  70,  25
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER
	db 225 ; catch rate
	db NO_ITEM ; item 1
	db DRAGON_SCALE ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn AMPHIBIAN, REPTILE ; egg groups

	; tmhm
	tmhm DRAGON_PULSE, WATER_PULSE, TOXIC, HAIL, WHIRLPOOL, WATER_GUN, ICE_BEAM, BLIZZARD, DRAGONBREATH, PROTECT, RAIN_DANCE, FRUSTRATION, RETURN, BUBBLEBEAM, DOUBLE_TEAM, SWIFT, FLASH_CANNON, FACADE, REST, ATTRACT, SURF, DIVE, WATERFALL, HEADBUTT, SLEEP_TALK, SWAGGER, ENDURE, SIGNAL_BEAM
	; end
