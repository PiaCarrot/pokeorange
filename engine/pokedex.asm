	const_def
	const DEXSTATE_MAIN_SCR
	const DEXSTATE_UPDATE_MAIN_SCR
	const DEXSTATE_DEX_ENTRY_SCR
	const DEXSTATE_UPDATE_DEX_ENTRY_SCR
	const DEXSTATE_REINIT_DEX_ENTRY_SCR
	const DEXSTATE_SEARCH_SCR
	const DEXSTATE_UPDATE_SEARCH_SCR
	const DEXSTATE_SEARCH_RESULTS_SCR
	const DEXSTATE_UPDATE_SEARCH_RESULTS_SCR
	const DEXSTATE_EXIT

Pokedex: ; 40000

	ld a, [hWX]
	ld l, a
	ld a, [hWY]
	ld h, a
	push hl
	ld a, [hSCX]
	push af
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	ld a, [VramState]
	push af
	xor a
	ld [VramState], a
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a

	xor a
	ld [hMapAnims], a
	call InitPokedex
	call DelayFrame

.main
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .exit
	call Pokedex_RunJumptable
	call DelayFrame
	jr .main

.exit
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	call WaitSFX
	call ClearSprites

	pop af
	ld [hInMenu], a
	pop af
	ld [VramState], a
	pop af
	ld [wOptions], a
	pop af
	ld [hSCX], a
	pop hl
	ld a, l
	ld [hWX], a
	ld a, h
	ld [hWY], a
	ret

InitPokedex: ; 40063
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	call Pokedex_LoadGFX

	ld hl, wPokedexDataStart
	ld bc, wPokedexDataEnd - wPokedexDataStart
	xor a
	call ByteFill

	xor a
	ld [wJumptableIndex], a
	ld [wDexEntryPrevJumptableIndex], a
	ld [wcf65], a
	ld [wcf66], a

	call Pokedex_OrderMonsByMode
	call Pokedex_InitCursorPosition
	call Pokedex_GetLandmark
	farcall DrawDexEntryScreenRightEdge
	jp Pokedex_ResetBGMapMode

Pokedex_InitCursorPosition: ; 400b4
	ld hl, wPokedexDataStart
	ld a, [wLastDexEntry]
	and a
	ret z
	cp NUM_POKEMON + 1
	ret nc

	ld b, a
	ld a, [wDexListingEnd]
	cp $8
	jr c, .only_one_page

	sub $7
	ld c, a
.loop1
	ld a, b
	cp [hl]
	ret z
	inc hl
	ld a, [wDexListingScrollOffset]
	inc a
	ld [wDexListingScrollOffset], a
	dec c
	jr nz, .loop1

.only_one_page
	ld c, $7
.loop2
	ld a, b
	cp [hl]
	ret z
	inc hl
	ld a, [wDexListingCursor]
	inc a
	ld [wDexListingCursor], a
	dec c
	jr nz, .loop2
	ret

Pokedex_GetLandmark: ; 400ed
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetWorldMapLocation

	cp SPECIAL_MAP
	jr nz, .load

	ld a, [BackupMapGroup]
	ld b, a
	ld a, [BackupMapNumber]
	ld c, a
	call GetWorldMapLocation

.load
	ld [wDexCurrentLocation], a
	ret

Pokedex_RunJumptable: ; 4010b
	ld a, [wJumptableIndex]
	ld hl, .Jumptable
	call Pokedex_LoadPointer
	jp hl


.Jumptable: ; 40115 (10:4115)
	dw Pokedex_InitMainScreen
	dw Pokedex_UpdateMainScreen
	dw Pokedex_InitDexEntryScreen
	dw Pokedex_UpdateDexEntryScreen
	dw Pokedex_ReinitDexEntryScreen
	dw Pokedex_InitSearchScreen
	dw Pokedex_UpdateSearchScreen
	dw Pokedex_InitSearchResultsScreen
	dw Pokedex_UpdateSearchResultsScreen
	dw Pokedex_Exit


Pokedex_IncrementDexPointer: ; 40131 (10:4131)
	ld hl, wJumptableIndex
	inc [hl]
	ret

Pokedex_Exit: ; 40136 (10:4136)
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

Pokedex_InitMainScreen: ; 4013c (10:413c)
	xor a
	ld [hBGMapMode], a
	call ClearSprites
	xor a
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	call ByteFill
	farcall DrawPokedexListWindow
	hlcoord 0, 17
	ld de, String_START_SEARCH
	call Pokedex_PlaceString
	ld a, 7
	ld [wDexListingHeight], a
	call Pokedex_PrintListing
	call Pokedex_SetBGMapMode4
	call Pokedex_SetBGMapMode3
	call Pokedex_ResetBGMapMode
	call Pokedex_DrawMainScreenBG
	ld a, $5
	ld [hSCX], a

	ld a, $47
	ld [hWX], a
	xor a
	ld [hWY], a
	call WaitBGMap

	call Pokedex_ResetBGMapMode
	ld a, -1
	ld [CurPartySpecies], a
	xor a
	ld [wDexMonPersonality], a
	ld a, SCGB_POKEDEX
	call Pokedex_GetSGBLayout
	call Pokedex_UpdateCursorOAM
	farcall DrawPokedexListWindow
	hlcoord 0, 17
	ld de, String_START_SEARCH
	call Pokedex_PlaceString
	ld a, 7
	ld [wDexListingHeight], a
	call Pokedex_PrintListing
	jp Pokedex_IncrementDexPointer

Pokedex_UpdateMainScreen: ; 401ae (10:41ae)
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .b
	ld a, [hl]
	and A_BUTTON
	jr nz, .a
	ld a, [hl]
	and START
	jr nz, .start
	call Pokedex_ListingHandleDPadInput
	ret nc
	call Pokedex_UpdateCursorOAM
	xor a
	ld [hBGMapMode], a
	call Pokedex_PrintListing
	call Pokedex_SetBGMapMode3
	jp Pokedex_ResetBGMapMode

