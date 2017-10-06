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
	db FISSURE
	db HEADBUTT
	db HAIL
	db BULLET_SEED
	db FAIRY_WIND
	db TOXIC
	db ZAP_CANNON
	db FLASH
	db WATER_GUN
	db DAZZLINGLEAM
	db SUNNY_DAY
	db WATER_PULSE
	db WHIRLPOOL
	db BLIZZARD
	db HYPER_BEAM
	db ICY_WIND
	db PROTECT
	db RAIN_DANCE
	db GIGA_DRAIN
	db ENDURE
	db FRUSTRATION
	db SOLARBEAM
	db IRON_TAIL
	db DRAGONBREATH
	db THUNDER
	db EARTHQUAKE
	db RETURN
	db DIG
	db PSYCHIC_M
	db SHADOW_BALL
	db FLAMETHROWER
	db BUBBLEBEAM
	db ICE_PUNCH
	db SWAGGER
	db SLEEP_TALK
	db SLUDGE_BOMB
	db SANDSTORM
	db FIRE_BLAST
	db SWIFT
	db ICE_BEAM
	db THUNDERPUNCH
	db DRAGON_PULSE
	db POWERUPPUNCH
	db REST
	db ATTRACT
	db THIEF
	db STEEL_WING
	db FIRE_PUNCH
	db AERIAL_ACE
	db SIGNAL_BEAM
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
	db DOUBLE_TEAM
	db MACH_PUNCH

	db 0 ; end
; 116b7
