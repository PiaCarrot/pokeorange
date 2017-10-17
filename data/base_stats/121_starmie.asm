	db STARMIE ; 121

	db  60,  75,  85, 115, 100,  85
	;   hp  atk  def  spd  sat  sdf

	db WATER, PSYCHIC
	db 60 ; catch rate
	db 182 ; base exp
	db STARDUST ; item 1
	db STAR_PIECE ; item 2
	db GENDERLESS ; gender
	db 20 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db SLOW ; growth rate
	dn INVERTEBRATE, INVERTEBRATE ; egg groups

	; tmhm
	tmhm WATER_PULSE, ICY_WIND, SLEEP_TALK, TOXIC, HAIL, WHIRLPOOL, WATER_GUN, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, THUNDERBOLT, THUNDER, RETURN, PSYCHIC_M, BUBBLEBEAM, DOUBLE_TEAM, SWAGGER, SWIFT, REST, DAZZLINGLEAM, FLASH, SURF, DIVE, WATERFALL, SIGNAL_BEAM
	; end
