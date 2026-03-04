Marts: ; 160a9
	dw TangeloMart
	dw MikanMart
	dw MandarinNorth
	dw SunburstMart1
	dw SunburstMart2
	dw SunburstMart3
	dw KinnowMart
	dw Route58Mart
	dw MoroMart
	dw MurcottMart
	dw TrovitopolisTrainerMart
	dw TrovitopolisPokeballMart
	dw TrovitopolisMedicineMart
	dw TrovitopolisTMMart
	dw AscorbiaMart
	dw KumquatMart
	dw PummeloMart
	dw TrovitopolisSewerTMMart
	dw UnnamedIsland2TMMart
	dw ShamoutiMart
MartsEnd:
; 160ed


TangeloMart: ; 160ed
	db 7 ; # items
	db POKE_BALL
	db HEAL_BALL
	db POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db REPEL
	db $ff
; 160f3

MikanMart: ; 160fa
	db 12 ; # items
	db POKE_BALL
	db HEAL_BALL
	db POTION
	db SUPER_POTION
	db ESCAPE_ROPE
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db REPEL
	db X_DEFEND
	db X_ATTACK
	db X_SPEED
	db $ff
; 16106

MandarinNorth: ; 16106
	db 14 ; # items
	db POKE_BALL
	db HEAL_BALL
	db DUSK_BALL
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db ESCAPE_ROPE
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db REPEL
	db X_DEFEND
	db X_ATTACK
	db X_SPEED
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
	db 9 ; # items
	db THUNDERSTONE
	db WATER_STONE
	db FIRE_STONE
	db LEAF_STONE
	db ICE_STONE
	db SUN_STONE
	db SHINY_STONE
	db MOON_STONE
	db KANTO_STONE
	db $ff
; 16121

SunburstMart3: ; 16121
	db 8 ; # items
	db X_DEFEND
	db X_ATTACK
	db X_SPCL_ATK
	db X_SPCL_DEF
	db X_ATTACK
	db X_SPEED
	db DIRE_HIT
	db GUARD_SPEC
	db $ff
; 1612b

KinnowMart:
	db 11
	db HEAL_BALL
	db DUSK_BALL
	db GREAT_BALL
	db SUPER_POTION
	db ESCAPE_ROPE
	db FULL_HEAL
	db REVIVE
	db SUPER_REPEL
	db X_DEFEND
	db X_ACCURACY
	db X_SPEED
	db $ff

Route58Mart:
	db 5
	db SUPER_POTION
	db FULL_HEAL
	db ICE_HEAL
	db ESCAPE_ROPE
	db MAX_REPEL
	db ICE_STONE
	db $ff

MoroMart:
	db 13
	db HEAL_BALL
	db DUSK_BALL
	db GREAT_BALL
	db SUPER_POTION
	db ESCAPE_ROPE
	db PARLYZ_HEAL
	db AWAKENING
	db FULL_HEAL
	db SUPER_REPEL
	db X_DEFEND
	db X_ATTACK
	db X_ACCURACY
	db LURE_BALL
	db $ff

MurcottMart:
	db 11
	db HEAL_BALL
	db DUSK_BALL
	db GREAT_BALL
	db SUPER_POTION
	db REVIVE
	db FULL_HEAL
	db HEAVY_BALL
	db MAX_REPEL
	db X_ACCURACY
	db X_ATTACK
	db X_SPEED
	db $ff

TrovitopolisTrainerMart:
	db 5
	db ESCAPE_ROPE
	db REPEL
	db SUPER_REPEL
	db MAX_REPEL
	db ETHER
	db $ff

TrovitopolisPokeballMart:
	db 13
	db POKE_BALL
	db HEAL_BALL
	db GREAT_BALL
	db ULTRA_BALL
	db LURE_BALL
	db FAST_BALL
	db LOVE_BALL
	db MOON_BALL
	db HEAVY_BALL
	db FRIEND_BALL
	db LEVEL_BALL
	db DIVE_BALL
	db DUSK_BALL
	db $ff

TrovitopolisMedicineMart:
	db 10
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db ANTIDOTE
	db AWAKENING
	db PARLYZ_HEAL
	db BURN_HEAL
	db ICE_HEAL
	db FULL_HEAL
	db REVIVE
	db $ff

TrovitopolisTMMart:
	db 10
	db TM_FLAMETHROWER
	db TM_THUNDERBOLT
	db TM_ICE_BEAM
	db TM_SOLARBEAM
	db TM_POWERUPPUNCH
	db TM_DIG
	db TM_EARTH_POWER
	db TM_GIGA_IMPACT
	db TM_DAZZLINGLEAM
	db TM_FLASH_CANNON
	db $ff

AscorbiaMart:
	db 8
	db GREAT_BALL
	db ULTRA_BALL
	db SUPER_POTION
	db HYPER_POTION
	db REVIVE
	db FULL_HEAL
	db MAX_REPEL
	db ESCAPE_ROPE
	db $ff

KumquatMart:
	db 8
	db GREAT_BALL
	db ULTRA_BALL
	db SUPER_POTION
	db HYPER_POTION
	db REVIVE
	db FULL_HEAL
	db MAX_REPEL
	db ESCAPE_ROPE
	db $ff

PummeloMart:
	db 13
	db ULTRA_BALL
	db HYPER_POTION
	db MAX_POTION
	db FULL_RESTORE
	db REVIVE
	db FULL_HEAL
	db MAX_REPEL
	db X_DEFEND
	db X_ATTACK
	db X_SPCL_ATK
	db X_SPCL_DEF
	db X_ATTACK
	db X_SPEED
	db $ff
	
TrovitopolisSewerTMMart:
	db 4
	db TM_DARK_PULSE
	db TM_TOXIC
	db TM_VENOSHOCK
	db TM_ZAP_CANNON
	db $ff
	
UnnamedIsland2TMMart:
	db 4
	db TM_REST
	db TM_RETURN
	db TM_FISSURE
	db TM_ROCK_SLIDE
	db $ff

ShamoutiMart:
	db 19
	db ULTRA_BALL
	db HYPER_POTION
	db MAX_POTION
	db FULL_RESTORE
	db REVIVE
	db FULL_HEAL
	db MAX_REPEL
	db X_DEFEND
	db X_ATTACK
	db X_SPCL_ATK
	db X_SPCL_DEF
	db X_ATTACK
	db X_SPEED
	db MAGMARIZER
	db ELECTIRIZER
	db PROTECTOR
	db KINGS_ROCK
	db METAL_COAT
	db DRAGON_SCALE
	db $ff

DefaultMart: ; 16214
	db 2 ; # items
	db POKE_BALL
	db POTION
	db $ff
; 16218
