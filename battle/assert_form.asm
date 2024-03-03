AssertEnemyMonType:
	ld a, [EnemyMonPersonality]
    and FORM_MASK
	push bc
	ld b, 3 ;lycanrock check
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

AssertPlayerMonType:
	ld a, [BattleMonPersonality]
    and FORM_MASK
	push bc
	ld b, 3 ;lycanrock check
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

; Strict form typing for specific WILD Pokémon and locations. NOT for trainer battles.
StrictForm:
	ld a, [wBattleMode]
	cp TRAINER_BATTLE
	jp z, .done
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

.crystal_onix
	ld a, [EnemyMonPersonality]
	and GENDER_MASK ;erase form
	or $02 ;enforce form 2 (crystal)
	or %11000000 ;enforce male for crystal onix
	jp .store_enforced_form

.store_enforced_form
	ld [EnemyMonPersonality], a
	ld [TempMonForm], a
.done
	ret
