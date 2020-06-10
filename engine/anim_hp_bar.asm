_AnimateHPBar: ; d627
	call .ComputePixels
.loop
	push bc
	push hl
	call HPBarAnim_UpdateVariables
	pop hl
	pop bc
	ret c
	push af
	push bc
	push hl
	call HPBarAnim_UpdateTiles
	call HPBarAnim_BGMapUpdate
	pop hl
	pop bc
	pop af
	jr nc, .loop
	ret
; d65f

.ComputePixels: ; d670
	push hl
	ld hl, wCurHPAnimMaxHP
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	pop hl
	call ComputeHPBarPixels
	ld a, e
	ld [wCurHPBarPixels], a

	ld a, [wCurHPAnimNewHP]
	ld c, a
	ld a, [wCurHPAnimNewHP + 1]
	ld b, a
	ld a, [wCurHPAnimMaxHP]
	ld e, a
	ld a, [wCurHPAnimMaxHP + 1]
	ld d, a
	call ComputeHPBarPixels
	ld a, e
	ld [wNewHPBarPixels], a

	push hl
	ld hl, wCurHPAnimOldHP
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	pop hl
	ld a, e
	sub c
	ld e, a
	ld a, d
	sbc b
	ld d, a
	jr c, .negative
	ld a, [wCurHPAnimOldHP]
	ld [wCurHPAnimLowHP], a
	ld a, [wCurHPAnimNewHP]
	ld [wCurHPAnimHighHP], a
	ld c, 1
	jr .got_direction

.negative
	ld a, [wCurHPAnimOldHP]
	ld [wCurHPAnimHighHP], a
	ld a, [wCurHPAnimNewHP]
	ld [wCurHPAnimLowHP], a
	ld a, e
	cpl
	inc a
	ld e, a
	ld a, d
	cpl
	ld d, a
	ld c, 0
.got_direction
	ld a, d
	ld [wCurHPAnimDeltaHP], a
	ld a, e
	ld [wCurHPAnimDeltaHP + 1], a
	ret
; d6e2

HPBarAnim_UpdateVariables: ; d6e2
	ld hl, wCurHPBarPixels
	ld a, c
	and a
	jr nz, .inc
	ld a, [hli]
	dec a
	cp [hl]
	jr c, .animdone
	jr z, .animdone
	jr .incdecdone

.inc
	ld a, [hli]
	inc a
	cp [hl]
	jr nc, .animdone
.incdecdone
	dec hl
	ld [hl], a
	ld [hMultiplier], a
	xor a
	ld [hMultiplicand], a
	ld a, [wCurHPAnimMaxHP + 1]
	ld [hMultiplicand + 1], a
	ld a, [wCurHPAnimMaxHP]
	ld [hMultiplicand + 2], a
	call Multiply
	ld a, 96
	ld [hDivisor], a
	ld b, 4
	call Divide
	ld a, [hQuotient + 1]
	ld [wCurHPAnimOldHP + 1], a
	ld a, [hQuotient + 2]
	ld [wCurHPAnimOldHP], a
	xor a ; clear carry flag
	ret

.animdone
	ld a, [hld]
	ld [hl], a
	ld hl, wCurHPAnimNewHP
	ld a, [hli]
	ld [wCurHPAnimOldHP], a
	ld a, [hl]
	ld [wCurHPAnimOldHP + 1], a
	scf
	ret
; d730

HPBarAnim_UpdateTiles: ; d730
	call HPBarAnim_UpdateHPRemaining
	ld a, [wCurHPBarPixels]
	ld c, a
	ld e, a
	ld d, $6
	ld a, [wWhichHPBar]
	and $1
	ld b, a
	push de
	call HPBarAnim_RedrawHPBar
	pop de
	jp HPBarAnim_PaletteUpdate
; d771

HPBarAnim_RedrawHPBar: ; d771
	ld a, [wWhichHPBar]
	cp $2
	jr nz, .skip
	ld a, 2 * SCREEN_WIDTH
	add l
	ld l, a
	adc h
	sub l
	ld h, a
.skip
	jp DrawBattleHPBar
; d784

HPBarAnim_UpdateHPRemaining: ; d784
	ld a, [wWhichHPBar]
	and a
	ret z
	cp $1
	jr z, .load_15
	ld de, SCREEN_WIDTH + 2
	jr .loaded_de

