	db FORRETRESS ; 205

	db  75,  90, 140,  40,  60,  60
	;   hp  atk  def  spd  sat  sdf

	db BUG, STEEL
	db 75 ; catch rate
	db 118 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn INSECT, INSECT ; egg groups

	; tmhm
	tmhm HEADBUTT, TOXIC, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, ENDURE, FRUSTRATION, SOLARBEAM, RETURN, SWAGGER, SLEEP_TALK, SANDSTORM, REST, ATTRACT, STRENGTH
	; end
