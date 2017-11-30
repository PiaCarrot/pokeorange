	db MIMIKYU ; 200

	db  55,  90,  80,  96,  50,  105
	;   hp  atk  def  spd  sat  sdf

	db GHOST, FAIRY
	db 45 ; catch rate
	db NO_ITEM ; item 1
	db SPELL_TAG ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn AMORPHOUS, AMORPHOUS ; egg groups

	; tmhm
	tmhm DARK_PULSE, TOXIC, HYPER_BEAM, PROTECT, FRUSTRATION, THUNDERBOLT, THUNDER, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, FACADE, REST, ATTRACT, THIEF, SHADOW_CLAW, DAZZLINGLEAM, SLEEP_TALK, SWAGGER
	; end
