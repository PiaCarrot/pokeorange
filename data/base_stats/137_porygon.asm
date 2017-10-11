	db PORYGON ; 137

	db  65,  60,  70,  40,  85,  75
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 45 ; catch rate
	db 79 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 255 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn INANIMATE, INANIMATE ; egg groups

	; tmhm
	tmhm TOXIC, HAIL, SUNNY_DAY, ICE_BEAM, BLIZZARD, HYPER_BEAM, DRAGONBREATH, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, SOLARBEAM, THUNDERBOLT, THUNDER, RETURN, PSYCHIC, SHADOW_BALL, BUBBLEBEAM, DOUBLE_TEAM, SWAGGER, SANDSTORM, SWIFT, AERIAL_ACE, HEADBUTT, ZAP_CANNON, REST, THIEF, STEEL_WING, FLASH, ROCK_SMASH, SIGNAL_BEAM, VENOSHOCK
	; end
