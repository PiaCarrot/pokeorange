SpecialBulbasaur:
	call GetLastPartyMonMoveset
	ld hl, .Moveset
	jp GiveSpecialMoveset

.Moveset:
	db LEECH_SEED
	db ANCIENTPOWER ; unique
	db GROWTH
	db VINE_WHIP
	db 0

SpecialCharmander:
	call GetLastPartyMonMoveset
	ld hl, .Moveset
	jp GiveSpecialMoveset

.Moveset:
	db FIRE_SPIN
	db SMOKESCREEN
	db CRUNCH ; unique
	db EMBER
	db 0

SpecialSquirtle:
	call GetLastPartyMonMoveset
	ld hl, .Moveset
	jp GiveSpecialMoveset

.Moveset:
	db BITE
	db RAPID_SPIN
	db ZAP_CANNON ; unique
	db WATER_GUN
	db 0

SpecialIllustratorPikachu:
	call GetLastPartyMonMoveset
	ld hl, .Moveset
	jp GiveSpecialMoveset

.Moveset:
	db QUICK_ATTACK
	db DOUBLE_TEAM
	db SKETCH ; unique
	db THUNDERBOLT
	db 0
	
SpecialMagikarp:
	call GetLastPartyMonMoveset
	ld hl, .Moveset
	jp GiveSpecialMoveset
	
.Moveset:
	db SPLASH
	db FLAIL
	db TACKLE
	db HYPER_BEAM ;unique
	db 0
	
SpecialDratini:
	call GetLastPartyMonMoveset
	ld hl, .Moveset
	jp GiveSpecialMoveset
	
.Moveset:
	db DRAGON_RAGE
	db SLAM
	db THUNDER_WAVE
	db EXTREMESPEED ;unique
	db 0

GetLastPartyMon: ; 0x8b1ce
	ld bc, PartyCount
	ld a, [bc]
	ld hl, MON_SPECIES

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

GetLastPartyMonMoveset:
	call GetLastPartyMon
	ld de, MON_MOVES
	add hl, de
	push hl
	pop de
	ret

GiveSpecialMoveset:
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