.a
	call Pokedex_GetSelectedMon
	call Pokedex_CheckSeen
	ret z
	ld a, DEXSTATE_DEX_ENTRY_SCR
	ld [wJumptableIndex], a
	ld a, DEXSTATE_MAIN_SCR
	ld [wDexEntryPrevJumptableIndex], a
	ret

.start
	call Pokedex_WhiteOutBG
	ld a, DEXSTATE_SEARCH_SCR
	ld [wJumptableIndex], a
	xor a
	ld [hSCX], a
	ld a, $a7
	ld [hWX], a
	jp DelayFrame

.b
	ld a, DEXSTATE_EXIT
	ld [wJumptableIndex], a
	ret

Pokedex_InitDexEntryScreen: ; 40217 (10:4217)
	call LowVolume
	xor a
	ld [wPokedexStatus], a
	xor a
	ld [hBGMapMode], a
	call ClearSprites
	call Pokedex_DrawDexEntryScreenBG
	call Pokedex_InitArrowCursor
	call Pokedex_GetSelectedMon
	ld [wLastDexEntry], a
	farcall DisplayDexEntry
	call WaitBGMap
	ld a, $a7
	ld [hWX], a
	call Pokedex_GetSelectedMon
	ld [CurPartySpecies], a
	xor a
	ld [wDexMonPersonality], a
	ld a, SCGB_POKEDEX
	call Pokedex_GetSGBLayout
	call DelayFrame
	ld a, [CurPartySpecies]
	call PlayCry
	jp Pokedex_IncrementDexPointer

Pokedex_UpdateDexEntryScreen: ; 40258 (10:4258)
	ld de, DexEntryScreen_ArrowCursorData
	call Pokedex_MoveArrowCursor
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .return_to_prev_screen
	ld a, [hl]
	and A_BUTTON
	jr nz, .do_menu_action
	call Pokedex_NextOrPreviousDexEntry
	ret nc
	jp Pokedex_IncrementDexPointer

.do_menu_action
	ld a, [wDexArrowCursorPosIndex]
	ld hl, DexEntryScreen_MenuActionJumptable
	call Pokedex_LoadPointer
	jp hl

.return_to_prev_screen
	ld a, [LastVolume]
	and a
	jr z, .max_volume
	ld a, $77
	ld [LastVolume], a

.max_volume
	call MaxVolume
	ld a, [wDexEntryPrevJumptableIndex]
	ld [wJumptableIndex], a
	ret

Pokedex_Page: ; 40292
	ld a, [wPokedexStatus]
	xor $1
	ld [wPokedexStatus], a
	call Pokedex_GetSelectedMon
	ld [wLastDexEntry], a
	farcall DisplayDexEntry
	jp WaitBGMap

Pokedex_ReinitDexEntryScreen: ; 402aa (10:42aa)
; Reinitialize the Pokédex entry screen after changing the selected mon.
	call Pokedex_WhiteOutBG
	xor a
	ld [wPokedexStatus], a
	xor a
	ld [hBGMapMode], a
	call Pokedex_DrawDexEntryScreenBG
	call Pokedex_InitArrowCursor
	call Pokedex_GetSelectedMon
	ld [wLastDexEntry], a
	farcall DisplayDexEntry
	call Pokedex_LoadSelectedMonTiles
	call WaitBGMap
	call Pokedex_GetSelectedMon
	ld [CurPartySpecies], a
	ld a, SCGB_POKEDEX
	call Pokedex_GetSGBLayout
	call DelayFrame
	ld a, [CurPartySpecies]
	call PlayCry
	ld hl, wJumptableIndex
	dec [hl]
	ret

DexEntryScreen_ArrowCursorData: ; 402e8
	db D_RIGHT | D_LEFT, 4
	dwcoord 1, 17
	dwcoord 6, 17
	dwcoord 11, 17
	dwcoord 15, 17

DexEntryScreen_MenuActionJumptable: ; 402f2
	dw Pokedex_Page
	dw .Area
	dw .Cry
	dw .Shiny

.Area: ; 402fa
	call Pokedex_WhiteOutBG
	xor a
	ld [hSCX], a
	call DelayFrame
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	call Pokedex_GetSelectedMon
	ld a, [wDexCurrentLocation]
	ld e, a
	predef _Area
	call Pokedex_WhiteOutBG
	call DelayFrame
	xor a
	ld [hBGMapMode], a
	ld a, $90
	ld [hWY], a
	ld a, $5
	ld [hSCX], a
	call DelayFrame
	call Pokedex_RedisplayDexEntry
	call Pokedex_LoadSelectedMonTiles
	call WaitBGMap
	call Pokedex_GetSelectedMon
	ld [CurPartySpecies], a
	ld a, SCGB_POKEDEX
	jp Pokedex_GetSGBLayout

.Cry: ; 40340
	call Pokedex_GetSelectedMon
	ld a, [wd265]
	jp _PlayCry

.Shiny: ; 4034f
	ld hl, wDexMonPersonality
	ld a, [hl]
	xor SHINY_MASK ; alternate normal and shiny
	ld [hl], a
	call Pokedex_GetSelectedMon
	ld [CurPartySpecies], a
	ld a, SCGB_POKEDEX
	jp Pokedex_GetSGBLayout

Pokedex_RedisplayDexEntry: ; 4038d
	call Pokedex_DrawDexEntryScreenBG
	call Pokedex_GetSelectedMon
	farcall DisplayDexEntry
	ret

Pokedex_InitSearchScreen: ; 40443 (10:4443)
	xor a
	ld [hBGMapMode], a
	call ClearSprites
	call Pokedex_DrawSearchScreenBG
	call Pokedex_InitArrowCursor
	ld a, NORMAL + 1
	ld [wDexSearchMonType1], a
	xor a
	ld [wDexSearchMonType2], a
	call Pokedex_PlaceSearchScreenTypeStrings
	xor a
	ld [wDexSearchSlowpokeFrame], a
	farcall DoDexSearchSlowpokeFrame
	call WaitBGMap
	ld a, SCGB_POKEDEX_SEARCH_OPTION
	call Pokedex_GetSGBLayout
	jp Pokedex_IncrementDexPointer

