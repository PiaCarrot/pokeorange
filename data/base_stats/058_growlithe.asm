	db GROWLITHE ; 058

	db  55,  70,  45,  60,  70,  50
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE
	db 190 ; catch rate
	db 70 ; base exp
	db BURNT_BERRY ; item 1
	db BURNT_BERRY ; item 2
	db 63 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db SLOW ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm SLEEP_TALK, TOXIC, SUNNY_DAY, PROTECT, ENDURE, FRUSTRATION, IRON_TAIL, RETURN, DIG, DOUBLE_TEAM, SWAGGER, FLAMETHROWER, FIRE_BLAST, SWIFT, AERIAL_ACE, HEADBUTT, REST, ATTRACT, THIEF, STRENGTH, ROCK_SMASH
	; end
