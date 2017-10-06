	db CORSOLA ; 222

	db  55,  55,  85,  35,  65,  85
	;   hp  atk  def  spd  sat  sdf

	db WATER, ROCK
	db 60 ; catch rate
	db 113 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 191 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db FAST ; growth rate
	dn AMPHIBIAN, INVERTEBRATE ; egg groups

	; tmhm
	tmhm HEADBUTT, CURSE, ROLLOUT, TOXIC, SUNNY_DAY, PROTECT, RAIN_DANCE, ENDURE, BUBBLEBEAM, FRUSTRATION, EARTHQUAKE, RETURN, PSYCHIC, SWAGGER, SLEEP_TALK, SANDSTORM, REST, ATTRACT, SURF, STRENGTH
	; end
