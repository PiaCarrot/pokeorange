	db NINETALES ; 038

	db  73,  76,  75, 100,  81, 100
	;   hp  atk  def  spd  sat  sdf

	db ICE, FAIRY
	db 75 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_75 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm DARK_PULSE, TOXIC, SUNNY_DAY, HYPER_BEAM, PROTECT, SOLARBEAM, IRON_TAIL, RETURN, DIG, DOUBLE_TEAM, GIGA_IMPACT, FLAMETHROWER, FIRE_BLAST, FACADE, REST, HEADBUTT, ZEN_HEADBUTT, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
