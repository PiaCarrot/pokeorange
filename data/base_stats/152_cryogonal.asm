	db CRYOGONAL ; 152

	db  70,  50,  30,  105,  95,  135
	;   hp  atk  def  spd  sat  sdf

	db ICE, ICE
	db 25 ; catch rate
	db 170 ; base exp
	db NO_ITEM ; item 1
	db NEVERMELTICE ; item 2
	db 255 ; gender
	db 20 ; step cycles to hatch
	dn 7, 7 ; frontpic dimensions

	db MEDIUM_SLOW ; growth rate
	dn INANIMATE, INANIMATE ; egg groups

	; tmhm
	tmhm ICY_WIND
	; end
