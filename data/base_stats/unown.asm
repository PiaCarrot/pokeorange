	db SPINDA ; 201

	db  60,  60,  60,  60,  60,  60
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 127 ; catch rate
	db 85 ; base exp
	db MINT_BERRY ; item 1
	db NO_ITEM ; item 2
	db 128 ; gender
	db 40 ; step cycles to hatch
	dn 6, 6 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FIELD, HUMANSHAPE ; egg groups

	; tmhm
	tmhm
	; end
