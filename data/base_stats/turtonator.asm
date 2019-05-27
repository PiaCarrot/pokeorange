	db TURTONATOR ; 207

	db  60,  78, 135,  36,  91,  85
	;   hp  atk  def  spd  sat  sdf

	db FIRE, DRAGON
	db 70 ; catch rate
	db NO_ITEM ; item 1
	db CHARCOAL ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn MONSTER, REPTILE ; egg groups

	; tmhm
	tmhm DRAGON_PULSE, VENOSHOCK, TOXIC, SUNNY_DAY, HYPER_BEAM, PROTECT, DRAGON_TAIL, SOLARBEAM, EARTHQUAKE, RETURN, DOUBLE_TEAM, GIGA_IMPACT, FLAMETHROWER, FIRE_BLAST, FLASH_CANNON, FACADE, REST, BODY_SLAM, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
