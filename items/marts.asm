Marts: ; 160a9
	dw TangeloMart
	dw MikanMart
	dw MandarinNorth
	dw SunburstMart1
	dw SunburstMart2
	dw SunburstMart3
MartsEnd
; 160ed


TangeloMart: ; 160ed
	db 5 ; # items
	db POKE_BALL
	db POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db $ff
; 160f3

MikanMart: ; 160fa
	db 10 ; # items
	db POKE_BALL
	db POTION
	db SUPER_POTION
	db ESCAPE_ROPE
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db X_DEFEND
	db X_ATTACK
	db X_SPEED
	db $ff
; 16106

MandarinNorth: ; 16106
	db 8 ; # items
	db POKE_BALL
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db ESCAPE_ROPE
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db $ff
; 16111

SunburstMart1: ; 16111
	db 6 ; # items
	db PROTEIN
	db IRON
	db CARBOS
	db CALCIUM
	db HP_UP
	db PP_UP
	db $ff
; 16118

SunburstMart2: ; 16118
	db 6 ; # items
	db THUNDERSTONE
	db WATER_STONE
	db FIRE_STONE
	db LEAF_STONE
	db SUN_STONE
	db MOON_STONE
	db $ff
; 16121

SunburstMart3: ; 16121
	db 6 ; # items
	db POKE_DOLL
	db RAGECANDYBAR
	db FRESH_WATER
	db SODA_POP
	db LEMONADE
	db SURF_MAIL
	db $ff
; 1612b

DefaultMart: ; 16214
	db 2 ; # items
	db POKE_BALL
	db POTION
	db $ff
; 16218
