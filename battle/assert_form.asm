;deprecated
AssertEnemyMonType:
	ld a, [EnemyMonPersonality]
    and FORM_MASK
	push bc
	ld b, 3 ;lycanroc check
    cp b
	pop bc
	jp z, .handle_forms
	push bc
	ld b, 2 ;all other alternate forms
	cp b
	pop bc
	jp nz, .end ;if base form, return
.handle_forms
	ld a, [CurSpecies]
	cp RATTATA
	jp z, .rattata
    cp RATICATE
    jp z, .raticate
	cp ONIX
	jp z, .onix
	cp STEELIX
	jp z, .steelix
	cp EXEGGUTOR
	jp z, .exeggutor
	cp GRIMER
	jp z, .grimer
	cp MUK
	jp z, .muk
	cp VULPIX
	jp z, .vulpix
	cp NINETALES
	jp z, .ninetales
	cp SANDSHREW
	jp z, .sandshrew
	cp SANDSLASH
	jp z, .sandslash
    cp DIGLETT
	jp z, .diglett
	cp DUGTRIO
	jp z, .dugtrio
    cp GEODUDE
	jp z, .geodude
	cp GRAVELER
	jp z, .graveler
    cp GOLEM
	jp z, .golem
    cp RAICHU
	jp z, .raichu
	cp MAROWAK
	jp z, .marowak
	jp .end ;failsafe
.rattata
.raticate
	ld a, NORMAL
	ld [EnemyMonType1], a
	ld [EnemyMonType2], a
	jp .end
.steelix
.onix
	ld a, CRYSTAL
	ld [EnemyMonType1], a
	ld [EnemyMonType2], a
	jp .end
.exeggutor
	ld a, GRASS
	ld [EnemyMonType1], a
	ld a, PSYCHIC
	ld [EnemyMonType2], a
	jp .end
.grimer
.muk
	ld a, POISON
	ld [EnemyMonType1], a
	ld [EnemyMonType2], a
	jp .end
.vulpix
.ninetales
	ld a, FIRE
	ld [EnemyMonType1], a
	ld [EnemyMonType2], a
	jp .end
.sandshrew
.sandslash
	ld a, ICE
	ld [EnemyMonType1], a
	ld a, STEEL
	ld [EnemyMonType2], a
	jp .end
.diglett
.dugtrio
.marowak
    ld a, GROUND
    ld [EnemyMonType1], a
	ld [EnemyMonType2], a
	jp .end
.geodude
.graveler
.golem
    ld a, ROCK
    ld [EnemyMonType1], a
    ld a, GROUND
    ld [EnemyMonType2], a
    jp .end
.raichu
    ld a, ELECTRIC
    ld [EnemyMonType1], a
	ld [EnemyMonType2], a
	jp .end
.meowth
    ld a, DARK
    ld [EnemyMonType1], a
	ld [EnemyMonType2], a
	jp .end
.end
	ret

;deprecated
AssertPlayerMonType:
	ld a, [BattleMonPersonality]
    and FORM_MASK
	push bc
	ld b, 3 ;lycanroc check
    cp b
	pop bc
	jp z, .handle_forms
	push bc
	ld b, 2 ;all other alternate forms
	cp b
	pop bc
	jp nz, .end ;if base form, return
.handle_forms
	ld a, [BattleMonSpecies]
	cp RATTATA
	jp z, .rattata
    cp RATICATE
    jp z, .raticate
	cp ONIX
	jp z, .onix
	cp STEELIX
	jp z, .steelix
	cp EXEGGUTOR
	jp z, .exeggutor
	cp GRIMER
	jp z, .grimer
	cp MUK
	jp z, .muk
	cp VULPIX
	jp z, .vulpix
	cp NINETALES
	jp z, .ninetales
	cp SANDSHREW
	jp z, .sandshrew
	cp SANDSLASH
	jp z, .sandslash
    cp DIGLETT
	jp z, .diglett
	cp DUGTRIO
	jp z, .dugtrio
    cp GEODUDE
	jp z, .geodude
	cp GRAVELER
	jp z, .graveler
    cp GOLEM
	jp z, .golem
    cp RAICHU
	jp z, .raichu
	cp MAROWAK
	jp z, .marowak
	jp .end ;failsafe
	
