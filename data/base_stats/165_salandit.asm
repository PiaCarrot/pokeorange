	db SALANDIT ; 165

	db  48,  44,  40,  77,  71,  40
	;   hp  atk  def  spd  sat  sdf

	db POISON, FIRE
	db 120 ; catch rate
	db 64 ; base exp
	db NO_ITEM ; item 1
	db SMOKE_BALL ; item 2
	db 31 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn MONSTER, REPTILE ; egg groups

	; tmhm
	tmhm HEADBUTT, TOXIC, SUNNY_DAY, PROTECT, GIGA_DRAIN, ENDURE, FRUSTRATION, SOLARBEAM, RETURN, DIG, ICE_PUNCH, SWAGGER, SLEEP_TALK, SWIFT, THUNDERPUNCH, REST, ATTRACT, THIEF
	; end
