INCLUDE "includes.asm"

SECTION "NULL", ROM0
NULL::

INCLUDE "rst.asm"
INCLUDE "interrupts.asm"
INCLUDE "home/highhome.asm"

SECTION "Header", ROM0[$100]

Start::
    nop ; no-optimize nops
    jp _Start

	ds $150 - @
; otherwise it either gets filled with padding or rgblink
; might place a small SECTION there

SECTION "Home", ROM0

INCLUDE "home/init.asm"
INCLUDE "home/vblank.asm"
INCLUDE "home/delay.asm"
INCLUDE "home/rtc.asm"
INCLUDE "home/fade.asm"
INCLUDE "home/lcd.asm"
INCLUDE "home/time.asm"
INCLUDE "home/serial.asm"
INCLUDE "home/joypad.asm"
INCLUDE "home/decompress.asm"
INCLUDE "home/palettes.asm"
INCLUDE "home/copy.asm"
INCLUDE "home/text.asm"
INCLUDE "home/video.asm"
INCLUDE "home/map_objects.asm"
INCLUDE "home/sine.asm"
INCLUDE "home/movement.asm"
INCLUDE "home/tilemap.asm"
INCLUDE "home/menu.asm"
INCLUDE "home/handshake.asm"
INCLUDE "home/game_time.asm"
INCLUDE "home/map.asm"
INCLUDE "home/farcall.asm"
INCLUDE "home/predef.asm"
INCLUDE "home/window.asm"
INCLUDE "home/flag.asm"

xor_a:: ; 2ec6
	xor a
	ret
; 2ec8

xor_a_dec_a:: ; 2ec8
	xor a
	dec a
	ret
; 2ecb

DisableSpriteUpdates:: ; 0x2ed3
; disables overworld sprite updating?
	xor a
	ld [hMapAnims], a
	ld a, [VramState]
	res 0, a
	ld [VramState], a
	ld a, $0
	ld [wSpriteUpdatesEnabled], a
	ret
; 0x2ee4

EnableSpriteUpdates:: ; 2ee4
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [VramState]
	set 0, a
	ld [VramState], a
	ld a, $1
	ld [hMapAnims], a
	ret
; 2ef6

INCLUDE "home/string.asm"

IsInJohto:: ; 2f17
; Return 0 if the player is in Orange, and 1 in Kanto.

	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetWorldMapLocation

	cp SPECIAL_MAP
	jr nz, .CheckRegion

	ld a, [BackupMapGroup]
	ld b, a
	ld a, [BackupMapNumber]
	ld c, a
	call GetWorldMapLocation

.CheckRegion:
	cp KANTO_LANDMARK
	jr nc, .Kanto

; Orange
	xor a
	ret

.Kanto:
	ld a, 1
	ret
; 2f3e

INCLUDE "home/item.asm"
INCLUDE "home/random.asm"
INCLUDE "home/sram.asm"

; Register aliases

_hl_:: ; 2fec
	jp hl
; 2fed

_de_:: ; 2fed
	push de
	ret
; 2fef

INCLUDE "home/double_speed.asm"

ClearSprites:: ; 300b
; Erase OAM data
	ld hl, Sprites
	ld b, SpritesEnd - Sprites
	xor a
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret
; 3016

HideSprites:: ; 3016
; Set all OAM y-positions to 160 to hide them offscreen
	ld hl, Sprites
	ld de, 4 ; length of an OAM struct
	ld b, (SpritesEnd - Sprites) / 4 ; number of OAM structs
	ld a, 160 ; y
.loop
	ld [hl], a
	add hl, de
	dec b
	jr nz, .loop
	ret
; 3026

INCLUDE "home/copy2.asm"

LoadTileMapToTempTileMap:: ; 309d
; Load TileMap into TempTileMap
	ld a, [rSVBK]
	push af
	ld a, BANK(TempTileMap)
	ld [rSVBK], a
	hlcoord 0, 0
	decoord 0, 0, TempTileMap
	ld bc, TileMapEnd - TileMap
	call CopyBytes
	pop af
	ld [rSVBK], a
	ret
; 30b4

Call_LoadTempTileMapToTileMap:: ; 30b4
	xor a
	ld [hBGMapMode], a
	call LoadTempTileMapToTileMap
	ld a, 1
	ld [hBGMapMode], a
	ret
; 30bf

LoadTempTileMapToTileMap:: ; 30bf
; Load TempTileMap into TileMap
	ld a, [rSVBK]
	push af
	ld a, BANK(TempTileMap)
	ld [rSVBK], a
	hlcoord 0, 0, TempTileMap
	decoord 0, 0
	ld bc, TileMapEnd - TileMap
	call CopyBytes
	pop af
	ld [rSVBK], a
	ret
; 30d6

CopyName1:: ; 30d6
; Copies the name from de to StringBuffer2
	ld hl, StringBuffer2

CopyName2:: ; 30d9
; Copies the name from de to hl
.loop
	ld a, [de]
	inc de
	ld [hli], a
	cp "@"
	jr nz, .loop
	ret
; 30e1

IsInArray:: ; 30e1
; Find value a for every de bytes in array hl.
; Return index in b and carry if found.

	ld b, 0
	ld c, a
.loop
	ld a, [hl]
	cp -1
	jr z, .NotInArray
	cp c
	jr z, .InArray
	inc b
	add hl, de
	jr .loop

.NotInArray:
	and a
	ret

.InArray:
	scf
	ret
; 30f4

SkipNames:: ; 0x30f4
; Skip a names.
	ld bc, NAME_LENGTH
	and a
	ret z
.loop
	add hl, bc
	dec a
	jr nz, .loop
	ret
; 0x30fe

INCLUDE "home/math.asm"

