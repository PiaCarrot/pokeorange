	db WIGGLYTUFF ; 040

	db 140,  70,  45,  45,  75,  50
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FAIRY
	db 50 ; catch rate
	db 109 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 191 ; gender
	db 10 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db FAST ; growth rate
	dn FAIRYEGG, FAIRYEGG ; egg groups

	; tmhm
	tmhm HEADBUTT, CURSE, ROLLOUT, TOXIC, ZAP_CANNON, SUNNY_DAY, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, BUBBLEBEAM, FRUSTRATION, SOLARBEAM, THUNDER, RETURN, PSYCHIC, SHADOW_BALL, ICE_PUNCH, SWAGGER, SLEEP_TALK, FIRE_BLAST, THUNDERPUNCH, REST, ATTRACT, FIRE_PUNCH, STRENGTH
	; end
