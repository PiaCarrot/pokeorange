	db MARSHADOW ; 248

	db 90, 125, 80,  125,  90, 90
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, GHOST
	db 3 ; catch rate
	db MYSTERYBERRY ; item 1
	db MYSTERYBERRY ; item 2
	db GENDERLESS ; gender
	db 40 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db SLOW ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; tmhm
	tmhm TOXIC, PROTECT, SHADOW_CLAW, RETURN, SHADOW_BALL, DOUBLE_TEAM, GIGA_IMPACT, FACADE, REST, THIEF, ROCK_SLIDE, FIRE_PUNCH, THUNDERPUNCH, ICE_PUNCH, ZEN_HEADBUTT, COUNTER, SUBSTITUTE, SWAGGER, SLEEP_TALK, POISON_JAB
	; end
