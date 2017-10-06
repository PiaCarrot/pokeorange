	db BLISSEY ; 242

	db 255,  10,  10,  55,  75, 135
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 30 ; catch rate
	db 255 ; base exp
	db NO_ITEM ; item 1
	db LUCKY_EGG ; item 2
	db 254 ; gender
	db 40 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db FAST ; growth rate
	dn FAIRYEGG, FAIRYEGG ; egg groups

	; tmhm
	tmhm HEADBUTT, CURSE, ROLLOUT, TOXIC, ZAP_CANNON, SUNNY_DAY, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, SOLARBEAM, THUNDER, RETURN, PSYCHIC, SHADOW_BALL, SWAGGER, SLEEP_TALK, SANDSTORM, FIRE_BLAST, REST, ATTRACT, STRENGTH
	; end
