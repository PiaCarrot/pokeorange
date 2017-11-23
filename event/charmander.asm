SpecialCharmander: ; 0x8b170
; if ScriptVar is 0 or 1, change the moveset of the last Charmander in the party.
;  0: give it a special moveset.
;  1: give it the normal moveset of a level 15 Charmander.

	ld a, [ScriptVar]
	cp $2
	ret nc
	ld bc, PartyCount
	ld a, [bc]
	ld hl, MON_SPECIES
	call .GetNthPartyMon
	ld a, [bc]
	ld c, a
	ld de, PARTYMON_STRUCT_LENGTH
.CheckForCharmander:
; start at the end of the party and search backwards for a Charmander
	ld a, [hl]
	cp CHARMANDER
	jr z, .GiveMoveset
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	dec c
	jr nz, .CheckForCharmander
	ret

.GiveMoveset:
	push hl
	ld a, [ScriptVar]
	ld hl, .Movesets
	ld bc, .Moveset1 - .Moveset0
	call AddNTimes

	; get address of mon's first move
	pop de
	inc de
	inc de

.GiveMoves:
	ld a, [hl]
	and a ; is the move 00?
	ret z ; if so, we're done here

	push hl
	push de
	ld [de], a ; give the Pokémon the new move

	; get the PP of the new move
	dec a
	ld hl, Moves + MOVE_PP
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte

	; get the address of the move's PP and update the PP
	ld hl, MON_PP - MON_MOVES
	add hl, de
	ld [hl], a

	pop de
	pop hl
	inc de
	inc hl
	jr .GiveMoves

.Movesets:
.Moveset0:
	db FIRE_SPIN
	db SMOKESCREEN
	db CRUNCH
	db EMBER
	db 0
.Moveset1:
; This is the normal moveset of a level 15 Charmander
	db SCRATCH
	db GROWL
	db EMBER
	db METAL_CLAW
	db 0

.GetNthPartyMon: ; 0x8b1ce
; inputs:
; hl must be set to 0 before calling this function.
; a must be set to the number of Pokémon in the party.

; outputs:
; returns the address of the last Pokémon in the party in hl.
; sets carry if a is 0.

	ld de, PartyMon1
	add hl, de
	and a
	jr z, .EmptyParty
	dec a
	ret z
	ld de, PARTYMON_STRUCT_LENGTH
.loop
	add hl, de
	dec a
	jr nz, .loop
	ret

.EmptyParty:
	scf
	ret
; 8b1e1