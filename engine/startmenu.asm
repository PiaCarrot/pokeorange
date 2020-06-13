StartMenu:: ; 125cd

	call ClearWindowData

	ld de, SFX_MENU
	call PlaySFX

	farcall ReanchorBGMap_NoOAMUpdate

	ld hl, StatusFlags2
	bit 2, [hl] ; bug catching contest
	ld hl, .MenuDataHeader
	jr z, .GotMenuData
	ld hl, .ContestMenuDataHeader
.GotMenuData:

	call LoadMenuDataHeader
	call .SetUpMenuItems
	ld a, [wd0d2]
	ld [wMenuCursorBuffer], a
	call .DrawDayTimeBox
	call DrawVariableLengthMenuBox
	call .DrawBugContestStatusBox
	call SafeUpdateSprites
	call _OpenAndCloseMenu_HDMATransferTileMapAndAttrMap
	farcall LoadFonts_NoOAMUpdate
	call .DrawBugContestStatus
	call UpdateTimePals
	jr .Select

.Reopen:
	call UpdateSprites
	call UpdateTimePals
	call .SetUpMenuItems
	ld a, [wd0d2]
	ld [wMenuCursorBuffer], a

.Select:
	call .GetInput
	jr c, .Exit
	call .DrawDayTimeBox
	ld a, [wMenuCursorBuffer]
	ld [wd0d2], a
	call PlayClickSFX
	call PlaceHollowCursor
	call .OpenMenu

; Menu items have different return functions.
; For example, saving exits the menu.
	ld hl, .MenuReturns
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.MenuReturns:
	dw .Reopen
	dw .Exit
	dw .ExitMenuCallFuncCloseText
	dw .ExitMenuRunScriptCloseText
	dw .ExitMenuRunScript
	dw .ReturnEnd
	dw .ReturnRedraw

.Exit:
	ld a, [hOAMUpdate]
	push af
	ld a, 1
	ld [hOAMUpdate], a
	call LoadFontsExtra
	pop af
	ld [hOAMUpdate], a
.ReturnEnd:
	call ExitMenu
.ReturnEnd2:
	call CloseText
	jp UpdateTimePals

.GetInput:
; Return carry on exit, and no-carry on selection.
	xor a
	ld [hBGMapMode], a
	call .DrawDayTimeBox
	call SetUpMenu
	ld a, $ff
	ld [wMenuSelection], a
.loop
	call .PrintDayTime
	call GetScrollingMenuJoypad
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .b
	cp A_BUTTON
	jr nz, .loop
.a
	call PlayClickSFX
	and a
	ret
.b
	scf
	ret
; 12691

.ExitMenuRunScript: ; 12691
	call ExitMenu
	ld a, HMENURETURN_SCRIPT
	ld [hMenuReturn], a
	ret
; 12699

.ExitMenuRunScriptCloseText: ; 12699
	call ExitMenu
	ld a, HMENURETURN_SCRIPT
	ld [hMenuReturn], a
	jr .ReturnEnd2
; 126a2

.ExitMenuCallFuncCloseText: ; 126a2
	call ExitMenu
	ld hl, wQueuedScriptAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wQueuedScriptBank]
	rst FarCall
	jr .ReturnEnd2
; 126b1

.ReturnRedraw: ; 126b1
	call ClearBGPalettes
	call Call_ExitMenu
	call ReloadTilesetAndPalettes
	call .DrawDayTimeBox
	call DrawVariableLengthMenuBox
	call .DrawBugContestStatus
	call UpdateSprites
	call FinishExitMenu
	jp .Reopen
; 126b7

.MenuDataHeader:
	db $40 ; tile backup
	db 0, 10 ; start coords
	db 17, 19 ; end coords
	dw .MenuData
	db 1 ; default selection

.ContestMenuDataHeader:
	db $40 ; tile backup
	db 2, 10 ; start coords
	db 17, 19 ; end coords
	dw .MenuData
	db 1 ; default selection

.MenuData:
	db %10101000 ; x padding, wrap around, start can close
	dn 0, 0 ; rows, columns
	dw MenuItemsList
	dw .ItemName
	dw .Items

.ItemName: ; 127ef
	push de
	ld a, [wMenuSelection]
	call .GetMenuItemTextPointer
	inc hl
	inc hl
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	jp PlaceString
; 12800

.Items:
	dw StartMenu_Pokedex, .PokedexString
	dw StartMenu_Pokemon, .PartyString
	dw StartMenu_Pack,    .PackString
	dw StartMenu_Status,  .StatusString
	dw StartMenu_Save,    .SaveString
	dw StartMenu_Option,  .OptionString
	dw StartMenu_Exit,    .ExitString
	dw StartMenu_Quit,    .QuitString

.PokedexString: db "#DEX@"
.PartyString:   db "#MON@"
.PackString:    db "PACK@"
.StatusString:  db "<PLAYER>@"
.SaveString:    db "SAVE@"
.OptionString:  db "OPTION@"
.ExitString:    db "EXIT@"
.QuitString:    db "QUIT@"


.OpenMenu: ; 127e5
	ld a, [wMenuSelection]
	call .GetMenuItemTextPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
; 127ef


