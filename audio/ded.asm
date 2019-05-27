DED_RATE = 10485
DED_RATE_NORMAL = 1048576 / DED_RATE
DED_RATE_FAINTED = DED_RATE_NORMAL * 10 / 9

_PlayDEDCry::
	ld c, DED_RATE_NORMAL % $100 ; playback rate
	ld a, e
	and a
	jr z, .notfainted
	ld c, DED_RATE_FAINTED
.notfainted
	call WaitSFX
	ld a, [rSVBK]
	push af
	ld a, BANK(wDEDTempSamp)
	ld [rSVBK], a
	ld a, [rIE]
	push af
	xor a
	ld [rIF], a
	ld a, 1 << VBLANK | 1 << TIMER
	ld [rIE], a
	ld a, [rNR50]
	push af
	ld a, [rNR51]
	push af
	ld a, [hVBlank]
	push af
	ld a, $77 ; full volume
	ld [rNR50], a
	xor a
	ld [rNR51], a
	ld [rNR30], a
	ld a, $20
	ld [rNR32], a
	ld a, [rTIMA]
	push af
	xor a
	sub c
	ld [rTMA], a
	ld [rTIMA], a
	xor a
	sla c
	sub c
	ld [rNR33], a
	ld c, %01000100 ; ch3 only
	ld a, [wOptions]
	bit 5, a ; stereo
	jr z, .mono
	ld a, [CryTracks]
	and a
	jr z, .mono
	and c
	ld c, a
.mono
	ld a, c
	ld [hDEDNR51Mask], a
	di
	xor a
	ld [hDEDCryFlag], a
	ld a, 7
	ld [hVBlank], a
	call PlayDEDSamples
	ei
	xor a
	ld [rNR51], a
	ld [rNR30], a
	ld [rTMA], a
	pop af
	ld [rTIMA], a
	ld a, (1 << rTAC_ON) | rTAC_65536_HZ
	ld [rTAC], a
	pop af
	ld [hVBlank], a
	pop af
	ld [rNR51], a
	pop af
	ld [rNR50], a
	pop af
	ld [rIE], a
	pop af
	ld [rSVBK], a
	scf
	ret

.notfound
	and a
	ret