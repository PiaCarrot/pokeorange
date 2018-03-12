	db GROWLITHE ; 058

	db  55,  70,  45,  60,  70,  50
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE
	db 190 ; catch rate
	db BURNT_BERRY ; item 1
	db BURNT_BERRY ; item 2
	db FEMALE_25 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db SLOW ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm TOXIC, SUNNY_DAY, DRAGONBREATH, PROTECT, IRON_TAIL, RETURN, DIG, DOUBLE_TEAM, FLAMETHROWER, FIRE_BLAST, AERIAL_ACE, FACADE, REST, THIEF, STRENGTH, ROCK_SMASH, HEADBUTT, BODY_SLAM, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
