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
	tmhm TOXIC, SUNNY_DAY, PROTECT, RAIN_DANCE, FRUSTRATION, IRON_TAIL, THUNDERBOLT, RETURN, DIG, DOUBLE_TEAM, SWIFT, FACADE, REST, ATTRACT, THIEF, DAZZLINGLEAM, SLEEP_TALK, SWAGGER, ENDURE
	; end
