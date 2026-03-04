_MainMenu: ; 5ae8
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	ld de, MUSIC_RIDING_LAPRAS
	ld a, e
	ld [wMapMusic], a
	call PlayMusic
	farcall MainMenu
	jp StartTitleScreen
; 5b04

PrintDayOfWeek: ; 5b05
	push de
	ld hl, .Days
	ld a, b
	call GetNthString
	ld d, h
	ld e, l
	pop hl
	call PlaceString
	ld h, b
	ld l, c
	ld de, .Day
	jp PlaceString
; 5b1c

.Days: ; 5b1c
	db "SUN@"
	db "MON@"
	db "TUES@"
	db "WEDNES@"
	db "THURS@"
	db "FRI@"
	db "SATUR@"
; 5b40

.Day: ; 5b40
	db "DAY@"
; 5b44

NewGame_ClearTileMapEtc: ; 5b44
	xor a
	ld [hMapAnims], a
	call ClearTileMap
	call LoadFontsExtra
	call LoadStandardFont
	jp ClearWindowData
; 5b54

OptionsMenu: ; 5b64
	farcall _OptionsMenu
	ret
; 5b6b

NewGame: ; 5b6b
	xor a
	ld [wMonStatusFlags], a
	call ResetWRAM
	call NewGame_ClearTileMapEtc
	call AreYouABoyOrAreYouAGirl
	call OakSpeech
	call InitializeWorld
	ld a, 1
	ld [wPreviousLandmark], a

	ld a, SPAWN_HOME
	ld [DefaultSpawnpoint], a

	ld a, MAPSETUP_WARP
	ld [hMapEntryMethod], a
	jp FinishContinueFunction
; 5b8f

AreYouABoyOrAreYouAGirl: ; 5b8f
	farcall InitGender
	ret

ResetWRAM: ; 5ba7
	xor a
	ld [hBGMapMode], a
	; fallthrough

_ResetWRAM: ; 5bae

	ld hl, Sprites
	ld bc, wOptions - Sprites
	xor a
	call ByteFill

	ld hl, wd000
	ld bc, wGameData - wd000
	xor a
	call ByteFill

	ld hl, wGameData
	ld bc, wGameDataEnd - wGameData
	xor a
	call ByteFill

	ld a, [rLY]
	ld [hSecondsBackup], a
	call DelayFrame
	ld a, [hRandomSub]
	ld [PlayerID], a

	ld a, [rLY]
	ld [hSecondsBackup], a
	call DelayFrame
	ld a, [hRandomAdd]
	ld [PlayerID + 1], a

	call Random
	ld [wSecretID], a
	call DelayFrame
	call Random
	ld [wSecretID + 1], a

	ld hl, PartyCount
	call .InitList

	xor a
	ld [wCurBox], a
	ld [wSavedAtLeastOnce], a

	call SetDefaultBoxNames

	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld hl, sBoxCount
	call .InitList
	call CloseSRAM

	ld hl, NumItems
	call .InitList

	ld hl, NumKeyItems
	call .InitList

	ld hl, NumBalls
	call .InitList

	ld hl, PCItems
	call .InitList

	xor a
	ld [wRoamMon1Species], a
	ld [wRoamMon2Species], a
	ld [wRoamMon3Species], a
	ld a, -1
	ld [wRoamMon1MapGroup], a
	ld [wRoamMon2MapGroup], a
	ld [wRoamMon3MapGroup], a
	ld [wRoamMon1MapNumber], a
	ld [wRoamMon2MapNumber], a
	ld [wRoamMon3MapNumber], a

	call LoadOrRegenerateLuckyIDNumber
	call InitializeMagikarpHouse

	xor a
	ld [MonType], a

	ld [Badges], a

	ld [Coins], a
	ld [Coins + 1], a

;	ld [Shells], a
;	ld [Shells + 1], a

START_MONEY EQU 3000

IF START_MONEY / $10000
	ld a, START_MONEY / $10000
