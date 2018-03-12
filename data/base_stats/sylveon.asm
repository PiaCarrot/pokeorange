	db SYLVEON ; 195

	db  95,  65,  65,  60,  110,  130
	;   hp  atk  def  spd  sat  sdf

	db FAIRY, FAIRY
	db 45 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_12_5 ; gender
	db 35 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm TOXIC, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, IRON_TAIL, RETURN, DIG, SHADOW_BALL, DOUBLE_TEAM, GIGA_IMPACT, DAZZLINGLEAM, FACADE, REST, FLASH, CUT, SUBSTITUTE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
