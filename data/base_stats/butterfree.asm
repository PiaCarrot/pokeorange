	db BUTTERFREE ; 012

	db  60,  45,  50,  70,  90,  80
	;   hp  atk  def  spd  sat  sdf

	db BUG, FLYING
	db 45 ; catch rate
	db NO_ITEM ; item 1
	db SILVERPOWDER ; item 2
	db FEMALE_50 ; gender
	db 15 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn INSECT, INSECT ; egg groups

	; tmhm
	tmhm VENOSHOCK, TOXIC, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, GIGA_DRAIN, SOLARBEAM, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, GIGA_IMPACT, AERIAL_ACE, FACADE, REST, THIEF, FLASH, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT, BUG_BITE, SIGNAL_BEAM
	; end