ENDC
	ld [Money], a
	ld a, START_MONEY / $100 % $100
	ld [Money + 1], a
	ld a, START_MONEY % $100
	ld [Money + 2], a

	farcall DeletePartyMonMail

	;Shiny Charm Cheatcode
	ld hl, hJoypadDown
	ld a, [hl]
	and SELECT
	jr z, .skipShinycharm
	ld hl, PCItems
	ld a, 1
	ld [hli], a
	ld a, SHINY_CHARM
	ld [hli], a
	ld a, 1
	ld [hli], a
	ld a, -1
	ld [hl], a
	;Set the Flag to prevent getting multiple charms
	ld hl, EventFlags
	ld b, SET_FLAG
	ld c, EVENT_GOT_SHINY_CHARM
	predef FlagPredef 
.skipShinycharm

	jp ResetGameTime
; 5ca1

.InitList: ; 5ca1
; Loads 0 in the count and -1 in the first item or mon slot.
	xor a
	ld [hli], a
	dec a
	ld [hl], a
	ret
; 5ca6

SetDefaultBoxNames: ; 5ca6
	ld hl, wBoxNames
	ld c, 0
.loop
	push hl
	ld de, .Box
	call CopyName2
	dec hl
	ld a, c
	inc a
	cp 10
	jr c, .less
	sub 10
	ld [hl], "1"
	inc hl

.less
	add "0"
	ld [hli], a
	ld [hl], "@"
	pop hl
	ld de, 9
	add hl, de
	inc c
	ld a, c
	cp NUM_BOXES
	jr c, .loop
	ret

.Box:
	db "BOX@"
; 5cd3

InitializeMagikarpHouse: ; 5cd3
	ld hl, wBestMagikarpLengthFeet
	ld a, $3
	ld [hli], a
	ld a, $6
	ld [hli], a
	ld de, .Ralph
	jp CopyName2
; 5ce3

.Ralph: ; 5ce3
	db "RALPH@"
; 5ce9

InitializeWorld: ; 5d23
	call ShrinkPlayer
	farcall SpawnPlayer
	farcall _InitializeStartDay
	ret
; 5d33

LoadOrRegenerateLuckyIDNumber: ; 5d33
	ld a, BANK(sLuckyIDNumber)
	call GetSRAMBank
	ld a, [CurDay]
	inc a
	ld b, a
	ld a, [sLuckyNumberDay]
	cp b
	ld a, [sLuckyIDNumber + 1]
	ld c, a
	ld a, [sLuckyIDNumber]
	jr z, .skip
	ld a, b
	ld [sLuckyNumberDay], a
	call Random
	ld c, a
	call Random

.skip
	ld [wLuckyIDNumber], a
	ld [sLuckyIDNumber], a
	ld a, c
	ld [wLuckyIDNumber + 1], a
	ld [sLuckyIDNumber + 1], a
	jp CloseSRAM
; 5d65

Continue: ; 5d65
	farcall TryLoadSaveFile
	ret c
	farcall _LoadData
	call LoadStandardMenuDataHeader
	call DisplaySaveInfoOnContinue
	ld a, $1
	ld [hBGMapMode], a
	ld c, 20
	call DelayFrames
	call ConfirmContinue
	jp c, CloseWindow
	call Continue_CheckRTC_RestartClock
	jp c, CloseWindow
	ld a, $8
	ld [MusicFade], a
	ld a, MUSIC_NONE % $100
	ld [MusicFadeIDLo], a
	ld a, MUSIC_NONE / $100
	ld [MusicFadeIDHi], a
	call ClearBGPalettes
	call CloseWindow
	call ClearTileMap
	ld c, 20
	call DelayFrames
	farcall JumpRoamMons
	farcall Function140ae ; time-related
	ld a, [wSpawnAfterChampion]
	cp SPAWN_LANCE
	jr z, .SpawnAfterE4
	ld a, MAPSETUP_CONTINUE
	ld [hMapEntryMethod], a
	jp FinishContinueFunction