PrintLetterDelay::
; Wait before printing the next letter.

; The text speed setting in wOptions is actually a frame count:
; 	fast: 1 frame
; 	mid:  3 frames
; 	slow: 5 frames

; TextBoxFlags[!0] and A or B override text speed with a one-frame delay.
; wOptions[4] and TextBoxFlags[!1] disable the delay.
; non-scrolling text?
	ld a, [wOptions]
	bit NO_TEXT_SCROLL, a
	ret nz
	and %11
	ret z

	ld a, [TextBoxFlags]
	bit 1, a
	ret z

	ld a, 1
	ld [hBGMapHalf], a
	push hl
	push de
	push bc
; force fast scroll?
	ld a, [TextBoxFlags]
	bit 0, a
	ld a, 1
	jr z, .updateDelay
; text speed
	ld a, [wOptions]
	and %11
	dec a
	ld b, 1
	jr z, .updateDelay_B
	dec a
	ld b, 3
	jr z, .updateDelay_B
	ld b, 5
.updateDelay_B
	ld a, b
.updateDelay
	ld [wTextDelayFrames], a
.textDelayLoop
	ld a, [wTextDelayFrames]
	and a
	jr z, .done
	call DelayFrame
	call GetJoypad
; Finish execution if A or B is pressed
	ld a, [hJoyDown]
	and A_BUTTON | B_BUTTON
	jr z, .textDelayLoop
.done
	pop bc
	pop de
	pop hl
	ret


CopyDataUntil:: ; 318c
; Copy [hl .. bc) to de.

; In other words, the source data is
; from hl up to but not including bc,
; and the destination is de.

	ld a, [hli]
	ld [de], a
	inc de
	ld a, h
	cp b
	jr nz, CopyDataUntil
	ld a, l
	cp c
	jr nz, CopyDataUntil
	ret
; 0x3198

PrintNum:: ; 3198
	homecall _PrintNum
	ret
; 31a4

FarPrintText:: ; 31b0
	ld [hBuffer], a
	ld a, [hROMBank]
	push af
	ld a, [hBuffer]
	rst Bankswitch

	call PrintText

	pop af
	rst Bankswitch
	ret
; 31be

CallPointerAt:: ; 31be
	ld a, [hROMBank]
	push af
	ld a, [hli]
	rst Bankswitch

	ld a, [hli]
	ld h, [hl]
	ld l, a

	call _hl_

	pop hl
	ld a, h
	rst Bankswitch
	ret
; 31cd

QueueScript:: ; 31cd
; Push pointer hl in the current bank to wQueuedScriptBank.
	ld a, [hROMBank]

FarQueueScript:: ; 31cf
; Push pointer a:hl to wQueuedScriptBank.
	ld [wQueuedScriptBank], a
	ld a, l
	ld [wQueuedScriptAddr], a
	ld a, h
	ld [wQueuedScriptAddr + 1], a
	ret
; 31db

StringCmp:: ; 31db
; Compare c bytes at de and hl.
; Return z if they all match.
.loop
	ld a, [de]
	cp [hl]
	ret nz
	inc de
	inc hl
	dec c
	jr nz, .loop
	ret
; 0x31e4

CompareLong:: ; 31e4
; Compare bc bytes at de and hl.
; Return carry if they all match.

	ld a, [de]
	cp [hl]
	jr nz, .Diff

	inc de
	inc hl
	dec bc

	ld a, b
	or c
	jr nz, CompareLong

	scf
	ret

.Diff:
	and a
	ret
; 31f3

WaitBGMap2:: ; 0x3200
	ld a, 2
	ld [hBGMapMode], a
	call Delay2

	ld a, 1
	ld [hBGMapMode], a
	jp Delay2
; 0x3218

CGBOnly_LoadEDTile:: ; 3238
LoadEDTile:: ; 323d
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a

	ld a, [hMapAnims]
	push af
	xor a
	ld [hMapAnims], a

.wait
	ld a, [rLY]
	cp $7f
	jr c, .wait

	di
	ld a, 1 ; BANK(VTiles3)
	ld [rVBK], a
	hlcoord 0, 0, AttrMap
	call .StackPointerMagic
	ld a, 0 ; BANK(VTiles0)
	ld [rVBK], a
	hlcoord 0, 0
	call .StackPointerMagic

.wait2
	ld a, [rLY]
	cp $7f
	jr c, .wait2
	ei

	pop af
	ld [hMapAnims], a
	pop af
	ld [hBGMapMode], a
	ret
; 327b

.StackPointerMagic: ; 327b
; Copy all tiles to VBGMap
	ld [hSPBuffer], sp
	ld sp, hl
	ld a, [hBGMapAddress + 1]
	ld h, a
	ld l, 0
	ld a, SCREEN_HEIGHT
	ld [hTilesPerCycle], a
	lb bc, (1 << 1), (rSTAT % $100) ; b: not in v/hblank

.loop
rept SCREEN_WIDTH / 2
	pop de
; if in v/hblank, wait until not in v/hblank
.loop\@
	ld a, [$ff00+c]
	and b
	jr nz, .loop\@
; load BGMap0
	ld [hl], e
	inc l
	ld [hl], d
	inc l
endr

	ld de, $20 - SCREEN_WIDTH
	add hl, de
	ld a, [hTilesPerCycle]
	dec a
	ld [hTilesPerCycle], a
	jr nz, .loop

	ld a, [hSPBuffer]
	ld l, a
	ld a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	ret
; 32f9

SetPalettes:: ; 32f9
; Inits the Palettes
; depending on the system the monochromes palettes or color palettes
	push de
	ld a, %11100100
	call DmgToCgbBGPals
	lb de, %11100100, %11100100
	call DmgToCgbObjPals
	pop de
	ret
