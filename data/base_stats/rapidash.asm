	db RAPIDASH ; 078

	db  65, 100,  70, 105,  80,  80
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE
	db 60 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm TOXIC, SUNNY_DAY, HYPER_BEAM, PROTECT, FRUSTRATION, SOLARBEAM, IRON_TAIL, RETURN, DOUBLE_TEAM, GIGA_IMPACT, FLAMETHROWER, FIRE_BLAST, SWIFT, FACADE, REST, ATTRACT, STRENGTH, HEADBUTT, POISON_JAB, SLEEP_TALK, SWAGGER, ENDURE
	; end
