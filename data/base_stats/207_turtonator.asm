	db TURTONATOR ; 207

	db  60,  78, 135,  36,  91,  85
	;   hp  atk  def  spd  sat  sdf

	db FIRE, DRAGON
	db 70 ; catch rate
	db 170 ; base exp
	db NO_ITEM ; item 1
	db CHARCOAL ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn MONSTER, REPTILE ; egg groups

	; tmhm
	tmhm DRAGON_PULSE, SLEEP_TALK, TOXIC, SUNNY_DAY, HYPER_BEAM, PROTECT, ENDURE, FRUSTRATION, SOLARBEAM, EARTHQUAKE, RETURN, DOUBLE_TEAM, SWAGGER, FLAMETHROWER, FIRE_BLAST, REST, ATTRACT, VENOSHOCK
	; end
