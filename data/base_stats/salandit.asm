	db SALANDIT ; 165

	db  48,  44,  40,  77,  71,  40
	;   hp  atk  def  spd  sat  sdf

	db POISON, FIRE
	db 120 ; catch rate
	db NO_ITEM ; item 1
	db SMOKE_BALL ; item 2
	db FEMALE_12_5 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn MONSTER, REPTILE ; egg groups

	; tmhm
	tmhm DRAGON_PULSE, VENOSHOCK, TOXIC, PROTECT, SHADOW_CLAW, RETURN, DOUBLE_TEAM, FLAMETHROWER, SLUDGE_BOMB, FIRE_BLAST, FACADE, REST, THIEF, SUBSTITUTE, SWAGGER, SLEEP_TALK, ATTRACT, POISON_JAB
	; end
