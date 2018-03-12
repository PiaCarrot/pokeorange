	db ROCKRUFF ; 159

	db  45,  65,  40,  60,  30,  40
	;   hp  atk  def  spd  sat  sdf

	db ROCK, ROCK
	db 190 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm TOXIC, SUNNY_DAY, PROTECT, RAIN_DANCE, IRON_TAIL, THUNDERBOLT, RETURN, DIG, DOUBLE_TEAM, DAZZLINGLEAM, FACADE, REST, THIEF, ROCK_SLIDE, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
