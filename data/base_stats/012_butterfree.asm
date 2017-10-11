	db BUTTERFREE ; 012

	db  60,  45,  50,  70,  80,  80
	;   hp  atk  def  spd  sat  sdf

	db BUG, FLYING
	db 45 ; catch rate
	db 178 ; base exp
	db NO_ITEM ; item 1
	db SILVERPOWDER ; item 2
	db 127 ; gender
	db 15 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn INSECT, INSECT ; egg groups

	; tmhm
	tmhm TOXIC, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, ENDURE, FRUSTRATION, SOLARBEAM, RETURN, PSYCHIC, SWAGGER, SLEEP_TALK, SWIFT, REST, ATTRACT
	; end
