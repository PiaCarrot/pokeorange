; Functions to copy data from ROM.

FarCopyBytesDouble_DoubleBankSwitch:: ; def
	ld [hBuffer], a
	ld a, [hROMBank]
	push af
	ld a, [hBuffer]
	rst Bankswitch

	call FarCopyBytesDouble

	pop af
	rst Bankswitch
	ret
; dfd



ReplaceKrisSprite:: ; e4a
	farcall _ReplaceKrisSprite
	ret
; e51

LoadStandardFont:: ; e51
	farcall _LoadStandardFont
	ret
; e58

LoadFontsBattleExtra:: ; e58
	farcall _LoadFontsBattleExtra
	ret
; e5f

LoadFontsExtra:: ; e5f
	farcall LoadFrame
	ret
; e6c

DecompressRequest2bpp:: ; e73
	push de
	ld a, BANK(sScratch)
	call GetSRAMBank
	push bc

	ld de, sScratch
	ld a, b
	call FarDecompress

	pop bc
	pop hl

	ld de, sScratch
	call Request2bpp
	jp CloseSRAM
; e8d



FarCopyBytes:: ; e8d
; copy bc bytes from a:hl to de

	ld [hBuffer], a
	ld a, [hROMBank]
	push af
	ld a, [hBuffer]
	rst Bankswitch

	call CopyBytes

	pop af
	rst Bankswitch
	ret
; 0xe9b


FarCopyBytesDouble:: ; e9b
; Copy bc bytes from a:hl to bc*2 bytes at de,
; doubling each byte in the process.

	ld [hBuffer], a
	ld a, [hROMBank]
	push af
	ld a, [hBuffer]
	rst Bankswitch

; switcheroo, de <> hl
	ld a, h
	ld h, d
	ld d, a
	ld a, l
	ld l, e
	ld e, a

	inc b
	inc c
	jr .dec

.loop
	ld a, [de]
	inc de
	ld [hli], a
	ld [hli], a
.dec
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop

	pop af
	rst Bankswitch
	ret
; 0xeba

Get2bpp:: ; f82
	ld a, [rLCDC]
	bit 7, a
	jr nz, Request2bpp

Copy2bpp:: ; f89
; copy c 2bpp tiles from b:de to hl

	push hl
	ld h, d
	ld l, e
	pop de

; bank
	ld a, b

; bc = c * $10
	push af
	swap c
	ld a, $f
	and c
	ld b, a
	ld a, $f0
	and c
	ld c, a
	pop af

	jp FarCopyBytes
; f9d

Request2bpp:: ; eba
; Load 2bpp at b:de to occupy c tiles of hl.
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a

	ld a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch

	ld a, e
	ld [hRequestedVTileSource], a
	ld a, d
	ld [hRequestedVTileSource + 1], a
	ld a, l
	ld [hRequestedVTileDest], a
	ld a, h
	ld [hRequestedVTileDest + 1], a
	ld a, [rLY]
	cp $88
	call nc, DelayFrame
	ld a, c
	ld [hRequested2bpp], a
	jr .handleLoop
.loop
	ld a, [hRequested2bpp]
	sub $8
	jr z, .copyEightTilesAndExit
	jr nc, .copyEightTiles
.copyEightTilesAndExit
	add $8
	ld [hTilesPerCycle], a
	call DelayFrame
	xor a
	ld [hRequested2bpp], a
	jr .done
.copyEightTiles
	ld [hRequested2bpp], a
	call DelayFrame
.handleLoop
	ld a, $8
	ld [hTilesPerCycle], a
	call HBlankCopy2bpp
	jr c, .loop
.done
	pop af
	rst Bankswitch

	pop af
	ld [hBGMapMode], a
	ret

Get1bpp:: ; f9d
	ld a, [rLCDC]
	bit 7, a
	jr nz, Request1bpp

Copy1bpp:: ; fa4
; copy c 1bpp tiles from b:de to hl

	push de
	ld d, h
	ld e, l

; bank
	ld a, b

; bc = c * $10 / 2
	push af
	ld h, 0
	ld l, c
	add hl, hl
	add hl, hl
	add hl, hl
	ld b, h
	ld c, l
	pop af

	pop hl
	jp FarCopyBytesDouble
; fb6

Request1bpp:: ; f1e
; Load 1bpp at b:de to occupy c tiles of hl.
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a

	ld a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch

	ld a, $8
	ld [hTilesPerCycle], a

	ld a, e
	ld [hRequestedVTileSource], a
	ld a, d
	ld [hRequestedVTileSource + 1], a
	ld a, l
	ld [hRequestedVTileDest], a
	ld a, h
	ld [hRequestedVTileDest + 1], a
	ld a, [rLY]
	cp $88
	call nc, DelayFrame
	ld a, c
	ld [hRequested1bpp], a
	jr .handleLoop
.loop
	ld a, [hRequested1bpp]
	sub $8
	jr z, .copyEightTilesAndExit
	jr nc, .copyEightTiles
.copyEightTilesAndExit
	add $8
	ld [hTilesPerCycle], a
	call DelayFrame
	xor a
	ld [hRequested1bpp], a
	jr .done
.copyEightTiles
	ld [hRequested1bpp], a
	call DelayFrame
.handleLoop
	ld a, $8
	ld [hTilesPerCycle], a
	call HBlankCopy1bpp
	jr c, .loop
.done
	pop af
	rst Bankswitch

	pop af
	ld [hBGMapMode], a
	ret

HBlankCopy1bpp:
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
	pop bc
	pop de
.waithblank2
	ld a, [rSTAT]
	and 3
	jr z, .waithblank2
.waithblank
	ld a, [rSTAT]
	and 3
	jr nz, .waithblank
	ld a, c
	ld [hli], a
	ld [hli], a
	ld a, b
	ld [hli], a
	ld [hli], a
	ld a, e
	ld [hli], a
	ld [hli], a
	ld a, d
	ld [hli], a
	ld [hli], a
	ld a, l
	and $f
	jr nz, .innerLoop
	ld a, [hRequested1bpp]
	dec a
	ld [hRequested1bpp], a
	jr nz, .outerLoop
	jr .done
.continueNextFrame
	ld a, l
	ld [hRequestedVTileDest], a
	ld a, h
	ld [hRequestedVTileDest + 1], a
	ld [hRequestedVTileSource], sp
	scf
.done
	ld a, [hSPBuffer]
	ld l, a
	ld a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	reti
