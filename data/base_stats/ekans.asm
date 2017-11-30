	db EKANS ; 023

	db  35,  60,  44,  55,  40,  54
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON
	db 255 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FIELD, REPTILE ; egg groups

	; tmhm
	tmhm DARK_PULSE, VENOSHOCK, TOXIC, FISSURE, SUNNY_DAY, PROTECT, RAIN_DANCE, GIGA_DRAIN, FRUSTRATION, IRON_TAIL, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SLUDGE_BOMB, FACADE, REST, ATTRACT, THIEF, STRENGTH, HEADBUTT, POISON_JAB, SLEEP_TALK, SWAGGER, ENDURE
	; end
