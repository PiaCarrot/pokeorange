EvolvePokemon: ; 421d8
	ld hl, EvolvableFlags
	xor a
	ld [hl], a
	ld a, [wCurPartyMon]
	ld c, a
	ld b, SET_FLAG
	call EvoFlagAction
EvolveAfterBattle: ; 421e6
	xor a
	ld [wMonTriedToEvolve], a
	dec a
	ld [wCurPartyMon], a
	push hl
	push bc
	push de
	ld hl, PartyCount

	push hl

EvolveAfterBattle_MasterLoop:
    ld hl, wCurPartyMon
    inc [hl]
 
    pop hl
 
    inc hl
    ld a, [hl]
    cp $ff
    jp z, .ReturnToMap
 
    ld [wEvolutionOldSpecies], a
 
    push hl
    ld a, [wCurPartyMon]
    ld c, a
    ld hl, EvolvableFlags
    ld b, CHECK_FLAG
    call EvoFlagAction
    ld a, c
    and a
    jp z, EvolveAfterBattle_MasterLoop
 
    ld a, [wEvolutionOldSpecies]
	ld hl, EvosAttacksPointers
    cp VULPIX
    jp z, .vulpix
	cp SANDSHREW
	jp z, .sandshrew
.got_pointers
    dec a
    ld b, 0
    ld c, a
    add hl, bc
    add hl, bc
.got_form_pointer
    ld a, [hli]
    ld h, [hl]
    ld l, a
 
    push hl
    xor a
    ld [MonType], a
    predef CopyPkmnToTempMon
    pop hl
    jr .loop

.vulpix
    ld c, a
    push bc
    push hl
    ld bc, PARTYMON_STRUCT_LENGTH
    ld a, [wCurPartyMon]
    ld hl, PartyMon1Form
    call AddNTimes
    ld a, [hl]
    and FORM_MASK
    cp VULPIX_KANTONESE_FORM
    pop hl
    pop bc
    ld a, c
    jp nz, .got_pointers
    ld hl, KantoneseVulpixFormEvosAttacksPointers
    jp .got_form_pointer
	
.sandshrew
    ld c, a
    push bc
    push hl
    ld bc, PARTYMON_STRUCT_LENGTH
    ld a, [wCurPartyMon]
    ld hl, PartyMon1Form
    call AddNTimes
    ld a, [hl]
    and FORM_MASK
    cp SANDSHREW_ALOLAN_FORM
    pop hl
    pop bc
    ld a, c
    jp nz, .got_pointers
    ld hl, AlolanSandshrewFormEvosAttacksPointers
    jp .got_form_pointer
    
.loop
	ld a, [hli]
	and a
	jp z, EvolveAfterBattle_MasterLoop

	ld b, a

	cp EVOLVE_TRADE
	jp z, .trade

	ld a, [wLinkMode]
	and a
	jp nz, .dont_evolve_2

	ld a, b
	cp EVOLVE_ITEM
	jp z, .item

	ld a, [wForceEvolution]
	and a
	jp nz, .dont_evolve_2

	ld a, b
	cp EVOLVE_MAP
	jp z, .map
	cp EVOLVE_MOVE
	jp z, .move
	cp EVOLVE_ALONGSIDE
	jp z, .alongside
	cp EVOLVE_FEMALE
	jp z, .female
	cp EVOLVE_LEVEL
	jp z, .level
	cp EVOLVE_HAPPINESS
	jp z, .happiness


; EVOLVE_STAT
	ld a, [TempMonLevel]
	cp [hl]
	jp c, .dont_evolve_1

	call IsMonHoldingEverstone
	jp z, .dont_evolve_1

	push hl
	ld de, TempMonAttack
	ld hl, TempMonDefense
	ld c, 2
	call StringCmp
	ld a, ATK_EQ_DEF
	jr z, .got_tyrogue_evo
	; if carry then a = ATK_LT_DEF, else a = ATK_GT_DEF
	sbc a
	and ATK_LT_DEF - ATK_GT_DEF
	add ATK_GT_DEF
