	db MAGMORTAR ; 228

	db  75,  95,  67,  83,  125,  95
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE
	db 30 ; catch rate
	db 199 ; base exp
	db BURNT_BERRY ; item 1
	db BURNT_BERRY ; item 2
	db 63 ; gender
	db 25 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn HUMANSHAPE, HUMANSHAPE ; egg groups

	; tmhm
	tmhm POWERUPPUNCH, SLEEP_TALK, TOXIC, SUNNY_DAY, HYPER_BEAM, PROTECT, ENDURE, FRUSTRATION, SOLARBEAM, IRON_TAIL, THUNDERBOLT, EARTHQUAKE, RETURN, PSYCHIC_M, DOUBLE_TEAM, SWAGGER, FLAMETHROWER, FIRE_BLAST, THUNDERPUNCH, HEADBUTT, REST, ATTRACT, THIEF, FIRE_PUNCH, STRENGTH, ROCK_SMASH, ROCK_CLIMB
	; end