.rattata
.raticate
	ld a, NORMAL
	ld [BattleMonType1], a
	ld [BattleMonType2], a
	jp .end
.steelix
.onix
	ld a, CRYSTAL
	ld [BattleMonType1], a
	ld [BattleMonType2], a
	jp .end
.exeggutor
	ld a, GRASS
	ld [BattleMonType1], a
	ld a, PSYCHIC
	ld [BattleMonType2], a
	jp .end
.grimer
.muk
	ld a, POISON
	ld [BattleMonType1], a
	ld [BattleMonType2], a
	jp .end
.vulpix
.ninetales
	ld a, FIRE
	ld [BattleMonType1], a
	ld [BattleMonType2], a
	jp .end
.sandshrew
.sandslash
	ld a, ICE
	ld [BattleMonType1], a
	ld a, STEEL
	ld [BattleMonType2], a
	jp .end
.diglett
.dugtrio
.marowak
    ld a, GROUND
    ld [BattleMonType1], a
	ld [BattleMonType2], a
	jp .end
.geodude
.graveler
.golem
    ld a, ROCK
    ld [BattleMonType1], a
    ld a, GROUND
    ld [BattleMonType2], a
    jp .end
.raichu
    ld a, ELECTRIC
    ld [BattleMonType1], a
	ld [BattleMonType2], a
	jp .end
.meowth
    ld a, DARK
    ld [BattleMonType1], a
	ld [BattleMonType2], a
	jp .end
.end
	ret

; Handles correct form for wild Pokémon and Trainer battles
; Enforces some forms and shinyness for certain wild Pokémon
LoadEnemyMonForm:
	ld a, [wBattleMode]
	cp TRAINER_BATTLE
	jp z, .trainer

	farcall GetWildPersonality
	ld a, b
	ld [EnemyMonPersonality], a
	ld [TempMonForm], a

	; Grab the BaseData for this species
	ld a, [EnemyMonSpecies]
	cp VULPIX
	jr z, .wild_vulpix
	cp MEOWTH
	jp z, .wild_meowth
	cp SANDSHREW
	jp z, .wild_sandshrew
	cp ONIX
	jp z, .wild_onix
	cp POLITOED
	jp z, .wild_politoed
	cp LYCANROC
	jp z, .wild_lycanroc
	cp RATTATA
	jp z, .wild_rats
	cp RATICATE
	jp z, .wild_rats
	cp ARBOK
	jp z, .force_form1
	cp VICTREEBEL
	jp z, .force_form1
	cp POLIWRATH
	jp z, .force_form1

	; Otherwise, we're done
	jp .done

.wild_sandshrew
	ld a, [MapGroup]
	cp 2 ; Alolan Sandshrew appears only in map GROUP 2. First check this.
	jr nz, .kantonese_sandshrew
	ld a, [MapNumber]
	cp 1 ; Tangelo jungle would set the carry flag
	jr c, .kantonese_sandshrew
	cp 5 ; Mt. Navel maps would set the carry flag
	jr nc, .kantonese_sandshrew

	; If we're here, it's the alolan form... which, is NOT default.
	ld a, [EnemyMonPersonality]
	and GENDER_MASK ;erase form
	or $02 ;enforce form 2 (alolan, not default)
	jp .store_enforced_form
.kantonese_sandshrew
	ld a, [EnemyMonPersonality]
	and GENDER_MASK ;erase form
	or $01 ;enforce form 1 (alolan, default)
	jp .store_enforced_form

.wild_vulpix
	ld a, [MapGroup]
	cp 2 ; Alolan Vulpix appears only in map GROUP 2. First check this.
	jr nz, .kantonese_vulpix
	ld a, [MapNumber]
	cp 1 ; Tangelo jungle would set the carry flag
	jr c, .kantonese_vulpix
	cp 5 ; Mt. Navel maps would set the carry flag
	jr nc, .kantonese_vulpix

	; If we're here, it's the alolan form... which, is default.

	ld a, [EnemyMonPersonality]
	and GENDER_MASK ;erase form
	or $01 ;enforce form 1 (alolan, default)
	jp .store_enforced_form
.kantonese_vulpix
	ld a, [EnemyMonPersonality]
	and GENDER_MASK ;erase form
	or $02 ;enforce form 2 (alolan, not default)
	jp .store_enforced_form