.got_tyrogue_evo
	pop hl

	inc hl
	cp [hl]
	jp nz, .dont_evolve_2

	inc hl
	jp .proceed


.happiness
	ld a, [TempMonHappiness]
	cp HAPPINESS_TO_EVOLVE
	jp c, .dont_evolve_2

	call IsMonHoldingEverstone
	jp z, .dont_evolve_2

	ld a, [hli]
	cp TR_ANYTIME
	jp z, .proceed
	cp TR_MORNDAY
	jr z, .happiness_daylight

; TR_NITE
	ld a, [TimeOfDay]
	cp NITE
	jp nz, .dont_evolve_3
	jp .proceed

.happiness_daylight
	ld a, [TimeOfDay]
	cp NITE
	jp z, .dont_evolve_3
	jp .proceed


.trade
	ld a, [wLinkMode]
	and a
	jp z, .dont_evolve_2

	call IsMonHoldingEverstone
	jp z, .dont_evolve_2

	ld a, [hli]
	ld b, a
	inc a
	jp z, .proceed

	ld a, [TempMonItem]
	cp b
	jp nz, .dont_evolve_3

	xor a
	ld [TempMonItem], a
	jp .proceed


.item
	ld a, [hli]
	ld b, a
	ld a, [wCurItem]
	cp b
	jp nz, .dont_evolve_3

	ld a, [wForceEvolution]
	and a
	jp z, .dont_evolve_3
	ld a, [wLinkMode]
	and a
	jp nz, .dont_evolve_3
	jr .proceed


.map
	call IsMonHoldingEverstone
	jp z, .dont_evolve_1
	ld a, [MapGroup]
	ld b, a
	ld a, [hli]
	cp b
	jp nz, .dont_evolve_2
	ld a, [MapNumber]
	ld b, a
	ld a, [hli]
	cp b
	jp nz, .dont_evolve_3
	jr .proceed


.move
	call IsMonHoldingEverstone
	jp z, .dont_evolve_2
	ld a, [hli]
	ld b, a
	push hl
	ld hl, TempMonMoves
rept NUM_MOVES
	ld a, [hli]
	cp b
	jr z, .pop_proceed
endr
	pop hl
	jp .dont_evolve_3


.alongside
	ld a, [hli]
	ld b, a
	ld a, [PartyCount]
	ld c, a
	push hl
	ld hl, PartySpecies
.alongside_loop
	ld a, [hli]
	cp b
	jr z, .pop_proceed
	dec c
	jr nz, .alongside_loop
	pop hl
	jp .dont_evolve_3


.pop_proceed
	pop hl
	jp .proceed


.female
	xor a
	ld [MonType], a
	push hl
	farcall GetGender
	pop hl
	jp nz, .dont_evolve_2
	; fallthrough

.level
	ld a, [hli]
	ld b, a
	ld a, [TempMonLevel]
	cp b
	jp c, .dont_evolve_3
	call IsMonHoldingEverstone
	jp z, .dont_evolve_3

.proceed
    push hl
    push bc
    call IsInJohto
    ld a, [TempMonSpecies]
    jr z, .cubone_alola
    cp PIKACHU
    jr nz, .exeggcute
    ld a, RAICHU_KANTONESE_FORM
    jr .got_form
.exeggcute
    cp EXEGGCUTE
    jr nz, .cubone
    ld a, EXEGGUTOR_KANTONESE_FORM
    jr .got_form
.cubone
    cp CUBONE
    jr nz, .meowth
    ld a, MAROWAK_KANTONESE_FORM
    jr .got_form
.cubone_alola
	cp CUBONE
	jr nz, .meowth
	push bc
	push hl
	push de
	ld a, [wCurPartyMon]
	ld hl, PartyMon1Gender
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hl]
	and GENDER_MASK ;delete current form
	or $01 ;enforce form 1 (alolan)
	ld [hl], a ;store
	pop de
	pop hl
	pop bc
	ld a, MAROWAK_NORMAL_FORM