.SpawnAfterE4:
	ld a, SPAWN_VALENCIA
	ld [DefaultSpawnpoint], a
	call PostCreditsSpawn
	jp FinishContinueFunction
; 5de2

SpawnAfterRed: ; 5de2
	ld a, SPAWN_HOME
	ld [DefaultSpawnpoint], a
	; fallthrough
; 5de7

PostCreditsSpawn: ; 5de7
	xor a
	ld [wSpawnAfterChampion], a
	ld a, MAPSETUP_WARP
	ld [hMapEntryMethod], a
	ret
; 5df0

ConfirmContinue: ; 5e34
.loop
	call DelayFrame
	call GetJoypad
	ld hl, hJoyPressed
	bit A_BUTTON_F, [hl]
	ret nz
	bit B_BUTTON_F, [hl]
	jr z, .loop
	scf
	ret
; 5e48

Continue_CheckRTC_RestartClock: ; 5e48
	call CheckRTCStatus
	and %10000000 ; Day count exceeded 16383
	jr z, .pass
	farcall RestartClock
	ld a, c
	and a
	jr z, .pass
	scf
	ret

.pass
	xor a
	ret
; 5e5d

FinishContinueFunction: ; 5e5d
.loop
	xor a
	ld [wDontPlayMapMusicOnReload], a
	ld [wLinkMode], a
	ld hl, GameTimerPause
	set 0, [hl]
	res 7, [hl]
	ld hl, wEnteredMapFromContinue
	set 1, [hl]
	farcall OverworldLoop
	ld a, [wSpawnAfterChampion]
	cp SPAWN_RED
	jp nz, Reset
	call SpawnAfterRed
	jr .loop
; 5e85

DisplaySaveInfoOnContinue: ; 5e85
	call CheckRTCStatus
	and %10000000
	jr z, .clock_ok
	lb de, 4, 8
	jp DisplayContinueDataWithRTCError

.clock_ok
	lb de, 4, 8
	jr DisplayNormalContinueData
; 5e9a

DisplaySaveInfoOnSave: ; 5e9a
	lb de, 4, 0
	; fallthrough
; 5e9f

DisplayNormalContinueData: ; 5e9f
	call Continue_LoadMenuHeader
	call Continue_DisplayBadgesDexPlayerName
	call Continue_PrintGameTime
	call LoadFontsExtra
	jp UpdateSprites
; 5eaf

DisplayContinueDataWithRTCError: ; 5eaf
	call Continue_LoadMenuHeader
	call Continue_DisplayBadgesDexPlayerName
	call Continue_UnknownGameTime
	call LoadFontsExtra
	jp UpdateSprites
; 5ebf

Continue_LoadMenuHeader: ; 5ebf
	xor a
	ld [hBGMapMode], a
	ld hl, .MenuDataHeader_Dex
	ld a, [StatusFlags]
	bit 0, a ; pokedex
	jr nz, .pokedex_header
	ld hl, .MenuDataHeader_NoDex

.pokedex_header
	call _OffsetMenuDataHeader
	call MenuBox
	jp PlaceVerticalMenuItems
; 5ed9

.MenuDataHeader_Dex: ; 5ed9
	db $40 ; flags
	db 00, 00 ; start coords
	db 09, 15 ; end coords
	dw .MenuData2_Dex
	db 1 ; default option
; 5ee1

.MenuData2_Dex: ; 5ee1
	db $00 ; flags
	db 4 ; items
	db "PLAYER@"
	db "BADGES@"
	db "#DEX@"
	db "TIME@"
; 5efb

.MenuDataHeader_NoDex: ; 5efb
	db $40 ; flags
	db 00, 00 ; start coords
	db 09, 15 ; end coords
	dw .MenuData2_NoDex
	db 1 ; default option
; 5f03

.MenuData2_NoDex: ; 5f03
	db $00 ; flags
	db 4 ; items
	db "PLAYER <PLAYER>@"
	db "BADGES@"
	db " @"
	db "TIME@"
; 5f1c


