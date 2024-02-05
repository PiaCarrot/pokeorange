
Special:: ; c01b
; Run script special de.
	ld hl, SpecialsPointers
	add hl,de
	add hl,de
	add hl,de
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, b
	rst FarCall
	ret
; c029

SpecialsPointers:: ; c029
	add_special WarpToSpawnPoint

; Communications
	add_special Special_SetBitsForLinkTradeRequest
	add_special Special_WaitForLinkedFriend
	add_special Special_CheckLinkTimeout
	add_special Special_TryQuickSave
	add_special Special_CheckBothSelectedSameRoom
	add_special Special_FailedLinkToPast
	add_special Special_CloseLink
	add_special WaitForOtherPlayerToExit
	add_special Special_SetBitsForBattleRequest
	add_special Special_TradeCenter
	add_special Special_Colosseum
	add_special Special_CableClubCheckWhichChris

; Map Events
	add_special BugContestJudging
	add_special CheckPartyFullAfterContest
	add_special ContestDropOffMons
	add_special ContestReturnMons
	add_special Special_GiveParkBalls
	add_special Special_CheckMagikarpLength
	add_special Special_MagikarpHouseSign
	add_special HealParty
	add_special PokemonCenterPC
	add_special Special_KrissHousePC
	add_special Special_DayCareMan
	add_special Special_DayCareLady
	add_special Special_DayCareManOutside
	add_special MoveDeletion
	add_special Special_MagnetTrain
	add_special Special_TownMap
	add_special Special_TownMapItem
	add_special Special_SlotMachine
	add_special Special_CardFlip
	add_special Special_ClearBGPalettesBufferScreen
	add_special FadeOutPalettes
	add_special Special_BattleTowerFade
	add_special Special_FadeBlackQuickly
	add_special FadeInPalettes
	add_special Special_FadeInQuickly
	add_special Special_ReloadSpritesNoPalettes
	add_special ClearBGPalettes
	add_special UpdateTimePals
	add_special ClearTileMap
	add_special UpdateSprites
	add_special ReplaceKrisSprite
	add_special Special_GameCornerPrizeMonCheckDex
	add_special ShowPokedexEntry
	add_special SpecialSeenMon
	add_special WaitSFX
	add_special PlayMapMusic
	add_special RestartMapMusic
	add_special HealMachineAnim
	add_special Special_SurfStartStep
	add_special Special_FindGreaterThanThatLevel
	add_special Special_FindAtLeastThatHappy
	add_special Special_FindThatSpecies
	add_special Special_FindThatSpeciesYourTrainerID
	add_special Special_DayCareMon1
	add_special Special_DayCareMon2
	add_special Special_SelectRandomBugContestContestants
	add_special Special_ActivateFishingSwarm
	add_special Special_BillsGrandfather
	add_special SpecialCheckPokerus
	add_special Special_DisplayCoinCaseBalance
	add_special Special_DisplayMoneyAndCoinBalance
	add_special PlaceMoneyTopRight
	add_special Special_CheckForLuckyNumberWinners
	add_special Special_CheckLuckyNumberShowFlag
	add_special Special_ResetLuckyNumberShowFlag
	add_special Special_PrintTodaysLuckyNumber
	add_special SpecialNameRater
	add_special Special_DisplayLinkRecord
	add_special GetFirstPokemonHappiness
	add_special CheckFirstMonIsEgg
	add_special MapCallbackSprites_LoadUsedSpritesGFX
	add_special PlaySlowCry
	add_special Special_YoungerHaircutBrother
	add_special Special_OlderHaircutBrother
	add_special Special_DaisyMassage
	add_special PlayCurMonCry
	add_special ProfOaksPCBoot
	add_special InitRoamMons
	add_special Special_FadeOutMusic
	add_special Diploma
	add_special SpecialBulbasaur
	add_special SpecialCharmander
	add_special SpecialSquirtle
	add_special SpecialIllustratorPikachu
	add_special SpecialMagikarp
	add_special SpecialDratini
	add_special SpecialTakeMeowth

	; Crystal
	add_special Reset
	add_special Special_MoveTutor
	add_special SpecialMonCheck
	add_special Special_SetPlayerPalette
	add_special RefreshSprites
	add_special LoadMapPalettes
	add_special Special_InitialSetDSTFlag
	add_special Special_InitialClearDSTFlag
	add_special ClockResetter
	add_special MoveReminder
; c224

Special_SetPlayerPalette: ; c225
	ld a, [ScriptVar]
	ld d, a
	farcall SetPlayerPalette
	ret
; c230

Special_GameCornerPrizeMonCheckDex: ; c230
	ld a, [ScriptVar]
	dec a
	call CheckCaughtMon
	ret nz
	ld a, [ScriptVar]
	dec a
	call SetSeenAndCaughtMon
	call FadeToMenu
	ld a, [ScriptVar]
	ld [wd265], a
	farcall NewPokedexEntry
	jp ExitAllMenus
; c252

ShowPokedexEntry:
	ld a, [ScriptVar]
	dec a
	call SetSeenMon
	call FadeToMenu
	ld a, [ScriptVar]
	ld [wNamedObjectIndexBuffer], a
	farcall NewPokedexEntry
	call ExitAllMenus
	ret