.meowth
    cp MEOWTH
    jr nz, .rockruff
    ld a, [TempMonForm]
    and FORM_MASK
    cp MEOWTH_ROCKET_FORM
    jp nz, .not_rockruff
    ld a, MEOWTH
    jr .got_form
.rockruff
    cp ROCKRUFF
    jr nz, .not_rockruff
    ; 5:00 PM to 5:59 PM = Dusk Lycanroc
    ld a, [hHours]
    cp DUSK_HOUR
    ld a, LYCANROC_DUSK_FORM
    jr z, .got_form
    ; night = Midnight Lycanroc
    ld a, [TimeOfDay]
    cp NITE
    ld a, LYCANROC_MIDNIGHT_FORM
    jr z, .got_form
    ; day = Midday Lycanroc
    ld a, LYCANROC_MIDDAY_FORM
.got_form
    ld b, a
    ld a, [TempMonForm]
	and $FF - FORM_MASK
    or b
    ld [TempMonForm], a
    ld a, [wCurPartyMon]
    ld hl, PartyMon1Form
    call GetPartyLocation
    ld a, [TempMonForm]
    ld [hl], a
.not_rockruff
    pop bc
    pop hl

	push hl
	ld hl, TempMonDVs
	predef GetVariant
	; TODO: make this variant apply correctly to Lycanroc
	pop hl

	ld a, [TempMonLevel]
	ld [CurPartyLevel], a
	ld a, $1
	ld [wMonTriedToEvolve], a

	push hl

	ld a, [hl]
	ld [wEvolutionNewSpecies], a
	ld a, [wCurPartyMon]
	ld hl, PartyMonNicknames
	call GetNick
	call CopyName1
	ld hl, Text_WhatEvolving
	call PrintText

	ld c, 50
	call DelayFrames

	xor a
	ld [hBGMapMode], a
	hlcoord 0, 0
	lb bc, 12, 20
	call ClearBox

	ld a, $1
	ld [hBGMapMode], a
	call ClearSprites

	farcall EvolutionAnimation

	push af
	call ClearSprites
	pop af
	jp c, CancelEvolution

	ld hl, Text_CongratulationsYourPokemon
	call PrintText

	pop hl

	ld a, [hl]
	ld [CurSpecies], a
	ld [TempMonSpecies], a
	ld [wEvolutionNewSpecies], a
	ld [wd265], a
	call GetPokemonName

	push hl
	ld hl, Text_EvolvedIntoPKMN
	call PrintTextBoxText

	ld de, MUSIC_NONE
	call PlayMusic
	ld de, SFX_CAUGHT_MON
	call PlaySFX
	call WaitSFX

	ld c, 40
	call DelayFrames

	call ClearTileMap
	call UpdateSpeciesNameIfNotNicknamed
	call GetBaseData

	ld hl, TempMonExp + 2
	ld de, TempMonMaxHP
	ld b, $1
	predef CalcPkmnStats

	ld a, [wCurPartyMon]
	ld hl, PartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld e, l
	ld d, h
	ld bc, MON_MAXHP
	add hl, bc
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, TempMonMaxHP + 1
	ld a, [hld]
	sub c
	ld c, a
	ld a, [hl]
	sbc b
	ld b, a
	ld hl, TempMonHP + 1
	ld a, [hl]
	add c
	ld [hld], a
	ld a, [hl]
	adc b
	ld [hl], a

	ld hl, TempMonSpecies
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes

	ld a, [CurSpecies]
	ld [wd265], a
	xor a
	ld [MonType], a
	call LearnEvolutionMove
	call LearnLevelMoves
	ld a, [wd265]
	dec a
	call SetSeenAndCaughtMon

	pop de
	pop hl
	ld a, [TempMonSpecies]
	ld [hl], a
	push hl
	ld l, e
	ld h, d
	jp EvolveAfterBattle_MasterLoop
; 423f8

.dont_evolve_1
	inc hl
.dont_evolve_2
	inc hl
.dont_evolve_3
	inc hl
	jp .loop

