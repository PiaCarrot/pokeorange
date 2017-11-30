	db PELIPPER ; 162

	db  60,  50,  100,  65,  95,  70
	;   hp  atk  def  spd  sat  sdf

	db WATER, FLYING
	db 90 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 15 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm WATER_PULSE, TOXIC, HAIL, WHIRLPOOL, WATER_GUN, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, FRUSTRATION, RETURN, DOUBLE_TEAM, GIGA_IMPACT, SWIFT, AERIAL_ACE, FACADE, REST, ATTRACT, THIEF, STEEL_WING, FLY, SURF, SLEEP_TALK, SWAGGER, ENDURE
	; end
