	db PALOSSAND ; 217

	db  90, 130,  75,  55,  75,  75
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 60 ; catch rate
	db 189 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm SLEEP_TALK, TOXIC, PROTECT, GIGA_DRAIN, FRUSTRATION, EARTHQUAKE, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SWAGGER, SLUDGE_BOMB, SANDSTORM, REST, ATTRACT
	; end