.ReturnToMap:
	pop de
	pop bc
	pop hl
	ld a, [wLinkMode]
	and a
	ret nz
	ld a, [wBattleMode]
	and a
	ret nz
	ld a, [wMonTriedToEvolve]
	and a
	call nz, RestartMapMusic
	ret
; 42414

UpdateSpeciesNameIfNotNicknamed: ; 42414
	ld a, [CurSpecies]
	push af
	ld a, [BaseDexNo]
	ld [wd265], a
	call GetPokemonName
	pop af
	ld [CurSpecies], a
	ld hl, StringBuffer1
	ld de, StringBuffer2
.loop
	ld a, [de]
	inc de
	cp [hl]
	inc hl
	ret nz
	cp "@"
	jr nz, .loop

	ld a, [wCurPartyMon]
	ld bc, PKMN_NAME_LENGTH
	ld hl, PartyMonNicknames
	call AddNTimes
	push hl
	ld a, [CurSpecies]
	ld [wd265], a
	call GetPokemonName
	ld hl, StringBuffer1
	pop de
	ld bc, PKMN_NAME_LENGTH
	jp CopyBytes
; 42454

CancelEvolution: ; 42454
	ld hl, Text_StoppedEvolving
	call PrintText
	call ClearTileMap
	pop hl
	jp EvolveAfterBattle_MasterLoop
; 42461

IsMonHoldingEverstone: ; 42461
	push hl
	ld a, [wCurPartyMon]
	ld hl, PartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hl]
	cp EVERSTONE
	pop hl
	ret
; 42473

Text_CongratulationsYourPokemon: ; 0x42473
	; Congratulations! Your @ @
	text_jump UnknownText_0x1c4b92
	db "@"
; 0x42478

Text_EvolvedIntoPKMN: ; 0x42478
	; evolved into @ !
	text_jump UnknownText_0x1c4baf
	db "@"
; 0x4247d

Text_StoppedEvolving: ; 0x4247d
	; Huh? @ stopped evolving!
	text_jump UnknownText_0x1c4bc5
	db "@"
; 0x42482

Text_WhatEvolving: ; 0x42482
	; What? @ is evolving!
	text_jump UnknownText_0x1c4be3
	db "@"
; 0x42487


LearnEvolutionMove:
	ld a, [CurPartySpecies]

	; Region specific
	cp PIKACHU
	jr z, .region
	cp EXEGGCUTE
	jr z, .region
	cp CUBONE
	jr z, .region

	; Form specific
	cp VULPIX
	jr z, .dual
	cp SANDSHREW
	jr z, .dual
.continue
	ld a, [wd265]
	ld [CurPartySpecies], a
	dec a
	ld b, 0
	ld c, a
	ld hl, EvolutionMoves
	add hl, bc
.override
	ld a, [hl]
	and a
	ret z

	push hl
	ld d, a
	ld hl, PartyMon1Moves
	ld a, [wCurPartyMon]
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes

	ld b, NUM_MOVES
.check_move
	ld a, [hli]
	cp d
	jr z, .has_move
	dec b
	jr nz, .check_move

	ld a, d
	ld [wPutativeTMHMMove], a
	ld [wd265], a
	call GetMoveName
	call CopyName1
	predef LearnMove
	ld a, [CurPartySpecies]
	ld [wd265], a

.has_move
	pop hl
	ret

.region
	;call IsInJohto ;disabled region evos since kanto stone will be used for these three
	;jp z, .continue
	ld a, [CurPartySpecies]
	cp CUBONE
	jr z, .cubone
	cp EXEGGCUTE
	jr z, .exeggcute
.pikachu
	ld a, [TempMonForm]
	and FORM_MASK
	cp RAICHU_KANTONESE_FORM
	jr nz, .continue
	ld [hl], THUNDERPUNCH
	jr .spec_continue
.exeggcute
	ld a, [TempMonForm]
	and FORM_MASK
	cp EXEGGUTOR_KANTONESE_FORM
	jr nz, .continue
	ld [hl], SEED_BOMB
	jr .spec_continue
