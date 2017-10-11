	db MINCCINO ; 159

	db  55,  50,  40,  75,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 255 ; catch rate
	db 60 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 128 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db FAST ; growth rate
	dn MONSTER, AMPHIBIAN ; egg groups

	; tmhm
	tmhm SLEEP_TALK, TOXIC, SUNNY_DAY, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, IRON_TAIL, THUNDERBOLT, RETURN, DIG, DOUBLE_TEAM, SWAGGER, SWIFT, REST, ATTRACT, THIEF, DAZZLINGLEAM
	; end
