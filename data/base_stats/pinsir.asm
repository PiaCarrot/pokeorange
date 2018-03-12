	db PINSIR ; 127

	db  65, 125, 100,  85,  55,  70
	;   hp  atk  def  spd  sat  sdf

	db BUG, BUG
	db 45 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 25 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db SLOW ; growth rate
	dn INSECT, INSECT ; egg groups

	; tmhm
	tmhm TOXIC, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, GIGA_IMPACT, FACADE, REST, THIEF, ROCK_SLIDE, CUT, STRENGTH, ROCK_SMASH, ROCK_CLIMB, HEADBUTT, SWORDS_DANCE, BODY_SLAM, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT, BUG_BITE
	; end