.cubone
	ld a, [TempMonForm]
	and FORM_MASK
	cp MAROWAK_KANTONESE_FORM
	jr nz, .continue
	ld [hl], SWORDS_DANCE
	jr .spec_continue
.dual
	ld a, [TempMonForm]
	and FORM_MASK
    cp SANDSHREW_ALOLAN_FORM
	jp nz, .continue
	ld a, [CurPartySpecies]
	cp VULPIX
	jr z, .vulpix
	ld [hl], AURORA_BEAM
	jr .spec_continue
.vulpix
	ld [hl], NO_MOVE
.spec_continue
	ld a, [wd265]
	ld [CurPartySpecies], a
	dec a
	ld b, 0
	ld c, a
	jp .override

LearnLevelMoves: ; 42487
    ld a, [wd265]
    ld [CurPartySpecies], a
    ld hl, EvosAttacksPointers
    cp EXEGGUTOR
    jp z, .exeggutor
	cp VULPIX
	jp z, .vulpix
	cp RATTATA
	jp z, .rattata
	cp RATICATE
	jp z, .raticate
	cp RAICHU
	jp z, .raichu
	cp SANDSHREW
	jp z, .sandshrew
	cp SANDSLASH
	jp z, .sandslash
	cp NINETALES
	jp z, .ninetales
	cp DIGLETT
	jp z, .diglett
	cp DUGTRIO
	jp z, .dugtrio
	cp MEOWTH
	jp z, .meowth
	cp PERSIAN
	jp z, .persian
	cp GEODUDE
	jp z, .geodude
	cp GRAVELER
	jp z, .graveler
	cp GOLEM
	jp z, .golem
	cp GRIMER
	jp z, .grimer
	cp MUK
	jp z, .muk
	cp MAROWAK
	jp z, .marowak
.got_pointers
    dec a
    ld b, 0
    ld c, a
    add hl, bc
    add hl, bc
.got_form_pointer
    ld a, [hli]
    ld h, [hl]
    ld l, a
jp .skip_evos
   
.exeggutor
	ld a, [TempMonForm]
    and FORM_MASK
    cp EXEGGUTOR_KANTONESE_FORM
	ld a, [CurPartySpecies]
    jp nz, .got_pointers
    ld hl, KantoneseExeggutorFormEvosAttacksPointers
    jp .got_form_pointer
	
.vulpix
	ld a, [TempMonForm]
    and FORM_MASK
    cp VULPIX_KANTONESE_FORM
	ld a, [CurPartySpecies]
    jp nz, .got_pointers
    ld hl, KantoneseVulpixFormEvosAttacksPointers
    jp .got_form_pointer
	
.rattata
	ld a, [TempMonForm]
    and FORM_MASK
    cp RATTATA_KANTONESE_FORM
	ld a, [CurPartySpecies]
    jp nz, .got_pointers
    ld hl, KantoneseRattataFormEvosAttacksPointers
    jp .got_form_pointer
	
.raticate
	ld a, [TempMonForm]
    and FORM_MASK
    cp RATICATE_KANTONESE_FORM
	ld a, [CurPartySpecies]
    jp nz, .got_pointers
    ld hl, KantoneseRaticateFormEvosAttacksPointers
    jp .got_form_pointer
	
.raichu
	ld a, [TempMonForm]
    and FORM_MASK
    cp RAICHU_KANTONESE_FORM
	ld a, [CurPartySpecies]
    jp nz, .got_pointers
    ld hl, KantoneseRaichuFormEvosAttacksPointers
    jp .got_form_pointer
	
.sandshrew
	ld a, [TempMonForm]
    and FORM_MASK
    cp SANDSHREW_ALOLAN_FORM
	ld a, [CurPartySpecies]
    jp nz, .got_pointers
    ld hl, AlolanSandshrewFormEvosAttacksPointers
    jp .got_form_pointer
	
.sandslash
	ld a, [TempMonForm]
    and FORM_MASK
    cp SANDSLASH_ALOLAN_FORM
	ld a, [CurPartySpecies]
    jp nz, .got_pointers
    ld hl, AlolanSandslashFormEvosAttacksPointers
    jp .got_form_pointer
	
