	db FEAROW ; 022

	db  65,  90,  65, 100,  61,  61
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING
	db 90 ; catch rate
	db NO_ITEM ; item 1
	db SHARP_BEAK ; item 2
	db FEMALE_50 ; gender
	db 15 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn AVIAN, AVIAN ; egg groups

	; tmhm
	tmhm TOXIC, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, FRUSTRATION, RETURN, DOUBLE_TEAM, GIGA_IMPACT, SWIFT, AERIAL_ACE, FACADE, REST, ATTRACT, THIEF, STEEL_WING, FLY, SLEEP_TALK, SWAGGER, ENDURE
	; end
