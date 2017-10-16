	db MAREEP ; 179

	db  55,  40,  40,  35,  65,  45
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC
	db 235 ; catch rate
	db 56 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn MONSTER, FIELD ; egg groups

	; tmhm
	tmhm SLEEP_TALK, TOXIC, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, IRON_TAIL, THUNDERBOLT, THUNDER, RETURN, DOUBLE_TEAM, SWAGGER, SWIFT, HEADBUTT, REST, ATTRACT, FLASH, SIGNAL_BEAM
	; end
