	db RIBOMBEE ; 244

	db 60, 55,  60, 124,  95,  70
	;   hp  atk  def  spd  sat  sdf

	db BUG, FAIRY
	db 75 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn INSECT, INSECT ; egg groups

	; tmhm
	tmhm TOXIC, SUNNY_DAY, PROTECT, SOLARBEAM, RETURN, PSYCHIC_M, DOUBLE_TEAM, DAZZLINGLEAM, AERIAL_ACE, FACADE, REST, THIEF, SUBSTITUTE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
