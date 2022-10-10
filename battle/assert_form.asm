; Band-Aid
AssertEnemyMonType:
	ld a, [CurSpecies]
	cp RATTATA
	jp z, .dual_form
    cp RATICATE
    jp z, .dual_form
	cp ONIX
	jp z, .dual_form
	cp STEELIX
	jp z, .dual_form
	cp EXEGGUTOR
	jp z, .dual_form
	cp GRIMER
	jp z, .dual_form
	cp MUK
	jp z, .dual_form
	cp VULPIX
	jp z, .dual_form
	cp NINETALES
	jp z, .dual_form
	cp SANDSHREW
	jp z, .dual_form
	cp SANDSLASH
	jp z, .dual_form
    cp DIGLETT
    jp z, .dual_form
    cp DUGTRIO
    jp z, .dual_form
    cp GEODUDE
	jp z, .dual_form
	cp GRAVELER
	jp z, .dual_form
    cp GOLEM
	jp z, .dual_form
    cp MAROWAK
    jp z, .dual_form
    cp RAICHU
    jp z, .dual_form
	cp MEOWTH
	jp z, .meowth
	jp .end
.dual_form
	ld a, [EnemyMonPersonality]
	srl a
	srl a
	srl a
    and FORM_MASK
	push bc
	ld b, 2
    cp b
	pop bc
	jp nz, .end
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
    ld a, [EnemyMonPersonality]
    srl a
	srl a
	srl a
    and FORM_MASK
	push bc
	ld b, 2
    cp b
    pop bc
    jr nz, .end
    ld a, DARK
    ld [EnemyMonType1], a
	ld [EnemyMonType2], a
	jp .end
.end
	ret

; Band-Aid 2
AssertPlayerMonType:
	ld a, [BattleMonSpecies]
	cp RATTATA
	jp z, .dual_form
    cp RATICATE
    jp z, .dual_form
	cp ONIX
	jp z, .dual_form
	cp STEELIX
	jp z, .dual_form
	cp EXEGGUTOR
	jp z, .dual_form
	cp GRIMER
	jp z, .dual_form
	cp MUK
	jp z, .dual_form
	cp VULPIX
	jp z, .dual_form
	cp NINETALES
	jp z, .dual_form
	cp SANDSHREW
	jp z, .dual_form
	cp SANDSLASH
	jp z, .dual_form
    cp DIGLETT
    jp z, .dual_form
    cp DUGTRIO
    jp z, .dual_form
    cp GEODUDE
	jp z, .dual_form
	cp GRAVELER
	jp z, .dual_form
    cp GOLEM
	jp z, .dual_form
    cp MAROWAK
    jp z, .dual_form
    cp RAICHU
    jp z, .dual_form
	cp MEOWTH
	jp z, .meowth
	jp .end
.dual_form
	ld a, [BattleMonPersonality]
	srl a
	srl a
	srl a
    and FORM_MASK
	push bc
	ld b, 2
    cp b
	pop bc
	jp nz, .end
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
    ld a, [BattleMonPersonality]
    srl a
	srl a
	srl a
    and FORM_MASK
	push bc
	ld b, 2
    cp b
    pop bc
    jr nz, .end
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
	ld a, 100
	call RandomRange
	cp 50
	jp c, .female_form
	jp .male_form
.kantonese_sandshrew
	ld a, 100
	call RandomRange
	cp 50
	jp c, .female_normal
	jp .male_normal

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
	ld a, 100
	call RandomRange
	cp 25
	jp nc, .female_normal
	jp .male_normal
.kantonese_vulpix
	ld a, 100
	call RandomRange
	cp 25
	jp nc, .female_form
	jp .male_form

; Meowth is pretty straightforward
.wild_meowth
	ld a, 100
	call RandomRange
	cp 50
	jr nc, .female_normal
	jr .male_normal

.male_form
	ld a, %11110000
	jr .load_new_value
.female_form
	ld a, %00110000
	jr .load_new_value
.male_normal
	ld a, %11000000
	jr .load_new_value
.female_normal
	ld a, %00000000
.load_new_value
	ld [EnemyMonPersonality], a
	ld [TempMonForm], a
.done
	ret
