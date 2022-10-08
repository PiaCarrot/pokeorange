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
