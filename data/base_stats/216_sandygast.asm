	db SANDYGAST ; 216

	db  55,  55,  80,  15,  70,  45
	;   hp  atk  def  spd  sat  sdf

	db GHOST, GROUND
	db 140 ; catch rate
	db 64 ; base exp
	db NO_ITEM ; item 1
	db SPELL_TAG ; item 2
	db 127 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn AMORPHOUS, AMORPHOUS ; egg groups

	; tmhm
	tmhm SLEEP_TALK, TOXIC, PROTECT, GIGA_DRAIN, FRUSTRATION, EARTHQUAKE, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SANDSTORM, REST, ATTRACT
	; end
