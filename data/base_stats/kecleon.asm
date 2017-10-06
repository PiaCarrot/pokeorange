	db KECLEON ; 153

	db  60,  90,  70,  40,  60,  120
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 200 ; catch rate
	db 154 ; base exp
	db NO_ITEM ; item 1
	db BITTER_BERRY ; item 2
	db 128 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn MONSTER, PLANT ; egg groups

	; tmhm
	tmhm HEADBUTT, CURSE, TOXIC, SUNNY_DAY, PROTECT, ENDURE, FRUSTRATION, IRON_TAIL, RETURN, SWAGGER, SLEEP_TALK, REST, ATTRACT, CUT, STRENGTH
	; end
