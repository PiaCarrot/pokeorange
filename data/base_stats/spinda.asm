	db SPINDA ; 201

	db  60,  60,  60,  60,  60,  60
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 127 ; catch rate
	db MINT_BERRY ; item 1
	db NO_ITEM ; item 2
	db FEMALE_50 ; gender
	db 40 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FIELD, HUMANSHAPE ; egg groups

	; tmhm
	tmhm FACADE, ROCK_SLIDE, ZEN_HEADBUTT, BODY_SLAM, COUNTER, SUBSTITUTE
	; end
