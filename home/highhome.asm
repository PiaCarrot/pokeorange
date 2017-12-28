; A little space between Joypad intterupt and ROM header that could

HBlankCopy2bpp::
	di
	ld [hSPBuffer], sp
	ld hl, hRequestedVTileDest
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld sp, hl
	ld h, d
	ld l, e
	jr .innerLoop
.outerLoop
	ld a, [rLY]
	cp $88
	jr nc, .continueNextFrame
.innerLoop
;	pop bc
;	pop de
.waitNoHBlank
	ld a, [rSTAT]
	and 3
	jr z, .waitNoHBlank
.waitHBlank
	ld a, [rSTAT]
	and 3
	jr nz, .waitHBlank
; >vram to vram copies
; preloads r us
;	ld a, c
;	ld [hli], a
;	ld a, b
;	ld [hli], a
;	ld a, e
;	ld [hli], a
;	ld a, d
;	ld [hli], a
	rept 3
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	endr
	pop de
	ld a, e
	ld [hli], a
	ld [hl], d
	inc hl
	ld a, l
	and $f
	jr nz, .innerLoop
	ld a, [hRequested2bpp]
	dec a
	ld [hRequested2bpp], a
	jr nz, .outerLoop
	jr .done
.continueNextFrame
	ld [hRequestedVTileSource], sp
	ld a, l
	ld [hRequestedVTileDest], a
	ld a, h
	ld [hRequestedVTileDest + 1], a
	scf
.done
	ld a, [hSPBuffer]
	ld l, a
	ld a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	reti