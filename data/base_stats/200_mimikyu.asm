	db MIMIKYU ; 200

	db  55,  90,  80,  96,  50,  105
	;   hp  atk  def  spd  sat  sdf

	db GHOST, FAIRY
	db 45 ; catch rate
	db 167 ; base exp
	db NO_ITEM ; item 1
	db SPELL_TAG ; item 2
	db 127 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn AMORPHOUS, AMORPHOUS ; egg groups

	; tmhm
	tmhm TOXIC, BULLET_SEED, WATER_GUN, HYPER_BEAM, DRAGONBREATH, PROTECT, ENDURE, FRUSTRATION, IRON_TAIL, THUNDERBOLT, THUNDER, PSYCHIC, SHADOW_BALL, DOUBLE_TEAM, SWIFT, REST, ATTRACT, THIEF, CUT, SIGNAL_BEAM, VENOSHOCK
	; end