; 3317

ClearPalettes:: ; 3317
; Make all palettes white
	ld a, [rSVBK]
	push af

	ld a, BANK(BGPals)
	ld [rSVBK], a

; Fill BGPals and OBPals with $ffff (white)
	ld hl, BGPals
	ld bc, 16 palettes
	ld a, $ff
	call ByteFill

	pop af
	ld [rSVBK], a

; Request palette update
	ld a, 1
	ld [hCGBPalUpdate], a
	ret
; 333e

GetMemSGBLayout:: ; 333e
	ld b, SCGB_RAM
GetSGBLayout:: ; 3340
; load sgb packets unless dmg
	predef_jump Predef_LoadSGBLayoutCGB
; 334e

SetHPPal:: ; 334e
; Set palette for hp bar pixel length e at hl.
	call GetHPPal
	ld [hl], d
	ret
; 3353

GetHPPal:: ; 3353
; Get palette for hp bar pixel length e in d.

	ld d, HP_GREEN
	ld a, e
	cp (50 * 48 / 100) * 2
	ret nc
	inc d ; yellow
	cp (21 * 48 / 100) * 2
	ret nc
	inc d ; red
	ret
; 335f

CountSetBits:: ; 0x335f
; Count the number of set bits in b bytes starting from hl.
; Return in a, c and [wd265].

	ld c, 0
.next
	ld a, [hli]
	ld e, a
	ld d, 8

.count
	srl e
	ld a, 0
	adc c
	ld c, a
	dec d
	jr nz, .count

	dec b
	jr nz, .next

	ld a, c
	ld [wd265], a
	ret
; 0x3376

GetWeekday:: ; 3376
	ld a, [CurDay]
.mod
	sub 7
	jr nc, .mod
	add 7
	ret
; 3380

INCLUDE "home/pokedex_flags.asm"

NamesPointers:: ; 33ab
	dba PokemonNames
	dba MoveNames
	dbw 0, 0
	dba ItemNames
	dbw 0, PartyMonOT
	dbw 0, OTPartyMonOT
	dba TrainerClassNames
	dbw $4, $4b52 ; within PackMenuGFX
; 33c3

GetName:: ; 33c3
; Return name CurSpecies from name list wNamedObjectTypeBuffer in StringBuffer1.

	ld a, [hROMBank]
	push af
	push hl
	push bc
	push de

	ld a, [wNamedObjectTypeBuffer]
	cp PKMN_NAME
	jr nz, .NotPokeName

	ld a, [CurSpecies]
	ld [wd265], a
	call GetPokemonName
	ld hl, PKMN_NAME_LENGTH
	add hl, de
	ld e, l
	ld d, h
	jr .done

.NotPokeName:
	ld a, [wNamedObjectTypeBuffer]
	dec a
	ld e, a
	ld d, 0
	ld hl, NamesPointers
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	rst Bankswitch
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, [CurSpecies]
	dec a
	call GetNthString

	ld de, StringBuffer1
	ld bc, ITEM_NAME_LENGTH
	call CopyBytes

.done
	pop de
	pop bc
	pop hl
	pop af
	rst Bankswitch
	ret
; 3411

GetNthString:: ; 3411
; Return the address of the
; ath string starting from hl.

	and a
	ret z

	push bc
	ld b, a
	ld c, "@"
.readChar
	ld a, [hli]
	cp c
	jr nz, .readChar
	dec b
	jr nz, .readChar
	pop bc
	ret
; 3420

GetBasePokemonName:: ; 3420
; Discards gender (Nidoran).

	push hl
	call GetPokemonName

	ld hl, StringBuffer1
.loop
	ld a, [hl]
	cp "@"
	jr z, .quit
	cp "♂"
	jr z, .end
	cp "♀"
	jr z, .end
	inc hl
	jr .loop
.end
	ld [hl], "@"
.quit
	pop hl
	ret

; 343b

GetPokemonName:: ; 343b
; Get Pokemon name wd265.

	ld a, [hROMBank]
	push af
	push hl
	ld a, BANK(PokemonNames)
	rst Bankswitch

; Each name is ten characters
	ld a, [wd265]
	dec a
	ld d, 0
	ld e, a
	ld h, 0
	ld l, a
	add hl, hl ; hl = hl * 4
	add hl, hl ; hl = hl * 4
	add hl, de ; hl = (hl*4) + de
	add hl, hl ; hl = (5*hl) + (5*hl)
	ld de, PokemonNames
	add hl, de

; Terminator
	ld de, StringBuffer1
	push de
	ld bc, PKMN_NAME_LENGTH - 1
	call CopyBytes
	ld hl, StringBuffer1 + PKMN_NAME_LENGTH - 1
	ld [hl], "@"
	pop de

	pop hl
	pop af
	rst Bankswitch
	ret
; 3468

GetItemName:: ; 3468
; Get item name wd265.

	push hl
	push bc
	ld a, [wd265]

	cp TM01
	jr nc, .TM

	ld [CurSpecies], a
	ld a, ITEM_NAME
	ld [wNamedObjectTypeBuffer], a
	call GetName
	jr .Copied
.TM:
	call GetTMHMName
.Copied:
	ld de, StringBuffer1
	pop bc
	pop hl
	ret
; 3487

GetTMHMName:: ; 3487
; Get TM/HM name by item id wd265.

	push hl
	push de
	push bc
	ld a, [wd265]
	push af

; TM/HM prefix
	cp HM01
	push af
	jr c, .TM

	ld hl, .HMText
	ld bc, .HMTextEnd - .HMText
	jr .asm_34a1

.TM:
	ld hl, .TMText
	ld bc, .TMTextEnd - .TMText

.asm_34a1
	ld de, StringBuffer1
	call CopyBytes