.GetMenuItemTextPointer: ; 12819
	ld e, a
	ld d, 0
	ld hl, wMenuData2PointerTableAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
rept 4
	add hl, de
endr
	ret
; 12829


.SetUpMenuItems: ; 12829
	xor a
	ld [wWhichIndexSet], a
	call .FillMenuList

	ld hl, StatusFlags
	bit 0, [hl]
	jr z, .no_pokedex
	ld a, 0 ; pokedex
	call .AppendMenuList
.no_pokedex

	ld a, [PartyCount]
	and a
	jr z, .no_pokemon
	ld a, 1 ; pokemon
	call .AppendMenuList
.no_pokemon

	ld a, [wLinkMode]
	and a
	jr nz, .no_pack
	ld hl, StatusFlags2
	bit 2, [hl] ; bug catching contest
	jr nz, .no_pack
	ld a, 2 ; pack
	call .AppendMenuList
.no_pack

	ld a, 3 ; status
	call .AppendMenuList

	ld a, [wLinkMode]
	and a
	jr nz, .no_save
	ld hl, StatusFlags2
	bit 2, [hl] ; bug catching contest
	ld a, 7 ; quit
	jr nz, .write
	ld a, 4 ; save
.write
	call .AppendMenuList
.no_save

	ld a, 5 ; option
	call .AppendMenuList
	ld a, 6 ; exit
	call .AppendMenuList
	ld a, c
	ld [MenuItemsList], a
	ret
; 1288d


.FillMenuList: ; 1288d
	xor a
	ld hl, MenuItemsList
	ld [hli], a
	ld a, -1
	ld bc, MenuItemsListEnd - (MenuItemsList + 1)
	call ByteFill
	ld de, MenuItemsList + 1
	ld c, 0
	ret
; 128a0

.AppendMenuList: ; 128a0
	ld [de], a
	inc de
	inc c
	ret
; 128a4

.DrawDayTimeBox: ; 128b4
	hlcoord 0, 13
	lb bc, 5, 10
	call ClearBox
	hlcoord 0, 13
	lb bc, 3, 8
	jp TextBoxPalette
; 128cb

.PrintDayTime: ; 128a7
	call .DrawDayTimeBox
	bccoord 0, 14
	farcall Text_TX_DAY
	ld a, [hHours]
	ld b, a
	ld a, [hMinutes]
	ld c, a
	decoord 0, 16
	farcall PrintHoursMins
	ret
; 128b4

.DrawBugContestStatusBox: ; 128d1
	ld hl, StatusFlags2
	bit 2, [hl] ; bug catching contest
	ret z
	farcall StartMenu_DrawBugContestStatusBox
	ret
; 128de

.DrawBugContestStatus: ; 128de
	ld hl, StatusFlags2
	bit 2, [hl] ; bug catching contest
	jr nz, .contest
	ret
.contest
	farcall StartMenu_PrintBugContestStatus
	ret
; 128ed


StartMenu_Exit: ; 128ed
; Exit the menu.

	ld a, 1
	ret
; 128f0


StartMenu_Quit: ; 128f0
; Retire from the bug catching contest.

	ld hl, .EndTheContestText
	call StartMenuYesNo
	jr c, .DontEndContest
	ld a, BANK(BugCatchingContestReturnToGateScript)
	ld hl, BugCatchingContestReturnToGateScript
	call FarQueueScript
	ld a, 4
	ret

.DontEndContest:
	ld a, 0
	ret

.EndTheContestText:
	text_jump UnknownText_0x1c1a6c
	db "@"
; 1290b


StartMenu_Save: ; 1290b
; Save the game.

	call BufferScreen
	farcall SaveMenu
	jr nc, .asm_12919
	ld a, 0
	ret
.asm_12919
	ld a, 1
	ret
; 1291c


StartMenu_Option: ; 1291c
; Game options.

	call FadeToMenu
	farcall OptionsMenu
	ld a, 6
	ret
; 12928


StartMenu_Status: ; 12928
; Player status.

	call FadeToMenu
	farcall TrainerCard
	call CloseSubmenu
	ld a, 0
	ret
; 12937


StartMenu_Pokedex: ; 12937

	ld a, [PartyCount]
	and a
	jr z, .asm_12949

	call FadeToMenu
	farcall Pokedex
	call CloseSubmenu

.asm_12949
	ld a, 0
	ret
; 1294c


StartMenu_Pack: ; 1295b

	call FadeToMenu
	farcall Pack
	ld a, [wcf66]
	and a
	jr nz, .used_item
	call CloseSubmenu
	ld a, 0
	ret

.used_item
	call ExitAllMenus
	ld a, 4
	ret
; 12976


StartMenu_Pokemon: ; 12976

	ld a, [PartyCount]
	and a
	jr z, .return

	call FadeToMenu

.choosemenu
	xor a
	ld [PartyMenuActionText], a ; Choose a POKéMON.
	call ClearBGPalettes

.menu
	farcall LoadPartyMenuGFX
	farcall InitPartyMenuWithCancel
	farcall InitPartyMenuGFX