.ninetales
	ld a, [TempMonForm]
    and FORM_MASK
    cp NINETALES_KANTONESE_FORM
	ld a, [CurPartySpecies]
    jp nz, .got_pointers
    ld hl, KantoneseNinetalesFormEvosAttacksPointers
    jp .got_form_pointer
	
.diglett
	ld a, [TempMonForm]
    and FORM_MASK
    cp DIGLETT_KANTONESE_FORM
	ld a, [CurPartySpecies]
    jp nz, .got_pointers
    ld hl, KantoneseDiglettFormEvosAttacksPointers
    jp .got_form_pointer
	
.dugtrio
	ld a, [TempMonForm]
    and FORM_MASK
    cp DUGTRIO_KANTONESE_FORM
	ld a, [CurPartySpecies]
    jp nz, .got_pointers
    ld hl, KantoneseDugtrioFormEvosAttacksPointers
    jp .got_form_pointer
	
.meowth
	ld a, [TempMonForm]
    and FORM_MASK
    cp MEOWTH_ALOLAN_FORM
	ld a, [CurPartySpecies]
    jp nz, .got_pointers
    ld hl, AlolanMeowthFormEvosAttacksPointers
    jp .got_form_pointer
	
.persian
	ld a, [TempMonForm]
    and FORM_MASK
    cp PERSIAN_ALOLAN_FORM
	ld a, [CurPartySpecies]
    jp nz, .got_pointers
    ld hl, AlolanPersianFormEvosAttacksPointers
    jp .got_form_pointer
	
.geodude
	ld a, [TempMonForm]
    and FORM_MASK
    cp GEODUDE_KANTONESE_FORM
	ld a, [CurPartySpecies]
    jp nz, .got_pointers
    ld hl, KantoneseGeodudeFormEvosAttacksPointers
    jp .got_form_pointer
	
.graveler
	ld a, [TempMonForm]
    and FORM_MASK
    cp GRAVELER_KANTONESE_FORM
	ld a, [CurPartySpecies]
    jp nz, .got_pointers
    ld hl, KantoneseGravelerFormEvosAttacksPointers
    jp .got_form_pointer
	
.golem
	ld a, [TempMonForm]
    and FORM_MASK
    cp GOLEM_KANTONESE_FORM
	ld a, [CurPartySpecies]
    jp nz, .got_pointers
    ld hl, KantoneseGolemFormEvosAttacksPointers
    jp .got_form_pointer
	
.grimer
	ld a, [TempMonForm]
    and FORM_MASK
    cp GRIMER_KANTONESE_FORM
	ld a, [CurPartySpecies]
    jp nz, .got_pointers
    ld hl, KantoneseGrimerFormEvosAttacksPointers
    jp .got_form_pointer
	
.muk
	ld a, [TempMonForm]
    and FORM_MASK
    cp MUK_KANTONESE_FORM
	ld a, [CurPartySpecies]
    jp nz, .got_pointers
    ld hl, KantoneseMukFormEvosAttacksPointers
    jp .got_form_pointer
	
.marowak
	ld a, [TempMonForm]
    and FORM_MASK
    cp MAROWAK_KANTONESE_FORM
	ld a, [CurPartySpecies]
    jp nz, .got_pointers
    ld hl, KantoneseMarowakFormEvosAttacksPointers
    jp .got_form_pointer
 
.skip_evos
    ld a, [hli]
    and a
    jr nz, .skip_evos

.find_move
	ld a, [hli]
	and a
	jr z, .done

	ld b, a
	ld a, [CurPartyLevel]
	cp b
	ld a, [hli]
	jr nz, .find_move

	push hl
	ld d, a
	ld hl, PartyMon1Moves
	ld a, [wCurPartyMon]
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes

	ld b, NUM_MOVES
.check_move
	ld a, [hli]
	cp d
	jr z, .has_move
	dec b
	jr nz, .check_move
	jr .learn
