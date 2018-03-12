	db SANDYGAST ; 216

	db  55,  55,  80,  15,  70,  45
	;   hp  atk  def  spd  sat  sdf

	db GHOST, GROUND
	db 140 ; catch rate
	db NO_ITEM ; item 1
	db SPELL_TAG ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn AMORPHOUS, AMORPHOUS ; egg groups

	; tmhm
	tmhm TOXIC, PROTECT, GIGA_DRAIN, EARTHQUAKE, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, EARTH_POWER, SANDSTORM, FACADE, REST, ROCK_SLIDE, SUBSTITUTE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