.load_15
	ld de, SCREEN_WIDTH + 1
.loaded_de
	push hl
	add hl, de
	ld a, " "
	ld [hli], a
	ld [hli], a
	ld [hld], a
	dec hl
	ld a, [wCurHPAnimOldHP]
	ld [StringBuffer2 + 1], a
	ld a, [wCurHPAnimOldHP + 1]
	ld [StringBuffer2], a
	ld de, StringBuffer2
	lb bc, 2, 3
	call PrintNum
	pop hl
	ret
; d7b4

HPBarAnim_PaletteUpdate: ; d7b4
	ld hl, wCurHPAnimPal
	call SetHPPal
	ld a, [wCurHPAnimPal]
	ld c, a
	farcall ApplyHPBarPals
	ret
; d7c9

HPBarAnim_BGMapUpdate: ; d7c9
	ld a, [wWhichHPBar]
	and a
	jr z, .enemy_hp_bar
	cp $1
	jr z, .player_hp_bar
	xor a
	ld [hCGBPalUpdate], a
	ld a, $1
	ld b, a
	ld [hBGMapMode], a

	ld a, [wCurPartyMon]
	ld c, a
	cp 4
	jr nc, .lowerHalf
	dec b
.lowerHalf
	ld a, b
	ld [hBGMapHalf], a
	ld a, c
	hlbgcoord 13, 2
	ld bc, BG_MAP_WIDTH * 2
	call AddNTimes
	ld a, [wCurHPAnimPal]
	inc a
	ld b, a
	di
	ld a, 1
	ld [rVBK], a
.waitnohb1
	ld a, [rSTAT]
	and 3
	jr z, .waitnohb1
.waithbl1
	ld a, [rSTAT]
	and 3
	jr nz, .waithbl1
	ld a, b
rept 6
	ld [hli], a
endr
	xor a
	ld [rVBK], a
	ei
	jp DelayFrame

.enemy_hp_bar
	lb bc, $92, $0
	ld hl, BGPals + 2 palettes + 2
	jr .finish

.player_hp_bar
	lb bc, $9a, $1
	ld hl, BGPals + 3 palettes + 2
.finish
	xor a
	ld [hCGBPalUpdate], a
	ld a, c
	ld [hBGMapHalf], a
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	di
.waitnohb3
	ld a, [rSTAT]
	and 3
	jr z, .waitnohb3
.waithb3
	ld a, [rSTAT]
	and 3
	jr nz, .waithb3
	ld a, b
	ld [rBGPI], a
rept 3
	ld a, [hli]
	ld [rBGPD], a
endr
	ld a, [hl]
	ld [rBGPD], a
	ei
	pop af
	ld [rSVBK], a
	jp DelayFrame

ShortHPBar_CalcPixelFrame: ; d839
	ld a, [wCurHPAnimMaxHP]
	ld c, a
	ld b, 0
	ld hl, 0
	ld a, [wCurHPBarPixels]
	cp 6 * 8
	jr nc, .return_max
	and a
	jr z, .return_zero
	call AddNTimes
	ld b, 0
.loop
	ld a, l ; no-optimize hl|bc|de -= N (dec h can't set carry)
	sub 6 * 8
	ld l, a
	ld a, h
	sbc $0
	ld h, a
	jr c, .done
	inc b
	jr .loop

.done
	push bc
	ld bc, $80
	add hl, bc
	pop bc
	ld a, l ; no-optimize hl|bc|de -= N (dec h can't set carry)
	sub 6 * 8
	ld l, a
	ld a, h
	sbc $0
	ld h, a
	jr c, .no_carry
	inc b
.no_carry
	ld a, [wCurHPAnimLowHP]
	cp b
	jr nc, .finish
	ld a, [wCurHPAnimHighHP]
	cp b
	jr c, .finish
	ld a, b
.finish
	ld [wCurHPAnimOldHP], a
	ret

.return_zero
	xor a
	ld [wCurHPAnimOldHP], a
	ret

.return_max
	ld a, [wCurHPAnimMaxHP]
	ld [wCurHPAnimOldHP], a
	ret
; d88c