Pokedex_UpdateSearchScreen: ; 40471 (10:4471)
	ld de, .ArrowCursorData
	call Pokedex_MoveArrowCursor
	call Pokedex_UpdateSearchMonType
	call c, Pokedex_PlaceSearchScreenTypeStrings
	ld hl, hJoyPressed
	ld a, [hl]
	and START | B_BUTTON
	jr nz, .cancel
	ld a, [hl]
	and A_BUTTON
	jr nz, .do_menu_action
	ret

.do_menu_action
	ld a, [wDexArrowCursorPosIndex]
	ld hl, .MenuActionJumptable
	call Pokedex_LoadPointer
	jp hl

.cancel
	call Pokedex_WhiteOutBG
	ld a, DEXSTATE_MAIN_SCR
	ld [wJumptableIndex], a
	ret

.ArrowCursorData: ; 4049e
	db D_UP | D_DOWN, 4
	dwcoord 2, 4
	dwcoord 2, 6
	dwcoord 2, 13
	dwcoord 2, 15

.MenuActionJumptable: ; 404a8
	dw .MenuAction_MonSearchType
	dw .MenuAction_MonSearchType
	dw .MenuAction_BeginSearch
	dw .MenuAction_Cancel

.MenuAction_MonSearchType: ; 404b0
	call Pokedex_NextSearchMonType
	jp Pokedex_PlaceSearchScreenTypeStrings

.MenuAction_BeginSearch: ; 404b7
	call Pokedex_SearchForMons
	farcall AnimateDexSearchSlowpoke
	ld a, [wDexSearchResultCount]
	and a
	jr nz, .show_search_results

; No mon with matching types was found.
	call Pokedex_OrderMonsByMode
	call Pokedex_DisplayTypeNotFoundMessage
	xor a
	ld [hBGMapMode], a
	call Pokedex_DrawSearchScreenBG
	call Pokedex_InitArrowCursor
	call Pokedex_PlaceSearchScreenTypeStrings
	jp WaitBGMap

.show_search_results
	ld [wDexListingEnd], a
	ld a, [wDexListingScrollOffset]
	ld [wDexListingScrollOffsetBackup], a
	ld a, [wDexListingCursor]
	ld [wDexListingCursorBackup], a
	ld a, [wLastDexEntry]
	ld [wcf65], a
	xor a
	ld [wDexListingScrollOffset], a
	ld [wDexListingCursor], a
	call Pokedex_WhiteOutBG
	ld a, DEXSTATE_SEARCH_RESULTS_SCR
	ld [wJumptableIndex], a
	ret

.MenuAction_Cancel: ; 40501
	call Pokedex_WhiteOutBG
	ld a, DEXSTATE_MAIN_SCR
	ld [wJumptableIndex], a
	ret

Pokedex_InitSearchResultsScreen: ; 4050a (10:450a)
	xor a
	ld [hBGMapMode], a
	xor a
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	call Pokedex_SetBGMapMode4
	call Pokedex_ResetBGMapMode
	farcall DrawPokedexSearchResultsWindow
	call Pokedex_PlaceSearchResultsTypeStrings
	ld a, 4
	ld [wDexListingHeight], a
	call Pokedex_PrintListing
	call Pokedex_SetBGMapMode3
	call Pokedex_ResetBGMapMode
	call Pokedex_DrawSearchResultsScreenBG
	ld a, $5
	ld [hSCX], a
	ld a, $4a
	ld [hWX], a
	xor a
	ld [hWY], a
	call WaitBGMap
	call Pokedex_ResetBGMapMode
	farcall DrawPokedexSearchResultsWindow
	call Pokedex_PlaceSearchResultsTypeStrings
	call Pokedex_UpdateSearchResultsCursorOAM
	ld a, $ff
	ld [CurPartySpecies], a
	ld a, SCGB_POKEDEX
	call Pokedex_GetSGBLayout
	jp Pokedex_IncrementDexPointer

Pokedex_UpdateSearchResultsScreen: ; 40562 (10:4562)
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .return_to_search_screen
	ld a, [hl]
	and A_BUTTON
	jr nz, .go_to_dex_entry
	call Pokedex_ListingHandleDPadInput
	ret nc
	call Pokedex_UpdateSearchResultsCursorOAM
	xor a
	ld [hBGMapMode], a
	call Pokedex_PrintListing
	call Pokedex_SetBGMapMode3
	jp Pokedex_ResetBGMapMode

.go_to_dex_entry
	call Pokedex_GetSelectedMon
	call Pokedex_CheckSeen
	ret z
	ld a, DEXSTATE_DEX_ENTRY_SCR
	ld [wJumptableIndex], a
	ld a, DEXSTATE_SEARCH_RESULTS_SCR
	ld [wDexEntryPrevJumptableIndex], a
	ret

.return_to_search_screen
	ld a, [wDexListingScrollOffsetBackup]
	ld [wDexListingScrollOffset], a
	ld a, [wDexListingCursorBackup]
	ld [wDexListingCursor], a
	ld a, [wcf65]
	ld [wLastDexEntry], a
	call Pokedex_WhiteOutBG
	call ClearSprites
	call Pokedex_OrderMonsByMode
	ld a, DEXSTATE_SEARCH_SCR
	ld [wJumptableIndex], a
	xor a
	ld [hSCX], a
	ld a, $a7
	ld [hWX], a
	ret

Pokedex_NextOrPreviousDexEntry: ; 4066c (10:466c)
	ld a, [wDexListingCursor]
	ld [wBackupDexListingCursor], a
	ld a, [wDexListingScrollOffset]
	ld [wBackupDexListingPage], a
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .up
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	and a
	ret

.up
	ld a, [wDexListingHeight]
	ld d, a
	ld a, [wDexListingEnd]
	ld e, a
	call Pokedex_ListingMoveCursorUp
	jr nc, .nope
	call Pokedex_GetSelectedMon
	call Pokedex_CheckSeen
	jr nz, .yep
	jr .up

.down
	ld a, [wDexListingHeight]
	ld d, a
	ld a, [wDexListingEnd]
	ld e, a
	call Pokedex_ListingMoveCursorDown
	jr nc, .nope
	call Pokedex_GetSelectedMon
	call Pokedex_CheckSeen
	jr z, .down

