TMHMPocket: ; 2c76f (b:476f)
	ld a, $1
	ld [hInMenu], a
	call TMHM_PocketLoop
	ld a, $0
	ld [hInMenu], a
	ret nc
	call PlaceHollowCursor
	call WaitBGMap
	ld a, [wCurItem]
	dec a
	ld [CurItemQuantity], a
	ld hl, TMsHMs
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ld [wItemQuantityBuffer], a
	call .ConvertItemToTMHMNumber
	scf
	ret

.ConvertItemToTMHMNumber: ; 2c798 (b:4798)
	ld a, [wCurItem]
	ld c, a
	farcall GetNumberedTMHM
	ld a, c
	ld [wCurItem], a
	ret

ConvertCurItemIntoCurTMHM: ; 2c7a7 (b:47a7)
	ld a, [wCurItem]
	ld c, a
	farcall GetTMHMNumber
	ld a, c
	ld [wCurTMHM], a
	ret

GetTMHMItemMove: ; 2c7b6 (b:47b6)
	call ConvertCurItemIntoCurTMHM
	predef_jump GetTMHMMove

AskTeachTMHM: ; 2c7bf (b:47bf)
	ld hl, wOptions
	ld a, [hl]
	push af
	res NO_TEXT_SCROLL, [hl]
	ld a, [wCurItem]
	cp TM01
	jr c, .NotTMHM
	call GetTMHMItemMove
	ld a, [wCurTMHM]
	ld [wPutativeTMHMMove], a
	call GetMoveName
	call CopyName1
	ld hl, Text_BootedTM ; Booted up a TM
	ld a, [wCurItem]
	cp HM01
	jr c, .TM
	ld hl, Text_BootedHM ; Booted up an HM
.TM:
	call PrintText
	ld hl, Text_ItContained
	call PrintText
	call YesNoBox
.NotTMHM:
	pop bc
	ld a, b
	ld [wOptions], a
	ret

ChooseMonToLearnTMHM: ; 2c7fb
	ld hl, StringBuffer2
	ld de, wTMHMMoveNameBackup
	ld bc, 12
	call CopyBytes
	call ClearBGPalettes
ChooseMonToLearnTMHM_NoRefresh: ; 2c80a
	farcall LoadPartyMenuGFX
	farcall InitPartyMenuWithCancel
	farcall InitPartyMenuGFX
	ld a, $3 ; TeachWhichPKMNString
	ld [PartyMenuActionText], a
.loopback
	farcall WritePartyMenuTilemap
	farcall PrintPartyMenuText
	call WaitBGMap
	call SetPalettes
	call DelayFrame
	farcall PartyMenuSelect
	push af
	ld a, [CurPartySpecies]
	cp EGG
	pop bc ; now contains the former contents of af
	jr z, .egg
	push bc
	ld hl, wTMHMMoveNameBackup
	ld de, StringBuffer2
	ld bc, 12
	call CopyBytes
	pop af ; now contains the original contents of af
	ret

.egg
	push hl
	push de
	push bc
	push af
	ld de, SFX_WRONG
	call PlaySFX
	call WaitSFX
	pop af
	pop bc
	pop de
	pop hl
	jr .loopback
; 2c867

TeachTMHM: ; 2c867
	predef CanLearnTMHMMove
	push bc
	ld a, [wCurPartyMon]
	ld hl, PartyMonNicknames
	call GetNick
	pop bc

	ld a, c
	and a
	jr nz, .compatible
	push de
	ld de, SFX_WRONG
	call PlaySFX
	pop de
	ld hl, Text_TMHMNotCompatible
	call PrintText
	jr .nope

.compatible
	farcall KnowsMove
	jr c, .nope

	predef LearnMove
	ld a, b
	and a
	jr z, .nope

	ld a, [wCurItem]
	call IsHM
	ret c

	ld c, HAPPINESS_LEARNMOVE
	farcall ChangeHappiness
	scf
	ret

.nope
	and a
	ret
; 2c8bf (b:48bf)

Text_BootedTM: ; 0x2c8bf
	; Booted up a TM.
	text_jump UnknownText_0x1c0373
	db "@"
; 0x2c8c4

