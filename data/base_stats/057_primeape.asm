	db PRIMEAPE ; 057

	db  65, 105,  60,  95,  60,  70
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING
	db 75 ; catch rate
	db 159 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm POWERUPPUNCH, SLEEP_TALK, TOXIC, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, IRON_TAIL, THUNDERBOLT, THUNDER, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SWIFT, AERIAL_ACE, THUNDERPUNCH, HEADBUTT, REST, ATTRACT, THIEF, FIRE_PUNCH, STRENGTH, ROCK_SMASH, ROCK_CLIMB, DYNAMICPUNCH
	; end