SpecialSeenMon: ; c252
	ld a, [ScriptVar]
	dec a
	jp SetSeenMon
; c25a

Special_FindGreaterThanThatLevel: ; c25a
	ld a, [ScriptVar]
	ld b, a
	farcall _FindGreaterThanThatLevel
	jr z, FoundNone
	jr FoundOne

Special_FindAtLeastThatHappy: ; c268
	ld a, [ScriptVar]
	ld b, a
	farcall _FindAtLeastThatHappy
	jr z, FoundNone
	jr FoundOne

Special_FindThatSpecies: ; c276
	ld a, [ScriptVar]
	ld b, a
	farcall _FindThatSpecies
	jr z, FoundNone
	jr FoundOne

Special_FindThatSpeciesYourTrainerID: ; c284
	ld a, [ScriptVar]
	ld b, a
	farcall _FindThatSpeciesYourTrainerID
	jr z, FoundNone
	; fallthrough

FoundOne: ; c292
	ld a, TRUE
	ld [ScriptVar], a
	ret

FoundNone: ; c298
	xor a
	ld [ScriptVar], a
	ret
; c29d

SpecialNameRater: ; c2b9
	farcall NameRater
	ret
; c2c0

Special_TownMap: ; c2c0
	call FadeToMenu
	farcall _TownMap
	jp ExitAllMenus
; c2cd

Special_TownMapItem:
	call FadeToMenu
	farcall _TownMap
	farcall Pack_InitGFX
	farcall Pack_InitColors
	jp Call_ExitMenu

Special_DisplayLinkRecord: ; c2da
	call FadeToMenu
	farcall DisplayLinkRecord
	jp ExitAllMenus
; c2e7

Special_KrissHousePC: ; c2e7
	xor a
	ld [ScriptVar], a
	farcall _KrissHousePC
	ld a, c
	ld [ScriptVar], a
	ret
; c2f6

BugContestJudging: ; c34a
	farcall _BugContestJudging
	ld a, b
	ld [ScriptVar], a
	ret
; c355

Special_SlotMachine: ; c373
	call Special_CheckCoins
	ret c
	ld a, BANK(_SlotMachine)
	ld hl, _SlotMachine
	jr Special_StartGameCornerGame
; c380

Special_CardFlip: ; c380
	call Special_CheckCoins
	ret c
	ld a, BANK(_CardFlip)
	ld hl, _CardFlip
	; fallthrough
; c38d

Special_StartGameCornerGame: ; c39a
	call FarQueueScript
	call FadeToMenu
	ld hl, wQueuedScriptBank
	ld a, [hli]
	push af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	rst FarCall
	jp ExitAllMenus
; c3ae

Special_CheckCoins: ; c3ae
	ld hl, Coins
	ld a, [hli]
	or [hl]
	jr z, .no_coins
	ld a, COIN_CASE
	ld [wCurItem], a
	ld hl, NumItems
	call CheckItem
	jr nc, .no_coin_case
	and a
	ret

.no_coins
	ld hl, .NoCoinsText
	jr .print

.no_coin_case
	ld hl, .NoCoinCaseText

.print
	call PrintText
	scf
	ret
; c3d1

.NoCoinsText: ; 0xc3d1
	; You have no coins.
	text_jump UnknownText_0x1bd3d7
	db "@"
; 0xc3d6

.NoCoinCaseText: ; 0xc3d6
	; You don't have a COIN CASE.
	text_jump UnknownText_0x1bd3eb
	db "@"
; 0xc3db

Special_ClearBGPalettesBufferScreen: ; c3db
	call ClearBGPalettes
	jp BufferScreen
; c3e2

ScriptReturnCarry: ; c3e2
	jr c, .carry
	xor a
	ld [ScriptVar], a
	ret
.carry
	ld a, 1
	ld [ScriptVar], a
	ret
; c3ef

Special_ActivateFishingSwarm: ; c3fc
	ld a, [ScriptVar]
	ld [wFishingSwarmFlag], a
	ret
; c403


StoreSwarmMapIndices:: ; c403
	ld a, d
	ld [wYanmaMapGroup], a
	ld a, e
	ld [wYanmaMapNumber], a
	ret
; c419


SpecialCheckPokerus: ; c419
; Check if a monster in your party has Pokerus
	farcall CheckPokerus
	jp ScriptReturnCarry
; c422

Special_ResetLuckyNumberShowFlag: ; c422
	farcall RestartLuckyNumberCountdown
	ld hl, wLuckyNumberShowFlag
	res 0, [hl]
	farcall LoadOrRegenerateLuckyIDNumber
	ret
; c434

Special_CheckLuckyNumberShowFlag: ; c434
	farcall CheckLuckyNumberShowFlag
	jp ScriptReturnCarry
; c43d

PlayCurMonCry: ; c472
	ld a, [CurPartySpecies]
	jp PlayCry
; c478

Special_FadeOutMusic: ; c48f
	ld a, MUSIC_NONE % $100
	ld [MusicFadeIDLo], a
	ld a, MUSIC_NONE / $100
	ld [MusicFadeIDHi], a
	ld a, $2
	ld [MusicFade], a
	ret
; c49f

Diploma: ; c49f
	call FadeToMenu
	farcall _Diploma
	jp ExitAllMenus
; c4ac

ClockResetter:
	farcall RestartClock
	ret