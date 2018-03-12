	db MARILL ; 183

	db  70,  20,  50,  40,  20,  50
	;   hp  atk  def  spd  sat  sdf

	db WATER, FAIRY
	db 190 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db FAST ; growth rate
	dn AMPHIBIAN, FAIRYEGG ; egg groups

	; tmhm
	tmhm POWERUPPUNCH, WATER_PULSE, TOXIC, HAIL, WHIRLPOOL, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, IRON_TAIL, RETURN, DIG, BUBBLEBEAM, DOUBLE_TEAM, FACADE, REST, SURF, STRENGTH, ROCK_SMASH, DIVE, WATERFALL, ICE_PUNCH, DYNAMICPUNCH, HEADBUTT, BODY_SLAM, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT, PLAY_ROUGH
	; end
