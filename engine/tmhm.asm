CanLearnTMHMMove: ; 11639
	ld a, [CurPartySpecies]
	ld [CurSpecies], a
	call GetBaseData
	ld hl, BaseTMHM
	push hl

	ld a, [wPutativeTMHMMove]
	ld b, a
	ld c, 0
	ld hl, TMHMMoves
.loop
	ld a, [hli]
	and a
	jr z, .end
	cp b
	jr z, .asm_11659
	inc c
	jr .loop

.asm_11659
	pop hl
	ld b, CHECK_FLAG
	push de
	ld d, 0
	predef FlagPredef
	pop de
	ret

.end
	pop hl
	ld c, 0
	ret
; 1166a

GetTMHMMove: ; 1166a
	ld a, [wd265]
	dec a
	ld hl, TMHMMoves
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wd265], a
	ret
; 1167a

TMHMMoves: ; 1167a
	db POWERUPPUNCH
	db DRAGON_PULSE
	db WATER_PULSE
	db ICY_WIND
	db SLEEP_TALK
	db TOXIC
	db HAIL
	db WHIRLPOOL
	db BULLET_SEED
	db FISSURE
	db SUNNY_DAY
	db WATER_GUN
	db ICE_BEAM
	db BLIZZARD
	db HYPER_BEAM
	db DRAGONBREATH
	db PROTECT
	db RAIN_DANCE
	db GIGA_DRAIN
	db ENDURE
	db FRUSTRATION
	db SOLARBEAM
	db IRON_TAIL
	db THUNDERBOLT
	db THUNDER
	db EARTHQUAKE
	db RETURN
	db DIG
	db PSYCHIC_M
	db SHADOW_BALL
	db BUBBLEBEAM
	db DOUBLE_TEAM
	db ICE_PUNCH
	db SWAGGER
	db FLAMETHROWER
	db SLUDGE_BOMB
	db SANDSTORM
	db FIRE_BLAST
	db SWIFT
	db AERIAL_ACE
	db THUNDERPUNCH
	db HEADBUTT
	db ZAP_CANNON
	db REST
	db ATTRACT
	db THIEF
	db STEEL_WING
	db FIRE_PUNCH
	db DAZZLINGLEAM
	db FLASH
	db CUT
	db FLY
	db SURF
	db STRENGTH
	db ROCK_SMASH
	db DIVE
	db WATERFALL
	db ROCK_CLIMB

; Move tutor
	db COMET_PUNCH
	db MACH_PUNCH
	db DYNAMICPUNCH
	db BUG_BITE
	db SIGNAL_BEAM
	db VENOSHOCK

	db 0 ; end
; 116b7