Text_BootedHM: ; 0x2c8c4
	; Booted up an HM.
	text_jump UnknownText_0x1c0384
	db "@"
; 0x2c8c9

Text_ItContained: ; 0x2c8c9
	; It contained @ . Teach @ to a #MON?
	text_jump UnknownText_0x1c0396
	db "@"
; 0x2c8ce

Text_TMHMNotCompatible: ; 0x2c8ce
	; is not compatible with @ . It can't learn @ .
	text_jump UnknownText_0x1c03c2
	db "@"
; 0x2c8d3

TMHM_PocketLoop: ; 2c8d3 (b:48d3)
	xor a
	ld [hBGMapMode], a
	call TMHM_DisplayPocketItems
	ld a, 2
	ld [w2DMenuCursorInitY], a
	ld a, 7
	ld [w2DMenuCursorInitX], a
	ld a, 1
	ld [w2DMenuNumCols], a
	ld a, 5
	sub d
	inc a
	cp 6
	jr nz, .okay
	dec a
.okay
	ld [w2DMenuNumRows], a
	ld a, $c
	ld [w2DMenuFlags1], a
	xor a
	ld [w2DMenuFlags2], a
	ld a, $20
	ld [w2DMenuCursorOffsets], a
	ld a, A_BUTTON | B_BUTTON | D_UP | D_DOWN | D_LEFT | D_RIGHT
	ld [wMenuJoypadFilter], a
	ld a, [wTMHMPocketCursor]
	inc a
	ld [wMenuCursorY], a
	ld a, $1
	ld [wMenuCursorX], a
	jr TMHM_ShowTMMoveDescription

TMHM_JoypadLoop: ; 2c915 (b:4915)
	call TMHM_DisplayPocketItems
	call StaticMenuJoypad
	ld b, a
	ld a, [wMenuCursorY]
	dec a
	ld [wTMHMPocketCursor], a
	xor a
	ld [hBGMapMode], a
	ld a, [w2DMenuFlags2]
	bit 7, a
	jp nz, TMHM_ScrollPocket
	ld a, b
	ld [wMenuJoypad], a
	bit A_BUTTON_F, a
	jp nz, TMHM_ChooseTMorHM
	bit B_BUTTON_F, a
	jp nz, TMHM_ExitPack
	bit D_RIGHT_F, a
	jp nz, TMHM_ExitPocket
	bit D_LEFT_F, a
	jp nz, TMHM_ExitPocket
TMHM_ShowTMMoveDescription: ; 2c946 (b:4946)
	call TMHM_CheckHoveringOverCancel
	jp nc, TMHM_ExitPocket
	hlcoord 0, 12
	lb bc, 4, SCREEN_WIDTH - 2
	call TextBox
	ld a, [wCurItem]
	cp NUM_TMS + NUM_HMS + 1
	jr nc, TMHM_JoypadLoop
	ld [wd265], a
	predef GetTMHMMove
	ld a, [wd265]
	ld [CurSpecies], a
	hlcoord 1, 14
	call PrintMoveDesc
	jp TMHM_JoypadLoop

TMHM_ChooseTMorHM: ; 2c974 (b:4974)
	call TMHM_PlaySFX_ReadText2
	call CountTMsHMs ; This stores the count to wd265.
	ld a, [wMenuCursorY]
	dec a
	ld b, a
	ld a, [wTMHMPocketScrollPosition]
	add b
	ld b, a
	ld a, [wd265]
	cp b
	jr z, _TMHM_ExitPack ; our cursor was hovering over CANCEL
TMHM_CheckHoveringOverCancel: ; 2c98a (b:498a)
	call TMHM_GetCurrentPocketPosition
	ld a, [wMenuCursorY]
	ld b, a
.loop
	inc c
	ld a, c
	cp NUM_TMS + NUM_HMS + 1
	jr nc, .okay
	ld a, [hli]
	and a
	jr z, .loop
	dec b
	jr nz, .loop
	ld a, c
.okay
	ld [wCurItem], a
	cp -1
	ret

TMHM_ExitPack: ; 2c9a5 (b:49a5)
	call TMHM_PlaySFX_ReadText2
