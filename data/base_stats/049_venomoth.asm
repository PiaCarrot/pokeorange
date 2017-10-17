	db VENOMOTH ; 049

	db  70,  65,  60,  90,  90,  75
	;   hp  atk  def  spd  sat  sdf

	db BUG, POISON
	db 75 ; catch rate
	db 158 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn INSECT, INSECT ; egg groups

	; tmhm
	tmhm SLEEP_TALK, TOXIC, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, ENDURE, FRUSTRATION, SOLARBEAM, RETURN, PSYCHIC_M, DOUBLE_TEAM, SWAGGER, SLUDGE_BOMB, SWIFT, AERIAL_ACE, REST, ATTRACT, THIEF, FLASH, BUG_BITE, SIGNAL_BEAM, VENOSHOCK
	; end