Continue_DisplayBadgesDexPlayerName: ; 5f1c
	call MenuBoxCoord2Tile
	push hl
	decoord 13, 4, 0
	add hl, de
	call Continue_DisplayBadgeCount
	pop hl
	push hl
	decoord 12, 6, 0
	add hl, de
	call Continue_DisplayPokedexNumCaught
	pop hl
	push hl
	decoord 8, 2, 0
	add hl, de
	ld de, .Player
	call PlaceString
	pop hl
	ret

.Player:
	db "<PLAYER>@"
; 5f40

Continue_PrintGameTime: ; 5f40
	decoord 9, 8, 0
	add hl, de
	jp Continue_DisplayGameTime
; 5f48

Continue_UnknownGameTime: ; 5f48
	decoord 9, 8, 0
	add hl, de
	ld de, .three_question_marks
	jp PlaceString

.three_question_marks
	db " ???@"
; 5f58

Continue_DisplayBadgeCount: ; 5f58
	push hl
	ld hl, Badges
	ld b, 1
	call CountSetBits
	pop hl
	ld de, wd265
	lb bc, 1, 2
	jp PrintNum
; 5f6b

Continue_DisplayPokedexNumCaught: ; 5f6b
	ld a, [StatusFlags]
	bit 0, a ; Pokedex
	ret z
	push hl
	ld hl, PokedexCaught
IF NUM_POKEMON % 8
	ld b, NUM_POKEMON / 8 + 1
ELSE
	ld b, NUM_POKEMON / 8
ENDC
	call CountSetBits
	pop hl
	ld de, wd265
	lb bc, 1, 3
	jp PrintNum
; 5f84

Continue_DisplayGameTime: ; 5f84
	ld de, GameTimeHours
	lb bc, 2, 3
	call PrintNum
	ld [hl], ":"
	inc hl
	ld de, GameTimeMinutes
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	jp PrintNum
; 5f99


OakSpeech: ; 0x5f99
	farcall InitClock
	
	ld hl, Text_AskForHardMode
	call PrintText
	call YesNoBox
	jr c, .not_hard
	ld hl, StatusFlags
	set 1, [hl] ; hard mode
.not_hard
	call RotateFourPalettesLeft
	call ClearTileMap

	ld de, MUSIC_ROUTE_24_GBS
	call PlayMusic

	call RotateFourPalettesRight
	call RotateThreePalettesRight
	xor a
	ld [CurPartySpecies], a
	ld a, PROF_IVY
	ld [TrainerClass], a
	call Intro_PrepTrainerPic

	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	call Intro_RotatePalettesLeftFrontpic

	ld hl, OakText1
	call PrintText
	call RotateThreePalettesRight
	call ClearTileMap

	ld a, BUTTERFREE
	ld [CurSpecies], a
	ld [CurPartySpecies], a
	call GetBaseData

	hlcoord 6, 4
	call PrepMonFrontpic

	xor a
	ld [TempMonDVs], a
	ld [TempMonDVs + 1], a

	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	call Intro_WipeInFrontpic

	ld hl, OakText2
	call PrintText
	ld hl, OakText4
	call PrintText
	call RotateThreePalettesRight
	call ClearTileMap

	xor a
	ld [CurPartySpecies], a
	ld a, PROF_IVY
	ld [TrainerClass], a
	call Intro_PrepTrainerPic

	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	call Intro_RotatePalettesLeftFrontpic

	ld hl, OakText5
	call PrintText
	call RotateThreePalettesRight
	call ClearTileMap

	xor a
	ld [CurPartySpecies], a
	farcall DrawIntroPlayerPic

	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	call Intro_RotatePalettesLeftFrontpic

	ld hl, OakText6
	call PrintText
	call NamePlayer
	ld hl, OakText7
	jp PrintText

OakText1: ; 0x6045
	text_jump _OakText1
	db "@"

OakText2: ; 0x604a
	text_jump _OakText2
	start_asm
	ld a, BUTTERFREE
	call PlayCry
	call WaitSFX
	ld hl, OakText3
	ret