.yep
	scf
	ret

.nope
	ld a, [wBackupDexListingCursor]
	ld [wDexListingCursor], a
	ld a, [wBackupDexListingPage]
	ld [wDexListingScrollOffset], a
	and a
	ret

Pokedex_ListingHandleDPadInput: ; 406c5 (10:46c5)
; Handles D-pad input for a list of Pokémon.
	ld a, [wDexListingHeight]
	ld d, a
	ld a, [wDexListingEnd]
	ld e, a
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, Pokedex_ListingMoveCursorUp
	ld a, [hl]
	and D_DOWN
	jr nz, Pokedex_ListingMoveCursorDown
	ld a, d
	cp e
	jr nc, Pokedex_ListingPosStayedSame
	ld a, [hl]
	and D_LEFT
	jr nz, Pokedex_ListingMoveUpOnePage
	ld a, [hl]
	and D_RIGHT
	jr nz, Pokedex_ListingMoveDownOnePage
	jr Pokedex_ListingPosStayedSame

Pokedex_ListingMoveCursorUp: ; 406ea (10:46ea)
	ld hl, wDexListingCursor
	ld a, [hl]
	and a
	jr z, .try_scrolling
	dec [hl]
	jr Pokedex_ListingPosChanged
.try_scrolling
	ld hl, wDexListingScrollOffset
	ld a, [hl]
	and a
	jr z, Pokedex_ListingPosStayedSame
	dec [hl]
	jr Pokedex_ListingPosChanged

Pokedex_ListingMoveCursorDown: ; 406fe (10:46fe)
	ld hl, wDexListingCursor
	ld a, [hl]
	inc a
	cp e
	jr nc, Pokedex_ListingPosStayedSame
	cp d
	jr nc, .try_scrolling
	inc [hl]
	jr Pokedex_ListingPosChanged
.try_scrolling
	ld hl, wDexListingScrollOffset
	add [hl]
	cp e
	jr nc, Pokedex_ListingPosStayedSame
	inc [hl]
	jr Pokedex_ListingPosChanged

Pokedex_ListingMoveUpOnePage: ; 40716 (10:4716)
	ld hl, wDexListingScrollOffset
	ld a, [hl]
	and a
	jr z, Pokedex_ListingPosStayedSame
	cp d
	jr nc, .not_near_top
; If we're already less than page away from the top, go to the top.
	xor a
	ld [hl], a
	jr Pokedex_ListingPosChanged
.not_near_top
	sub d
	ld [hl], a
	jr Pokedex_ListingPosChanged

Pokedex_ListingMoveDownOnePage: ; 40728 (10:4728)
; When moving down a page, the return value always report a change in position.
	ld hl, wDexListingScrollOffset
	ld a, d
	add a
	add [hl]
	jr c, .near_bottom
	cp e
	jr c, .not_near_bottom
.near_bottom
	ld a, e
	sub d
	ld [hl], a
	jr Pokedex_ListingPosChanged
.not_near_bottom
	ld a, [hl]
	add d
	ld [hl], a
	jr Pokedex_ListingPosChanged

Pokedex_ListingPosStayedSame: ; 4073d (10:473d)
	and a
	ret

Pokedex_ListingPosChanged: ; 4073f (10:473f)
	scf
	ret

Pokedex_FillColumn: ; 40741
; Fills a column starting at HL, going downwards.
; B is the height of the column and A is the tile it's filled with.
	push de
	ld de, SCREEN_WIDTH
.loop
	ld [hl], a
	add hl, de
	dec b
	jr nz, .loop
	pop de
	ret

Pokedex_DrawMainScreenBG: ; 4074c (10:474c)
; Draws the left sidebar and the bottom bar on the main screen.
	hlcoord 0, 17
	ld de, String_START_SEARCH
	call Pokedex_PlaceString
	ld a, $41
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	hlcoord 0, 0
	lb bc, 7, 7
	call Pokedex_PlaceFrontpicBorder
	hlcoord 0, 9
	lb bc, 6, 7
	call Pokedex_PlaceBorder
	hlcoord 1, 11
	ld de, String_SEEN
	call Pokedex_PlaceString
	ld hl, PokedexSeen
	ld b, EndPokedexSeen - PokedexSeen
	call CountSetBits
	ld de, wd265
	hlcoord 5, 12
	lb bc, 1, 3
	call PrintNum
	hlcoord 1, 14
	ld de, String_OWN
	call Pokedex_PlaceString
	ld hl, PokedexCaught
	ld b, EndPokedexCaught - PokedexCaught
	call CountSetBits
	ld de, wd265
	hlcoord 5, 15
	lb bc, 1, 3
	call PrintNum
	hlcoord 8, 1
	ld b, 7
	ld a, $58
	call Pokedex_FillColumn
	hlcoord 8, 10
	ld b, 6
	ld a, $69
	call Pokedex_FillColumn
	hlcoord 8, 0
	ld [hl], $56
	hlcoord 8, 8
	ld [hl], $74
	hlcoord 8, 9
	ld [hl], $63
	hlcoord 8, 16
	ld [hl], $6a
	jp Pokedex_PlaceFrontpicTopLeftCorner

String_SEEN: ; 407e1
	db "SEEN", $ff
String_OWN: ; 407e6
	db "OWN", $ff
String_START_SEARCH: ; 407f2
	db $41, $4a, $50, $51, $52, $5a, $5b, $5c, $5d, $4b, $ff ; START > SEARCH

Pokedex_DrawDexEntryScreenBG: ; 407fd
	call Pokedex_FillBackgroundColor2
	hlcoord 0, 0
	lb bc, 15, 18
	call Pokedex_PlaceBorder
	hlcoord 19, 0
	ld [hl], $43
	hlcoord 19, 1
	ld a, " "
	ld b, 15
	call Pokedex_FillColumn
	ld [hl], $48
	farcall DrawPokedexHorizontalDivider
	hlcoord 1, 17
	ld bc, 18
	ld a, " "
	call ByteFill
	hlcoord 9, 6
	ld de, .Height
	call Pokedex_PlaceString
	hlcoord 9, 8
	ld de, .Weight
	call Pokedex_PlaceString
	hlcoord 0, 17
	ld de, .MenuItems
	call Pokedex_PlaceString
	jp Pokedex_PlaceFrontpicTopLeftCorner