.menunoreload
	farcall WritePartyMenuTilemap
	farcall PrintPartyMenuText
	call WaitBGMap
	call SetPalettes ; load regular palettes?
	call DelayFrame
	farcall PartyMenuSelect
	jr c, .return ; if cancelled or pressed B

	call PokemonActionSubmenu
	cp 3
	jr z, .menu
	and a
	jr z, .choosemenu
	cp 1
	jr z, .menunoreload
	cp 2
	jr z, .quit

.return
	call CloseSubmenu
	ld a, 0
	ret

.quit
	ld a, b
	push af
	call ExitAllMenus
	pop af
	ret
; 129d5

HasNoItems: ; 129d5
	ld a, [NumItems]
	and a
	ret nz
	ld a, [NumKeyItems]
	and a
	ret nz
	ld a, [NumBalls]
	and a
	ret nz
	ld hl, TMsHMs
	ld b, NUM_TMS + NUM_HMS
.loop
	ld a, [hli]
	and a
	jr nz, .done
	dec b
	jr nz, .loop
	scf
	ret
.done
	and a
	ret

TossItemFromPC: ; 129f4
	push de
	call PartyMonItemName
	farcall _CheckTossableItem
	ld a, [wItemAttributeParamBuffer]
	and a
	jr nz, .key_item
	ld hl, .TossHowMany
	call MenuTextBox
	farcall SelectQuantityToToss
	push af
	call CloseWindow
	call ExitMenu
	pop af
	jr c, .quit
	ld hl, .ConfirmToss
	call MenuTextBox
	call YesNoBox
	push af
	call ExitMenu
	pop af
	jr c, .quit
	pop hl
	ld a, [wd107]
	call TossItem
	call PartyMonItemName
	ld hl, .TossedThisMany
	call MenuTextBox
	call ExitMenu
	and a
	ret

.key_item
	call .CantToss
.quit
	pop hl
	scf
	ret

.TossHowMany:
	; Toss out how many @ (S)?
	text_jump UnknownText_0x1c1a90
	db "@"

.ConfirmToss:
	; Throw away @ @ (S)?
	text_jump UnknownText_0x1c1aad
	db "@"

.TossedThisMany:
	; Discarded @ (S).
	text_jump UnknownText_0x1c1aca
	db "@"

.CantToss:
	ld hl, .TooImportantToToss
	jp MenuTextBoxBackup

.TooImportantToToss:
	; That's too impor- tant to toss out!
	text_jump UnknownText_0x1c1adf
	db "@"
; 0x12a60

CantUseItem: ; 12a60
	ld hl, CantUseItemText
	jp MenuTextBoxWaitButton
; 12a67

CantUseItemText: ; 12a67
	text_jump UnknownText_0x1c1b03
	db "@"
; 12a6c


PartyMonItemName: ; 12a6c
	ld a, [wCurItem]
	ld [wd265], a
	call GetItemName
	jp CopyName1
; 12a79


CancelPokemonAction: ; 12a79
	farcall InitPartyMenuWithCancel
	farcall UnfreezeMonIcons
	ld a, 1
	ret
; 12a88


PokemonActionSubmenu: ; 12a88
	hlcoord 1, 15
	lb bc, 2, 18
	call ClearBox
	farcall MonSubmenu
	call GetCurNick
	ld a, [wMenuSelection]
	ld hl, .Actions
	ld de, 3
	call IsInArray
	jr nc, .nothing

	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.nothing
	ld a, 0
	ret

.Actions:
	dbw MONMENU_CUT,        MonMenu_Cut ; Cut
	dbw MONMENU_FLY,        MonMenu_Fly ; Fly
	dbw MONMENU_SURF,       MonMenu_Surf ; Surf
	dbw MONMENU_STRENGTH,   MonMenu_Strength ; Strength
	dbw MONMENU_ROCKSMASH,  MonMenu_RockSmash ; Rock Smash
	dbw MONMENU_DIVE,       MonMenu_Dive ; Dive
	dbw MONMENU_WATERFALL,  MonMenu_Waterfall ; Waterfall
	dbw MONMENU_ROCK_CLIMB, MonMenu_RockClimb ; Rock Climb

	dbw MONMENU_FLASH,      MonMenu_Flash ; Flash
	dbw MONMENU_WHIRLPOOL,  MonMenu_Whirlpool ; Whirlpool
	dbw MONMENU_DIG,        MonMenu_Dig ; Dig
	dbw MONMENU_TELEPORT,   MonMenu_Teleport ; Teleport
	dbw MONMENU_SOFTBOILED, MonMenu_Softboiled ; Softboiled
	dbw MONMENU_HEADBUTT,   MonMenu_Headbutt ; Headbutt
	dbw MONMENU_SWEETSCENT, MonMenu_SweetScent ; Sweet Scent
	dbw MONMENU_STATS,      OpenPartyStats
	dbw MONMENU_SWITCH,     SwitchPartyMons
	dbw MONMENU_ITEM,       GiveTakePartyMonItem
	dbw MONMENU_CANCEL,     CancelPokemonAction
	dbw MONMENU_MOVE,       ManagePokemonMoves ; move
	dbw MONMENU_MAIL,       MonMailAction ; mail
; 12aec


SwitchPartyMons: ; 12aec

