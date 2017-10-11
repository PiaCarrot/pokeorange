	db ONIX ; 095

	db  35,  45, 160,  70,  30,  45
	;   hp  atk  def  spd  sat  sdf

	db ROCK, GROUND
	db 45 ; catch rate
	db 77 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 25 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn INANIMATE, INANIMATE ; egg groups

	; tmhm
	tmhm DRAGON_PULSE, SLEEP_TALK, TOXIC, FISSURE, SUNNY_DAY, DRAGONBREATH, PROTECT, ENDURE, FRUSTRATION, IRON_TAIL, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SANDSTORM, HEADBUTT, REST, ATTRACT, STRENGTH, ROCK_SMASH, ROCK_CLIMB
	; end