.Height: ; 40852
	db "HT  ?′??″", $ff ; HT  ?'??"
.Weight: ; 4085c
	db "WT   ???lb", $ff ; WT   ???lb
.MenuItems: ; 40867
	db $4a, " PAGE AREA CRY SHNY", $ff

Pokedex_DrawSearchScreenBG: ; 408f0 (10:48f0)
	call Pokedex_FillBackgroundColor2
	hlcoord 0, 2
	lb bc, 14, 18
	call Pokedex_PlaceBorder
	hlcoord 0, 1
	ld de, .Title
	call Pokedex_PlaceString
	hlcoord 8, 4
	ld de, .TypeLeftRightArrows
	call PlaceString
	hlcoord 8, 6
	ld de, .TypeLeftRightArrows
	call PlaceString
	hlcoord 3, 4
	ld de, .Types
	call PlaceString
	hlcoord 3, 13
	ld de, .Menu
	jp PlaceString

.Title: ; 4092a
	db $4a, " SEARCH ", $4b, $ff

.TypeLeftRightArrows: ; 40935
	db "◀        ▶@"

.Types: ; 40940
	db   "TYPE1"
	next "TYPE2"
	db   "@"

.Menu: ; 4094c
	db   "BEGIN SEARCH!"
	next "CANCEL"
	db   "@"

Pokedex_DrawSearchResultsScreenBG: ; 40962 (10:4962)
	call Pokedex_FillBackgroundColor2
	hlcoord 0, 0
	lb bc, 7, 7
	call Pokedex_PlaceFrontpicBorder
	hlcoord 0, 11
	lb bc, 5, 18
	call Pokedex_PlaceBorder
	hlcoord 1, 12
	ld de, .BottomWindowText
	call PlaceString
	ld de, wDexSearchResultCount
	hlcoord 1, 16
	lb bc, 1, 3
	call PrintNum
	hlcoord 8, 0
	ld [hl], $56
	hlcoord 8, 1
	ld b, 7
	ld a, $58
	call Pokedex_FillColumn
	hlcoord 8, 8
	ld [hl], $74
	hlcoord 8, 9
	ld [hl], $78
	hlcoord 8, 10
	ld [hl], $79
	jp Pokedex_PlaceFrontpicTopLeftCorner

.BottomWindowText: ; 409ae
	db   "SEARCH RESULTS"
	next "  TYPE"
	next "    FOUND!"
	db   "@"

Pokedex_PlaceSearchResultsTypeStrings: ; 409cf (10:49cf)
	ld a, [wDexSearchMonType1]
	hlcoord 0, 14
	call Pokedex_PlaceTypeString
	ld a, [wDexSearchMonType1]
	ld b, a
	ld a, [wDexSearchMonType2]
	and a
	ret z
	cp b
	ret z
	hlcoord 2, 15
	call Pokedex_PlaceTypeString
	hlcoord 1, 15
	ld [hl], "/"
	ret

Pokedex_FillBackgroundColor2: ; 40aa6
	hlcoord 0, 0
	ld a, $41
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	jp ByteFill

Pokedex_PlaceFrontpicTopLeftCorner: ; 40ab2
	hlcoord 1, 1
	xor a
	ld b, $7
.row
	ld c, $7
	push af
	push hl
.col
	ld [hli], a
	add $7
	dec c
	jr nz, .col
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	pop af
	inc a
	dec b
	jr nz, .row
	ret

Pokedex_PlaceString: ; 40acd
.loop
	ld a, [de]
	cp -1
	ret z
	inc de
	ld [hli], a
	jr .loop

Pokedex_PlaceBorder: ; 40ad5
	push hl
	ld a, $42
	ld [hli], a
	ld d, $43
	call Pokedex_PlaceBorder_FillRow
	ld a, $44
	ld [hl], a
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
.loop
	push hl
	ld a, $45
	ld [hli], a
	ld d, $7f
	call Pokedex_PlaceBorder_FillRow
	ld a, $46
	ld [hl], a
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .loop
	ld a, $47
	ld [hli], a
	ld d, $48
	call Pokedex_PlaceBorder_FillRow
	ld a, $49
	ld [hl], a
	ret

Pokedex_PlaceFrontpicBorder:
	push hl
	ld a, $54
	ld [hli], a
	ld d, $55
	call Pokedex_PlaceBorder_FillRow
	ld a, $56
	ld [hl], a
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
.loop
	push hl
	ld a, $57
	ld [hli], a
	ld d, $7f
	call Pokedex_PlaceBorder_FillRow
	ld a, $58
	ld [hl], a
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .loop
	ld a, $72
	ld [hli], a
	ld d, $73
	call Pokedex_PlaceBorder_FillRow
	ld a, $74
	ld [hl], a
	ret

Pokedex_PlaceBorder_FillRow: ; 40b06
	ld e, c
.row_loop
	ld a, e
	and a
	ret z
	ld a, d
	ld [hli], a
	dec e
	jr .row_loop


Pokedex_PrintListing: ; 40b0f (10:4b0f)
; Prints the list of Pokémon on the main Pokédex screen.
; Clear (2 * [wDexListingHeight] + 1) by 11 box starting at 0,1
	hlcoord 0, 1
	ld a, [wDexListingHeight]
	add a
	inc a
	ld b, a
	ld c, 11
	ld a, " "
	call Pokedex_FillBox

; Load de with wPokedexDataStart + [wDexListingScrollOffset]
	ld a, [wDexListingScrollOffset]
	ld e, a
	ld d, $0
	ld hl, wPokedexDataStart
	add hl, de
	ld e, l
	ld d, h
	hlcoord 0, 2
	ld a, [wDexListingHeight]
.loop
	push af
	ld a, [de]
	ld [wd265], a
	push de
	push hl
	call .PrintEntry
	pop hl
	ld de, 2 * SCREEN_WIDTH
	add hl, de
	pop de
	inc de
	pop af
	dec a
	jr nz, .loop
	jp Pokedex_LoadSelectedMonTiles

