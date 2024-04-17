BattleCommand_Bugbite:
; Bugbite

	ld a, [hBattleTurn]
	and a
	jr nz, .enemy

; The enemy needs to have an item to eat.

	call .enemyitem
	ld a, [hl]
	and a
	ret z

; Enemy's item needs to be a berry.

	ld [wd265], a
	ld d, a
	call ItemIsBerry
	ret nc

	ld a, [EffectFailed]
	and a
	ret nz

	ld a, [wLinkMode]
	and a
	jr z, .stealenemyitem

	ld a, [wBattleMode]
	dec a
	ret z

.stealenemyitem
	call .playeritem
	ld a, [hl]
	push af ;store player's held item
	ld a, [wd265] ;wd265 holds the berry ID
	ld [hl], a ;overwrite BattleMon held item temporarily
	ld [de], a ;overwrite PartyMon held item temporarily
	
	call GetItemName
	ld hl, EatBerryText
	call StdBattleTextBox
	
	;now we need to actually consume that berry
	farcall HandleBugBiteEatBerry
	
	;restore previous held item from party struct
	call .playeritem
	pop af
	ld [hl], a
	ld [de], a
	;erase enemy berry
	call .enemyitem ;get address for loaded enemy mon and that mon's enemy party 
	xor a
	ld [hl], a ;erase EnemyMonItem
	ld [de], a ;erase OTPartyMonXItem
	
	ret

.enemy

; The player must have an item to steal.

	call .playeritem
	ld a, [hl]
	and a
	ret z

; Enemy's item needs to be a berry.

	ld [wd265], a
	ld d, a
	call ItemIsBerry
	ret nc

	ld a, [EffectFailed]
	and a
	ret nz

; If the enemy eats your berry, it's gone for good
	call .enemyitem
	ld a, [hl]
	push af ;store player's held item
	ld a, [wd265] ;wd265 holds the berry ID
	ld [hl], a ;overwrite BattleMon held item temporarily
	ld [de], a ;overwrite PartyMon held item temporarily
	
	call GetItemName
	ld hl, EatBerryText
	call StdBattleTextBox
	
	;now we need to actually consume that berry
	farcall HandleBugBiteEatBerry
	
	;restore previous held item from party struct
	call .enemyitem
	pop af
	ld [hl], a
	ld [de], a
	;erase player berry
	call .playeritem ;get address for loaded enemy mon and that mon's enemy party 
	xor a
	ld [hl], a ;erase EnemyMonItem
	ld [de], a ;erase OTPartyMonXItem
	
	ret

.playeritem
	ld a, 1
	call BattlePartyAttr
	ld d, h
	ld e, l
	ld hl, BattleMonItem
	ret

.enemyitem
	ld a, 1
	call OTPartyAttr
	ld d, h
	ld e, l
	ld hl, EnemyMonItem
	ret

ItemIsBerry:
	ld a, d
	ld hl, .items
	ld de, 1
	jp IsInArray

.items
	db PINKAN_BERRY
	db PSNCUREBERRY 
	db PRZCUREBERRY 
	db BURNT_BERRY
	db ICE_BERRY
	db BITTER_BERRY
	db MINT_BERRY
	db MIRACLEBERRY
	db MYSTERYBERRY
	db BERRY
	db GOLD_BERRY
	db -1
