; Taken from Dabomstew's pokecrystal-speedchoice
; https://github.com/Dabomstew/pokecrystal-speedchoice/blob/master/bwxp/core.asm

; Experience formula:
; EXP = ((a*b*L) / (5*s) * ((2L+10)^2.5 / (L+Lp+10)^2.5) + 1)*t*e
; a: 1.5 if trainer battle, otherwise 1
; b: foe's base exp
; L: foe's level
; s: 2 if the mon did not participate (exp all must be on), otherwise 1
; Lp: the mon's level
; t: 1.5 if mon is traded, otherwise 1
; e: 1.5 if mon is holding Lucky Egg, otherwise 1

ScaledExpCalculation::
; requires de = current party mon struct
	ld a, [EnemyMonLevel]
; calculate 2L+10
	add a
	add 10
; calculate (2L+10)^2.5
	call Power25Calculator
; calculate (2L+10)^2.5*a
	ld a, [wBattleMode]
	dec a
	call nz, BoostExp
; calculate (2L+10)^2.5*(a*L)
	ld a, [EnemyMonLevel]
	ld [hMultiplier], a
	call Multiply
; calculate (2L+10)^2.5*(a*L)/(5*s)
	push bc
	call CheckForParticipation
	; if mon did not participate, s = 2 (exp all must be on), so a = 10
	; if mon participated, s = 1, so a = 5
	sbc a
	and 10 - 5
	add 5
	ld [hDivisor], a
	ld b, $4
	call Divide
	pop bc
; copy the result so far into wExpScratch40_1
	ld hl, wExpScratch40_1
	ld a, [hProduct]
	ld [hli], a
	ld a, [hProduct+1]
	ld [hli], a
	ld a, [hProduct+2]
	ld [hli], a
	ld a, [hProduct+3]
	ld [hl], a
; calculate (2L+10)^2.5*(a*b*L)/(5*s) - done in two parts
; first multiplier - least significant byte
	ld bc, BaseExpTable
	ld h, 0
	ld a, [EnemyMonSpecies]
	ld l, a
	add hl, hl
	add hl, bc
	ld a, [hl]
	ld [hMultiplier], a
	call BigMultiply
; store (2L+10)^2.5*(a*L)/(5*s) in the stack
	ld a, [hBigMultiplicand]
	push af
	ld a, [hBigMultiplicand + 1]
	push af
	ld a, [hBigMultiplicand + 2]
	push af
	ld a, [hBigMultiplicand + 3]
	push af
	ld a, [hBigMultiplicand + 4]
	push af
; get back (2L+10)^2.5*(a*L)/(5*s)
	ld hl, wExpScratch40_1
	ld a, [hli]
	ld [hProduct], a
	ld a, [hli]
	ld [hProduct + 1], a
	ld a, [hli]
	ld [hProduct + 2], a
	ld a, [hl]
	ld [hProduct + 3], a
; second multiplier - most significant byte
	ld bc, BaseExpTable + 1
	ld h, 0
	ld a, [EnemyMonSpecies]
	ld l, a
	add hl, hl
	add hl, bc
	ld a, [hl]
	ld [hMultiplier], a
	call BigMultiply
; shift the result up one byte
	ld a, [hBigMultiplicand + 1]
	ld [hBigMultiplicand], a
	ld a, [hBigMultiplicand + 2]
	ld [hBigMultiplicand + 1], a
	ld a, [hBigMultiplicand + 3]
	ld [hBigMultiplicand + 2], a
	ld a, [hBigMultiplicand + 4]
	ld [hBigMultiplicand + 3], a
; add the old result back
; 5th byte of the new result is 0, so just use the old one directly
	pop af
	ld [hBigMultiplicand + 4], a
