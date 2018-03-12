	db PONYTA ; 077

	db  50,  85,  55,  90,  65,  65
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE
	db 190 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm TOXIC, SUNNY_DAY, PROTECT, SOLARBEAM, IRON_TAIL, RETURN, DOUBLE_TEAM, FLAMETHROWER, FIRE_BLAST, FACADE, REST, STRENGTH, HEADBUTT, BODY_SLAM, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
