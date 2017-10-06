	db POLIWRATH ; 062

	db  90,  85,  95,  70,  70,  90
	;   hp  atk  def  spd  sat  sdf

	db WATER, FIGHTING
	db 45 ; catch rate
	db 185 ; base exp
	db NO_ITEM ; item 1
	db KINGS_ROCK ; item 2
	db 127 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn AMPHIBIAN, AMPHIBIAN ; egg groups

	; tmhm
	tmhm HEADBUTT, CURSE, TOXIC, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, BUBBLEBEAM, FRUSTRATION, EARTHQUAKE, RETURN, PSYCHIC, ICE_PUNCH, SWAGGER, SLEEP_TALK, REST, ATTRACT, THIEF, SURF, STRENGTH, WATERFALL
	; end
