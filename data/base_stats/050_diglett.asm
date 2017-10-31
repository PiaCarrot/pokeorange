	db DIGLETT ; 050

	db  10,  55,  30,  90,  35,  45
	;   hp  atk  def  spd  sat  sdf

	db GROUND, STEEL
	db 255 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm SLEEP_TALK, TOXIC, FISSURE, SUNNY_DAY, PROTECT, ENDURE, FRUSTRATION, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SLUDGE_BOMB, SANDSTORM, AERIAL_ACE, HEADBUTT, REST, ATTRACT, THIEF
	; end