.has_move

	pop hl
	jr .find_move

.learn
	ld a, d
	ld [wPutativeTMHMMove], a
	ld [wd265], a
	call GetMoveName
	call CopyName1
	predef LearnMove
	pop hl
	jr .find_move

.done
	ld a, [CurPartySpecies]
	ld [wd265], a
	ret
; 424e1


FillMoves: ; 424e1
; Fill in moves at de for CurPartySpecies at CurPartyLevel
 
    push hl
    push de
    push bc
    ld b, 0
    ld a, [CurPartySpecies]
    ld hl, EvosAttacksPointers
	ld c, a
    cp EXEGGUTOR
    jp z, .exeggutor
	cp VULPIX
	jp z, .vulpix
	cp SANDSHREW
	jp z, .sandshrew
	cp RATTATA
	jp z, .rattata
	cp RATICATE
	jp z, .raticate
	cp DIGLETT
	jp z, .diglett
	cp DUGTRIO
	jp z, .dugtrio
	cp GEODUDE
	jp z, .geodude
	cp GRAVELER
	jp z, .graveler
	cp GRIMER
	jp z, .grimer
	cp MUK
	jp z, .muk
	cp MAROWAK
	jp z, .marowak
.got_pointers
	ld a, c
    dec a
    add a
    rl b
    ld c, a
    add hl, bc
.got_form_pointer
    ld a, [hli]
    ld h, [hl]
    ld l, a
.GoToAttacks:
    ld a, [hli]
    and a
    jr nz, .GoToAttacks
    jp .GetLevel
   
.exeggutor
	ld a, [TempMonForm]
    and FORM_MASK
	cp EXEGGUTOR_KANTONESE_FORM
	ld a, c
    jp nz, .got_pointers
    ld hl, KantoneseExeggutorFormEvosAttacksPointers
    jp .got_form_pointer
   
.vulpix
	ld a, [TempMonForm]
    and FORM_MASK
	cp VULPIX_KANTONESE_FORM
    jp nz, .got_pointers
    ld hl, KantoneseVulpixFormEvosAttacksPointers
    jp .got_form_pointer
   
.sandshrew
	ld a, [TempMonForm]
    and FORM_MASK
	cp SANDSHREW_ALOLAN_FORM
    jp nz, .got_pointers
    ld hl, AlolanSandshrewFormEvosAttacksPointers
    jp .got_form_pointer

.rattata
	ld a, [TempMonForm]
    and FORM_MASK
	cp RATTATA_KANTONESE_FORM
    jp nz, .got_pointers
    ld hl, KantoneseRattataFormEvosAttacksPointers
    jp .got_form_pointer
   
.raticate
	ld a, [TempMonForm]
    and FORM_MASK
	cp RATICATE_KANTONESE_FORM
    jp nz, .got_pointers
    ld hl, KantoneseRaticateFormEvosAttacksPointers
    jp .got_form_pointer
   
.diglett
	ld a, [TempMonForm]
    and FORM_MASK
	cp DIGLETT_KANTONESE_FORM
    jp nz, .got_pointers
    ld hl, KantoneseDiglettFormEvosAttacksPointers
    jp .got_form_pointer
   
.dugtrio
	ld a, [TempMonForm]
    and FORM_MASK
	cp DUGTRIO_KANTONESE_FORM
    jp nz, .got_pointers
    ld hl, KantoneseDugtrioFormEvosAttacksPointers
    jp .got_form_pointer
   
.geodude
	ld a, [TempMonForm]
    and FORM_MASK
	cp GEODUDE_KANTONESE_FORM
    jp nz, .got_pointers
    ld hl, KantoneseGeodudeFormEvosAttacksPointers
    jp .got_form_pointer
   
.graveler
	ld a, [TempMonForm]
    and FORM_MASK
	cp GRAVELER_KANTONESE_FORM
    jp nz, .got_pointers
    ld hl, KantoneseGravelerFormEvosAttacksPointers
    jp .got_form_pointer
   
