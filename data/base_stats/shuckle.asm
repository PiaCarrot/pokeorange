	db SHUCKLE ; 213

	db  20,  10, 230,  05,  10, 230
	;   hp  atk  def  spd  sat  sdf

	db BUG, ROCK
	db 190 ; catch rate
	db 80 ; base exp
	db BERRY ; item 1
	db BERRY ; item 2
	db 127 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn INSECT, INSECT ; egg groups

	; tmhm
	tmhm HEADBUTT, TOXIC, SUNNY_DAY, PROTECT, ENDURE, FRUSTRATION, EARTHQUAKE, RETURN, DIG, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, SANDSTORM, REST, ATTRACT, STRENGTH
	; end
