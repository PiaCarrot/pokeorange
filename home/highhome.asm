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
	ld a, h 
	ld h, d
	ld l, e
; vram to vram copy check:
	cp VTiles0 / $100 ; is source in RAM?
	jr c, .innerLoop
	cp SRAM_Begin / $100 ; is source past VRAM
	jr nc, .innerLoop
; vram to vram copy
	lb bc, %11, rSTAT & $ff ; predefine bitmask and rSTAT source for speed and size
	jr .waitNoHBlank2
.outerLoop2
	ld a, [rLY]
	cp $88
	jp nc, .continueNextFrame
.waitNoHBlank2
	ld a, [$ff00+c]
	and b
	jr z, .waitNoHBlank2
.waitHBlank2
	ld a, [$ff00+c]
	and b
	jr nz, .waitHBlank2
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
	jr nz, .waitNoHBlank2
	ld a, [hRequested2bpp]
	dec a
	ld [hRequested2bpp], a
	jr nz, .outerLoop2
	jp .done
.outerLoop
	ld a, [rLY]
	cp $88
	jr nc, .continueNextFrame
.innerLoop
	pop bc
	pop de
.waitNoHBlank
	ld a, [rSTAT]
	and 3
	jr z, .waitNoHBlank
.waitHBlank
	ld a, [rSTAT]
	and 3
	jr nz, .waitHBlank
; preloads r us
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
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