.grimer
	ld a, [TempMonForm]
    and FORM_MASK
	cp GRIMER_KANTONESE_FORM
    jp nz, .got_pointers
    ld hl, KantoneseGrimerFormEvosAttacksPointers
    jp .got_form_pointer
   
.muk
	ld a, [TempMonForm]
    and FORM_MASK
	cp MUK_KANTONESE_FORM
    jp nz, .got_pointers
    ld hl, KantoneseMukFormEvosAttacksPointers
    jp .got_form_pointer
   
.marowak
	ld a, [TempMonForm]
    and FORM_MASK
	cp MAROWAK_KANTONESE_FORM
    jp nz, .got_pointers
    ld hl, KantoneseMarowakFormEvosAttacksPointers
    jp .got_form_pointer

.NextMove:
	pop de
.GetMove:
	inc hl
.GetLevel:
	ld a, [hli]
	and a
	jp z, .done
	ld b, a
	ld a, [CurPartyLevel]
	cp b
	jp c, .done
	ld a, [wEvolutionOldSpecies]
	and a
	jr z, .CheckMove
	ld a, [wd002]
	cp b
	jr nc, .GetMove

.CheckMove:
	push de
	ld c, NUM_MOVES
.CheckRepeat:
	ld a, [de]
	inc de
	cp [hl]
	jr z, .NextMove
	dec c
	jr nz, .CheckRepeat
	pop de
	push de
	ld c, NUM_MOVES
.CheckSlot:
	ld a, [de]
	and a
	jr z, .LearnMove
	inc de
	dec c
	jr nz, .CheckSlot
	pop de
	push de
	push hl
	ld h, d
	ld l, e
	call ShiftMoves
	ld a, [wEvolutionOldSpecies]
	and a
	jr z, .ShiftedMove
	push de
	ld bc, PartyMon1PP - (PartyMon1Moves + NUM_MOVES - 1)
	add hl, bc
	ld d, h
	ld e, l
	call ShiftMoves
	pop de

.ShiftedMove:
	pop hl

.LearnMove:
	ld a, [hl]
	ld [de], a
	ld a, [wEvolutionOldSpecies]
	and a
	jr z, .NextMove
	push hl
	ld a, [hl]
	ld hl, MON_PP - MON_MOVES
	add hl, de
	push hl
	dec a
	ld hl, Moves + MOVE_PP
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	pop hl
	ld [hl], a
	pop hl
	jr .NextMove

.done
	pop bc
	pop de
	pop hl
	ret
; 4256e

ShiftMoves: ; 4256e
	ld c, NUM_MOVES - 1
.loop
	inc de
	ld a, [de]
	ld [hli], a
	dec c
	jr nz, .loop
	ret
; 42577


EvoFlagAction: ; 42577
	push de
	ld d, $0
	predef FlagPredef
	pop de
	ret
; 42581

GetPreEvolution: ; 42581
; Find the first mon to evolve into CurPartySpecies.

; Return carry and the new species in CurPartySpecies
; if a pre-evolution is found.
; necessary for Polished Crystal for Breeding. Orange has no breeding now.

	ld c, 0
.loop ; For each Pokemon...
	ld hl, EvosAttacksPointers
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
.loop2 ; For each evolution...
	ld a, [hli]
	and a
	jr z, .no_evolve ; If we jump, this Pokemon does not evolve into CurPartySpecies.
	cp EVOLVE_STAT ; This evolution type has the extra parameter of stat comparison.
	jr z, .tyrogue
	cp EVOLVE_MAP ; This evolution type has the extra parameter of map group.
	jr nz, .not_two_bytes
.tyrogue
	inc hl

.not_two_bytes
	inc hl
	ld a, [CurPartySpecies]
	cp [hl]
	jr z, .found_preevo
	inc hl
	ld a, [hl]
	and a
	jr nz, .loop2

.no_evolve
	inc c
	ld a, c
	cp NUM_POKEMON
	jr c, .loop
	and a
	ret

.found_preevo
	inc c
	ld a, c
	ld [CurPartySpecies], a
	scf
	ret
; 425b1