; add the rest
	pop bc
	ld a, [hBigMultiplicand + 3]
	add b
	ld [hBigMultiplicand + 3], a
	pop bc
	ld a, [hBigMultiplicand + 2]
	adc b
	ld [hBigMultiplicand + 2], a
	pop bc
	ld a, [hBigMultiplicand + 1]
	adc b
	ld [hBigMultiplicand + 1], a
	pop bc
	ld a, [hBigMultiplicand]
	adc b
	ld [hBigMultiplicand], a
; calculate L
	ld a, [EnemyMonLevel]
	ld b, a
; calculate L+Lp+10
	ld a, MON_LEVEL
	call GetPartyParamLocation
	ld a, [hl]
	add b
	add 10
	ld b, a
; store the multiplication result in hBigMultiplicand and dehl
	ld a, [hBigMultiplicand + 1]
	ld d, a
	ld a, [hBigMultiplicand + 2]
	ld e, a
	ld a, [hBigMultiplicand + 3]
	ld h, a
	ld a, [hBigMultiplicand + 4]
	ld l, a
	ld a, [hBigMultiplicand]
	ld [wExpScratchByte], a
; calculate (L+Lp+10)^2.5
	ld a, b
	call Power25Calculator
	call SwapProductWithDEHL
; get the old MSB back from storage, the divisor here will never be 40-bit
	ld a, [wExpScratchByte]
	ld [hBigMultiplicand], a
; calculate (a*b*L)/(5*s)*((2L+10)^2.5/(L+Lp+10)^2.5)
	call BigDivision
