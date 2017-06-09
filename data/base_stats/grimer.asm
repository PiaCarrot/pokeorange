	db GRIMER ; 088

	db  80,  80,  50,  25,  40,  50
	;   hp  atk  def  spd  sat  sdf

	db POISON, DARK
	db 190 ; catch rate
	db 90 ; base exp
	db NO_ITEM ; item 1
	db NUGGET ; item 2
	db 127 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn AMORPHOUS, AMORPHOUS ; egg groups

	; tmhm
	tmhm DYNAMICPUNCH, CURSE, TOXIC, ZAP_CANNON, HIDDEN_POWER, SUNNY_DAY, SNORE, PROTECT, GIGA_DRAIN, ENDURE, FRUSTRATION, THUNDER, RETURN, MUD_SLAP, ICE_PUNCH, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, FIRE_BLAST, THUNDERPUNCH, REST, ATTRACT, THIEF, FIRE_PUNCH, FLAMETHROWER, THUNDERBOLT
	; end