; TM/HM number
	push de
	ld a, [wd265]
	ld c, a
	farcall GetTMHMNumber
	pop de

; HM numbers start from 51, not 1
	pop af
	ld a, c
	jr c, .asm_34b9
	sub NUM_TMS
.asm_34b9

; Divide and mod by 10 to get the top and bottom digits respectively
	ld b, "0"
.mod10
	sub 10
	jr c, .asm_34c2
	inc b
	jr .mod10
.asm_34c2
	add 10

	push af
	ld a, b
	ld [de], a
	inc de
	pop af

	ld b, "0"
	add b
	ld [de], a

; End the string
	inc de
	ld a, "@"
	ld [de], a

	pop af
	ld [wd265], a
	pop bc
	pop de
	pop hl
	ret

.TMText:
	db "TM"
.TMTextEnd:
	db "@"

.HMText:
	db "HM"
.HMTextEnd:
	db "@"
; 34df

IsHM:: ; 34df
	cp HM01
	jr c, .NotHM
	scf
	ret
.NotHM:
	and a
	ret
; 34e7

IsHMMove:: ; 34e7
	ld hl, .HMMoves
	ld de, 1
	jp IsInArray

.HMMoves:
	db CUT
	db FLY
	db SURF
	db STRENGTH
	db ROCK_SMASH
	db DIVE
	db WATERFALL
	db ROCK_CLIMB
	db -1
; 34f8

GetMoveName:: ; 34f8
	push hl

	ld a, MOVE_NAME
	ld [wNamedObjectTypeBuffer], a

	ld a, [wNamedObjectIndexBuffer] ; move id
	ld [CurSpecies], a

	call GetName
	ld de, StringBuffer1

	pop hl
	ret
; 350c

ScrollingMenu:: ; 350c
	call CopyMenuData2
	ld a, [hROMBank]
	push af

	ld a, BANK(_ScrollingMenu)
	rst Bankswitch

	call _InitScrollingMenu
	call .UpdatePalettes
	call _ScrollingMenu

	pop af
	rst Bankswitch

	ld a, [wMenuJoypad]
	ret
; 3524

.UpdatePalettes: ; 3524
	ld hl, VramState
	bit 0, [hl]
	jp nz, UpdateTimePals
	jp SetPalettes
; 352f

InitScrollingMenu:: ; 352f
	ld a, [wMenuBorderTopCoord]
	dec a
	ld b, a
	ld a, [wMenuBorderBottomCoord]
	sub b
	ld d, a
	ld a, [wMenuBorderLeftCoord]
	dec a
	ld c, a
	ld a, [wMenuBorderRightCoord]
	sub c
	ld e, a
	push de
	call Coord2Tile
	pop bc
	jp TextBox
; 354b

JoyTextDelay_ForcehJoyDown:: ; 354b joypad
	call DelayFrame

	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	call JoyTextDelay
	pop af
	ld [hInMenu], a

	ld a, [hJoyLast]
	and D_RIGHT + D_LEFT + D_UP + D_DOWN
	ld c, a
	ld a, [hJoyPressed]
	and A_BUTTON + B_BUTTON + SELECT + START
	or c
	ld c, a
	ret
; 3567

HandleStoneQueue:: ; 3567
	ld a, [hROMBank]
	push af

	call SwitchToMapScriptHeaderBank
	call .WarpAction

	pop bc
	ld a, b
	rst Bankswitch
	ret
; 3574

.WarpAction: ; 3574
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, de
	ld a, [hl]
	cp $ff
	jr z, .nope

	ld l, a
	push hl
	call .IsPersonOnWarp
	pop hl
	jr nc, .nope
	ld d, a
	ld e, l
	call .IsObjectInStoneTable
	jr nc, .nope
	call CallMapScript
	farcall EnableScriptMode
	scf
	ret

.nope
	and a
	ret
; 3599

.IsPersonOnWarp: ; 3599
	push de

	ld hl, OBJECT_NEXT_MAP_X
	add hl, de
	ld a, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, de
	ld e, [hl]

	sub 4
	ld d, a
	ld a, e
	sub 4
	ld e, a
	call .check_on_warp

	pop de
	ret
; 35b0

.check_on_warp ; 35b0
	ld hl, wCurrMapWarpHeaderPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wCurrMapWarpCount]
	and a
	jr z, .nope2

.loop
	push af
	ld a, [hl]
	cp e
	jr nz, .not_on_warp
	inc hl
	ld a, [hld]
	cp d
	jr z, .found_warp

.not_on_warp
	ld a, 5
	add l
	ld l, a
	adc h
	sub l
	ld h, a

	pop af
	dec a
	jr nz, .loop

.nope2
	and a
	ret

.found_warp
	pop af
	ld d, a
	ld a, [wCurrMapWarpCount]
	sub d
	inc a
	scf
	ret
; 35de

.IsObjectInStoneTable: ; 35de
	ld hl, CMDQUEUE_ADDR
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
.loop2
	ld a, [hli]
	cp $ff
	jr z, .nope3
	cp d
	jr nz, .next_inc3
	ld a, [hli]
	cp e
	jr nz, .next_inc2
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jr .yes

.next_inc3
	inc hl

.next_inc2
	inc hl
	inc hl
	jr .loop2

.nope3
	and a
	ret

.yes
	scf
	ret
; 3600

CheckTrainerBattle2:: ; 3600

	ld a, [hROMBank]
	push af

	call SwitchToMapScriptHeaderBank
	call CheckTrainerBattle

	pop bc
	ld a, b
	rst Bankswitch
	ret
; 360d

CheckTrainerBattle:: ; 360d
; Check if any trainer on the map sees the player and wants to battle.

