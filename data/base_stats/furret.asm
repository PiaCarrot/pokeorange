	db PELIPPER ; 162

	db  60,  50,  100,  65,  95,  70
	;   hp  atk  def  spd  sat  sdf

	db WATER, FLYING
	db 90 ; catch rate
	db 116 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 100 ; unknown
	db 15 ; step cycles to hatch
	db 5 ; unknown
	dn 7, 7 ; frontpic dimensions
	db 0, 0, 0, 0 ; padding
	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm
	; end