; Don't try if there's nothing to switch!
	ld a, [PartyCount]
	cp 2
	jr c, .DontSwitch

	ld a, [wCurPartyMon]
	inc a
	ld [wSwitchMon], a

	farcall HoldSwitchmonIcon
	farcall InitPartyMenuNoCancel

	ld a, 4
	ld [PartyMenuActionText], a
	farcall WritePartyMenuTilemap
	farcall PrintPartyMenuText

	hlcoord 0, 1
	ld bc, 20 * 2
	ld a, [wSwitchMon]
	dec a
	call AddNTimes
	ld [hl], "▷"
	call WaitBGMap
	call SetPalettes
	call DelayFrame

	farcall PartyMenuSelect
	bit 1, b
	jr c, .DontSwitch

	farcall _SwitchPartyMons

	xor a
	ld [PartyMenuActionText], a

	farcall LoadPartyMenuGFX
	farcall InitPartyMenuWithCancel
	farcall InitPartyMenuGFX

	ld a, 1
	ret

.DontSwitch:
	xor a
	ld [PartyMenuActionText], a
	jp CancelPokemonAction
; 12b60


GiveTakePartyMonItem: ; 12b60

; Eggs can't hold items!
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .cancel

	ld hl, GiveTakeItemMenuData
	call LoadMenuDataHeader
	call VerticalMenu
	call ExitMenu
	jr c, .cancel

	call GetCurNick
	ld hl, StringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	ld a, [wMenuCursorY]
	cp 1
	jr nz, .take

	call LoadStandardMenuDataHeader
	call ClearPalettes
	call .GiveItem
	call ClearPalettes
	call LoadFontsBattleExtra
	call ExitMenu
	ld a, 0
	ret

.take
	call TakePartyItem
	ld a, 3
	ret

.cancel
	ld a, 3
	ret
; 12ba9


.GiveItem:

	farcall DepositSellInitPackBuffers

.loop
	farcall DepositSellPack

	ld a, [wcf66]
	and a
	ret z

	ld a, [wcf65]
	cp 2
	jr z, .next

	call CheckTossableItem
	ld a, [wItemAttributeParamBuffer]
	and a
	jr z, TryGiveItemToPartymon

.next
	ld hl, CantBeHeldText
	call MenuTextBoxBackup
	jr .loop
; 12bd9


TryGiveItemToPartymon: ; 12bd9

	call SpeechTextBox
	call PartyMonItemName
	call GetPartyItemLocation
	ld a, [hl]
	and a
	jr z, .give_item_to_mon

	push hl
	ld d, a
	farcall ItemIsMail
	pop hl
	jr c, .please_remove_mail
	ld a, [hl]
	jr .already_holding_item

.give_item_to_mon
	call GiveItemToPokemon
	ld hl, MadeHoldText
	call MenuTextBoxBackup
	jp GivePartyItem

.please_remove_mail
	ld hl, PleaseRemoveMailText
	jp MenuTextBoxBackup

.already_holding_item
	ld [wd265], a
	call GetItemName
	ld hl, SwitchAlreadyHoldingText
	call StartMenuYesNo
	ret c

	call GiveItemToPokemon
	ld a, [wd265]
	push af
	ld a, [wCurItem]
	ld [wd265], a
	pop af
	ld [wCurItem], a
	call ReceiveItemFromPokemon
	jr nc, .bag_full

	ld hl, TookAndMadeHoldText
	call MenuTextBoxBackup
	ld a, [wd265]
	ld [wCurItem], a
	jp GivePartyItem

.bag_full
	ld a, [wd265]
	ld [wCurItem], a
	call ReceiveItemFromPokemon
	ld hl, ItemStorageIsFullText
	jp MenuTextBoxBackup
; 12c4c


GivePartyItem: ; 12c4c

	call GetPartyItemLocation
	ld a, [wCurItem]
	ld [hl], a
	ld d, a
	farcall ItemIsMail
	ret nc
	jp ComposeMailMessage
; 12c60


TakePartyItem: ; 12c60

	call SpeechTextBox
	call GetPartyItemLocation
	ld a, [hl]
	and a
	jr z, .asm_12c8c

	ld [wCurItem], a
	call ReceiveItemFromPokemon
	jr nc, .asm_12c94

	farcall ItemIsMail
	call GetPartyItemLocation
	ld a, [hl]
	ld [wd265], a
	ld [hl], NO_ITEM
	call GetItemName
	ld hl, TookFromText
	jp MenuTextBoxBackup

.asm_12c8c
	ld hl, IsntHoldingAnythingText
	jp MenuTextBoxBackup

.asm_12c94
	ld hl, ItemStorageIsFullText
	jp MenuTextBoxBackup
; 12c9b


GiveTakeItemMenuData: ; 12c9b
	db %01010000
	db 12, 12 ; start coords
	db 17, 19 ; end coords
	dw .Items
	db 1 ; default option

.Items:
	db %10000000 ; x padding
	db 2 ; # items
	db "GIVE@"
	db "TAKE@"
; 12caf


TookAndMadeHoldText: ; 12caf
	text_jump UnknownText_0x1c1b2c
	db "@"
; 12cb4

MadeHoldText: ; 12cb4
	text_jump UnknownText_0x1c1b57
	db "@"
; 12cb9

