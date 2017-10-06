	db WAILMER ; 209

	db  130, 70,  35,  60,  70,  35
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER
	db 125 ; catch rate
	db 137 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 128 ; gender
	db 40 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db FAST ; growth rate
	dn FIELD, FAIRYEGG ; egg groups

	; tmhm
	tmhm HEADBUTT, TOXIC, ZAP_CANNON, SUNNY_DAY, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, THUNDER, RETURN, SHADOW_BALL, ICE_PUNCH, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, THUNDERPUNCH, REST, ATTRACT, THIEF, FIRE_PUNCH, STRENGTH
	; end
