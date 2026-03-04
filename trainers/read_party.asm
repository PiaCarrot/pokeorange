
ReadTrainerParty: ; 39771
	ld a, [InBattleTowerBattle]
	bit 0, a
	ret nz

	ld a, [wLinkMode]
	and a
	ret nz

	ld hl, OTPartyCount
	xor a
	ld [hli], a
	dec a
	ld [hl], a

	ld hl, OTPartyMons
	ld bc, OTPartyMonsEnd - OTPartyMons
	xor a
	call ByteFill

	ld a, [OtherTrainerClass]
	dec a
	ld c, a
	ld b, 0
	ld hl, TrainerGroups
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, [OtherTrainerID]
	ld b, a
.skip_trainer
	dec b
	jr z, .got_trainer
.loop
	ld a, [hli]
	cp $ff
	jr nz, .loop
	jr .skip_trainer
.got_trainer

.skip_name
	ld a, [hli]
	cp "@"
	jr nz, .skip_name

	ld a, [hli]
	ld [OtherTrainerType], a

.loop2
; level
	ld a, [hli]
	cp $ff
	ret z

	ld [CurPartyLevel], a

; species
	ld a, [hli]
	ld [CurPartySpecies], a

	ld a, OTPARTYMON
	ld [MonType], a

;if there's a personality value, we need to get it to TempMonPersonality so TryAddMonToParty loads the correct basedata, pointers, etc.
	push hl
	ld a, [OtherTrainerType]
	bit TRNTYPE_PERSONALITY, a
	jr z, .skip
	ld a, [hli]
	ld [TempMonPersonality], a
.skip
	predef TryAddMonToParty
	pop hl
	
; nickname?
	ld a, [OtherTrainerType]
	bit TRNTYPE_NICKNAME_F, a
	jr z, .no_nickname

	push de

	ld de, StringBuffer2
.copy_nickname
	ld a, [hli]
	ld [de], a
	inc de
	cp "@"
	jr nz, .copy_nickname

	push hl
	ld a, [OTPartyCount]
	dec a
	ld hl, OTPartyMonNicknames
	ld bc, PKMN_NAME_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, StringBuffer2
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	pop hl

	pop de
.no_nickname

; item?
	ld a, [OtherTrainerType]
	bit TRNTYPE_ITEM, a
	jr z, .not_item

	push hl
	ld a, [OTPartyCount]
	dec a
	ld hl, OTPartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	pop hl

	ld a, [hli]
	ld [de], a
.not_item

; dvs?
	ld a, [OtherTrainerType]
	bit TRNTYPE_DVS, a
	jr z, .not_dvs

	push hl
	ld a, [OTPartyCount]
	dec a
	ld hl, OTPartyMon1DVs
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	pop hl

	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
.not_dvs
	and a
    jr nz, .nonzero
    dec a ; 0 - 1 = $ff
.nonzero

; personality?
	ld a, [OtherTrainerType]
	bit TRNTYPE_PERSONALITY, a
	jr z, .not_personality

	push hl
	ld a, [OTPartyCount]
	dec a
	ld hl, OTPartyMon1Personality
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	pop hl

	ld a, [hli]
	ld [de], a
.not_personality

; moves?
	ld a, [OtherTrainerType]
	bit TRNTYPE_MOVES, a
	jr z, .not_moves

	push hl
	ld a, [OTPartyCount]
	dec a
	ld hl, OTPartyMon1Moves
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	pop hl

	ld b, NUM_MOVES
.copy_moves
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .copy_moves

	push hl

	ld a, [OTPartyCount]
	dec a
	ld hl, OTPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, MON_PP
	add hl, de

	push hl
	ld hl, MON_MOVES
	add hl, de
	pop de

	ld b, NUM_MOVES
.copy_pp
	ld a, [hli]
	and a
	jr z, .copied_pp

	push hl
	push bc
	dec a
	ld hl, Moves + MOVE_PP
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	pop bc
	pop hl

	ld [de], a
	inc de
	dec b
	jr nz, .copy_pp
.copied_pp
	pop hl
.not_moves

; stat exp in Hard Mode

	; skip for wild battles
	ld a, [wBattleMode]
	dec a
	jr z, .no_stat_exp

	; check if hard mode
	ld a, [StatusFlags]
	bit 1, a ; hard mode
	jr z, .no_stat_exp

	push hl
	ld a, [OTPartyCount]
	dec a
	ld hl, OTPartyMon1StatExp
	call GetPartyLocation
	ld d, h
	ld e, l

; Stat exp is handled by number of badges owned
	ld bc, $4000
	ld hl, $0000
	
	ld a, [Badges]
	bit 0, a
	jr z, .badge2
	add hl, bc
.badge2
	bit 1, a
	jr z, .badge3
	add hl, bc
.badge3
	bit 2, a
	jr z, .badge4
	add hl, bc
.badge4
	bit 3, a
	jr z, .endBadges
	add hl, bc
	dec hl ;when adding the 4th badge, hl overflows to 0x0000, decreasing it makes it 0xFFFF

.endBadges
	ld c, 5 ; NUM_EXP_STATS
.storeStat
	ld a, h
	ld [de], a
	inc de
	ld a, l
	ld [de], a
	inc de

.continue_stat_exp
	dec c
	jr nz, .storeStat
	
	pop hl
.no_stat_exp

	; custom DVs may alter stats
	ld a, [OtherTrainerType]
	and TRAINERTYPE_DVS
	;jr z, .no_stat_recalc
	push hl
	ld a, [OTPartyCount]
	dec a
	ld hl, OTPartyMon1MaxHP
	ld bc, PARTYMON_STRUCT_LENGTH
	push af
	call AddNTimes
	pop af
	push hl
	ld hl, OTPartyMon1StatExp
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	pop de
	ld b, TRUE
	push de
	predef CalcPkmnStats
	pop hl
	inc hl
	ld c, [hl]
	dec hl
	ld b, [hl]
	dec hl
	ld [hl], c
	dec hl
	ld [hl], b
	pop hl
.no_stat_recalc
	jp .loop2
; 397e3

ComputeTrainerReward: ; 3991b (e:591b)
	ld hl, hProduct
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, [wEnemyTrainerBaseReward]
	ld [hli], a
	ld a, [CurPartyLevel]
	ld [hl], a
	call Multiply
	ld hl, wBattleReward
	xor a
	ld [hli], a
	ld a, [hProduct + 2]
	ld [hli], a
	ld a, [hProduct + 3]
	ld [hl], a
	ret


Battle_GetTrainerName:: ; 39939
	ld a, [InBattleTowerBattle]
	bit 0, a
	ld hl, OTPlayerName
	jp nz, CopyTrainerName

	ld a, [OtherTrainerID]
	ld b, a
	ld a, [OtherTrainerClass]
	ld c, a
	; fallthrough

GetTrainerName:: ; 3994c
	ld a, c
	dec c
	push bc
	ld b, 0
	ld hl, TrainerGroups
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop bc

.loop
	dec b
	jr z, CopyTrainerName

.skip
	ld a, [hli]
	cp $ff
	jr nz, .skip
	jr .loop

CopyTrainerName: ; 39984
	ld de, StringBuffer1
	push de
	ld bc, NAME_LENGTH
	call CopyBytes
	pop de
	ret
; 39990