OakText3: ; 0x605b
	text_jump _OakText3
	db "@"

OakText4: ; 0x6060
	text_jump _OakText4
	db "@"

OakText5: ; 0x6065
	text_jump _OakText5
	db "@"

OakText6: ; 0x606a
	text_jump _OakText6
	db "@"

OakText7: ; 0x606f
	text_jump _OakText7
	db "@"

Text_AskForHardMode:
	text_jump _HardModeText
	db "@"

NamePlayer: ; 0x6074
	farcall MovePlayerPicRight
	farcall ShowPlayerNamingChoices
	ld a, [wMenuCursorY]
	dec a
	jr z, .NewName
	call StorePlayerName
	farcall ApplyMonOrTrainerPals
	farcall MovePlayerPicLeft
	ret

.NewName:
	ld b, $1 ; player
	ld de, PlayerName
	farcall NamingScreen

	call RotateThreePalettesRight
	call ClearTileMap

	call LoadFontsExtra
	call WaitBGMap

	xor a
	ld [CurPartySpecies], a
	farcall DrawIntroPlayerPic

	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	call RotateThreePalettesLeft

	ld hl, PlayerName
	ld de, .Chris
	ld a, [PlayerGender]
	bit 0, a
	jr z, .Male
	ld de, .Kris
.Male:
	jp InitName

.Chris:
	db "INDIGO@@@@@"
.Kris:
	db "ORANGE@@@@@"
; 60e9

StorePlayerName: ; 60fa
	ld a, "@"
	ld bc, NAME_LENGTH
	ld hl, PlayerName
	call ByteFill
	ld hl, PlayerName
	ld de, StringBuffer2
	jp CopyName2
; 610f

ShrinkPlayer: ; 610f

	ld a, [hROMBank]
	push af

	ld a, 0 << 7 | 32 ; fade out
	ld [MusicFade], a
	ld de, MUSIC_NONE
	ld a, e
	ld [MusicFadeIDLo], a
	ld a, d
	ld [MusicFadeIDHi], a

	ld de, SFX_ESCAPE_ROPE
	call PlaySFX
	pop af
	rst Bankswitch

	ld c, 8
	call DelayFrames

	ld hl, Shrink1Pic
	ld b, BANK(Shrink1Pic)
	call ShrinkFrame

	ld c, 8
	call DelayFrames

	ld hl, Shrink2Pic
	ld b, BANK(Shrink2Pic)
	call ShrinkFrame

	ld c, 8
	call DelayFrames

	hlcoord 6, 5
	lb bc, 7, 7
	call ClearBox

	ld c, 3
	call DelayFrames

	call Intro_PlacePlayerSprite
	call LoadFontsExtra

	ld c, 50
	call DelayFrames

	call RotateThreePalettesRight
	jp ClearTileMap
; 616a

Intro_RotatePalettesLeftFrontpic: ; 616a
	ld hl, IntroFadePalettes
	ld b, IntroFadePalettesEnd - IntroFadePalettes
.loop
	ld a, [hli]
	call DmgToCgbBGPals
	ld c, 10
	call DelayFrames
	dec b
	jr nz, .loop
	ret
; 617c

IntroFadePalettes: ; 0x617c
	db %01010100
	db %10101000
	db %11111100
	db %11111000
	db %11110100
	db %11100100
IntroFadePalettesEnd:
; 6182

Intro_WipeInFrontpic: ; 6182
	ld a, $77
	ld [hWX], a
	call DelayFrame
	ld a, %11100100
	call DmgToCgbBGPals
.loop
	call DelayFrame
	ld a, [hWX]
	sub $8
	cp -1
	ret z
	ld [hWX], a
	jr .loop
; 619c

Intro_PrepTrainerPic: ; 619c
	ld de, VTiles2
	farcall GetTrainerPic
	xor a
	ld [hGraphicStartTile], a
	hlcoord 6, 4
	lb bc, 7, 7
	predef_jump PlaceGraphic
; 61b4

