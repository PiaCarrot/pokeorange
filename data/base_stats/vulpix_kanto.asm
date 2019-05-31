	db VULPIX ; 037

	db  38,  41,  40,  65,  50,  65
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE
	db 190 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_75 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm DARK_PULSE, TOXIC, SUNNY_DAY, PROTECT, IRON_TAIL, RETURN, DIG, DOUBLE_TEAM, FLAMETHROWER, FIRE_BLAST, FACADE, REST, HEADBUTT, ZEN_HEADBUTT, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT
	; end

	; end