PleaseRemoveMailText: ; 12cb9
	text_jump UnknownText_0x1c1b6f
	db "@"
; 12cbe

IsntHoldingAnythingText: ; 12cbe
	text_jump UnknownText_0x1c1b8e
	db "@"
; 12cc3

ItemStorageIsFullText: ; 12cc3
	text_jump UnknownText_0x1c1baa
	db "@"
; 12cc8

TookFromText: ; 12cc8
	text_jump UnknownText_0x1c1bc4
	db "@"
; 12ccd

SwitchAlreadyHoldingText: ; 12ccd
	text_jump UnknownText_0x1c1bdc
	db "@"
; 12cd2

CantBeHeldText: ; 12cd2
	text_jump UnknownText_0x1c1c09
	db "@"
; 12cd7


GetPartyItemLocation: ; 12cd7
	push af
	ld a, MON_ITEM
	call GetPartyParamLocation
	pop af
	ret
; 12cdf


ReceiveItemFromPokemon: ; 12cdf
	ld a, $1
	ld [wItemQuantityChangeBuffer], a
	ld hl, NumItems
	jp ReceiveItem
; 12cea


GiveItemToPokemon: ; 12cea (4:6cea)
	ld a, $1
	ld [wItemQuantityChangeBuffer], a
	ld hl, NumItems
	jp TossItem

StartMenuYesNo: ; 12cf5
	call MenuTextBox
	call YesNoBox
	jp ExitMenu
; 12cfe


ComposeMailMessage: ; 12cfe (4:6cfe)
	ld de, wTempMailMessage
	farcall _ComposeMailMessage
	ld hl, PlayerName
	ld de, wTempMailAuthor
	ld bc, NAME_LENGTH - 1
	call CopyBytes
	ld hl, PlayerID
	ld bc, 2
	call CopyBytes
	ld a, [CurPartySpecies]
	ld [de], a
	inc de
	ld a, [wCurItem]
	ld [de], a
	ld a, [wCurPartyMon]
	ld hl, sPartyMail
	ld bc, MAIL_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wTempMail
	ld bc, MAIL_STRUCT_LENGTH
	ld a, BANK(sPartyMail)
	call GetSRAMBank
	call CopyBytes
	jp CloseSRAM

MonMailAction: ; 12d45
; If in the time capsule or trade center,
; selecting the mail only allows you to
; read the mail.
	ld a, [wLinkMode]
	cp LINK_TRADECENTER
	jr z, .read

; Show the READ/TAKE/QUIT menu.
	ld hl, .MenuDataHeader
	call LoadMenuDataHeader
	call VerticalMenu
	call ExitMenu

; Interpret the menu.
	jp c, .done
	ld a, [wMenuCursorY]
	cp $1
	jr z, .read
	cp $2
	jr z, .take
	jp .done

.read
	farcall ReadPartyMonMail
	ld a, $0
	ret

.take
	ld hl, .sendmailtopctext
	call StartMenuYesNo
	jr c, .RemoveMailToBag
	ld a, [wCurPartyMon]
	ld b, a
	farcall SendMailToPC
	jr c, .MailboxFull
	ld hl, .sentmailtopctext
	call MenuTextBoxBackup
	jr .done

.MailboxFull:
	ld hl, .mailboxfulltext
	call MenuTextBoxBackup
	jr .done

.RemoveMailToBag:
	ld hl, .mailwilllosemessagetext
	call StartMenuYesNo
	jr c, .done
	call GetPartyItemLocation
	ld a, [hl]
	ld [wCurItem], a
	call ReceiveItemFromPokemon
	jr nc, .BagIsFull
	call GetPartyItemLocation
	ld [hl], $0
	call GetCurNick
	ld hl, .tookmailfrommontext
	call MenuTextBoxBackup
	jr .done

.BagIsFull:
	ld hl, .bagfulltext
	call MenuTextBoxBackup
	; fallthrough

.done
	ld a, $3
	ret
; 12dc9


.MenuDataHeader:
	db $40 ; flags
	db 10, 12 ; start coords
	db 17, 19 ; end coords
	dw .MenuData2
	db 1 ; default option
; 0x12dd1

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "READ@"
	db "TAKE@"
	db "QUIT@"
; 0x12de2


.mailwilllosemessagetext
; The MAIL will lose its message. OK?
	text_jump UnknownText_0x1c1c22
	db "@"
; 0x12de7

.tookmailfrommontext
; MAIL detached from <POKEMON>.
	text_jump UnknownText_0x1c1c47
	db "@"
; 0x12dec

.bagfulltext
; There's no space for removing MAIL.
	text_jump UnknownText_0x1c1c62
	db "@"
; 0x12df1

.sendmailtopctext
; Send the removed MAIL to your PC?
	text_jump UnknownText_0x1c1c86
	db "@"
; 0x12df6

.mailboxfulltext
; Your PC's MAILBOX is full.
	text_jump UnknownText_0x1c1ca9
	db "@"
; 0x12dfb

.sentmailtopctext
; The MAIL was sent to your PC.
	text_jump UnknownText_0x1c1cc4
	db "@"
; 0x12e00


OpenPartyStats: ; 12e00
	call LoadStandardMenuDataHeader
	call ClearSprites