ShrinkFrame: ; 61b4
	ld de, VTiles2
	ld c, $31
	predef DecompressPredef
	xor a
	ld [hGraphicStartTile], a
	hlcoord 6, 4
	lb bc, 7, 7
	predef_jump PlaceGraphic
; 61cd

Intro_PlacePlayerSprite: ; 61cd

	farcall GetPlayerIcon
	ld c, $c
	ld hl, VTiles0
	call Request2bpp

	ld hl, Sprites
	ld de, .sprites
	ld a, [de]
	inc de

	ld c, a
.loop
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a

	ld b, PAL_OW_PURPLE
	ld a, [PlayerGender]
	bit 0, a
	jr z, .male
	ld b, PAL_OW_RED
.male
	ld a, b

	ld [hli], a
	dec c
	jr nz, .loop
	ret
; 61fe

.sprites ; 61fe
	db 4
	db  9 * 8 + 4,  9 * 8, 0
	db  9 * 8 + 4, 10 * 8, 1
	db 10 * 8 + 4,  9 * 8, 2
	db 10 * 8 + 4, 10 * 8, 3
; 620b


CrystalIntroSequence: ; 620b
	farcall Copyright_GFPresents
StartTitleScreen: ; 6219
	ld hl, rIE
	set LCD_STAT, [hl]
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a

	call .TitleScreen
	call DelayFrame
.loop
	call RunTitleScreen
	jr nc, .loop

	call ClearSprites
	call ClearBGPalettes

	pop af
	ld [rSVBK], a
	ld hl, rIE
	res LCD_STAT, [hl]
	ld hl, rLCDC
	res 2, [hl]
	call ClearScreen
	call WaitBGMap2
	xor a
	ld [hLCDCPointer], a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call UpdateTimePals
	ld a, [wIntroSceneFrameCounter]
	cp 5
	jr c, .ok
	xor a
.ok
	ld e, a
	ld d, 0
	ld hl, .dw
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
; 626a

.dw
	dw _MainMenu
	dw DeleteSaveData
	dw CrystalIntroSequence
	dw CrystalIntroSequence
	dw ResetClock
; 6274


.TitleScreen: ; 6274
	farcall _TitleScreen
	ret
; 627b

RunTitleScreen: ; 627b
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done_title
	call TitleScreenScene
	farcall SuicuneFrameIterator
	call DelayFrame
	and a
	ret

.done_title
	scf
	ret
; 6292

TitleScreenScene: ; 62a3
	ld e, a
	ld d, 0
	ld hl, .scenes
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
; 62af

.scenes
	dw TitleScreenEntrance
	dw TitleScreenTimer
	dw TitleScreenMain
	dw TitleScreenEnd
; 62b7

TitleScreenEntrance: ; 62bc

; Animate the logo:
; Move each line by 4 pixels until our count hits 0.
	ld a, [hSCX]
	and a
	jr z, .done
	sub 4
	ld [hSCX], a

; Lay out a base (all lines scrolling together).
	ld e, a
	ld hl, wLYOverrides
	ld bc, 8 * 10 ; logo height
	call ByteFill

; Reversed signage for every other line's position.
; This is responsible for the interlaced effect.
	ld a, e
	cpl
	inc a

	ld b, 8 * 10 / 2 ; logo height / 2
	ld hl, wLYOverrides + 1
.loop
	ld [hli], a
	inc hl
	dec b
	jr nz, .loop
	ret

.done
; Next scene
	ld hl, wJumptableIndex
	inc [hl]
	xor a
	ld [hLCDCPointer], a

; Play the title screen music.
	ld de, MUSIC_TITLE
	call PlayMusic

	ld a, $88
	ld [hWY], a
	ret
; 62f6


TitleScreenTimer: ; 62f6

; Next scene
	ld hl, wJumptableIndex
	inc [hl]

; Start a timer
	ld hl, wTitleScreenTimerLo
	ld de, 73 * 60 + 36
	ld [hl], e
	inc hl ; wTitleScreenTimerHi
	ld [hl], d
	ret
