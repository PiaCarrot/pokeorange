	db DEWGONG ; 087

	db  90,  70,  80,  70,  70,  95
	;   hp  atk  def  spd  sat  sdf

	db WATER, ICE
	db 75 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn AMPHIBIAN, FIELD ; egg groups

	; tmhm
	tmhm WATER_PULSE, TOXIC, HAIL, WHIRLPOOL, WATER_GUN, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, FRUSTRATION, IRON_TAIL, RETURN, BUBBLEBEAM, DOUBLE_TEAM, GIGA_IMPACT, FACADE, REST, ATTRACT, THIEF, SURF, STRENGTH, DIVE, WATERFALL, HEADBUTT, SLEEP_TALK, SWAGGER, ENDURE, SIGNAL_BEAM
	; end
