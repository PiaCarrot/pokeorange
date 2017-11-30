	db JUMPLUFF ; 189

	db  75,  55,  70, 110,  55,  95
	;   hp  atk  def  spd  sat  sdf

	db GRASS, FLYING
	db 45 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn FAIRYEGG, PLANT ; egg groups

	; tmhm
	tmhm TOXIC, BULLET_SEED, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, FRUSTRATION, SOLARBEAM, RETURN, DOUBLE_TEAM, GIGA_IMPACT, AERIAL_ACE, FACADE, REST, ATTRACT, DAZZLINGLEAM, FLASH, HEADBUTT, SLEEP_TALK, SWAGGER, ENDURE
	; end
