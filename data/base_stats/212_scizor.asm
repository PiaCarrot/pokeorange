	db SCIZOR ; 212

	db  70, 130, 100,  65,  55,  80
	;   hp  atk  def  spd  sat  sdf

	db BUG, STEEL
	db 25 ; catch rate
	db 200 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 25 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn INSECT, INSECT ; egg groups

	; tmhm
	tmhm SLEEP_TALK, TOXIC, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, RETURN, DOUBLE_TEAM, SWAGGER, SANDSTORM, SWIFT, AERIAL_ACE, HEADBUTT, REST, ATTRACT, THIEF, STEEL_WING, CUT, STRENGTH, ROCK_SMASH, BUG_BITE, VENOSHOCK
	; end
