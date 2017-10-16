	db STEELIX ; 208

	db  75,  85, 200,  30,  55,  65
	;   hp  atk  def  spd  sat  sdf

	db STEEL, GROUND
	db 25 ; catch rate
	db 179 ; base exp
	db NO_ITEM ; item 1
	db METAL_COAT ; item 2
	db 127 ; gender
	db 25 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn INANIMATE, INANIMATE ; egg groups

	; tmhm
	tmhm DRAGON_PULSE, SLEEP_TALK, TOXIC, SUNNY_DAY, HYPER_BEAM, DRAGONBREATH, PROTECT, ENDURE, FRUSTRATION, IRON_TAIL, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SANDSTORM, HEADBUTT, REST, ATTRACT, CUT, STRENGTH, ROCK_SMASH, ROCK_CLIMB
	; end
