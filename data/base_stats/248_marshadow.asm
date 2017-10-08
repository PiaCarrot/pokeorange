	db MARSHADOW ; 248

	db 90, 125, 80,  125,  90, 90
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, GHOST
	db 3 ; catch rate
	db 120 ; base exp
	db MYSTERYBERRY ; item 1
	db MYSTERYBERRY ; item 2
	db 255 ; gender
	db 40 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db SLOW ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; tmhm
	tmhm POWERUPPUNCH, SLEEP_TALK, TOXIC, FISSURE, SUNNY_DAY, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, EARTHQUAKE, RETURN, PSYCHIC, SHADOW_BALL, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SLUDGE_BOMB, SANDSTORM, SWIFT, AERIAL_ACE, THUNDERPUNCH, HEADBUTT, REST, THIEF, FIRE_PUNCH, STRENGTH, ROCK_SMASH, ROCK_CLIMB
	; end
