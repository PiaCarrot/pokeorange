	db SEEL ; 086

	db  65,  45,  55,  45,  45,  70
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER
	db 190 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn AMPHIBIAN, FIELD ; egg groups

	; tmhm
	tmhm WATER_PULSE, TOXIC, HAIL, WHIRLPOOL, WATER_GUN, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, FRUSTRATION, IRON_TAIL, RETURN, BUBBLEBEAM, DOUBLE_TEAM, FACADE, REST, ATTRACT, THIEF, SURF, STRENGTH, DIVE, WATERFALL, HEADBUTT, SLEEP_TALK, SWAGGER, ENDURE, SIGNAL_BEAM
	; end
