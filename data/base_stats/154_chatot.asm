	db CHATOT ; 154

	db  76,  65, 45,  91,  92, 42
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING
	db 30 ; catch rate
	db 144 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 128 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn AVIAN, AVIAN ; egg groups

	; tmhm
	tmhm SLEEP_TALK, TOXIC, BULLET_SEED, SUNNY_DAY, WATER_GUN, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, IRON_TAIL, RETURN, DOUBLE_TEAM, SWAGGER, SANDSTORM, SWIFT, AERIAL_ACE, REST, ATTRACT, THIEF, STEEL_WING, FLY
	; end
