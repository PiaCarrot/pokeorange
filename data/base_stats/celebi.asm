	db CELEBI ; 251

	db 100, 100, 100, 100, 100, 100
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, GRASS
	db 45 ; catch rate
	db 64 ; base exp
	db NO_ITEM ; item 1
	db MIRACLEBERRY ; item 2
	db 255 ; gender
	db 120 ; step cycles to hatch
	dn 5 , 5 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; tmhm
	tmhm CURSE, TOXIC, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, GIGA_DRAIN, ENDURE, FRUSTRATION, SOLARBEAM, RETURN, PSYCHIC, SHADOW_BALL, SWAGGER, SLEEP_TALK, SANDSTORM, SWIFT, REST
	; end
