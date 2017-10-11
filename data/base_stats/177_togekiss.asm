	db TOGEKISS ; 177

	db  85,  50,  95,  80,  120,  115
	;   hp  atk  def  spd  sat  sdf

	db FAIRY, FLYING
	db 30 ; catch rate
	db 245 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 31 ; gender
	db 15 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db FAST ; growth rate
	dn AVIAN, FAIRYEGG ; egg groups

	; tmhm
	tmhm WATER_PULSE, SLEEP_TALK, TOXIC, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, SOLARBEAM, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, FLAMETHROWER, FIRE_BLAST, SWIFT, AERIAL_ACE, HEADBUTT, REST, ATTRACT, STEEL_WING, DAZZLINGLEAM, FLASH, FLY, ROCK_SMASH, SIGNAL_BEAM
	; end