; PartyMon
	xor a
	ld [MonType], a
	call LowVolume
	predef StatsScreenInit
	call MaxVolume
	call Call_ExitMenu
	ld a, 0
	ret
; 12e1b


MonMenu_Fly: ; 12e30
	farcall FlyFunction
	ld a, [wFieldMoveSucceeded]
	and a
	jr z, .Error
	cp $2
	jr z, _MonMenu_StandardFail
	jr _MonMenu_StandardSuccess

.Error:
	ld a, $0
	ret

MonMenu_Cut: ; 12e1b
	farcall CutFunction
_MonMenu_StandardCheck:
	ld a, [wFieldMoveSucceeded]
	cp $1
	jr nz, _MonMenu_StandardFail
_MonMenu_StandardSuccess:
	ld b, $4
	ld a, $2
	ret

_MonMenu_StandardFail:
	ld a, $3
	ret
; 12e30

MonMenu_Flash: ; 12e55
	farcall OWFlash
	jr _MonMenu_StandardCheck
; 12e6a

MonMenu_Strength: ; 12e6a
	farcall StrengthFunction
	jr _MonMenu_StandardCheck
; 12e7f

MonMenu_Whirlpool: ; 12e7f
	farcall WhirlpoolFunction
	jr _MonMenu_StandardCheck
; 12e94

MonMenu_Waterfall: ; 12e94
	farcall WaterfallFunction
	jr _MonMenu_StandardCheck
; 12ea9

MonMenu_RockClimb:
	farcall RockClimbFunction
	jr _MonMenu_StandardCheck

MonMenu_Dig: ; 12ed1
	farcall DigFunction
	jr _MonMenu_StandardCheck
; 12ee6

MonMenu_Headbutt: ; 12f26
	farcall HeadbuttFunction
	jr _MonMenu_StandardCheck
; 12f3b

MonMenu_RockSmash: ; 12f3b
	farcall RockSmashFunction
	jr _MonMenu_StandardCheck
; 12f50

MonMenu_SweetScent: ; 12f50
	farcall SweetScentFromMenu
	jr _MonMenu_StandardSuccess
; 12f5b

MonMenu_Teleport: ; 12ea9
	farcall TeleportFunction
_MonMenu_AlternateCheck:
	ld a, [wFieldMoveSucceeded]
	and a
	jr z, _MonMenu_StandardFail
	jr _MonMenu_StandardSuccess
; 12ebd

MonMenu_Surf: ; 12ebd
	farcall SurfFunction
	jr _MonMenu_AlternateCheck
; 12ed1

MonMenu_Dive:
	farcall DiveFunction
	jr _MonMenu_AlternateCheck

MonMenu_Softboiled: ; 12ee6
	call .CheckMonHasEnoughHP
	jr nc, .NotEnoughHP
	farcall Softboiled_MilkDrinkFunction
	jr .finish

.NotEnoughHP:
	ld hl, .Text_NotEnoughHP
	call PrintText

.finish
	xor a
	ld [PartyMenuActionText], a
	ld a, $3
	ret
; 12f00

.Text_NotEnoughHP:
	; Not enough HP!
	text_jump UnknownText_0x1c1ce3
	db "@"
; 0x12f05

.CheckMonHasEnoughHP:
; Need to have at least (MaxHP / 5) HP left.
	ld a, MON_MAXHP
	call GetPartyParamLocation
	ld a, [hli]
	ld [hDividend + 0], a
	ld a, [hl]
	ld [hDividend + 1], a
	ld a, 5
	ld [hDivisor], a
	ld b, 2
	call Divide
	ld a, MON_HP + 1
	call GetPartyParamLocation
	ld a, [hQuotient + 2]
	sub [hl]
	dec hl
	ld a, [hQuotient + 1]
	sbc [hl]
	ret
; 12f26

ChooseMoveToDelete: ; 12f5b
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call LoadFontsBattleExtra
	call .ChooseMoveToDelete
	pop bc
	ld a, b
	ld [wOptions], a
	push af
	call ClearBGPalettes
	pop af
	ret
; 12f73

.ChooseMoveToDelete
	call SetUpMoveScreenBG
	ld de, DeleteMoveScreenAttrs
	call SetMenuAttributes
	call SetUpMoveList
	ld hl, w2DMenuFlags1
	set 6, [hl]
	jr .enter_loop

.loop
	call ScrollingMenuJoypad
	bit B_BUTTON_F, a
	jp nz, .b_button
	bit A_BUTTON_F, a
	jp nz, .a_button

.enter_loop
	call PrepareToPlaceMoveData
	call PlaceMoveData
	jp .loop
; 12f9c

.a_button
	and a
	jr .finish

.b_button
	scf

.finish
	push af
	xor a
	ld [wSwitchMon], a
	ld hl, w2DMenuFlags1
	res 6, [hl]
	call ClearSprites
	call ClearTileMap
	pop af
	ret
; 12fb2

DeleteMoveScreenAttrs: ; 12fb2
	db 3, 1
	db 3, 1
	db $40, $00
	dn 2, 0
	db D_UP | D_DOWN | A_BUTTON | B_BUTTON
; 12fba

