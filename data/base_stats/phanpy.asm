	db PHANPY ; 231

	db  90,  60,  60,  40,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db GROUND, GROUND
	db 120 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm TOXIC, FISSURE, SUNNY_DAY, PROTECT, IRON_TAIL, EARTHQUAKE, RETURN, DOUBLE_TEAM, EARTH_POWER, SANDSTORM, FACADE, REST, SEED_BOMB, ROCK_SLIDE, STRENGTH, ROCK_SMASH, HEADBUTT, BODY_SLAM, COUNTER, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT, PLAY_ROUGH
	; end