; 6304

TitleScreenMain: ; 6304

; Run the timer down.
	ld hl, wTitleScreenTimerLo
	ld e, [hl]
	inc hl ; wTitleScreenTimerHi
	ld d, [hl]
	ld a, e
	or d
	jr z, .end

	dec de
	ld [hl], d
	dec hl
	ld [hl], e

	call GetJoypad
	ld hl, hJoyDown

; Save data can be deleted by pressing Up + B + Select.
	ld a, [hl]
	and D_UP + B_BUTTON + SELECT
	cp  D_UP + B_BUTTON + SELECT
	jr z, .delete_save_data

; The clock can be reset by pressing Down + B + Select.
	ld a, [hl]
	and D_DOWN + B_BUTTON + SELECT
	cp  D_DOWN + B_BUTTON + SELECT
	jr z, .clock_reset

; Press Start or A to start the game.
.check_start
	ld a, [hl]
	and START | A_BUTTON
	jr nz, .main_menu
	ret

.main_menu
	ld a, DRAGONITE
	call PlayCry
	xor a
	jr .done

.delete_save_data
	ld a, 1

.done
	ld [wIntroSceneFrameCounter], a

; Return to the intro sequence.
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

.end
; Next scene
	ld hl, wJumptableIndex
	inc [hl]

; Fade out the title screen music
	xor a
	ld [MusicFadeIDLo], a
	ld [MusicFadeIDHi], a
	ld hl, MusicFade
	ld [hl], 8 ; 1 second

	ld hl, wTitleScreenTimerLo
	inc [hl]
	ret

.clock_reset
	ld a, 4
	ld [wIntroSceneFrameCounter], a

; Return to the intro sequence.
	ld hl, wJumptableIndex
	set 7, [hl]
	ret
; 6375

TitleScreenEnd: ; 6375

; Wait until the music is done fading.

	ld hl, wTitleScreenTimerLo
	inc [hl]

	ld a, [MusicFade]
	and a
	ret nz

	ld a, 2
	ld [wIntroSceneFrameCounter], a

; Back to the intro.
	ld hl, wJumptableIndex
	set 7, [hl]
	ret
; 6389

DeleteSaveData: ; 6389
	farcall _DeleteSaveData
	jp Init
; 6392

ResetClock: ; 6392
	farcall _ResetClock
	jp Init
; 639b

OpeningLines: ; 63e2
	call ClearTileMap
	call LoadFontsExtra
	ld de, OpeningLinesGFX
	ld hl, VTiles2 tile $50
	lb bc, BANK(OpeningLinesGFX), 38
	call Request2bpp
	hlcoord 3, 7
	ld de, .Line1
	call .PlaceLine
	hlcoord 2, 9
	ld de, .Line2
	call .PlaceLine
	hlcoord 6, 11
	ld de, .Line3
.PlaceLine:
	ld a, [de]
	cp $ff
	ret z
	ld [hli], a
	inc de
	jr .PlaceLine
; 63fd

.Line1: ; Pokémon Orange Beta
	db $50, $51, $52, $53, $54, $55, $56, $57, $58, $59, $5a, $5b, $5c, $5d, $ff
.Line2: ; 2017 HotY Nominee Edition
	db $5e, $5f, $60, $61, $62, $63, $64, $65, $66, $67, $68, $69, $6a, $6b, $6c, $6d, $ff
.Line3: ; (c) 2016-2018
	db $6e, $6f, $70, $71, $72, $73, $74, $75, $ff
; 642e

OpeningLinesGFX:: ; e4000
INCBIN "gfx/intro/opening_lines.2bpp"

GameInit:: ; 642e
	farcall TryLoadSaveData
	call ClearWindowData
	call ClearBGPalettes
	call ClearTileMap
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a
	xor a
	ld [hBGMapAddress], a
	ld [hJoyDown], a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $90
	ld [hWY], a
	call WaitBGMap
	jp CrystalIntroSequence
; 6454
