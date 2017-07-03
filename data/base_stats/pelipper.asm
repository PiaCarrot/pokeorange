	db PELIPPER ; 162

	db  60,  50,  100,  65,  95,  70
	;   hp  atk  def  spd  sat  sdf

	db WATER, FLYING
	db 90 ; catch rate
	db 116 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	db 127 ; gender
	db 15 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; tmhm
	tmhm BUBBLEBEAM, SURF
	; end
