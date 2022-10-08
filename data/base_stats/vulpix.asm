	db VULPIX ; 037

	db  38,  41,  40,  65,  50,  65
	;   hp  atk  def  spd  sat  sdf

	db ICE, ICE
	db 190 ; catch rate
	db ICE_STONE ; item 1
	db ICE_STONE ; item 2 ICE_STONE
	db FEMALE_75 ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm DARK_PULSE, TOXIC, HAIL, PROTECT, IRON_TAIL, RETURN, DIG, DOUBLE_TEAM, ICE_BEAM, BLIZZARD, FACADE, REST, HEADBUTT, ZEN_HEADBUTT, SUBSTITUTE, ENDURE, SWAGGER, SLEEP_TALK, ATTRACT
	; end