; Skip the player object.
	ld a, 1
	ld de, MapObjects + OBJECT_LENGTH

.loop

; Start a battle if the object:

	push af
	push de

; Has a sprite
	ld hl, MAPOBJECT_SPRITE
	add hl, de
	ld a, [hl]
	and a
	jr z, .next

; Is a trainer
	ld hl, MAPOBJECT_COLOR
	add hl, de
	ld a, [hl]
	and %00001111
	cp PERSONTYPE_TRAINER
	jr nz, .next

; Is visible on the map
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, de
	ld a, [hl]
	cp -1
	jr z, .next

; Is facing the player...
	call GetObjectStruct
	call FacingPlayerDistance_bc
	jr nc, .next

; ...within their sight range
	ld hl, MAPOBJECT_RANGE
	add hl, de
	ld a, [hl]
	cp b
	jr c, .next

; And hasn't already been beaten
	push bc
	push de
	ld hl, MAPOBJECT_SCRIPT_POINTER
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	pop de
	pop bc
	and a
	jr z, .startbattle

.next
	pop de
	ld hl, OBJECT_LENGTH
	add hl, de
	ld d, h
	ld e, l

	pop af
	inc a
	cp NUM_OBJECTS
	jr nz, .loop
	xor a
	ret

.startbattle
	pop de
	pop af
	ld [hLastTalked], a
	ld a, b
	ld [EngineBuffer2], a
	ld a, c
	ld [EngineBuffer3], a
	jr LoadTrainer_continue
; 3674

TalkToTrainer:: ; 3674
	ld a, 1
	ld [EngineBuffer2], a
	ld a, -1
	ld [EngineBuffer3], a

LoadTrainer_continue:: ; 367e
	call GetMapScriptHeaderBank
	ld [EngineBuffer1], a

	ld a, [hLastTalked]
	call GetMapObject

	ld hl, MAPOBJECT_SCRIPT_POINTER
	add hl, bc
	ld a, [EngineBuffer1]
	call GetFarHalfword
	ld de, wTempTrainerHeader
	ld bc, wTempTrainerHeaderEnd - wTempTrainerHeader
	ld a, [EngineBuffer1]
	call FarCopyBytes
	xor a
	ld [wRunningTrainerBattleScript], a
	scf
	ret
; 36a5

FacingPlayerDistance_bc:: ; 36a5

	push de
	call FacingPlayerDistance
	ld b, d
	ld c, e
	pop de
	ret
; 36ad

FacingPlayerDistance:: ; 36ad
; Return carry if the sprite at bc is facing the player,
; and its distance in d.

	ld hl, OBJECT_NEXT_MAP_X ; x
	add hl, bc
	ld d, [hl]

	ld hl, OBJECT_NEXT_MAP_Y ; y
	add hl, bc
	ld e, [hl]

	ld a, [PlayerStandingMapX]
	cp d
	jr z, .CheckY

	ld a, [PlayerStandingMapY]
	cp e
	jr z, .CheckX

	and a
	ret

.CheckY:
	ld a, [PlayerStandingMapY]
	sub e
	jr z, .NotFacing
	jr nc, .Above

; Below
	cpl
	inc a
	ld d, a
	ld e, OW_UP
	jr .CheckFacing

.Above:
	ld d, a
	ld e, OW_DOWN
	jr .CheckFacing

.CheckX:
	ld a, [PlayerStandingMapX]
	sub d
	jr z, .NotFacing
	jr nc, .Left

; Right
	cpl
	inc a
	ld d, a
	ld e, OW_LEFT
	jr .CheckFacing

.Left:
	ld d, a
	ld e, OW_RIGHT

.CheckFacing:
	call GetSpriteDirection
	cp e
	jr nz, .NotFacing
	scf
	ret

.NotFacing:
	and a
	ret
; 36f5

PrintWinLossText:: ; 3718
	ld a, [wBattleResult]
	ld hl, wWinTextPointer
	and $f
	jr z, .ok
	ld hl, wLossTextPointer

.ok
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMapScriptHeaderBank
	call FarPrintText
	call WaitBGMap
	jp WaitPressAorB_BlinkCursor
; 3741

IsAPokemon:: ; 3741
; Return carry if species a is not a Pokemon.
	and a
	jr z, .NotAPokemon
	cp EGG
	jr z, .Pokemon
	cp NUM_POKEMON + 1
	jr c, .Pokemon

.NotAPokemon:
	scf
	ret

.Pokemon:
	and a
	ret
; 3750

DrawBattleHPBar:: ; 3750
; Draw an HP bar d tiles long at hl
; Fill it up to e pixels

	push hl
	push de
	push bc
	srl c
	srl e
; Place 'HP:'
	ld a, $60
	ld [hli], a
	ld a, $61
	ld [hli], a

; Draw a template
	push hl
	ld a, $62 ; empty bar
.template
	ld [hli], a
	dec d
	jr nz, .template
	ld a, $6b ; bar end
	add b
	ld [hl], a
	pop hl

; Safety check # pixels
	ld a, e
	and a
	jr nz, .fill
	ld a, c
	and a
	jr z, .done
	ld e, 1

.fill
; Keep drawing tiles until pixel length is reached
	ld a, e
	sub TILE_WIDTH
	jr c, .lastbar

	ld e, a
	ld a, $6a ; full bar
	ld [hli], a
	ld a, e
	and a
	jr z, .done
	jr .fill

.lastbar
	ld a, $62  ; empty bar
	add e      ; + e
	ld [hl], a

.done
	pop bc
	pop de
	pop hl
	ret
; 3786

PrepMonFrontpic:: ; 3786
	ld a, $1
	ld [wBoxAlignment], a