ManagePokemonMoves: ; 12fba
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .egg
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call MoveScreenLoop
	pop af
	ld [wOptions], a
	call ClearBGPalettes

.egg
	ld a, $0
	ret
; 12fd5

MoveScreenLoop: ; 12fd5
	ld a, [wCurPartyMon]
	inc a
	ld [wPartyMenuCursor], a
	call SetUpMoveScreenBG
	call Function132d3
	ld de, MoveScreenAttributes
	call SetMenuAttributes
.loop
	call SetUpMoveList
	ld hl, w2DMenuFlags1
	set 6, [hl]
	jr .skip_joy

.joy_loop
	call ScrollingMenuJoypad
	bit 1, a
	jp nz, .b_button
	bit 0, a
	jp nz, .a_button
	bit 4, a
	jp nz, .d_right
	bit 5, a
	jp nz, .d_left

.skip_joy
	call PrepareToPlaceMoveData
	ld a, [wMoveSwapBuffer]
	and a
	jr nz, .moving_move
	call PlaceMoveData
	jp .joy_loop

.moving_move
	ld a, " "
	hlcoord 1, 11
	ld bc, 5
	call ByteFill
	hlcoord 1, 12
	lb bc, 5, SCREEN_WIDTH - 2
	call ClearBox
	hlcoord 1, 12
	ld de, String_1316b
	call PlaceString
	jp .joy_loop
.b_button
	call PlayClickSFX
	call WaitSFX
	ld a, [wMoveSwapBuffer]
	and a
	jp z, .exit

	ld a, [wMoveSwapBuffer]
	ld [wMenuCursorY], a
	xor a
	ld [wMoveSwapBuffer], a
	hlcoord 1, 2
	lb bc, 8, SCREEN_WIDTH - 2
	call ClearBox
	jp .loop
; 1305b

.d_right
	ld a, [wMoveSwapBuffer]
	and a
	jp nz, .joy_loop

	ld a, [wCurPartyMon]
	ld b, a
	push bc
	call .cycle_right
	pop bc
	ld a, [wCurPartyMon]
	cp b
	jp z, .joy_loop
	jp MoveScreenLoop

.d_left
	ld a, [wMoveSwapBuffer]
	and a
	jp nz, .joy_loop
	ld a, [wCurPartyMon]
	ld b, a
	push bc
	call .cycle_left
	pop bc
	ld a, [wCurPartyMon]
	cp b
	jp z, .joy_loop
	jp MoveScreenLoop

.cycle_right
	ld a, [wCurPartyMon]
	inc a
	ld [wCurPartyMon], a
	ld c, a
	ld b, 0
	ld hl, PartySpecies
	add hl, bc
	ld a, [hl]
	cp -1
	jr z, .cycle_left
	cp EGG
	ret nz
	jr .cycle_right

.cycle_left
	ld a, [wCurPartyMon]
	and a
	ret z
.cycle_left_loop
	ld a, [wCurPartyMon]
	dec a
	ld [wCurPartyMon], a
	ld c, a
	ld b, 0
	ld hl, PartySpecies
	add hl, bc
	ld a, [hl]
	cp EGG
	ret nz
	ld a, [wCurPartyMon]
	and a
	jr z, .cycle_right
	jr .cycle_left_loop
; 130c6

.a_button
	call PlayClickSFX
	call WaitSFX
	ld a, [wMoveSwapBuffer]
	and a
	jr nz, .place_move
	ld a, [wMenuCursorY]
	ld [wMoveSwapBuffer], a
	call PlaceHollowCursor
	jp .moving_move

.place_move
	ld hl, PartyMon1Moves
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wCurPartyMon]
	call AddNTimes
	push hl
	call .copy_move
	pop hl
	ld bc, $15
	add hl, bc
	call .copy_move
	ld a, [wBattleMode]
	jr z, .swap_moves
	ld hl, BattleMonMoves
	ld bc, $20
	ld a, [wCurPartyMon]
	call AddNTimes
	push hl
	call .copy_move
	pop hl
	ld bc, 6
	add hl, bc
	call .copy_move

.swap_moves
	ld de, SFX_SWITCH_POKEMON
	call PlaySFX
	call WaitSFX
	ld de, SFX_SWITCH_POKEMON
	call PlaySFX
	call WaitSFX
	hlcoord 1, 2
	lb bc, 8, 18
	call ClearBox
	hlcoord 10, 10
	lb bc, 1, 9
	call ClearBox
	jp .loop
; 1313a

.copy_move
	push hl
	ld a, [wMenuCursorY]
	dec a
	ld c, a
	ld b, $0
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	ld a, [wMoveSwapBuffer]
	dec a
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [de]
	ld b, [hl]
	ld [hl], a
	ld a, b
	ld [de], a
	ret
; 13154

.exit
	xor a
	ld [wMoveSwapBuffer], a
	ld hl, w2DMenuFlags1
	res 6, [hl]
	call ClearSprites
	jp ClearTileMap
; 13163

MoveScreenAttributes: ; 13163
	db 3, 1
	db 3, 1
	db $40, $00
	dn 2, 0
	db D_UP | D_DOWN | D_LEFT | D_RIGHT | A_BUTTON | B_BUTTON