; calculate the whole ratio + 1 into hProduct
	xor a
	ld [hProduct], a
	ld a, c
	add 1 ; no-optimize a++|a-- (inc a can't set carry)
	ld [hProduct + 3], a
	ld a, b
	adc 0
	ld [hProduct + 2], a
	ld a, [wExpScratchByte]
	adc 0
	ld [hProduct + 1], a
; calculate (ratio+1)*t
; now we need that offset into partymon again
	ld a, MON_ID
	call GetPartyParamLocation
	ld b, [hl]
	inc hl
	ld a, [PlayerID]
	cp b
	jr nz, .boostedEXP
	ld b, [hl]
	ld a, [PlayerID + 1]
	cp b
	ld a, 0
	jr z, .writeBoostedFlag

.boostedEXP
	call BoostExp
	ld a, $1

.writeBoostedFlag
	ld [StringBuffer2 + 2], a
; calculate (ratio+1)*t*e
	ld a, MON_ITEM
	call GetPartyParamLocation
	ld a, [hl]
	cp LUCKY_EGG
	call z, BoostExp
; Apply HARD MODE deboost
	call HardModeDeboostExp
; store final EXP to be handled back in the original bank
	ld a, [hProduct + 3]
	ld [wExpScratch40_1 + 2], a
	ld a, [hProduct + 2]
	ld [wExpScratch40_1 + 1], a
	ld a, [hProduct + 1]
	ld [wExpScratch40_1], a
	ret

Power25Calculator::
; calc (a^2.5), stored in the multiplication bytes
	ld [hProduct+3], a
	ld [hMultiplier], a
	push af
	xor a
	ld [hProduct], a
	ld [hProduct+1], a
	ld [hProduct+2], a
	call Multiply
	pop af
	push hl
	ld h, a
	ld l, 0
	call SqrtHL
	pop hl
	ld [hMultiplier], a
	call Multiply
	push bc
	ld a, $10
	ld [hDivisor], a
	ld b, $4
	call Divide
	pop bc
	ret

SqrtHL::
; sqrt hl, return a
; uses de
	push de
	ld a, $ff
	ld de, $1
.loop
	inc a
	dec e
; fix for OAM trash bug, even though it was fixed on GBC.
; good practice to not write code that can cause it in any case.
	jr nz, .noHighDec
	dec d
.noHighDec
	dec e
	add hl, de
	jr c, .loop

	pop de
	ret

BoostExp::
; boost exp by 1.5x for stuff like traded or trainer mons
	push bc
	ld a, $3
	ld [hMultiplier], a
	call Multiply
	ld a, $2
	ld [hDivisor], a
	ld b, $4
	call Divide
	pop bc
	ret

HardModeDeboostExp::
; reduce exp by 25% in hard mode
; when this is called exp is already in place
	ld a, [StatusFlags]
	bit 1, a ; hard mode
	ret z ; if hard mode is disabled, return
	push bc
	ld a, $4 ;divide by 4
	ld [hDivisor], a
	ld b, $4
	call Divide
	ld a, $3
	ld [hMultiplier], a
	call Multiply	
	pop bc
	ret

BigMultiply:
; hBigMultiplicand argument
; hMultiplierStor multiplier
; output to hBigMultiplicand
; uses wExpScratchByte as temp storage for 5th byte
	push bc
	ld b, 8
	xor a
	ld [hBigMultiplicand], a
	ld [wExpScratchByte], a
	ld [hMultiplierStor], a
	ld [hMultiplierStor + 1], a
	ld [hMultiplierStor + 2], a
	ld [hMultiplierStor + 3], a
.loop
	ld a, [hMultiplier]
	srl a
	ld [hMultiplier], a
	jr nc, .next
	ld a, [hMultiplierStor + 3]
	ld c, a
	ld a, [hBigMultiplicand + 4]
	add c
	ld [hMultiplierStor + 3], a
	ld a, [hMultiplierStor + 2]
	ld c, a
	ld a, [hBigMultiplicand + 3]
	adc c
	ld [hMultiplierStor + 2], a
	ld a, [hMultiplierStor + 1]
	ld c, a
	ld a, [hBigMultiplicand + 2]
	adc c
	ld [hMultiplierStor + 1], a
	ld a, [hMultiplierStor]
	ld c, a
	ld a, [hBigMultiplicand + 1]
	adc c
	ld [hMultiplierStor], a
	ld a, [wExpScratchByte]
	ld c, a
	ld a, [hBigMultiplicand]
	adc c
	ld [wExpScratchByte], a

.next
	dec b
	jr z, .done
	push hl
	ld hl, hBigMultiplicand + 4
	sla [hl]
	dec hl
	rl [hl]
	dec hl
	rl [hl]
	dec hl
	rl [hl]
	dec hl
	rl [hl]
	pop hl
	jr .loop

.done
	ld a, [hMultiplierStor + 3]
	ld [hBigMultiplicand + 4], a
	ld a, [hMultiplierStor + 2]
	ld [hBigMultiplicand + 3], a
	ld a, [hMultiplierStor + 1]
	ld [hBigMultiplicand + 2], a
	ld a, [hMultiplierStor]
	ld [hBigMultiplicand + 1], a
	ld a, [wExpScratchByte]
	ld [hBigMultiplicand], a
	pop bc
	ret

SwapProductWithDEHL:
; uses wExpScratch40_1 as temp storage
	push bc
	ld b, h
	ld c, l
; swap hProduct and debc
; backup debc
	ld hl, wExpScratch40_1
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, b
	ld [hli], a
	ld [hl], c
; move hProduct into debc
	ld a, [hProduct]
	ld d, a
	ld a, [hProduct + 1]
	ld e, a
	ld a, [hProduct + 2]
	ld b, a
	ld a, [hProduct + 3]
	ld c, a
; move backup into hProduct
	ld hl, wExpScratch40_1
	ld a, [hli]
	ld [hProduct], a
	ld a, [hli]
	ld [hProduct + 1], a
	ld a, [hli]
	ld [hProduct + 2], a
	ld a, [hl]
	ld [hProduct + 3], a
; move bc back into hl and return
	ld h, b
	ld l, c
	pop bc
	ret

BigDivision::
; 40-bit by 32-bit bitwise long division
; Inputs:
; hBigMultiplicand: 40bit top
; de:hl : 32bit bottom
; Initialize result
	ld bc, 0
	xor a
	ld [wExpScratchByte], a
; Check for div/0 and don't divide at all if it happens
	ld a, l
	and a
	jr nz, .dontquit
	ld a, h
	and a
	jr nz, .dontquit
	ld a, e
	and a
	jr nz, .dontquit
	ld a, d
	and a
	jr nz, .dontquit
	ret
.dontquit
; clear temp storage
	xor a
	push hl
	ld hl, wExpScratch40_1
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, wExpScratch40_2
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
; final byte in scratch2 should be 1 to be the shifter
	ld a, $1
	ld [hl], a
; get back original HL
	pop hl
; copy initial value of de:hl into the lower 4 bytes of scratch1
	ld a, l
	ld [wExpScratch40_1 + 4], a
	ld a, h
	ld [wExpScratch40_1 + 3], a
	ld a, e
	ld [wExpScratch40_1 + 2], a
	ld a, d
	ld [wExpScratch40_1 + 1], a
; setup for the division
.setup
	ld hl, wExpScratch40_1
	ld de, hBigMultiplicand
	call FortyBitCompare
	jr nc, .loop
	ld hl, wExpScratch40_1 + 4
	call FortyBitLeftShift
	ld hl, wExpScratch40_2 + 4
	call FortyBitLeftShift
	jr .setup

.loop
	ld hl, wExpScratch40_1
	ld de, hBigMultiplicand
	call FortyBitCompare
	jr nc, .aftersubtract
	ld de, hBigMultiplicand + 4
	ld hl, wExpScratch40_1 + 4
	call FortyBitSubtract
	call BigDiv_AccumulateAnswer

.aftersubtract
	ld hl, wExpScratch40_2
	call FortyBitRightShift
	ret c ; if carry is set, the accumulator finished so we're done.
	ld hl, wExpScratch40_1
	call FortyBitRightShift
	jr .loop

BigDiv_AccumulateAnswer::
; set the appropriate answer bit when we do a division step
	push de
	ld a, [wExpScratch40_2 + 2]
	and a
	jr z, .checkSecondByte
	ld d, a
	ld a, [wExpScratchByte]
	or d
	ld [wExpScratchByte], a
	jr .done

.checkSecondByte
	ld a, [wExpScratch40_2 + 3]
	and a
	jr z, .checkThirdByte
	ld d, a
	ld a, b
	or d
	ld b, a
	jr .done

.checkThirdByte
	ld a, [wExpScratch40_2 + 4]
	and a
	jr z, .done
	ld d, a
	ld a, c
	or d
	ld c, a

.done
	pop de
	ret

FortyBitSubtract::
; 40-bit subtract value ending at [hl] from value ending at [de]
	ld a, [de]
	sub [hl]
	ld [de], a
rept 4
	dec de
	dec hl
	ld a, [de]
	sbc [hl]
	ld [de], a
endr
	ret

FortyBitCompare::
; 40-bit <=
; sets carry if value starting at [hl] <= value starting at [de], clears otherwise
; uses b as temp storage along with a
rept 4
	ld a, [de]
	cp [hl]
	jr c, .false
	jr nz, .true
	inc de
	inc hl
endr
	ld a, [de]
	cp [hl]
	jr c, .false
.true
	scf
	ret

.false
	and a
	ret

FortyBitLeftShift::
; take hl = last address in memory
; shift it and the four preceding bytes left
	sla [hl]
rept 4
	dec hl
	rl [hl]
endr
	ret

FortyBitRightShift::
; take hl = first address in memory
; shift it and the four following bytes right
	srl [hl]
rept 4
	inc hl
	rr [hl]
endr
	ret

CheckForParticipation::
; return true if wCurPartyMon did not participate
	push hl
	push bc
	ld hl, wBattleParticipantsNotFainted
	ld a, [wCurPartyMon]
	ld c, a
	ld b, CHECK_FLAG
	ld d, 0
	predef FlagPredef
	ld a, c
	and a
	pop bc
	pop hl
	jr z, .true
	and a
	ret

.true
	scf
	ret

BaseExpTable:
; 1 word per pokemon, starting with 0
INCLUDE "data/base_experience.asm"