_PrepMonFrontpic:: ; 378b
	ld a, [CurPartySpecies]
	call IsAPokemon
	jr c, .not_pokemon

	push hl
	ld de, VTiles2
	predef GetFrontpic
	pop hl
	xor a
	ld [hGraphicStartTile], a
	lb bc, 7, 7
	predef PlaceGraphic
	xor a
	ld [wBoxAlignment], a
	ret

.not_pokemon
	xor a
	ld [wBoxAlignment], a
	inc a
	ld [CurPartySpecies], a
	ret
; 37b6

INCLUDE "home/cry.asm"

PrintLevel:: ; 382d
; Print TempMonLevel at hl

	ld a, [TempMonLevel]
	ld [hl], "<LV>"
	inc hl

; How many digits?
	ld c, 2
	cp 100
	jr c, Print8BitNumRightAlign

; 3-digit numbers overwrite the :L.
	dec hl
	inc c
Print8BitNumRightAlign:: ; 3842
	ld [wd265], a
	ld de, wd265
	ld b, PRINTNUM_RIGHTALIGN | 1
	jp PrintNum
; 384d

GetBaseData:: ; 3856
    push bc
    push de
    push hl
    ld a, [hROMBank]
    push af
    ld a, BANK(BaseData)
    rst Bankswitch

; Egg doesn't have BaseData
    ld a, [CurSpecies]
    cp EGG
    jp z, .egg
    cp EXEGGUTOR
    jp z, .exeggutor
	cp VULPIX
	jp z, .vulpix
	cp RATTATA
	jp z, .rattata
	cp RATICATE
	jp z, .raticate
	cp RAICHU
	jp z, .raichu
	cp SANDSHREW
	jp z, .sandshrew
	cp SANDSLASH
	jp z, .sandslash
	cp NINETALES
	jp z, .ninetales
	cp DIGLETT
	jp z, .diglett
	cp DUGTRIO
	jp z, .dugtrio
	cp MEOWTH
	jp z, .meowth
	cp PERSIAN
	jp z, .persian
	cp GEODUDE
	jp z, .geodude
	cp GRAVELER
	jp z, .graveler
	cp GOLEM
	jp z, .golem
	cp GRIMER
	jp z, .grimer
	cp MUK
	jp z, .muk
	cp MAROWAK
	jp z, .marowak
	cp ONIX
	jp z, .onix
	cp STEELIX
	jp z, .steelix
	cp LYCANROC
	jp z, .lycanroc

;Poliwrath, Arbok and Victreebel alternates use the same base data, so no need to handle.

; Get BaseData
.got_base_data
    dec a
    ld bc, BaseData1 - BaseData0
    ld hl, BaseData
    call AddNTimes
.got_base_data_loc
    ld de, CurBaseData
    ld bc, BaseData1 - BaseData0
    call CopyBytes
    jp .end

.egg
; Sprite dimensions
    ld a, $55 ; 5x5
    ld [BasePicSize], a
	jp .end
    
.exeggutor
	ld a, [TempMonForm]
    and FORM_MASK
    cp EXEGGUTOR_KANTONESE_FORM
	ld a, EXEGGUTOR
    jp nz, .got_base_data
    ld a, BANK(KantoneseExeggutorBaseData)
    rst Bankswitch
    ld hl, KantoneseExeggutorBaseData
    jp .got_base_data_loc
	
.vulpix
	ld a, [TempMonForm]
    and FORM_MASK
	push bc
    ld b, VULPIX_KANTONESE_FORM
	cp b
	pop bc
	ld a, VULPIX
    jp nz, .got_base_data
    ld a, BANK(KantoneseVulpixBaseData)
    rst Bankswitch
    ld hl, KantoneseVulpixBaseData
    jp .got_base_data_loc
	
.rattata
    ld a, [TempMonForm]
    and FORM_MASK
	push bc
	ld b, RATTATA_KANTONESE_FORM
    cp b
	pop bc
	ld a, RATTATA
    jp nz, .got_base_data
    ld a, BANK(KantoneseRattataBaseData)
    rst Bankswitch
    ld hl, KantoneseRattataBaseData
    jp .got_base_data_loc
	
.raticate
;Rocket (Cassidy) Raticate
    ld a, [TempMonForm]
    and FORM_MASK
	push bc
	ld b, RATICATE_ROCKET_FORM
	cp b
	pop bc
	ld a, RATICATE
    jp z, .got_base_data

;Check for normal Kantonese Raticate
    ld a, [TempMonForm]
    and FORM_MASK
	push bc
    ld b, RATICATE_KANTONESE_FORM
	cp b
	pop bc
	ld a, RATICATE
    jp nz, .got_base_data
    ld a, BANK(KantoneseRaticateBaseData)
    rst Bankswitch
    ld hl, KantoneseRaticateBaseData
    jp .got_base_data_loc
	
.raichu
    ld a, [TempMonForm]
    and FORM_MASK
	push bc
    ld b, RAICHU_KANTONESE_FORM
	cp b
	pop bc
	ld a, RAICHU
    jp nz, .got_base_data
    ld a, BANK(KantoneseRaichuBaseData)
    rst Bankswitch
    ld hl, KantoneseRaichuBaseData
    jp .got_base_data_loc
	
.sandshrew
    ld a, [TempMonForm]
    and FORM_MASK
	push bc
    ld b, SANDSHREW_ALOLAN_FORM
	cp b
	pop bc
	ld a, SANDSHREW
    jp nz, .got_base_data
    ld a, BANK(AlolanSandshrewBaseData)
    rst Bankswitch
    ld hl, AlolanSandshrewBaseData
    jp .got_base_data_loc
	
