	db PICHU ; 172

	db  20,  40,  15,  60,  35,  35
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC
	db 190 ; catch rate
	db NO_ITEM ; item 1
	db BERRY ; item 2
	db FEMALE_50 ; gender
	db 10 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; tmhm
	tmhm TOXIC, PROTECT, RAIN_DANCE, FRUSTRATION, IRON_TAIL, THUNDERBOLT, THUNDER, RETURN, DOUBLE_TEAM, SWIFT, FACADE, REST, ATTRACT, FLASH, SURF, THUNDERPUNCH, HEADBUTT, SLEEP_TALK, SWAGGER, ENDURE, SIGNAL_BEAM
	; end