.PrintEntry: ; 40b55 (10:4b55)
; Prints one entry in the list of Pokémon on the main Pokédex screen.
	and a
	ret z
	call Pokedex_PlaceDefaultStringIfNotSeen
	ret c
	call Pokedex_PlaceCaughtSymbolIfCaught
	push hl
	call GetPokemonName
	pop hl
	jp PlaceString

Pokedex_PlaceCaughtSymbolIfCaught: ; 40b82 (10:4b82)
	call Pokedex_CheckCaught
	jr nz, .place_caught_symbol
	inc hl
	ret

.place_caught_symbol
	ld a, $5e
	ld [hli], a
	ret

Pokedex_PlaceDefaultStringIfNotSeen: ; 40b8d (10:4b8d)
	call Pokedex_CheckSeen
	ret nz
	inc hl
	ld de, .NameNotSeen
	call PlaceString
	scf
	ret

.NameNotSeen: ; 40b9a
	db "-----@"

Pokedex_GetSelectedMon: ; 40bb1
; Gets the species of the currently selected Pokémon. This corresponds to the
; position of the cursor in the main listing, but this function can be used
; on all Pokédex screens.
	ld a, [wDexListingCursor]
	ld hl, wDexListingScrollOffset
	add [hl]
	ld e, a
	ld d, $0
	ld hl, wPokedexDataStart
	add hl, de
	ld a, [hl]
	ld [wd265], a
	ret

Pokedex_CheckCaught: ; 40bc4 (10:4bc4)
	push de
	push hl
	ld a, [wd265]
	dec a
	call CheckCaughtMon
	pop hl
	pop de
	ret

Pokedex_CheckSeen: ; 40bd0
	push de
	push hl
	ld a, [wd265]
	dec a
	call CheckSeenMon
	pop hl
	pop de
	ret

Pokedex_OrderMonsByMode: ; 40bdc
	ld hl, wPokedexDataStart
	ld bc, wPokedexMetadata - wPokedexDataStart
	xor a
	call ByteFill

	ld de, NewPokedexOrder
	ld hl, wPokedexDataStart
	ld c, NUM_POKEMON
.loopnew
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .loopnew

	ld hl, wPokedexDataStart + NUM_POKEMON - 1
	ld d, NUM_POKEMON
	ld e, d
.loopfindend
	ld a, [hld]
	ld [wd265], a
	call Pokedex_CheckSeen
	jr nz, .foundend
	dec d
	dec e
	jr nz, .loopfindend
.foundend
	ld a, d
	ld [wDexListingEnd], a
	ret

NewPokedexOrder: ; 0x40d60
INCLUDE "data/pokedex/order_new.asm"

Pokedex_UpdateSearchMonType: ; 40f4f (10:4f4f)
	ld a, [wDexArrowCursorPosIndex]
	cp 2
	jr nc, .no_change
	ld hl, hJoyLast
	ld a, [hl]
	and D_LEFT
	jr nz, Pokedex_PrevSearchMonType
	ld a, [hl]
	and D_RIGHT
	jr nz, Pokedex_NextSearchMonType
.no_change
	and a
	ret

Pokedex_PrevSearchMonType: ; 40f65
	ld a, [wDexArrowCursorPosIndex]
	and a
	jr nz, .type2

	ld hl, wDexSearchMonType1
	ld a, [hl]
	cp $1
	jr z, .wrap_around
	dec [hl]
	jr .done

.type2
	ld hl, wDexSearchMonType2
	ld a, [hl]
	and a
	jr z, .wrap_around
	dec [hl]
	jr .done

.wrap_around
	ld [hl], TYPES_END

.done
	scf
	ret

Pokedex_NextSearchMonType: ; 40f84
	ld a, [wDexArrowCursorPosIndex]
	and a
	jr nz, .type2

	ld hl, wDexSearchMonType1
	ld a, [hl]
	cp TYPES_END
	jr nc, .type1_wrap_around
	inc [hl]
	jr .done
.type1_wrap_around
	ld [hl], $1
	jr .done

.type2
	ld hl, wDexSearchMonType2
	ld a, [hl]
	cp TYPES_END
	jr nc, .type2_wrap_around
	inc [hl]
	jr .done
.type2_wrap_around
	ld [hl], 0

.done
	scf
	ret

Pokedex_PlaceSearchScreenTypeStrings: ; 40fa8 (10:4fa8)
	xor a
	ld [hBGMapMode], a
	hlcoord 9, 3
	lb bc, 4, 8
	ld a, " "
	call Pokedex_FillBox
	ld a, [wDexSearchMonType1]
	hlcoord 9, 4
	call Pokedex_PlaceTypeString
	ld a, [wDexSearchMonType2]
	hlcoord 9, 6
	call Pokedex_PlaceTypeString
	ld a, $1
	ld [hBGMapMode], a
	ret

Pokedex_PlaceTypeString: ; 40fcd (10:4fcd)
	push hl
	ld e, a
	ld d, 0
	ld hl, .TypeStrings
rept 9
	add hl, de
endr
	ld e, l
	ld d, h
	pop hl
	jp PlaceString

.TypeStrings: ; 40fe4
	db "  ----  @"
	db " NORMAL @"
	db "  FIRE  @"
	db " WATER  @"
	db " GRASS  @"
	db "ELECTRIC@"
	db "  ICE   @"
	db "FIGHTING@"
	db " POISON @"
	db " GROUND @"
	db " FLYING @"
	db "PSYCHIC @"
	db "  BUG   @"
	db "  ROCK  @"
	db " GHOST  @"
	db " DRAGON @"
	db "  DARK  @"
	db " STEEL  @"
	db " FAIRY  @"
	db "CRYSTAL @"

Pokedex_SearchForMons: ; 41086
	ld a, [wDexSearchMonType2]
	and a
	call nz, .Search
	ld a, [wDexSearchMonType1]
	and a
	call nz, .Search
	ret