.sandslash
   ld a, [TempMonForm]
    and FORM_MASK
	push bc
    ld b, SANDSLASH_ALOLAN_FORM
	cp b
	pop bc
	ld a, SANDSLASH
    jp nz, .got_base_data
    ld a, BANK(AlolanSandslashBaseData)
    rst Bankswitch
    ld hl, AlolanSandslashBaseData
    jp .got_base_data_loc
	
.ninetales
    ld a, [TempMonForm]
    and FORM_MASK
	push bc
    ld b, NINETALES_KANTONESE_FORM
	cp b
	pop bc
	ld a, NINETALES
    jp nz, .got_base_data
    ld a, BANK(KantoneseNinetalesBaseData)
    rst Bankswitch
    ld hl, KantoneseNinetalesBaseData
    jp .got_base_data_loc
	
.diglett
    ld a, [TempMonForm]
    and FORM_MASK
	push bc
    ld b, DIGLETT_KANTONESE_FORM
	cp b
	pop bc
	ld a, DIGLETT
    jp nz, .got_base_data
    ld a, BANK(KantoneseDiglettBaseData)
    rst Bankswitch
    ld hl, KantoneseDiglettBaseData
    jp .got_base_data_loc
	
.dugtrio
   ld a, [TempMonForm]
    and FORM_MASK
	push bc
    ld b, DUGTRIO_KANTONESE_FORM
	cp b
	pop bc
	ld a, DUGTRIO
    jp nz, .got_base_data
    ld a, BANK(KantoneseDugtrioBaseData)
    rst Bankswitch
    ld hl, KantoneseDugtrioBaseData
    jp .got_base_data_loc
	
.meowth
    ld a, [TempMonForm]
    and FORM_MASK
	push bc
    ld b, MEOWTH_ALOLAN_FORM
	cp b
	pop bc
	ld a, MEOWTH
    jp nz, .got_base_data
    ld a, BANK(AlolanMeowthBaseData)
    rst Bankswitch
    ld hl, AlolanMeowthBaseData
    jp .got_base_data_loc
	
.persian
    ld a, [TempMonForm]
    and FORM_MASK
	push bc
    ld b, PERSIAN_ALOLAN_FORM
	cp b
	pop bc
	ld a, PERSIAN
    jp nz, .got_base_data
    ld a, BANK(AlolanPersianBaseData)
    rst Bankswitch
    ld hl, AlolanPersianBaseData
    jp .got_base_data_loc
	
.geodude
    ld a, [TempMonForm]
    and FORM_MASK
	push bc
    ld b, GEODUDE_KANTONESE_FORM
	cp b
	pop bc
	ld a, GEODUDE
    jp nz, .got_base_data
    ld a, BANK(KantoneseGeodudeBaseData)
    rst Bankswitch
    ld hl, KantoneseGeodudeBaseData
    jp .got_base_data_loc
	
.graveler
    ld a, [TempMonForm]
    and FORM_MASK
	push bc
    ld b, GRAVELER_KANTONESE_FORM
	cp b
	pop bc
	ld a, GRAVELER
    jp nz, .got_base_data
    ld a, BANK(KantoneseGravelerBaseData)
    rst Bankswitch
    ld hl, KantoneseGravelerBaseData
    jp .got_base_data_loc
	
.golem
    ld a, [TempMonForm]
    and FORM_MASK
	push bc
    ld b, GOLEM_KANTONESE_FORM
	cp b
	pop bc
	ld a, GOLEM
    jp nz, .got_base_data
    ld a, BANK(KantoneseGolemBaseData)
    rst Bankswitch
    ld hl, KantoneseGolemBaseData
    jp .got_base_data_loc
	
.grimer
    ld a, [TempMonForm]
    and FORM_MASK
	push bc
    ld b, GRIMER_KANTONESE_FORM
	cp b
	pop bc
	ld a, GRIMER
    jp nz, .got_base_data
    ld a, BANK(KantoneseGrimerBaseData)
    rst Bankswitch
    ld hl, KantoneseGrimerBaseData
    jp .got_base_data_loc
	
.muk
    ld a, [TempMonForm]
    and FORM_MASK
	push bc
    ld b, MUK_KANTONESE_FORM
	cp b
	pop bc
	ld a, MUK
    jp nz, .got_base_data
    ld a, BANK(KantoneseMukBaseData)
    rst Bankswitch
    ld hl, KantoneseMukBaseData
    jp .got_base_data_loc
	
.marowak
    ld a, [TempMonForm]
    and FORM_MASK
	push bc
    ld b, MAROWAK_KANTONESE_FORM
	cp b
	pop bc
	ld a, MAROWAK
    jp nz, .got_base_data
    ld a, BANK(KantoneseMarowakBaseData)
    rst Bankswitch
    ld hl, KantoneseMarowakBaseData
    jp .got_base_data_loc
	
.onix
    ld a, [TempMonForm]
    and FORM_MASK
	push bc
    ld b, ONIX_CRYSTAL_FORM
	cp b
	pop bc
	ld a, ONIX
    jp nz, .got_base_data
    ld a, BANK(CrystalOnixBaseData)
    rst Bankswitch
    ld hl, CrystalOnixBaseData
    jp .got_base_data_loc

.steelix
    ld a, [TempMonForm]
    and FORM_MASK
	push bc
    ld b, STEELIX_CRYSTAL_FORM
	cp b
	pop bc
	ld a, STEELIX
    jp nz, .got_base_data
    ld a, BANK(CrystalSteelixBaseData)
    rst Bankswitch
    ld hl, CrystalSteelixBaseData
    jp .got_base_data_loc
	
.lycanroc
    ld a, [TempMonForm]
    and FORM_MASK
	push bc
    ld b, LYCANROC_MIDNIGHT_FORM
	cp b
	jr nz, .dusk_or_day