_TMHM_ExitPack: ; 2c9a8 (b:49a8)
	ld a, $2
	ld [wMenuJoypad], a
	and a
	ret

TMHM_ExitPocket: ; 2c9af (b:49af)
	and a
	ret

TMHM_ScrollPocket: ; 2c9b1 (b:49b1)
	ld a, b
	bit 7, a
	jr nz, .skip
	ld hl, wTMHMPocketScrollPosition
	ld a, [hl]
	and a
	jp z, TMHM_JoypadLoop
	dec [hl]
	call TMHM_DisplayPocketItems
	jp TMHM_ShowTMMoveDescription

.skip
	call TMHM_GetCurrentPocketPosition
	ld b, 5
.loop
	inc c
	ld a, c
	cp NUM_TMS + NUM_HMS + 1
	jp nc, TMHM_JoypadLoop
	ld a, [hli]
	and a
	jr z, .loop
	dec b
	jr nz, .loop
	ld hl, wTMHMPocketScrollPosition
	inc [hl]
	call TMHM_DisplayPocketItems
	jp TMHM_ShowTMMoveDescription

TMHM_DisplayPocketItems: ; 2c9e2 (b:49e2)
	hlcoord 5, 2
	lb bc, 10, 15
	ld a, " "
	call ClearBox
	call TMHM_GetCurrentPocketPosition
	ld d, $5
.loop2
	inc c
	ld a, c
	cp NUM_TMS + NUM_HMS + 1
	jr nc, .NotTMHM
	ld a, [hli]
	and a
	jr z, .loop2
	ld b, a
	ld a, c
	ld [wd265], a
	push hl
	push de
	push bc
	call TMHMPocket_GetCurrentLineCoord
	push hl
	ld a, [wd265]
	cp NUM_TMS + 1
	jr nc, .HM
	ld de, wd265
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	jr .okay

.HM:
	push af
	sub NUM_TMS
	ld [wd265], a
	ld [hl], "H"
	inc hl
	ld de, wd265
	lb bc, PRINTNUM_RIGHTALIGN | 1, 2
	call PrintNum
	pop af
	ld [wd265], a
.okay
	predef GetTMHMMove
	ld a, [wd265]
	ld [wPutativeTMHMMove], a
	call GetMoveName
	pop hl
	ld bc, 3
	add hl, bc
	push hl
	call PlaceString
	pop hl
	pop bc
	pop de
	pop hl
	dec d
	jr nz, .loop2
	ret

.NotTMHM:
	call TMHMPocket_GetCurrentLineCoord
	inc hl
	inc hl
	inc hl
	push de
	ld de, TMHM_String_Cancel
	call PlaceString
	pop de
	ret

TMHMPocket_GetCurrentLineCoord: ; 2ca86 (b:4a86)
	hlcoord 5, 0
	ld bc, 2 * SCREEN_WIDTH
	ld a, 6
	sub d
	ld e, a
	; AddNTimes
.loop
	add hl, bc
	dec e
	jr nz, .loop
	ret
; 2ca95 (b:4a95)

TMHM_String_Cancel: ; 2caae
	db "CANCEL@"
; 2cab5

TMHM_GetCurrentPocketPosition: ; 2cab5 (b:4ab5)
	ld hl, TMsHMs
	ld a, [wTMHMPocketScrollPosition]
	ld b, a
	inc b
	ld c, 0
.loop
	inc c
	ld a, [hli]
	and a
	jr z, .loop
	dec b
	jr nz, .loop
	dec hl
	dec c
	ret

TMHM_PlaySFX_ReadText2: ; 2cad6 (b:4ad6)
	push de
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	pop de
	ret
; 2cadf (b:4adf)

CountTMsHMs: ; 2cb2a (b:4b2a)
	lb bc, 0, NUM_TMS + NUM_HMS
	ld hl, TMsHMs
.loop
	ld a, [hli]
	and a
	jr z, .skip
	inc b
.skip
	dec c
	jr nz, .loop
	ld a, b
	ld [wd265], a
	ret

PrintMoveDesc: ; 2cb3e
	push hl
	ld hl, MoveDescriptions
	ld a, [CurSpecies]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	jp PlaceString
; 2cb52
