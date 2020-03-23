_Multiply:: ; 66de

; hMultiplier is one byte.
	ld a, 8
	ld b, a

	xor a
	ld [hProduct], a
	ld [hMathBuffer + 1], a
	ld [hMathBuffer + 2], a
	ld [hMathBuffer + 3], a
	ld [hMathBuffer + 4], a


.loop
	ld a, [hMultiplier]
	srl a
	ld [hMultiplier], a
	jr nc, .next

	ld a, [hMathBuffer + 4]
	ld c, a
	ld a, [hMultiplicand + 2]
	add c
	ld [hMathBuffer + 4], a

	ld a, [hMathBuffer + 3]
	ld c, a
	ld a, [hMultiplicand + 1]
	adc c
	ld [hMathBuffer + 3], a

	ld a, [hMathBuffer + 2]
	ld c, a
	ld a, [hMultiplicand + 0]
	adc c
	ld [hMathBuffer + 2], a

	ld a, [hMathBuffer + 1]
	ld c, a
	ld a, [hProduct]
	adc c
	ld [hMathBuffer + 1], a

.next
	dec b
	jr z, .done


; hMultiplicand <<= 1

	ld a, [hMultiplicand + 2]
	add a
	ld [hMultiplicand + 2], a

	ld a, [hMultiplicand + 1]
	rla
	ld [hMultiplicand + 1], a

	ld a, [hMultiplicand + 0]
	rla
	ld [hMultiplicand + 0], a

	ld a, [hProduct]
	rla
	ld [hProduct], a

	jr .loop


.done
	ld a, [hMathBuffer + 4]
	ld [hProduct + 3], a

	ld a, [hMathBuffer + 3]
	ld [hProduct + 2], a

	ld a, [hMathBuffer + 2]
	ld [hProduct + 1], a

	ld a, [hMathBuffer + 1]
	ld [hProduct + 0], a

	ret
; 673e


_Divide:: ; 673e
	xor a
	ld [hMathBuffer + 0], a
	ld [hMathBuffer + 1], a
	ld [hMathBuffer + 2], a
	ld [hMathBuffer + 3], a
	ld [hMathBuffer + 4], a

	ld a, 9
	ld e, a

.loop
	ld a, [hMathBuffer + 0]
	ld c, a
	ld a, [hDividend + 1]
	sub c
	ld d, a

	ld a, [hDivisor]
	ld c, a
	ld a, [hDividend + 0]
	sbc c
	jr c, .next

	ld [hDividend + 0], a

	ld a, d
	ld [hDividend + 1], a

	ld a, [hMathBuffer + 4]
	inc a
	ld [hMathBuffer + 4], a

	jr .loop

.next
	ld a, b
	cp 1
	jr z, .done

	ld a, [hMathBuffer + 4]
	add a
	ld [hMathBuffer + 4], a

	ld a, [hMathBuffer + 3]
	rla
	ld [hMathBuffer + 3], a

	ld a, [hMathBuffer + 2]
	rla
	ld [hMathBuffer + 2], a

	ld a, [hMathBuffer + 1]
	rla
	ld [hMathBuffer + 1], a

	dec e
	jr nz, .next2

	ld e, 8
	ld a, [hMathBuffer + 0]
	ld [hDivisor], a
	xor a
	ld [hMathBuffer + 0], a

	ld a, [hDividend + 1]
	ld [hDividend + 0], a

	ld a, [hDividend + 2]
	ld [hDividend + 1], a

	ld a, [hDividend + 3]
	ld [hDividend + 2], a

.next2
	ld a, e
	cp 1
	jr nz, .okay
	dec b

.okay
	ld a, [hDivisor]
	srl a
	ld [hDivisor], a

	ld a, [hMathBuffer + 0]
	rra
	ld [hMathBuffer + 0], a

	jr .loop

.done
	ld a, [hDividend + 1]
	ld [hDivisor], a

	ld a, [hMathBuffer + 4]
	ld [hDividend + 3], a

	ld a, [hMathBuffer + 3]
	ld [hDividend + 2], a

	ld a, [hMathBuffer + 2]
	ld [hDividend + 1], a

	ld a, [hMathBuffer + 1]
	ld [hDividend + 0], a

	ret
; 67c1

DivideLong::
; divides 4-byte hDividend by 2-byte hDivisor
; stores quotient in 4-byte hLongQuotient (hDividend, hQuotient - 1, hProduct, etc) and remainder in 2-byte hRemainder
	push bc
	push de
	push hl
	ld hl, hDividend
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld l, [hl]
	ld h, a
	or l
	jp z, .division_by_zero
	push hl
	; clear quotient and remainder
	xor a
	ld hl, hLongQuotient
	rept 6
	ld [hli], a
	endr
	pop hl
	ld a, 32
	ld [hLoopCounter], a
.loop
	sla e
	rl d
	rl c
	rl b
	ld a, [hRemainder + 1]
	rla
	ld [hRemainder + 1], a
	ld a, [hRemainder]
	rla
	ld [hRemainder], a
	ld a, [hRemainder + 1]
	sub l
	ld a, [hRemainder]
	sbc h
	jr c, .skip
.sub
	ld a, [hRemainder + 1]
	sub l
	ld [hRemainder + 1], a
	ld a, [hRemainder]
	sbc h
	ld [hRemainder], a
	scf
	jr .done
.skip
	and a ; clear carry flag
.done
	ld a, [hLongQuotient + 3]
	rla
	ld [hLongQuotient + 3], a
	ld a, [hLongQuotient + 2]
	rla
	ld [hLongQuotient + 2], a
	ld a, [hLongQuotient + 1]
	rla
	ld [hLongQuotient + 1], a
	ld a, [hLongQuotient]
	rla
	ld [hLongQuotient], a
	ld a, [hLoopCounter]
	dec a
	ld [hLoopCounter], a
	jr nz, .loop
	pop hl
	pop de
	pop bc
	ret
.division_by_zero
	rst $38