.lycanroc_midnight
	pop bc ;it is midnight form, load data and return
    ld a, BANK(MidnightLycanrocBaseData)
    rst Bankswitch
    ld hl, MidnightLycanrocBaseData
    jp .got_base_data_loc
.dusk_or_day
	ld b, LYCANROC_DUSK_FORM
	cp b
	pop bc
	ld a, LYCANROC
	jp nz, .got_base_data ; no dusk, so the first form data (day forme) is already loaded
    ld a, BANK(DuskLycanrocBaseData)
    rst Bankswitch
    ld hl, DuskLycanrocBaseData
    jp .got_base_data_loc

.end
; Replace Pokedex # with species
    ld a, [CurSpecies]
    ld [BaseDexNo], a

    pop af
    rst Bankswitch
    pop hl
    pop de
    pop bc
    ret
; 389c

GetCurNick:: ; 389c
	ld a, [wCurPartyMon]
	ld hl, PartyMonNicknames

GetNick:: ; 38a2
; Get nickname a from list hl.

	push hl
	push bc

	call SkipNames
	ld de, StringBuffer1

	push de
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	pop de

	pop bc
	pop hl
	ret
; 38bb

PrintBCDNumber:: ; 38bb
; function to print a BCD (Binary-coded decimal) number
; de = address of BCD number
; hl = destination address
; c = flags and length
; bit 7: if set, do not print leading zeroes
;        if unset, print leading zeroes
; bit 6: if set, left-align the string (do not pad empty digits with spaces)
;        if unset, right-align the string
; bit 5: if set, print currency symbol at the beginning of the string
;        if unset, do not print the currency symbol
; bits 0-4: length of BCD number in bytes
; Note that bits 5 and 7 are modified during execution. The above reflects
; their meaning at the beginning of the functions's execution.
	ld b, c ; save flags in b
	res 7, c
	res 6, c
	res 5, c ; c now holds the length
	bit 5, b
	jr z, .loop
	bit 7, b
	jr nz, .loop ; skip currency symbol
	ld [hl], "¥"
	inc hl
.loop
	ld a, [de]
	swap a
	call PrintBCDDigit ; print upper digit
	ld a, [de]
	call PrintBCDDigit ; print lower digit
	inc de
	dec c
	jr nz, .loop
	bit 7, b ; were any non-zero digits printed?
	ret z ; if so, we are done
.numberEqualsZero ; if every digit of the BCD number is zero
	bit 6, b ; left or right alignment?
	jr nz, .skipRightAlignmentAdjustment
	dec hl ; if the string is right-aligned, it needs to be moved back one space
.skipRightAlignmentAdjustment
	bit 5, b
	jr z, .skipCurrencySymbol
	ld [hl], "¥" ; currency symbol
	inc hl
.skipCurrencySymbol
	ld [hl], "0"
	call PrintLetterDelay
	inc hl
	ret
; 0x38f2

PrintBCDDigit:: ; 38f2
	and %00001111
	jr z, .zeroDigit
.nonzeroDigit
	bit 7, b ; have any non-space characters been printed?
	jr z, .outputDigit
; if bit 7 is set, then no numbers have been printed yet
	bit 5, b ; print the currency symbol?
	jr z, .skipCurrencySymbol
	ld [hl], "¥"
	inc hl
	res 5, b
.skipCurrencySymbol
	res 7, b ; unset 7 to indicate that a nonzero digit has been reached
.outputDigit
	add "0"
	ld [hli], a
	jp PrintLetterDelay

.zeroDigit
	bit 7, b ; either printing leading zeroes or already reached a nonzero digit?
	jr z, .outputDigit ; if so, print a zero digit
	bit 6, b ; left or right alignment?
	ret nz
	ld a, " "
	ld [hli], a ; if right-aligned, "print" a space by advancing the pointer
	ret
; 0x3917

GetPartyParamLocation:: ; 3917
; Get the location of parameter a from wCurPartyMon in hl
	push bc
	ld hl, PartyMons
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [wCurPartyMon]
	call GetPartyLocation
	pop bc
	ret
; 3927

GetPartyLocation:: ; 3927
; Add the length of a PartyMon struct to hl a times.
	ld bc, PARTYMON_STRUCT_LENGTH
	jp AddNTimes
; 392d

INCLUDE "home/battle.asm"

PushLYOverrides:: ; 3b0c

	ld a, [hLCDCPointer]
	and a
	ret z

	ld a, LYOverridesBackup % $100
	ld [hRequestedVTileSource], a
	ld a, LYOverridesBackup / $100
	ld [hRequestedVTileSource + 1], a

	ld a, wLYOverrides % $100
	ld [hRequestedVTileDest], a
	ld a, wLYOverrides / $100
	ld [hRequestedVTileDest + 1], a

	ld a, (wLYOverridesEnd - wLYOverrides) / 16
	ld [hRequested2bpp], a
	ret
; 3b2a

_InitSpriteAnimStruct:: ; 3b2a

	ld [wSpriteAnimIDBuffer], a
	ld a, [hROMBank]
	push af

	ld a, BANK(InitSpriteAnimStruct)
	rst Bankswitch
	ld a, [wSpriteAnimIDBuffer]

	call InitSpriteAnimStruct

	pop af
	rst Bankswitch

	ret
; 3b3c

ReinitSpriteAnimFrame:: ; 3b3c

	ld [wSpriteAnimIDBuffer], a
	ld a, [hROMBank]
	push af

	ld a, BANK(_ReinitSpriteAnimFrame)
	rst Bankswitch
	ld a, [wSpriteAnimIDBuffer]

	call _ReinitSpriteAnimFrame

	pop af
	rst Bankswitch

	ret
; 3b4e

INCLUDE "home/audio.asm"

INCLUDE "home/ded.asm"