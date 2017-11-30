	db VENOMOTH ; 049

	db  70,  65,  60,  90,  90,  75
	;   hp  atk  def  spd  sat  sdf

	db BUG, POISON
	db 75 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn INSECT, INSECT ; egg groups

	; tmhm
	tmhm VENOSHOCK, TOXIC, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, FRUSTRATION, SOLARBEAM, RETURN, PSYCHIC_M, DOUBLE_TEAM, GIGA_IMPACT, SLUDGE_BOMB, SWIFT, AERIAL_ACE, FACADE, REST, ATTRACT, THIEF, FLASH, ZEN_HEADBUTT, SLEEP_TALK, SWAGGER, ENDURE, BUG_BITE, SIGNAL_BEAM
	; end