; Crystal Onix should only appear in Crystal Cave... and only appear as a MALE. Source: le animu
.wild_onix
	ld a, [MapGroup]
	cp 2 ; Map GROUP 2
	jr nz, .wild_meowth ; This is actually the best way to do this
	ld a, [MapNumber]
	cp 7 ; Crystal Cave BF1, since the map constants are a bit borken
	jr nz, .wild_meowth

	; Alright then, we jump to the male wild Crystal Onix.
	jp .crystal_onix

; Meowth is pretty straightforward
.wild_meowth ;seems only normal form is supposed to appear?
	ld a, [EnemyMonPersonality]
	and GENDER_MASK ;erase form
	or MEOWTH_NORMAL_FORM ;enforce form 1 (normal, default?)
	jp .store_enforced_form

; Ensure Poliwrath, Arbok and Victreebel only appear as base form
.force_form1
	ld a, [EnemyMonPersonality]
	and GENDER_MASK ;erase form
	or 1 ; Form 1
	jp .store_enforced_form

.crystal_onix
	ld a, [EnemyMonPersonality]
	and GENDER_MASK ;erase form
	or $02 ;enforce form 2 (crystal)
	or %11000000 ;enforce male for crystal onix
	jp .store_enforced_form

;UnnamedIsland3 fixed Politoed encounter should be shiny 
.wild_politoed
	ld a, [MapGroup]
	cp 16 ; Map GROUP 16
	jr nz, .done
	ld a, [MapNumber]
	cp 26 ; UnnamedIsland3
	jr nz, .done
	ld a, [BattleType] ;extra check, so wild Politoed fished with the Master Rod are not enforced shiny
	cp BATTLETYPE_SHINY
	jr nz, .done
	ld a, [EnemyMonPersonality]
	or SHINY_MASK ;enforce shiny for the Unnamed Island 3 Politoed
	jp .store_enforced_form

;wild lycanroc form depends on the current time
.wild_lycanroc
    ; 5:00 PM to 5:59 PM = Dusk Lycanroc
    ld a, [hHours]
    cp DUSK_HOUR
    ld b, LYCANROC_DUSK_FORM
    jr z, .got_lycanroc_form
    ; night = Midnight Lycanroc
    ld a, [TimeOfDay]
    cp NITE
    ld b, LYCANROC_MIDNIGHT_FORM
    jr z, .got_lycanroc_form
    ; day = Midday Lycanroc
    ld b, LYCANROC_MIDDAY_FORM
.got_lycanroc_form
	ld a, [EnemyMonPersonality]
	and GENDER_MASK ;erase form
	or b ;
	jp .store_enforced_form

;wild Ratatta and Raticate form depends on the current time
;also prevents RATICATE_ROCKET_FORM from appearing in the wild
.wild_rats
    ; night = Alolan Rats
    ld a, [TimeOfDay]
    cp NITE
    ld b, RATTATA_NORMAL_FORM ; same as RATICATE_NORMAL_FORM, Alolan form
    jr z, .got_rat_form
    ; day = Kantonese Rattata and Raticate
    ld b, RATTATA_KANTONESE_FORM ; same as RATICATE_KANTONESE_FORM
.got_rat_form
	ld a, [EnemyMonPersonality]
	and GENDER_MASK ;erase form
	or b ;
	jp .store_enforced_form


;for trainers, we just need to load and copy the personality byte (gender, shininess, pinkness, form)
.trainer
	ld a, [wCurPartyMon]
	ld hl, OTPartyMon1Personality
	call GetPartyLocation ; bc = PartyMon[wCurPartyMon] - PartyMons
	ld a, [hl] ;personality value is loaded in a
	jp .store_enforced_form

.store_enforced_form
	; This would be a good place to check BATTLETYPE_SHINY and make a global shiny enforce
	ld [EnemyMonPersonality], a
	ld [TempMonForm], a
.done
	ret


; Called in DexEntryScreen_MenuActionJumptable.shiny to handle form toggling at the pokédex
; The function is here because the bank is pretty tight
IsThreeFormMon:
	ld a, [CurPartySpecies]
	cp MEOWTH
	jr z, .yes
	cp RATICATE
	jr z, .yes
	cp LYCANROC
	jr z, .yes
	xor a
	ret
.yes
	scf
	ret