.Search: ; 41095
	dec a
	ld e, a
	ld d, 0
	ld hl, .TypeConversionTable
	add hl, de
	ld a, [hl]
	ld [wDexConvertedMonType], a
	ld hl, wPokedexDataStart
	ld de, wPokedexDataStart
	ld c, NUM_POKEMON
	xor a
	ld [wDexSearchResultCount], a
.loop
	push bc
	ld a, [hl]
	and a
	jr z, .next_mon
	ld [wd265], a
	ld [CurSpecies], a
	call Pokedex_CheckCaught
	jr z, .next_mon
	push hl
	push de
	call GetBaseData
	pop de
	pop hl
	ld a, [wDexConvertedMonType]
	ld b, a
	ld a, [BaseType1]
	cp b
	jr z, .match_found
	ld a, [BaseType2]
	cp b
	jr nz, .next_mon

.match_found
	ld a, [wd265]
	ld [de], a
	inc de
	ld a, [wDexSearchResultCount]
	inc a
	ld [wDexSearchResultCount], a

.next_mon
	inc hl
	pop bc
	dec c
	jr nz, .loop

	ld l, e
	ld h, d
	ld a, [wDexSearchResultCount]
	ld c, 0

.zero_remaining_mons
	cp NUM_POKEMON
	ret z
	ld [hl], c
	inc hl
	inc a
	jr .zero_remaining_mons

.TypeConversionTable: ; 410f6
	db NORMAL
	db FIRE
	db WATER
	db GRASS
	db ELECTRIC
	db ICE
	db FIGHTING
	db POISON
	db GROUND
	db FLYING
	db PSYCHIC
	db BUG
	db ROCK
	db GHOST
	db DRAGON
	db DARK
	db STEEL
	db FAIRY
	db CRYSTAL

Pokedex_DisplayTypeNotFoundMessage: ; 41107
	xor a
	ld [hBGMapMode], a
	hlcoord 0, 12
	lb bc, 4, 18
	call Pokedex_PlaceBorder
	ld de, .TypeNotFound
	hlcoord 1, 14
	call PlaceString
	ld a, $1
	ld [hBGMapMode], a
	ld c, $80
	jp DelayFrames

.TypeNotFound: ; 41126
	db   "The specified type"
	next "was not found.@"

Pokedex_UpdateCursorOAM: ; 41148 (10:5148)
	ld hl, .CursorOAM
	call Pokedex_LoadCursorOAM
	jp Pokedex_PutScrollbarOAM

.CursorOAM: ; 41230
	db $1b, $47, $30, $07
	db $13, $47, $31, $07
	db $13, $4f, $32, $07
	db $13, $57, $32, $07
	db $13, $5f, $33, $07
	db $13, $80, $33, $27
	db $13, $88, $32, $27
	db $13, $90, $32, $27
	db $13, $98, $31, $27
	db $1b, $98, $30, $27
	db $23, $47, $30, $47
	db $2b, $47, $31, $47
	db $2b, $4f, $32, $47
	db $2b, $57, $32, $47
	db $2b, $5f, $33, $47
	db $2b, $80, $33, $67
	db $2b, $88, $32, $67
	db $2b, $90, $32, $67
	db $2b, $98, $31, $67
	db $23, $98, $30, $67
	db $ff

Pokedex_UpdateSearchResultsCursorOAM: ; 41281 (10:5281)
	ld hl, .CursorOAM
	jp Pokedex_LoadCursorOAM

.CursorOAM: ; 41290
	db $1b, $47, $30, $07
	db $13, $47, $31, $07
	db $13, $4f, $32, $07
	db $13, $57, $32, $07
	db $13, $5f, $32, $07
	db $13, $67, $33, $07
	db $13, $7e, $33, $27
	db $13, $86, $32, $27
	db $13, $8e, $32, $27
	db $13, $96, $32, $27
	db $13, $9e, $31, $27
	db $1b, $9e, $30, $27
	db $23, $47, $30, $47
	db $2b, $47, $31, $47
	db $2b, $4f, $32, $47
	db $2b, $57, $32, $47
	db $2b, $5f, $32, $47
	db $2b, $67, $33, $47
	db $2b, $7e, $33, $67
	db $2b, $86, $32, $67
	db $2b, $8e, $32, $67
	db $2b, $96, $32, $67
	db $2b, $9e, $31, $67
	db $23, $9e, $30, $67
	db $ff

Pokedex_LoadCursorOAM: ; 412f1 (10:52f1)
	ld de, Sprites
.loop
	ld a, [hl]
	cp $ff
	ret z
	ld a, [wDexListingCursor]
	and $7
	swap a
	add [hl]
	inc hl
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	jr .loop

Pokedex_PutScrollbarOAM: ; 4130e (10:530e)
; Writes the OAM data for the scrollbar in the new mode and ABC mode.
	push de
	ld a, [wDexListingEnd]
	dec a
	ld e, a
	ld a, [wDexListingCursor]
	ld hl, wDexListingScrollOffset
	add [hl]
	cp e
	jr z, .asm_4133f
	ld hl, $0
	ld bc, $79
	call AddNTimes
	ld e, l
	ld d, h
	ld b, $0
	ld a, d
	or e
	jr z, .asm_41341
	ld a, [wDexListingEnd]
	ld c, a
.asm_41333
	ld a, e
	sub c
	ld e, a
	ld a, d
	sbc $0
	ld d, a
	jr c, .asm_41341
	inc b
	jr .asm_41333
.asm_4133f
	ld b, $79
.asm_41341
	ld a, $14
	add b
	pop hl
	ld [hli], a
	ld a, $a1
	ld [hli], a
	ld a, $f
	ld [hli], a
	ld [hl], $0
	ret

Pokedex_InitArrowCursor: ; 4134f (10:534f)
	xor a
	ld [wDexArrowCursorPosIndex], a
	ld [wDexArrowCursorDelayCounter], a
	ld [wDexArrowCursorBlinkCounter], a
	ret

