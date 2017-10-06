	db PIKIPEK ; 155

	db  39,  52,  43,  65,  60,  50
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE
	db 45 ; catch rate
	db 65 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 31 ; gender
	db 20 ; step cycles to hatch
	dn 5, 5 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm HEADBUTT, CURSE, ROLLOUT, TOXIC, SUNNY_DAY, PROTECT, ENDURE, FRUSTRATION, IRON_TAIL, RETURN, DIG, SWAGGER, SLEEP_TALK, FIRE_BLAST, SWIFT, REST, ATTRACT, CUT
	; end
