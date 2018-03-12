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
	tmhm WATER_PULSE, TOXIC, HAIL, WHIRLPOOL, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, IRON_TAIL, RETURN, BUBBLEBEAM, DOUBLE_TEAM, FACADE, REST, THIEF, SURF, STRENGTH, DIVE, WATERFALL, HEADBUTT, BODY_SLAM, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT, SIGNAL_BEAM
	; end