Pokedex_MoveArrowCursor: ; 4135a (10:535a)
; bc = [de] - 1
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	dec a
	ld c, a
	inc de
	call Pokedex_BlinkArrowCursor

	ld hl, hJoyPressed
	ld a, [hl]
	and D_LEFT | D_UP
	and b
	jr nz, .move_left_or_up
	ld a, [hl]
	and D_RIGHT | D_DOWN
	and b
	jr nz, .move_right_or_down
	ld a, [hl]
	and SELECT
	and b
	jr nz, .select
	call Pokedex_ArrowCursorDelay
	jr c, .no_action
	ld hl, hJoyLast
	ld a, [hl]
	and D_LEFT | D_UP
	and b
	jr nz, .move_left_or_up
	ld a, [hl]
	and D_RIGHT | D_DOWN
	and b
	jr nz, .move_right_or_down
	jr .no_action

.move_left_or_up
	ld a, [wDexArrowCursorPosIndex]
	and a
	jr z, .no_action
	call Pokedex_GetArrowCursorPos
	ld [hl], " "
	ld hl, wDexArrowCursorPosIndex
	dec [hl]
	jr .update_cursor_pos

.move_right_or_down
	ld a, [wDexArrowCursorPosIndex]
	cp c
	jr nc, .no_action
	call Pokedex_GetArrowCursorPos
	ld [hl], " "
	ld hl, wDexArrowCursorPosIndex
	inc [hl]

.update_cursor_pos
	call Pokedex_GetArrowCursorPos
	ld [hl], "▶"
	ld a, 12
	ld [wDexArrowCursorDelayCounter], a
	xor a
	ld [wDexArrowCursorBlinkCounter], a
	scf
	ret

.no_action
	and a
	ret

.select
	call Pokedex_GetArrowCursorPos
	ld [hl], " "
	ld a, [wDexArrowCursorPosIndex]
	cp c
	jr c, .update
	ld a, -1
.update
	inc a
	ld [wDexArrowCursorPosIndex], a
	jr .update_cursor_pos

Pokedex_GetArrowCursorPos: ; 413d4 (10:53d4)
	ld a, [wDexArrowCursorPosIndex]
	add a
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

Pokedex_BlinkArrowCursor: ; 413e0 (10:53e0)
	ld hl, wDexArrowCursorBlinkCounter
	ld a, [hl]
	inc [hl]
	and $8
	jr z, .blink_on
	call Pokedex_GetArrowCursorPos
	ld [hl], " "
	ret

.blink_on
	call Pokedex_GetArrowCursorPos
	ld [hl], "▶"
	ret

Pokedex_ArrowCursorDelay: ; 413f5 (10:53f5)
; Updates the delay counter set when moving the arrow cursor.
; Returns whether the delay is active in carry.
	ld hl, wDexArrowCursorDelayCounter
	ld a, [hl]
	and a
	ret z

	dec [hl]
	scf
	ret

Pokedex_FillBox: ; 413fe (10:53fe)
	jp FillBoxWithByte

Pokedex_WhiteOutBG: ; 41401 (10:5401)
; Make BG palettes white so that the BG becomes all white.
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, UnknBGPals
	ld bc, 8 palettes
	ld a, $ff ; xor a
	call ByteFill
	pop af
	ld [rSVBK], a
	xor a
	call DmgToCgbBGPals
	xor a
	call DmgToCgbObjPal0
	jp DelayFrame

Pokedex_GetSGBLayout: ; 41423
	ld b, a
	jp GetSGBLayout

Pokedex_LoadPointer: ; 41432
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

Pokedex_LoadSelectedMonTiles: ; 4143b
; Loads the tiles of the currently selected Pokémon.
	call Pokedex_GetSelectedMon
	call Pokedex_CheckSeen
	jr z, .QuestionMark
	ld a, [wd265]
	ld [CurPartySpecies], a
	cp SPINDA
	ld a, 1
	jr nz, .got_variant
	ld a, [wFirstSpindaSeen]
.got_variant
	ld [MonVariant], a
	call GetBaseData
	ld de, VTiles2
	predef_jump GetFrontpic

.QuestionMark:
	ld a, BANK(sScratch)
	call GetSRAMBank
	farcall LoadQuestionMarkPic
	ld hl, VTiles2
	ld de, sScratch
	ld c, 7 * 7
	ld a, [hROMBank]
	ld b, a
	call Get2bpp
	jp CloseSRAM

Pokedex_LoadGFX: ; 414b7
	call DisableLCD
	ld hl, VTiles2
	ld bc, (7 * 7) tiles
	xor a
	call ByteFill
	call LoadStandardFont
	call LoadFontsExtra
	ld hl, PokedexLZ
	ld de, VTiles2 tile $40
	call Decompress
	ld hl, PokedexSlowpokeLZ
	ld de, VTiles0
	call Decompress
	ld a, 6
	call SkipMusic
	jp EnableLCD

_NewPokedexEntry: ; 41a7f
	xor a
	ld [hBGMapMode], a
	farcall DrawDexEntryScreenRightEdge
	call Pokedex_ResetBGMapMode
	call DisableLCD
	call LoadStandardFont
	call LoadFontsExtra
	call Pokedex_LoadGFX
	ld a, [wd265]
	ld [CurPartySpecies], a
	call Pokedex_DrawDexEntryScreenBG
	hlcoord 0, 17
	ld [hl], $4a
	inc hl
	ld bc, 19
	ld a, " "
	call ByteFill
	farcall DisplayDexEntry
	call EnableLCD
	call WaitBGMap
	call GetBaseData
	ld de, VTiles2
	predef GetFrontpic
	ld a, SCGB_POKEDEX
	call Pokedex_GetSGBLayout
	call DelayFrame
	ld a, [CurPartySpecies]
	jp PlayCry

Pokedex_SetBGMapMode3: ; 41ad7 (10:5ad7)
	ld a, $3
	ld [hBGMapMode], a
	jp Delay2

Pokedex_SetBGMapMode4: ; 41ae1 (10:5ae1)
	ld a, $4
	ld [hBGMapMode], a
	jp Delay2

Pokedex_ResetBGMapMode: ; 41af7
	xor a
	ld [hBGMapMode], a
	ret

PokedexLZ: ; 4150e
INCBIN "gfx/pokedex/pokedex.2bpp.lz"

PokedexSlowpokeLZ: ; 416b0
INCBIN "gfx/pokedex/slowpoke.2bpp.lz"
