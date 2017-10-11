	db TOXAPEX ; 215

	db  55,  95,  55, 115,  35,  75
	;   hp  atk  def  spd  sat  sdf

	db DARK, ICE
	db 60 ; catch rate
	db 132 ; base exp
	db NO_ITEM ; item 1
	db QUICK_CLAW ; item 2
	db 127 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm SLEEP_TALK, TOXIC, HAIL, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, FRUSTRATION, RETURN, DOUBLE_TEAM, SWAGGER, SLUDGE_BOMB, REST, ATTRACT, SURF, VENOSHOCK
	; end
