	db CLEFABLE ; 036

	db  95,  70,  73,  60,  85,  90
	;   hp  atk  def  spd  sat  sdf

	db FAIRY, FAIRY
	db 25 ; catch rate
	db 129 ; base exp
	db MYSTERYBERRY ; item 1
	db MOON_STONE ; item 2
	db 191 ; gender
	db 10 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db FAST ; growth rate
	dn FAIRYEGG, FAIRYEGG ; egg groups

	; tmhm
	tmhm HEADBUTT, CURSE, TOXIC, ZAP_CANNON, SUNNY_DAY, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, BUBBLEBEAM, FRUSTRATION, SOLARBEAM, IRON_TAIL, THUNDER, RETURN, PSYCHIC, SHADOW_BALL, ICE_PUNCH, SWAGGER, SLEEP_TALK, FIRE_BLAST, THUNDERPUNCH, REST, ATTRACT, FIRE_PUNCH, STRENGTH
	; end
