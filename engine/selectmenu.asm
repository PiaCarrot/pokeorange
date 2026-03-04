SelectMenu:: ; 13327

	call CheckRegisteredItem
	jp nc, UseRegisteredItem

	call OpenText
	ld b, BANK(ItemMayBeRegisteredText)
	ld hl, ItemMayBeRegisteredText
	call MapTextbox
	call WaitButton
	jp CloseText
; 13340


ItemMayBeRegisteredText: ; 13340
	text_jump UnknownText_0x1c1cf3
	db "@"
; 13345


CheckRegisteredItem: ; 13345

	ld a, [WhichRegisteredItem]
	and a
	jr z, .NoRegisteredItem
	and REGISTERED_POCKET
	rlca
	rlca
	ld hl, .Pockets
	rst JumpTable
	ret

.Pockets:
	dw .CheckItem
	dw .CheckBall
	dw .CheckKeyItem
	dw .CheckTMHM

.CheckItem:
	ld hl, NumItems
	call .CheckRegisteredNo
	jr c, .NoRegisteredItem
	inc hl
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	call .IsSameItem
	jr c, .NoRegisteredItem
	and a
	ret

.CheckKeyItem:
	ld a, [RegisteredItem]
	ld hl, KeyItems
	ld de, 1
	call IsInArray
	jr nc, .NoRegisteredItem
	ld a, [RegisteredItem]
	ld [wCurItem], a
	and a
	ret

.CheckBall:
	ld hl, NumBalls
	call .CheckRegisteredNo
	jr nc, .NoRegisteredItem
	inc hl
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	call .IsSameItem
	jr c, .NoRegisteredItem
	ret

.CheckTMHM:
.NoRegisteredItem:
	xor a
	ld [WhichRegisteredItem], a
	ld [RegisteredItem], a
	scf
	ret
; 133a6


.CheckRegisteredNo: ; 133a6
	ld a, [WhichRegisteredItem]
	and REGISTERED_NUMBER
	dec a
	cp [hl]
	jr nc, .NotEnoughItems
	ld [wd107], a
	and a
	ret

.NotEnoughItems:
	scf
	ret
; 133b6


.IsSameItem: ; 133b6
	ld a, [RegisteredItem]
	cp [hl]
	jr nz, .NotSameItem
	ld [wCurItem], a
	and a
	ret

.NotSameItem:
	scf
	ret
; 133c3


UseRegisteredItem: ; 133c3

	farcall CheckItemMenu

	;handle Town Map for Fly
	ld a, [wCurItem]
	cp TOWN_MAP
	jr nz, .skipTownMap

	;if fast TMHM isn't enabled, use normal town map
	ld a, [StatusFlags2]
	bit 3, a
	jr z, .handleTownMapNoFly

	;if player has fly, continue
	ld hl, TMsHMs
	ld b, 0
	ld c, FLY_TMNUM - 1 ; FLY
	add hl, bc
	ld a, [hl] ; not using "bit 0, [hl]" because it would fail in case there are multiple TMs stored. Not possible in normal playtrough though
	and a
	jr z, .handleTownMapNoFly
	
	; Change the attribute to close the menu if using the map for Fly
	ld a, 06
	ld [wItemAttributeParamBuffer], a
	jr .skipTownMap

.handleTownMapNoFly
	; Signal to use normal Town Map instead of FlyMap
	ld a, -1
	ld [EnemyMonUnused], a
	ld a, 1
	ld [wUsingItemWithSelect], a

.skipTownMap

	ld a, [wItemAttributeParamBuffer]
	ld hl, .SwitchTo
	rst JumpTable
	ret

.SwitchTo:
	dw .CantUse
	dw .NoFunction
	dw .NoFunction
	dw .NoFunction
	dw .Current
	dw .Party
	dw .Overworld
; 133df

.NoFunction: ; 133df
	call OpenText
	call CantUseItem
	call CloseText
	and a
	ret
; 133ea

.Current: ; 133ea
	call OpenText
	call DoItemEffect
	call CloseText
	and a
	ret
; 133f5

.Party: ; 133f5
	call RefreshScreen
	call FadeToMenu
	call DoItemEffect
	call CloseSubmenu
	call CloseText
	and a
	ret
; 13406

.Overworld: ; 13406
	call RefreshScreen
	ld a, 1
	ld [wUsingItemWithSelect], a
	call DoItemEffect
	xor a
	ld [wUsingItemWithSelect], a
	ld a, [wItemEffectSucceeded]
	cp 1
	jr nz, ._cantuse
	scf
	ld a, HMENURETURN_SCRIPT
	ld [hMenuReturn], a
	ret
; 13422

.CantUse: ; 13422
	call RefreshScreen

._cantuse
	ld a, [EnemyMonUnused]
	and a
	jr nz, .skip_oak
	call CantUseItem
.skip_oak
	call CloseText
	and a
	ret
; 1342d
