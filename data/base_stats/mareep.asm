	db MAREEP ; 179

	db  55,  40,  40,  35,  65,  45
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC
	db 235 ; catch rate
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn MONSTER, FIELD ; egg groups

	; tmhm
	tmhm TOXIC, PROTECT, RAIN_DANCE, IRON_TAIL, THUNDERBOLT, THUNDER, RETURN, DOUBLE_TEAM, FACADE, REST, FLASH, HEADBUTT, BODY_SLAM, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT, SIGNAL_BEAM
	; end
