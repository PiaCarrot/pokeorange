	db FLYGON ; 206

	db 80,  100,  80,  100,  80,  80
	;   hp  atk  def  spd  sat  sdf

	db GROUND, DRAGON
	db 45 ; catch rate
	db 234 ; base exp
	db NO_ITEM ; item 1
	db SOFT_SAND ; item 2
	db 127 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn INSECT, INSECT ; egg groups

	; tmhm
	tmhm SLEEP_TALK, TOXIC, FISSURE, SUNNY_DAY, HYPER_BEAM, DRAGONBREATH, PROTECT, ENDURE, FRUSTRATION, SOLARBEAM, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SANDSTORM, SWIFT, REST, ATTRACT, THIEF, CUT, FLY, STRENGTH, ROCK_SMASH, BUG_BITE, SIGNAL_BEAM, VENOSHOCK
	; end
