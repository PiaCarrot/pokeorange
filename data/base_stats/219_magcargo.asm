	db MAGCARGO ; 219

	db  50,  50, 120,  30,  80,  80
	;   hp  atk  def  spd  sat  sdf

	db FIRE, ROCK
	db 75 ; catch rate
	db 154 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn AMORPHOUS, AMORPHOUS ; egg groups

	; tmhm
	tmhm TOXIC, SUNNY_DAY, HYPER_BEAM, PROTECT, ENDURE, FRUSTRATION, EARTHQUAKE, RETURN, SWAGGER, SLEEP_TALK, FIRE_BLAST, REST, ATTRACT, STRENGTH
	; end
