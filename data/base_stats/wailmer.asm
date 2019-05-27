	db WAILMER ; 209

	db  130, 70,  35,  60,  70,  35
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER
	db 125 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 40 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db FAST ; growth rate
	dn FIELD, FAIRYEGG ; egg groups

	; tmhm
	tmhm WATER_PULSE, TOXIC, HAIL, WHIRLPOOL, FISSURE, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, EARTHQUAKE, RETURN, DOUBLE_TEAM, FACADE, REST, SURF, STRENGTH, ROCK_SMASH, DIVE, WATERFALL, HEADBUTT, ZEN_HEADBUTT, BODY_SLAM, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
