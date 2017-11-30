	db PIDGEOT ; 018

	db  83,  80,  75,  101,  70,  70
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING
	db 45 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 15 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn AVIAN, AVIAN ; egg groups

	; tmhm
	tmhm TOXIC, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, FRUSTRATION, RETURN, DOUBLE_TEAM, GIGA_IMPACT, SWIFT, AERIAL_ACE, FACADE, REST, ATTRACT, THIEF, STEEL_WING, FLY, SLEEP_TALK, SWAGGER, ENDURE
	; end
