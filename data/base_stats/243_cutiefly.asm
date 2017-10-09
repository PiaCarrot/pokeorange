	db CUTIEFLY ; 243

	db  40,  45,  40, 84, 55, 40
	;   hp  atk  def  spd  sat  sdf

	db BUG, FAIRY
	db 190 ; catch rate
	db 61 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn INSECT, INSECT ; egg groups

	; tmhm
	tmhm SLEEP_TALK, TOXIC, SUNNY_DAY, PROTECT, RAIN_DANCE, GIGA_DRAIN, ENDURE, FRUSTRATION, RETURN, PSYCHIC, DOUBLE_TEAM, SWAGGER, SWIFT, AERIAL_ACE, REST, ATTRACT, THIEF, STEEL_WING, DAZZLINGLEAM, BUG_BITE, SIGNAL_BEAM, VENOSHOCK
	; end
