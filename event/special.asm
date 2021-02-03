Special_BillsGrandfather: ; 73f7
	farcall SelectMonFromParty
	jr c, .cancel
	ld a, [CurPartySpecies]
	ld [ScriptVar], a
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	jp CopyPokemonName_Buffer1_Buffer3

.cancel
	xor a
	ld [ScriptVar], a
	ret

Special_YoungerHaircutBrother: ; 7413
	ld hl, Data_YoungerHaircutBrother
	jr MassageOrHaircut

Special_OlderHaircutBrother: ; 7418
	ld hl, Data_OlderHaircutBrother
	jr MassageOrHaircut

Special_DaisyMassage: ; 741d
	ld hl, Data_DaisyMassage

MassageOrHaircut: ; 7420
	push hl
	farcall SelectMonFromParty
	pop hl
	jr c, .nope
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .egg
	push hl
	call GetCurNick
	call CopyPokemonName_Buffer1_Buffer3
	pop hl
	call Random
.loop
	sub [hl]
	jr c, .ok
	inc hl
	inc hl
	inc hl
	jr .loop

.ok
	inc hl
	ld a, [hli]
	ld [ScriptVar], a
	ld c, [hl]
	jp ChangeHappiness

.nope
	xor a
	ld [ScriptVar], a
	ret

.egg
	ld a, 1
	ld [ScriptVar], a
	ret

Data_YoungerHaircutBrother: ; 7459
	db $4c, 2, HAPPINESS_YOUNGCUT1 ; 30% chance
	db $80, 3, HAPPINESS_YOUNGCUT2 ; 20% chance
	db $ff, 4, HAPPINESS_YOUNGCUT3 ; 50% chance

Data_OlderHaircutBrother: ; 7462
	db $9a, 2, HAPPINESS_OLDERCUT1 ; 60% chance
	db $4c, 3, HAPPINESS_OLDERCUT2 ; 10% chance
	db $ff, 4, HAPPINESS_OLDERCUT3 ; 30% chance

Data_DaisyMassage: ; 746b
	db $80, 2, HAPPINESS_MASSAGE ; 50% chance
	db $ff, 2, HAPPINESS_MASSAGE ; 50% chance

CopyPokemonName_Buffer1_Buffer3: ; 746e
	ld hl, StringBuffer1
	ld de, StringBuffer3
	ld bc, PKMN_NAME_LENGTH
	jp CopyBytes
	
SpecialTakeMeowth:
	farcall RemoveMonFromPartyOrBox
	ret
