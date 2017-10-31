	db CUTIEFLY ; 243

	db  40,  45,  40, 84, 55, 40
	;   hp  atk  def  spd  sat  sdf

	db BUG, FAIRY
	db 190 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn INSECT, INSECT ; egg groups

	; tmhm
	tmhm SLEEP_TALK, TOXIC, SUNNY_DAY, PROTECT, FRUSTRATION, RETURN, PSYCHIC_M, DOUBLE_TEAM, SWAGGER, AERIAL_ACE, REST, ATTRACT, THIEF, DAZZLINGLEAM
	; end