; 1316b

String_1316b: ; 1316b
	db "Where?@"
; 13172

SetUpMoveScreenBG: ; 13172
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	xor a
	ld [hBGMapMode], a
	farcall LoadStatsScreenPageTilesGFX
	farcall ClearSpriteAnims2
	ld a, [wCurPartyMon]
	ld e, a
	ld d, $0
	ld hl, PartySpecies
	add hl, de
	ld a, [hl]
	ld [wd265], a
	farcall LoadMoveMenuMonIcon
	hlcoord 0, 1
	lb bc, 9, 18
	call TextBox
	hlcoord 0, 11
	lb bc, 5, 18
	call TextBox
	hlcoord 2, 0
	lb bc, 2, 3
	call ClearBox
	xor a
	ld [MonType], a
	ld hl, PartyMonNicknames
	ld a, [wCurPartyMon]
	call GetNick
	hlcoord 5, 1
	call PlaceString
	push bc
	farcall CopyPkmnToTempMon
	pop hl
	call PrintLevel
	ld hl, PlayerHPPal
	call SetHPPal
	ld b, SCGB_MOVE_LIST
	call GetSGBLayout
	hlcoord 16, 0
	lb bc, 1, 3
	jp ClearBox
; 131ef

SetUpMoveList: ; 131ef
	xor a
	ld [hBGMapMode], a
	ld [wMoveSwapBuffer], a
	ld [MonType], a
	predef CopyPkmnToTempMon
	ld hl, TempMonMoves
	ld de, wListMoves_MoveIndicesBuffer
	ld bc, NUM_MOVES
	call CopyBytes
	ld a, SCREEN_WIDTH * 2
	ld [Buffer1], a
	hlcoord 2, 3
	predef ListMoves
	hlcoord 10, 4
	predef ListMovePP
	call WaitBGMap
	call SetPalettes
	ld a, [wNumMoves]
	inc a
	ld [w2DMenuNumRows], a
	hlcoord 0, 11
	lb bc, 5, 18
	jp TextBox
; 13235

PrepareToPlaceMoveData: ; 13235
	ld hl, PartyMon1Moves
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wCurPartyMon]
	call AddNTimes
	ld a, [wMenuCursorY]
	dec a
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	ld [CurMove], a
	hlcoord 1, 12
	lb bc, 5, 18
	jp ClearBox
; 13256

PlaceMoveData: ; 13256
	xor a
	ld [hBGMapMode], a
	hlcoord 0, 10
	ld de, String_132ba
	call PlaceString
	hlcoord 0, 11
	ld de, String_132c2
	call PlaceString
if DEF(PSS)
	ld a, [CurMove]
	dec a
	ld hl, Moves + MOVE_CATEGORY
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	and CATEGORY_MASK
	ld de, PhysicalCategoryString
	cp PHYSICAL
	jr z, .got_category
	ld de, SpecialCategoryString
	cp SPECIAL
	jr z, .got_category
	ld de, StatusCategoryString
.got_category
else
	ld de, String_132ca
endc
	hlcoord 12, 12
	call PlaceString
	ld a, [CurMove]
	ld b, a
	hlcoord 2, 12
	predef PrintMoveType
	ld a, [CurMove]
	dec a
	ld hl, Moves + MOVE_POWER
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	hlcoord 16, 12
	cp 2
	jr c, .no_power
	ld [wd265], a
	ld de, wd265
	lb bc, 1, 3
	call PrintNum
	jr .description

.no_power
	ld de, String_132cf
	call PlaceString

.description
	hlcoord 1, 14
	predef PrintMoveDesc
	ld a, $1
	ld [hBGMapMode], a
	ret
; 132ba

String_132ba: db "┌─────┐@"
String_132c2: db "│TYPE/└@"
String_132cf: db "---@"

if DEF(PSS)
PhysicalCategoryString: db "PHY/@"
SpecialCategoryString:  db "SPE/@"
StatusCategoryString:   db "STA/@"
else
String_132ca: db "ATK/@"
endc

Function132d3: ; 132d3
	call Function132da
	jp Function132fe
; 132da

Function132da: ; 132da
	ld a, [wCurPartyMon]
	and a
	ret z
	ld c, a
	ld e, a
	ld d, 0
	ld hl, PartyCount
	add hl, de
.loop
	ld a, [hl]
	and a
	jr z, .prev
	cp EGG
	jr z, .prev
	cp NUM_POKEMON + 1
	jr c, .legal

.prev
	dec hl
	dec c
	jr nz, .loop
	ret

.legal
	hlcoord 16, 0
	ld [hl], "◀"
	ret
; 132fe

Function132fe: ; 132fe
	ld a, [wCurPartyMon]
	inc a
	ld c, a
	ld a, [PartyCount]
	cp c
	ret z
	ld e, c
	ld d, 0
	ld hl, PartySpecies
	add hl, de
.loop
	ld a, [hl]
	cp -1
	ret z
	and a
	jr z, .next
	cp EGG
	jr z, .next
	cp NUM_POKEMON + 1
	jr c, .legal

.next
	inc hl
	jr .loop

.legal
	hlcoord 18, 0
	ld [hl], "▶"
	ret
; 13327
