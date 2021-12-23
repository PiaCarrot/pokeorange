; Event scripting commands.


EnableScriptMode:: ; 96c56
	push af
	ld a, SCRIPT_READ
	ld [ScriptMode], a
	pop af
	ret
; 96c5e

ScriptEvents:: ; 96c5e
	call StartScript
.loop
	ld a, [ScriptMode]
	ld hl, .modes
	rst JumpTable
	call CheckScript
	jr nz, .loop
	ret
; 96c6e

.modes ; 96c6e
	dw EndScript
	dw RunScriptCommand
	dw WaitScriptMovement
	dw WaitScript

EndScript: ; 96c76
	jp StopScript
; 96c7a

WaitScript: ; 96c7a
	call StopScript

	ld hl, ScriptDelay
	dec [hl]
	ret nz

	farcall ReleaseAllMapObjects

	ld a, SCRIPT_READ
	ld [ScriptMode], a
	jp StartScript
; 96c91

WaitScriptMovement: ; 96c91
	call StopScript

	ld hl, VramState
	bit 7, [hl]
	ret nz

	farcall ReleaseAllMapObjects

	ld a, SCRIPT_READ
	ld [ScriptMode], a
	jp StartScript
; 96ca9

RunScriptCommand: ; 96ca9
	call GetScriptByte
	ld hl, ScriptCommandTable
	rst JumpTable
	ret
; 96cb1


ScriptCommandTable: ; 96cb1
	dw Script_scall
	dw Script_farscall
	dw Script_ptcall
	dw Script_jump
	dw Script_farjump
	dw Script_ptjump
	dw Script_if_equal
	dw Script_if_not_equal
	dw Script_iffalse
	dw Script_iftrue
	dw Script_if_greater_than
	dw Script_if_less_than
	dw Script_jumpstd
	dw Script_callstd
	dw Script_callasm
	dw Script_special
	dw Script_ptcallasm
	dw Script_checkmaptriggers
	dw Script_domaptrigger
	dw Script_checktriggers
	dw Script_dotrigger
	dw Script_writebyte
	dw Script_addvar
	dw Script_random
	dw Script_copybytetovar
	dw Script_copyvartobyte
	dw Script_loadvar
	dw Script_checkcode
	dw Script_writevarcode
	dw Script_writecode
	dw Script_giveitem
	dw Script_takeitem
	dw Script_checkitem
	dw Script_givemoney
	dw Script_takemoney
	dw Script_checkmoney
	dw Script_givecoins
	dw Script_takecoins
	dw Script_checkcoins
	dw Script_checktime
	dw Script_checkpoke
	dw Script_givepoke
	dw Script_giveegg
	dw Script_givepokeitem
	dw Script_checkpokeitem
	dw Script_checkevent
	dw Script_clearevent
	dw Script_setevent
	dw Script_checkflag
	dw Script_clearflag
	dw Script_setflag
	dw Script_wildon
	dw Script_wildoff
	dw Script_warpmod
	dw Script_blackoutmod
	dw Script_warp
	dw Script_readmoney
	dw Script_readcoins
	dw Script_RAM2MEM
	dw Script_pokenamemem
	dw Script_itemtotext
	dw Script_mapnametotext
	dw Script_trainertotext
	dw Script_stringtotext
	dw Script_itemnotify
	dw Script_pocketisfull
	dw Script_textbox
	dw Script_refreshscreen
	dw Script_closetext
	dw Script_farwritetext
	dw Script_writetext
	dw Script_repeattext
	dw Script_yesorno
	dw Script_loadmenudata
	dw Script_closewindow
	dw Script_jumptextfaceplayer
	dw Script_farjumptext
	dw Script_jumptext
	dw Script_waitbutton
	dw Script_buttonsound
	dw Script_pokepic
	dw Script_closepokepic
	dw Script__2dmenu
	dw Script_verticalmenu
	dw Script_randomwildmon
	dw Script_loadmemtrainer
	dw Script_loadwildmon
	dw Script_loadtrainer
	dw Script_startbattle
	dw Script_reloadmapafterbattle
	dw Script_trainertext
	dw Script_trainerflagaction
	dw Script_winlosstext
	dw Script_scripttalkafter
	dw Script_end_if_just_battled
	dw Script_check_just_battled
	dw Script_setlasttalked
	dw Script_applymovement
	dw Script_applymovement2
	dw Script_faceplayer
	dw Script_faceperson
	dw Script_variablesprite
	dw Script_disappear
	dw Script_appear
	dw Script_follow
	dw Script_stopfollow
	dw Script_moveperson
	dw Script_writepersonxy
	dw Script_loademote
	dw Script_showemote
	dw Script_spriteface
	dw Script_follownotexact
	dw Script_earthquake
	dw Script_changemap
	dw Script_changeblock
	dw Script_reloadmap
	dw Script_reloadmappart
	dw Script_writecmdqueue
	dw Script_delcmdqueue
	dw Script_playmusic
	dw Script_encountermusic
	dw Script_musicfadeout
	dw Script_playmapmusic
	dw Script_dontrestartmapmusic
	dw Script_cry
	dw Script_playsound
	dw Script_waitsfx
	dw Script_warpsound
	dw Script_specialsound
	dw Script_passtoengine
	dw Script_newloadmap
	dw Script_pause
	dw Script_deactivatefacing
	dw Script_priorityjump
	dw Script_warpcheck
	dw Script_ptpriorityjump
	dw Script_return
	dw Script_end
	dw Script_reloadandreturn
	dw Script_end_all
	dw Script_pokemart
	dw Script_elevator
	dw Script_trade
	dw Script_fruittree
	dw Script_verbosegiveitem
	dw Script_verbosegiveitem2
	dw Script_swarm
	dw Script_halloffame
	dw Script_credits
	dw Script_warpfacing
	dw Script_landmarktotext
	dw Script_trainerclassname
	dw Script_name
	dw Script_wait
	dw Script_check_save
	dw Script_divemap
	dw Script_divewarp
	dw Script_giveshells
	dw Script_checkshells
	dw Script_readshells
; 96e05

StartScript: ; 96e05
	ld hl, ScriptFlags
	set SCRIPT_RUNNING, [hl]
	ret
; 96e0b

CheckScript: ; 96e0b
	ld hl, ScriptFlags
	bit SCRIPT_RUNNING, [hl]
	ret
; 96e11

StopScript: ; 96e11
	ld hl, ScriptFlags
	res SCRIPT_RUNNING, [hl]
	ret
; 96e17

Script_callasm: ; 96e17
; parameters:
;     asm (AsmPointerParam)
	call GetScriptByte
	ld b, a
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, b
	rst FarCall
	ret
; 96e26

Script_special: ; 96e26
; parameters:
;     predefined_script (SingleByteParam)
	call GetScriptByte
	ld e, a
	ld d, 0
	farcall Special
	ret
; 96e35

Script_ptcallasm: ; 96e35
; parameters:
;     asm (PointerToAsmPointerParam)
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, b
	rst FarCall
	ret
; 96e45

Script_jumptextfaceplayer: ; 96e45
; parameters:
;     text_pointer (RawTextPointerLabelParam)
	ld a, [ScriptBank]
	ld [wScriptTextBank], a
	call GetScriptByte
	ld [wScriptTextAddr], a
	call GetScriptByte
	ld [wScriptTextAddr + 1], a
	ld b, BANK(JumpTextFacePlayerScript)
	ld hl, JumpTextFacePlayerScript
	jp ScriptJump
; 96e5f

Script_jumptext: ; 96e5f
; parameters:
;     text_pointer (RawTextPointerLabelParam)
	ld a, [ScriptBank]
	ld [wScriptTextBank], a
	call GetScriptByte
	ld [wScriptTextAddr], a
	call GetScriptByte
	ld [wScriptTextAddr + 1], a
	ld b, BANK(JumpTextScript)
	ld hl, JumpTextScript
	jp ScriptJump
; 96e79

JumpTextFacePlayerScript: ; 96e79
	faceplayer
JumpTextScript: ; 96e7a
	opentext
	repeattext -1, -1
	waitbutton
	closetext
	end
; 96e81


Script_farjumptext: ; 96e81
; parameters:
;     text_pointer (PointerLabelBeforeBank)
	call GetScriptByte
	ld [wScriptTextBank], a
	call GetScriptByte
	ld [wScriptTextAddr], a
	call GetScriptByte
	ld [wScriptTextAddr + 1], a
	ld b, BANK(JumpTextScript)
	ld hl, JumpTextScript
	jp ScriptJump
; 96e9b


Script_writetext: ; 96e9b
; parameters:
;     text_pointer (RawTextPointerLabelParam)
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, [ScriptBank]
	ld b, a
	jp MapTextbox
; 96eab

Script_farwritetext: ; 96eab
; parameters:
;     text_pointer (PointerLabelBeforeBank)
	call GetScriptByte
	ld b, a
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	jp MapTextbox
; 96ebb

Script_repeattext: ; 96ebb
; parameters:
;     byte (SingleByteParam)
;     byte (SingleByteParam)
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	cp -1
	ret nz
	ld a, l
	cp -1
	ret nz
	ld hl, wScriptTextBank
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp MapTextbox
; 96ed9

Script_waitbutton: ; 96ed9
	jp WaitButton
; 96edc

Script_buttonsound: ; 96edc
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a
	call WaitBGMap
	call ButtonSound
	pop af
	ld [hOAMUpdate], a
	ret
; 96eed

Script_yesorno: ; 96eed
	call YesNoBox
	; if carry (no) then a = FALSE, else a = TRUE
	sbc a
	add TRUE
	ld [ScriptVar], a
	ret
; 96efa

Script_loadmenudata: ; 96efa
; parameters:
;     data (MenuDataPointerParam)
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld de, LoadMenuDataHeader
	ld a, [ScriptBank]
	call Call_a_de
	jp UpdateSprites
; 96f0f

Script_closewindow: ; 96f0f
	call CloseWindow
	jp UpdateSprites
; 96f16

Script_pokepic: ; 96f16
; parameters:
;     pokemon (PokemonParam)
	call GetScriptByte
	and a
	jr nz, .ok
	ld a, [ScriptVar]
.ok
	ld [CurPartySpecies], a
	farcall Pokepic
	ret
; 96f29

Script_closepokepic: ; 96f29
	farcall ClosePokepic
	ret
; 96f30

Script_verticalmenu: ; 96f30
	ld a, [ScriptBank]
	ld hl, VerticalMenu
	rst FarCall
	ld a, [wMenuCursorY]
	jr nc, .ok
	xor a
.ok
	ld [ScriptVar], a
	ret
; 96f41

Script__2dmenu: ; 96f41
	ld a, [ScriptBank]
	ld hl, _2DMenu
	rst FarCall
	ld a, [wMenuCursorBuffer]
	jr nc, .ok
	xor a
.ok
	ld [ScriptVar], a
	ret
; 96f52

Script_verbosegiveitem: ; 96f60
; parameters:
;     item (ItemLabelByte)
;     quantity (DecimalParam)
	call Script_giveitem
	call CurItemName
	ld de, StringBuffer1
	ld a, 1
	call CopyConvertedText
	ld b, BANK(GiveItemScript)
	ld de, GiveItemScript
	jp ScriptCall
; 96f76


GiveItemScript: ; 96f77
	farwritetext ReceivedItemText
	iffalse .Full
	waitsfx
	specialsound
	waitbutton
	itemnotify
	end

.Full:
	buttonsound
	pocketisfull
	end
; 96f89

Script_verbosegiveitem2: ; 96f8e
; parameters:
;     item (ItemLabelByte)
;     var (SingleByteParam)
	call GetScriptByte
	cp -1
	jr nz, .ok
	ld a, [ScriptVar]
.ok
	ld [wCurItem], a
	call GetScriptByte
	call GetVarAction
	ld a, [de]
	ld [wItemQuantityChangeBuffer], a
	ld hl, NumItems
	call ReceiveItem
	; a = carry ? TRUE : FALSE
	sbc a
	and TRUE
	ld [ScriptVar], a
	call CurItemName
	ld de, StringBuffer1
	ld a, 1
	call CopyConvertedText
	ld b, BANK(GiveItemScript)
	ld de, GiveItemScript
	jp ScriptCall
; 96fc6

Script_itemnotify: ; 96fc6
	call GetPocketName
	call CurItemName
	ld b, BANK(PutItemInPocketText)
	ld hl, PutItemInPocketText
	jp MapTextbox
; 96fd5

Script_pocketisfull: ; 96fd5
	call GetPocketName
	call CurItemName
	ld b, BANK(PocketIsFullText)
	ld hl, PocketIsFullText
	jp MapTextbox
; 96fe4

Script_specialsound: ; 96fe4
	farcall CheckItemPocket
	ld a, [wItemAttributeParamBuffer]
	cp TM_HM
	ld de, SFX_GET_TM
	jr z, .play
	ld de, SFX_ITEM
.play
	call PlaySFX
	jp WaitSFX
; 96ffe


GetPocketName: ; 96ffe
	farcall CheckItemPocket
	ld a, [wItemAttributeParamBuffer]
	dec a
	ld hl, .Pockets
	and 3
	add a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld hl, StringBuffer3
	jp CopyName2

.Pockets:
	dw .Item
	dw .Key
	dw .Ball
	dw .TM

.Item:
	db "ITEM POCKET@"
.Key:
	db "KEY POCKET@"
.Ball:
	db "BALL POCKET@"
.TM:
	db "TM POCKET@"
; 97051

CurItemName: ; 97051
	ld a, [wCurItem]
	ld [wd265], a
	jp GetItemName
; 9705b


PutItemInPocketText: ; 9705b
	text_jump UnknownText_0x1c472c
	db "@"
; 97060

PocketIsFullText: ; 97060
	text_jump UnknownText_0x1c474b
	db "@"
; 97065


Script_pokemart: ; 97065
; parameters:
;     dialog_id (SingleByteParam)
;     mart_id (SingleByteParam)
	call GetScriptByte
	ld c, a
	call GetScriptByte
	ld e, a
	ld d, 0
	ld a, [ScriptBank]
	ld b, a
	farcall OpenMartDialog
	ret
; 9707c

Script_elevator: ; 9707c
; parameters:
;     floor_list_pointer (PointerLabelParam)
	xor a
	ld [ScriptVar], a
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld a, [ScriptBank]
	ld b, a
	farcall Elevator
	ret c
	ld a, TRUE
	ld [ScriptVar], a
	ret
; 97099

Script_trade: ; 97099
; parameters:
;     trade_id (SingleByteParam)
	call GetScriptByte
	ld e, a
	farcall NPCTrade
	ret
; 970a4

Script_fruittree: ; 970ee
; parameters:
;     tree_id (SingleByteParam)
	call GetScriptByte
	ld [CurFruitTree], a
	ld b, BANK(FruitTreeScript)
	ld hl, FruitTreeScript
	jp ScriptJump
; 970fc

Script_swarm: ; 970fc
; parameters:
;     flag (SingleByteParam)
;     map_group (MapGroupParam)
;     map_id (MapIdParam)
	call GetScriptByte
	ld c, a
	call GetScriptByte
	ld d, a
	call GetScriptByte
	ld e, a
	farcall StoreSwarmMapIndices
	ret
; 9710f

Script_trainertext: ; 9710f
; parameters:
;     which_text (SingleByteParam)
	call GetScriptByte
	ld c, a
	ld b, 0
	ld hl, WalkingX
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [EngineBuffer1]
	ld b, a
	jp MapTextbox
; 97125

Script_scripttalkafter: ; 97125
	ld hl, wScriptAfterPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [EngineBuffer1]
	ld b, a
	jp ScriptJump
; 97132

Script_trainerflagaction: ; 97132
; parameters:
;     action (SingleByteParam)
	xor a
	ld [ScriptVar], a
	ld hl, wd041
	ld e, [hl]
	inc hl
	ld d, [hl]
	call GetScriptByte
	ld b, a
	call EventFlagAction
	ld a, c
	and a
	ret z
	ld a, TRUE
	ld [ScriptVar], a
	ret
; 9714c

Script_winlosstext: ; 9714c
; parameters:
;     win_text_pointer (TextPointerLabelParam)
;     loss_text_pointer (TextPointerLabelParam)
	ld hl, wWinTextPointer ; d047
	call GetScriptByte
	ld [hli], a
	call GetScriptByte
	ld [hli], a
	ld hl, wLossTextPointer ; d049; this is unnecessary
	call GetScriptByte
	ld [hli], a
	call GetScriptByte
	ld [hli], a
	ret
; 97163

Script_end_if_just_battled: ; 97163
	ld a, [wRunningTrainerBattleScript]
	and a
	ret z
	jp Script_end
; 9716b

Script_check_just_battled: ; 9716b
	ld a, TRUE
	ld [ScriptVar], a
	ld a, [wRunningTrainerBattleScript]
	and a
	ret nz
	xor a
	ld [ScriptVar], a
	ret
; 9717a

Script_encountermusic: ; 9717a
	ld a, [OtherTrainerClass]
	ld e, a
	farcall PlayTrainerEncounterMusic
	ret
; 97185

Script_playmapmusic: ; 97185
	jp PlayMapMusic
; 97189

Script_playmusic: ; 97189
; parameters:
;     music_pointer (SingleByteParam)
	ld de, MUSIC_NONE
	call PlayMusic
	xor a
	ld [MusicFade], a
	call MaxVolume
	call GetScriptByte
	ld e, a
	ld d, 0
	jp PlayMusic
; 971a2

Script_musicfadeout: ; 971a2
; parameters:
;     music (SingleByteParam)
;     fadetime (SingleByteParam)
	call GetScriptByte
	ld [MusicFadeID], a
	xor a
	ld [MusicFadeID + 1], a
	call GetScriptByte
	and $7f
	ld [MusicFade], a
	ret
; 971b7

Script_playsound: ; 971b7
; parameters:
;     sound_pointer (SingleByteParam)
	call GetScriptByte
	ld e, a
	ld d, 0
	jp PlaySFX
; 971c3

Script_waitsfx: ; 971c3
	jp WaitSFX
; 971c7

Script_warpsound: ; 971c7
	ld a, [PlayerStandingTile]
	ld de, SFX_ENTER_DOOR
	cp COLL_DOOR
	jr z, .play
	ld de, SFX_WARP_TO
	cp COLL_WARP_PANEL
	jr z, .play
	ld de, SFX_EXIT_BUILDING
.play
	jp PlaySFX
; 971d1

Script_cry: ; 971d1
; parameters:
;     cry_id (SingleByteParam)
	call GetScriptByte
	and a
	jr nz, .ok
	ld a, [ScriptVar]
.ok
	jp PlayCry
; 971e3

Script_setlasttalked: ; 971ea
; parameters:
;     person (SingleByteParam)
	call GetScriptByte
	ld [hLastTalked], a
	ret
; 971f3

Script_applymovement: ; 971f3
; parameters:
;     person (SingleByteParam)
;     data (MovementPointerLabelParam)
	call GetScriptByte
	ld c, a
; 971fa

ApplyMovement: ; 971fa
	push bc
	ld a, c
	farcall SetFlagsForMovement_1
	pop bc

	push bc
	call SetFlagsForMovement_2
	pop bc

	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, [ScriptBank]
	ld b, a
	call GetMovementData
	ret c

	ld a, SCRIPT_WAIT_MOVEMENT
	ld [ScriptMode], a
	jp StopScript
; 97221

SetFlagsForMovement_2: ; 97221
	farcall _SetFlagsForMovement_2
	ret
; 97228

Script_applymovement2: ; 97228
; apply movement to last talked
; parameters:
;     data (MovementPointerLabelParam)
	ld a, [hLastTalked]
	ld c, a
	jp ApplyMovement
; 9722e

Script_faceplayer: ; 9722e
	ld a, [hLastTalked]
	and a
	ret z
	ld d, $0
	ld a, [hLastTalked]
	ld e, a
	farcall GetRelativeFacing
	ld a, d
	add a
	add a
	ld e, a
	ld a, [hLastTalked]
	ld d, a
	jp ApplyPersonFacing
; 97248

Script_faceperson: ; 97248
; parameters:
;     person1 (SingleByteParam)
;     person2 (SingleByteParam)
	call GetScriptByte
	cp LAST_TALKED
	jr c, .ok
	ld a, [hLastTalked]
.ok
	ld e, a
	call GetScriptByte
	cp LAST_TALKED
	jr nz, .ok2
	ld a, [hLastTalked]
.ok2
	ld d, a
	push de
	farcall GetRelativeFacing
	pop bc
	ret c
	ld a, d
	add a
	add a
	ld e, a
	ld d, c
	jp ApplyPersonFacing
; 97274

Script_spriteface: ; 97274
; parameters:
;     person (SingleByteParam)
;     facing (SingleByteParam)
	call GetScriptByte
	cp LAST_TALKED
	jr nz, .ok
	ld a, [hLastTalked]
.ok
	ld d, a
	call GetScriptByte
	add a
	add a
	ld e, a
	; fallthrough
; 9728b

ApplyPersonFacing: ; 9728b
	ld a, d
	push de
	call CheckObjectVisibility
	jr c, .not_visible
	ld hl, OBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	push bc
	call DoesSpriteHaveFacings
	pop bc
	jr c, .not_visible ; STILL_SPRITE
	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit FIXED_FACING, [hl]
	jr nz, .not_visible
	pop de
	ld a, e
	call SetSpriteDirection
	ld hl, VramState
	bit 6, [hl]
	jr nz, .text_state
	call .DisableTextTiles
.text_state
	jp UpdateSprites

.not_visible
	pop de
	scf
	ret
; 972bc

.DisableTextTiles: ; 972bc
	call LoadMapPart
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
.loop
	res 7, [hl]
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret
; 972ce

Script_variablesprite: ; 972ce
; parameters:
;     byte (SingleByteParam)
;     sprite (SingleByteParam)
	call GetScriptByte
	ld e, a
	ld d, $0
	ld hl, VariableSprites
	add hl, de
	call GetScriptByte
	ld [hl], a
	ret
; 972dd

Script_appear: ; 972dd
; parameters:
;     person (SingleByteParam)
	call GetScriptByte
	call _CopyObjectStruct
	ld a, [hMapObjectIndexBuffer]
	ld b, 0 ; clear
	jp ApplyEventActionAppearDisappear
; 972ee

Script_disappear: ; 972ee
; parameters:
;     person (SingleByteParam)
	call GetScriptByte
	cp LAST_TALKED
	jr nz, .ok
	ld a, [hLastTalked]
.ok
	call DeleteObjectStruct
	ld a, [hMapObjectIndexBuffer]
	ld b, 1 ; set
	call ApplyEventActionAppearDisappear
	farcall _UpdateSprites
	ret
; 9730b

ApplyEventActionAppearDisappear: ; 9730b
	push bc
	call GetMapObject
	ld hl, MAPOBJECT_EVENT_FLAG
	add hl, bc
	pop bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, -1
	cp e
	jr nz, .okay
	cp d
	jr nz, .okay
	xor a
	ret
.okay
	jp EventFlagAction
; 97325

Script_follow: ; 97325
; parameters:
;     person2 (SingleByteParam)
;     person1 (SingleByteParam)
	call GetScriptByte
	ld b, a
	call GetScriptByte
	ld c, a
	farcall StartFollow
	ret
; 9733a

Script_stopfollow: ; 9733a
	farcall StopFollow
	ret
; 97341

Script_moveperson: ; 97341
; parameters:
;     person (SingleByteParam)
;     x (SingleByteParam)
;     y (SingleByteParam)
	call GetScriptByte
	ld b, a
	call GetScriptByte
	add 4
	ld d, a
	call GetScriptByte
	add 4
	ld e, a
	farcall CopyDECoordsToMapObject
	ret
; 9735b

Script_writepersonxy: ; 9735b
; parameters:
;     person (SingleByteParam)
	call GetScriptByte
	cp LAST_TALKED
	jr nz, .ok
	ld a, [hLastTalked]
.ok
	ld b, a
	farcall WritePersonXY
	ret
; 9736f

Script_follownotexact: ; 9736f
; parameters:
;     person2 (SingleByteParam)
;     person1 (SingleByteParam)
	call GetScriptByte
	ld b, a
	call GetScriptByte
	ld c, a
	farcall FollowNotExact
	ret
; 97384

Script_loademote: ; 97384
; parameters:
;     bubble (SingleByteParam)
	call GetScriptByte
	cp -1
	jr nz, .not_var_emote
	ld a, [ScriptVar]
.not_var_emote
	ld c, a
	farcall LoadEmote
	ret
; 97396

Script_showemote: ; 97396
; parameters:
;     bubble (SingleByteParam)
;     person (SingleByteParam)
;     time (DecimalParam)
	call GetScriptByte
	ld [ScriptVar], a
	call GetScriptByte
	cp LAST_TALKED
	jr z, .ok
	ld [hLastTalked], a
.ok
	call GetScriptByte
	ld [ScriptDelay], a
	ld b, BANK(ShowEmoteScript)
	ld de, ShowEmoteScript
	jp ScriptCall
; 973b6

ShowEmoteScript: ; 973b6
	loademote EMOTE_MEM
	applymovement2 .Show
	pause 0
	applymovement2 .Hide
	end

.Show:
	show_emote
	step_sleep 1
	step_end

.Hide:
	hide_emote
	step_sleep 1
	step_end
; 973c7


Script_earthquake: ; 973c7
; parameters:
;     param (DecimalParam)
	ld hl, EarthquakeMovement
	ld de, wd002
	ld bc, EarthquakeMovementEnd - EarthquakeMovement
	call CopyBytes
	call GetScriptByte
	ld [wd003], a
	and (1 << 6) - 1
	ld [wd005], a
	ld b, BANK(.script)
	ld de, .script
	jp ScriptCall
; 973e6

.script ; 973e6
	applymovement PLAYER, wd002
	end
; 973eb

EarthquakeMovement: ; 973eb
	step_shake 16 ; the 16 gets overwritten with the script byte
	step_sleep 16 ; the 16 gets overwritten with the lower 6 bits of the script byte
	step_end
EarthquakeMovementEnd:
; 973f0


Script_randomwildmon: ; 973fb
	xor a
	ld [wBattleScriptFlags], a
	ret
; 97400

Script_loadmemtrainer: ; 97400
	ld a, (1 << 7) | 1
	ld [wBattleScriptFlags], a
	ld a, [wTempTrainerClass]
	ld [OtherTrainerClass], a
	ld a, [wTempTrainerID]
	ld [OtherTrainerID], a
	ret
; 97412

Script_loadwildmon: ; 97412
; parameters:
;     pokemon (PokemonParam)
;     level (DecimalParam)
	ld a, (1 << 7)
	ld [wBattleScriptFlags], a
	call GetScriptByte
	ld [TempWildMonSpecies], a
	call GetScriptByte
	ld [CurPartyLevel], a
	ret
; 97424

Script_loadtrainer: ; 97424
; parameters:
;     trainer_group (TrainerGroupParam)
;     trainer_id (TrainerIdParam)
	ld a, (1 << 7) | 1
	ld [wBattleScriptFlags], a
	call GetScriptByte
	ld [OtherTrainerClass], a
	call GetScriptByte
	ld [OtherTrainerID], a
	ret
; 97436

Script_startbattle: ; 97436
	call BufferScreen
	predef StartBattle
	ld a, [wBattleResult]
	and $3f
	ld [ScriptVar], a
	ret
; 97447

Script_reloadmapafterbattle: ; 97459
	ld hl, wBattleScriptFlags
	ld d, [hl]
	ld [hl], $0
	ld a, [wBattleResult]
	and $3f
	cp $1
	jr nz, .notblackedout
	ld b, BANK(Script_BattleWhiteout)
	ld hl, Script_BattleWhiteout
	jp ScriptJump

.notblackedout
	bit 0, d
	jr nz, .done
	ld a, [wBattleResult]
	bit 7, a
	jr z, .done
	ld b, BANK(Script_AlertToFullBox)
	ld de, Script_AlertToFullBox
	farcall LoadScriptBDE
.done
	; fallthrough
; 97491

Script_reloadmap: ; 97491
	xor a
	ld [wBattleScriptFlags], a
	ld a, MAPSETUP_RELOADMAP
	ld [hMapEntryMethod], a
	ld a, $1
	call LoadMapStatus
	jp StopScript
; 974a2

Script_scall: ; 974a2
; parameters:
;     pointer (ScriptPointerLabelParam)
	ld a, [ScriptBank]
	ld b, a
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	jr ScriptCall
; 974b0

Script_farscall: ; 974b0
; parameters:
;     pointer (ScriptPointerLabelBeforeBank)
	call GetScriptByte
	ld b, a
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	jr ScriptCall
; 974be

Script_ptcall: ; 974be
; parameters:
;     pointer (PointerLabelToScriptPointer)
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld b, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	; fallthrough

ScriptCall: ; 974cb
; Bug: The script stack has a capacity of 5 scripts, yet there is
; nothing to stop you from pushing a sixth script.  The high part
; of the script address can then be overwritten by modifications
; to ScriptDelay, causing the script to return to the rst/interrupt
; space.

	push de
	ld hl, wScriptStackSize
	ld e, [hl]
	inc [hl]
	ld d, $0
	ld hl, wScriptStack
	add hl, de
	add hl, de
	add hl, de
	pop de
	ld a, [ScriptBank]
	ld [hli], a
	ld a, [ScriptPos]
	ld [hli], a
	ld a, [ScriptPos + 1]
	ld [hl], a
	ld a, b
	ld [ScriptBank], a
	ld a, e
	ld [ScriptPos], a
	ld a, d
	ld [ScriptPos + 1], a
	ret
; 974f3

CallCallback:: ; 974f3
	ld a, [ScriptBank]
	or $80
	ld [ScriptBank], a
	jp ScriptCall
; 974fe

Script_jump: ; 974fe
; parameters:
;     pointer (ScriptPointerLabelParam)
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, [ScriptBank]
	ld b, a
	jp ScriptJump
; 9750d

Script_farjump: ; 9750d
; parameters:
;     pointer (ScriptPointerLabelBeforeBank)
	call GetScriptByte
	ld b, a
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	jp ScriptJump
; 9751c

Script_ptjump: ; 9751c
; parameters:
;     pointer (PointerLabelToScriptPointer)
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp ScriptJump
; 9752c

Script_iffalse: ; 9752c
; parameters:
;     pointer (ScriptPointerLabelParam)
	ld a, [ScriptVar]
	and a
	jp nz, SkipTwoScriptBytes
	jp Script_jump
; 97536

Script_iftrue: ; 97536
; parameters:
;     pointer (ScriptPointerLabelParam)
	ld a, [ScriptVar]
	and a
	jp nz, Script_jump
	jp SkipTwoScriptBytes
; 97540

Script_if_equal: ; 97540
; parameters:
;     byte (SingleByteParam)
;     pointer (ScriptPointerLabelParam)
	call GetScriptByte
	ld hl, ScriptVar
	cp [hl]
	jr z, Script_jump
	jr SkipTwoScriptBytes
; 9754b

Script_if_not_equal: ; 9754b
; parameters:
;     byte (SingleByteParam)
;     pointer (ScriptPointerLabelParam)
	call GetScriptByte
	ld hl, ScriptVar
	cp [hl]
	jr nz, Script_jump
	jr SkipTwoScriptBytes
; 97556

Script_if_greater_than: ; 97556
; parameters:
;     byte (SingleByteParam)
;     pointer (ScriptPointerLabelParam)
	ld a, [ScriptVar]
	ld b, a
	call GetScriptByte
	cp b
	jr c, Script_jump
	jr SkipTwoScriptBytes
; 97562

Script_if_less_than: ; 97562
; parameters:
;     byte (SingleByteParam)
;     pointer (ScriptPointerLabelParam)
	call GetScriptByte
	ld b, a
	ld a, [ScriptVar]
	cp b
	jr c, Script_jump
	jr SkipTwoScriptBytes
; 9756e

Script_jumpstd: ; 9756e
; parameters:
;     predefined_script (SingleByteParam)
	call StdScript
	jr ScriptJump
; 97573

Script_callstd: ; 97573
; parameters:
;     predefined_script (SingleByteParam)
	call StdScript
	ld d, h
	ld e, l
	jp ScriptCall
; 9757b

StdScript: ; 9757b
	call GetScriptByte
	ld e, a
	ld d, 0
	ld hl, StdScripts
	add hl, de
	add hl, de
	add hl, de
	ld a, BANK(StdScripts)
	call GetFarByte
	ld b, a
	inc hl
	ld a, BANK(StdScripts)
	jp GetFarHalfword
; 97596

SkipTwoScriptBytes: ; 97596
	call GetScriptByte
	jp GetScriptByte
; 9759d

ScriptJump: ; 9759d
	ld a, b
	ld [ScriptBank], a
	ld a, l
	ld [ScriptPos], a
	ld a, h
	ld [ScriptPos + 1], a
	ret
; 975aa

Script_priorityjump: ; 975aa
; parameters:
;     pointer (ScriptPointerLabelParam)
	ld a, [ScriptBank]
	ld [wPriorityScriptBank], a
	call GetScriptByte
	ld [wPriorityScriptAddr], a
	call GetScriptByte
	ld [wPriorityScriptAddr + 1], a
	ld hl, ScriptFlags
	set 3, [hl]
	ret
; 975c2

Script_checktriggers: ; 975c2
	call CheckTriggers
	jr z, .no_triggers
	ld [ScriptVar], a
	ret

.no_triggers
	ld a, $ff
	ld [ScriptVar], a
	ret
; 975d1

Script_checkmaptriggers: ; 975d1
; parameters:
;     map_group (SingleByteParam)
;     map_id (SingleByteParam)
	call GetScriptByte
	ld b, a
	call GetScriptByte
	ld c, a
	call GetMapTrigger
	ld a, d
	or e
	jr z, .no_triggers
	ld a, [de]
	ld [ScriptVar], a
	ret

.no_triggers
	ld a, $ff
	ld [ScriptVar], a
	ret
; 975eb

Script_dotrigger: ; 975eb
; parameters:
;     trigger_id (SingleByteParam)
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	jr DoTrigger
; 975f5

Script_domaptrigger: ; 975f5
; parameters:
;     map_group (MapGroupParam)
;     map_id (MapIdParam)
;     trigger_id (SingleByteParam)
	call GetScriptByte
	ld b, a
	call GetScriptByte
	ld c, a
DoTrigger: ; 975fd
	call GetMapTrigger
	ld a, d
	or e
	ret z
	call GetScriptByte
	ld [de], a
	ret
; 97609

Script_copybytetovar: ; 97609
; parameters:
;     address (RAMAddressParam)
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, [hl]
	ld [ScriptVar], a
	ret
; 97616

Script_copyvartobyte: ; 97616
; parameters:
;     address (RAMAddressParam)
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, [ScriptVar]
	ld [hl], a
	ret
; 97623

Script_loadvar: ; 97623
; parameters:
;     address (RAMAddressParam)
;     value (SingleByteParam)
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	call GetScriptByte
	ld [hl], a
	ret
; 97630

Script_writebyte: ; 97630
; parameters:
;     value (SingleByteParam)
	call GetScriptByte
	ld [ScriptVar], a
	ret
; 97637

Script_addvar: ; 97637
; parameters:
;     value (SingleByteParam)
	call GetScriptByte
	ld hl, ScriptVar
	add [hl]
	ld [hl], a
	ret
; 97640

Script_random: ; 97640
; parameters:
;     input (SingleByteParam)
	call GetScriptByte
	ld [ScriptVar], a
	and a
	ret z

	ld c, a
	call .Divide256byC
	and a
	jr z, .no_restriction ; 256 % b == 0
	ld b, a
	xor a
	sub b
	ld b, a
.loop
	push bc
	call Random
	pop bc
	ld a, [hRandomAdd]
	cp b
	jr nc, .loop
	jr .finish

.no_restriction
	push bc
	call Random
	pop bc
	ld a, [hRandomAdd]

.finish
	push af
	ld a, [ScriptVar]
	ld c, a
	pop af
	call SimpleDivide
	ld [ScriptVar], a
	ret
; 97673

.Divide256byC: ; 97673
	xor a
	ld b, a
	sub c
.mod_loop
	inc b
	sub c
	jr nc, .mod_loop
	dec b
	add c
	ret
; 9767d

Script_checkcode: ; 9767d
; parameters:
;     variable_id (SingleByteParam)
	call GetScriptByte
	call GetVarAction
	ld a, [de]
	ld [ScriptVar], a
	ret
; 97688

Script_writevarcode: ; 97688
; parameters:
;     variable_id (SingleByteParam)
	call GetScriptByte
	call GetVarAction
	ld a, [ScriptVar]
	ld [de], a
	ret
; 97693

Script_writecode: ; 97693
; parameters:
;     variable_id (SingleByteParam)
;     value (SingleByteParam)
	call GetScriptByte
	call GetVarAction
	call GetScriptByte
	ld [de], a
	ret
; 9769e

GetVarAction: ; 9769e
	ld c, a
	farcall _GetVarAction
	ret
; 976a6

Script_pokenamemem: ; 976ae
; parameters:
;     pokemon (PokemonParam); leave $0 to draw from script var
;     memory (SingleByteParam)
	call GetScriptByte
	and a
	jr nz, .gotit
	ld a, [ScriptVar]
.gotit
	ld [wd265], a
	call GetPokemonName
	ld de, StringBuffer1

ConvertMemToText: ; 976c0
	call GetScriptByte
	cp 3
	jr c, .ok
	xor a
.ok

CopyConvertedText: ; 976c8
	ld hl, StringBuffer3
	ld bc, StringBuffer4 - StringBuffer3
	call AddNTimes
	jp CopyName2
; 976d5

Script_itemtotext: ; 976d5
; parameters:
;     item (ItemLabelByte); use 0 to draw from ScriptVar
;     memory (SingleByteParam)
	call GetScriptByte
	and a
	jr nz, .ok
	ld a, [ScriptVar]
.ok
	ld [wd265], a
	call GetItemName
	ld de, StringBuffer1
	jr ConvertMemToText
; 976e9

Script_mapnametotext: ; 976e9
; parameters:
;     memory (SingleByteParam)
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetWorldMapLocation

ConvertLandmarkToText: ; 976f4
	ld e, a
	farcall GetLandmarkName
	ld de, StringBuffer1
	jp ConvertMemToText
; 97701

Script_landmarktotext: ; 97701
; parameters:
;     id (SingleByteParam)
;     memory (SingleByteParam)
	call GetScriptByte
	jr ConvertLandmarkToText
; 97706

Script_trainertotext: ; 97706
; parameters:
;     trainer_id (TrainerGroupParam)
;     trainer_group (TrainerIdParam)
;     memory (SingleByteParam)
	call GetScriptByte
	ld c, a
	call GetScriptByte
	ld b, a
	farcall GetTrainerName
	jr ConvertMemToText
; 97716

Script_name: ; 97716
; parameters:
;     type (SingleByteParam)
;     id (SingleByteParam)
;     memory (SingleByteParam)
	call GetScriptByte
	ld [wNamedObjectTypeBuffer], a

ContinueToGetName: ; 9771c
	call GetScriptByte
	ld [CurSpecies], a
	call GetName
	ld de, StringBuffer1
	jp ConvertMemToText
; 9772b

Script_trainerclassname: ; 9772b
; parameters:
;     id (SingleByteParam)
;     memory (SingleByteParam)
	ld a, TRAINER_NAME
	ld [wNamedObjectTypeBuffer], a
	jr ContinueToGetName
; 97732

Script_readmoney: ; 97732
; parameters:
;     account (SingleByteParam)
;     memory (SingleByteParam)
	call ResetStringBuffer1
	call GetMoneyAccount
	ld hl, StringBuffer1
	lb bc, PRINTNUM_RIGHTALIGN | 3, 6
	call PrintNum
	ld de, StringBuffer1
	jp ConvertMemToText
; 97747

Script_readcoins: ; 97747
; parameters:
;     memory (SingleByteParam)
	call ResetStringBuffer1
	ld hl, StringBuffer1
	ld de, Coins
	lb bc, PRINTNUM_RIGHTALIGN | 2, 6
	call PrintNum
	ld de, StringBuffer1
	jp ConvertMemToText
; 9775c

Script_RAM2MEM: ; 9775c
; parameters:
;     memory (SingleByteParam)
	call ResetStringBuffer1
	ld de, ScriptVar
	ld hl, StringBuffer1
	lb bc, PRINTNUM_RIGHTALIGN | 1, 3
	call PrintNum
	ld de, StringBuffer1
	jp ConvertMemToText
; 97771

ResetStringBuffer1: ; 97771
	ld hl, StringBuffer1
	ld bc, NAME_LENGTH
	ld a, "@"
	jp ByteFill
; 9777d

Script_stringtotext: ; 9777d
; parameters:
;     text_pointer (EncodedTextLabelParam)
;     memory (SingleByteParam)
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld a, [ScriptBank]
	ld hl, CopyName1
	rst FarCall
	ld de, StringBuffer2
	jp ConvertMemToText
; 97792

Script_givepokeitem: ; 97792
; parameters:
;     pointer (PointerParamToItemAndLetter)
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	ld a, [ScriptBank]
	call GetFarByte
	ld b, a
	push bc
	inc hl
	ld bc, MAIL_MAX_LENGTH
	ld de, wd002
	ld a, [ScriptBank]
	call FarCopyBytes
	pop bc
	farcall GivePokeItem
	ret
; 977b7

Script_checkpokeitem: ; 977b7
; parameters:
;     pointer (PointerParamToItemAndLetter)
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld a, [ScriptBank]
	ld b, a
	farcall CheckPokeItem
	ret
; 977ca

Script_giveitem: ; 977ca
; parameters:
;     item (ItemLabelByte)
;     quantity (SingleByteParam)
	call GetScriptByte
	cp ITEM_FROM_MEM
	jr nz, .ok
	ld a, [ScriptVar]
.ok
	ld [wCurItem], a
	call GetScriptByte
	ld [wItemQuantityChangeBuffer], a
	ld hl, NumItems
	call ReceiveItem
	jr nc, .full
	ld a, TRUE
	ld [ScriptVar], a
	ret
.full
	xor a
	ld [ScriptVar], a
	ret
; 977f0

Script_takeitem: ; 977f0
; parameters:
;     item (ItemLabelByte)
;     quantity (DecimalParam)
	xor a
	ld [ScriptVar], a
	call GetScriptByte
	ld [wCurItem], a
	call GetScriptByte
	ld [wItemQuantityChangeBuffer], a
	ld a, -1
	ld [CurItemQuantity], a
	ld hl, NumItems
	call TossItem
	ret nc
	ld a, TRUE
	ld [ScriptVar], a
	ret
; 97812

Script_checkitem: ; 97812
; parameters:
;     item (ItemLabelByte)
	xor a
	ld [ScriptVar], a
	call GetScriptByte
	ld [wCurItem], a
	ld hl, NumItems
	call CheckItem
	ret nc
	ld a, TRUE
	ld [ScriptVar], a
	ret
; 97829

Script_givemoney: ; 97829
; parameters:
;     account (SingleByteParam)
;     money (MoneyByteParam)
	call GetMoneyAccount
	call LoadMoneyAmountToMem
	farcall GiveMoney
	ret
; 97836

Script_takemoney: ; 97836
; parameters:
;     account (SingleByteParam)
;     money (MoneyByteParam)
	call GetMoneyAccount
	call LoadMoneyAmountToMem
	farcall TakeMoney
	ret
; 97843

Script_checkmoney: ; 97843
; parameters:
;     account (SingleByteParam)
;     money (MoneyByteParam)
	call GetMoneyAccount
	call LoadMoneyAmountToMem
	farcall CompareMoney
; 9784f

CompareMoneyAction: ; 9784f
	jr c, .two
	jr z, .one
	ld a, 0
	jr .done
.one
	ld a, 1
	jr .done
.two
	ld a, 2
.done
	ld [ScriptVar], a
	ret
; 97861

GetMoneyAccount: ; 97861
	call GetScriptByte
	and a
	ld de, Money
	ret z
	ld de, wMomsMoney
	ret
; 9786d

LoadMoneyAmountToMem: ; 9786d
	ld bc, hMoneyTemp
	push bc
	call GetScriptByte
	ld [bc], a
	inc bc
	call GetScriptByte
	ld [bc], a
	inc bc
	call GetScriptByte
	ld [bc], a
	pop bc
	ret
; 97881

Script_givecoins: ; 97881
; parameters:
;     coins (CoinByteParam)
	call LoadCoinAmountToMem
	farcall GiveCoins
	ret
; 9788b

Script_takecoins: ; 9788b
; parameters:
;     coins (CoinByteParam)
	call LoadCoinAmountToMem
	farcall TakeCoins
	ret
; 97895

Script_checkcoins: ; 97895
; parameters:
;     coins (CoinByteParam)
	call LoadCoinAmountToMem
	farcall CheckCoins
	jr CompareMoneyAction
; 978a0

LoadCoinAmountToMem: ; 978a0
	call GetScriptByte
	ld [hMoneyTemp + 1], a
	call GetScriptByte
	ld [hMoneyTemp], a
	ld bc, hMoneyTemp
	ret
; 978ae

Script_checktime: ; 978ae
; parameters:
;     time (SingleByteParam)
	xor a
	ld [ScriptVar], a
	farcall CheckTime
	call GetScriptByte
	and c
	ret z
	ld a, TRUE
	ld [ScriptVar], a
	ret
; 978c3

Script_checkpoke: ; 978c3
; parameters:
;     pkmn (PokemonParam)
	xor a
	ld [ScriptVar], a
	call GetScriptByte
	ld hl, PartySpecies
	ld de, 1
	call IsInArray
	ret nc
	ld a, TRUE
	ld [ScriptVar], a
	ret
; 978da

Script_givepoke: ; 97932
; parameters:
;     pokemon (PokemonParam)
;     level (DecimalParam)
;     item (ItemLabelByte)
;     trainer (DecimalParam)
;     trainer_name_pointer (MultiByteParam)
;     pkmn_nickname (MultiByteParam)
	call GetScriptByte
	ld [CurPartySpecies], a
	call GetScriptByte
	ld [CurPartyLevel], a
	call GetScriptByte
	ld [wCurItem], a
	call GetScriptByte
	ld [MonVariant], a
	call GetScriptByte
	and a
	ld b, a
	jr z, .ok
	ld hl, ScriptPos
	ld e, [hl]
	inc hl
	ld d, [hl]
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
.ok
	farcall GivePoke
	ld a, b
	ld [ScriptVar], a
	ret
; 97968

Script_giveegg: ; 97968
; parameters:
;     pkmn (PokemonParam)
;     level (DecimalParam)
; if no room in the party, return 0 in ScriptVar; else, return 2
	xor a ; PARTYMON
	ld [ScriptVar], a
	ld [MonType], a
	call GetScriptByte
	ld [CurPartySpecies], a
	call GetScriptByte
	ld [CurPartyLevel], a
	farcall GiveEgg
	ret nc
	ld a, 2
	ld [ScriptVar], a
	ret
; 97988

Script_setevent: ; 97988
; parameters:
;     bit_number (MultiByteParam)
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld b, SET_FLAG
	jp EventFlagAction
; 97996

Script_clearevent: ; 97996
; parameters:
;     bit_number (MultiByteParam)
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld b, RESET_FLAG
	jp EventFlagAction
; 979a4

Script_checkevent: ; 979a4
; parameters:
;     bit_number (MultiByteParam)
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	jr z, .false
	ld a, TRUE
.false
	ld [ScriptVar], a
	ret
; 979bb

Script_setflag: ; 979bb
; parameters:
;     bit_number (MultiByteParam)
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld b, SET_FLAG
	jp _EngineFlagAction
; 979c9

Script_clearflag: ; 979c9
; parameters:
;     bit_number (MultiByteParam)
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld b, RESET_FLAG
	jp _EngineFlagAction
; 979d7

Script_checkflag: ; 979d7
; parameters:
;     bit_number (MultiByteParam)
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld b, 2 ; check
	call _EngineFlagAction
	ld a, c
	and a
	jr z, .false
	ld a, TRUE
.false
	ld [ScriptVar], a
	ret
; 979ee

_EngineFlagAction: ; 979ee
	farcall EngineFlagAction
	ret
; 979f5

Script_wildoff: ; 979f5
	ld hl, StatusFlags
	set 5, [hl]
	ret
; 979fb

Script_wildon: ; 979fb
	ld hl, StatusFlags
	res 5, [hl]
	ret
; 97a01

Script_warpfacing: ; 97a0e
; parameters:
;     facing (SingleByteParam)
;     map_group (MapGroupParam)
;     map_id (MapIdParam)
;     x (SingleByteParam)
;     y (SingleByteParam)
	call GetScriptByte
	and $3
	ld c, a
	ld a, [wPlayerSpriteSetupFlags]
	set 5, a
	or c
	ld [wPlayerSpriteSetupFlags], a
; fall through

Script_warp: ; 97a1d
; parameters:
;     map_group (MapGroupParam)
;     map_id (MapIdParam)
;     x (SingleByteParam)
;     y (SingleByteParam)
; This seems to be some sort of error handling case.
	call GetScriptByte
	and a
	jr z, .not_ok
	ld [MapGroup], a
	call GetScriptByte
	ld [MapNumber], a
	call GetScriptByte
	ld [XCoord], a
	call GetScriptByte
	ld [YCoord], a
	ld a, -1
	ld [wd001], a
	ld a, MAPSETUP_WARP
	ld [hMapEntryMethod], a
	ld a, 1
	call LoadMapStatus
	jp StopScript

.not_ok
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	ld a, -1
	ld [wd001], a
	ld a, MAPSETUP_BADWARP
	ld [hMapEntryMethod], a
	ld a, 1
	call LoadMapStatus
	jp StopScript
; 97a65

Script_warpmod: ; 97a65
; parameters:
;     warp_id (SingleByteParam)
;     map_group (MapGroupParam)
;     map_id (MapIdParam)
	call GetScriptByte
	ld [BackupWarpNumber], a
	call GetScriptByte
	ld [BackupMapGroup], a
	call GetScriptByte
	ld [BackupMapNumber], a
	ret
; 97a78

Script_blackoutmod: ; 97a78
; parameters:
;     map_group (MapGroupParam)
;     map_id (MapIdParam)
	call GetScriptByte
	ld [wLastSpawnMapGroup], a
	call GetScriptByte
	ld [wLastSpawnMapNumber], a
	ret
; 97a85

Script_dontrestartmapmusic: ; 97a85
	ld a, 1
	ld [wDontPlayMapMusicOnReload], a
	ret
; 97a8b

Script_writecmdqueue: ; 97a8b
; parameters:
;     queue_pointer (MultiByteParam)
	call GetScriptByte
	ld e, a
	call GetScriptByte
	ld d, a
	ld a, [ScriptBank]
	ld b, a
	farcall WriteCmdQueue ; no need to farcall
	ret
; 97a9e

Script_delcmdqueue: ; 97a9e
; parameters:
;     byte (SingleByteParam)
	xor a
	ld [ScriptVar], a
	call GetScriptByte
	ld b, a
	farcall DelCmdQueue ; no need to farcall
	ret c
	ld a, 1
	ld [ScriptVar], a
	ret
; 97ab3

Script_changemap: ; 97ab3
; parameters:
;     map_data_pointer (MapDataPointerParam)
	call GetScriptByte
	ld [MapBlockDataBank], a
	call GetScriptByte
	ld [MapBlockDataPointer], a
	call GetScriptByte
	ld [MapBlockDataPointer + 1], a
	call ChangeMap
	jp BufferScreen
; 97acc

Script_changeblock: ; 97acc
; parameters:
;     x (SingleByteParam)
;     y (SingleByteParam)
;     block (SingleByteParam)
	call GetScriptByte
	add 4
	ld d, a
	call GetScriptByte
	add 4
	ld e, a
	call GetBlockLocation
	call GetScriptByte
	ld [hl], a
	jp BufferScreen
; 97ae3

Script_reloadmappart:: ; 97ae3
	xor a
	ld [hBGMapMode], a
	call OverworldTextModeSwitch
	call GetMovementPermissions
	farcall ReloadMapPart
	jp UpdateSprites
; 97af6

Script_warpcheck: ; 97af6
	call WarpCheck
	ret nc
	farcall EnableEvents
	ret
; 97b01

Script_newloadmap: ; 97b08
; parameters:
;     which_method (SingleByteParam)
	call GetScriptByte
	ld [hMapEntryMethod], a
	ld a, 1
	call LoadMapStatus
	jp StopScript
; 97b16

Script_reloadandreturn: ; 97b16
	call Script_newloadmap
	jp Script_end
; 97b1c

Script_textbox: ; 97b1c
	jp OpenText
; 97b20

Script_refreshscreen: ; 97b20
	jp RefreshScreen
; 97b27

Script_closetext: ; 97b2f
	call _OpenAndCloseMenu_HDMATransferTileMapAndAttrMap
	jp CloseText
; 97b36


Script_passtoengine: ; 97b36
; parameters:
;     data_pointer (PointerLabelBeforeBank)
	call GetScriptByte
	push af
	call GetScriptByte
	ld l, a
	call GetScriptByte
	ld h, a
	pop af
	jp StartAutoInput
; 97b47

Script_pause: ; 97b47
; parameters:
;     length (DecimalParam)
	call GetScriptByte
	and a
	jr z, .loop
	ld [ScriptDelay], a
.loop
	ld c, 2
	call DelayFrames
	ld hl, ScriptDelay
	dec [hl]
	jr nz, .loop
	ret
; 97b5c

Script_deactivatefacing: ; 97b5c
; parameters:
;     time (SingleByteParam)
	call GetScriptByte
	and a
	jr z, .no_time
	ld [ScriptDelay], a
.no_time
	ld a, SCRIPT_WAIT
	ld [ScriptMode], a
	jp StopScript
; 97b6e

Script_ptpriorityjump: ; 97b6e
; parameters:
;     pointer (ScriptPointerLabelParam)
	call StopScript
	jp Script_jump
; 97b74

Script_end: ; 97b74
	call ExitScriptSubroutine
	jr c, .resume
	ret

.resume
	xor a
	ld [ScriptRunning], a
	ld a, SCRIPT_OFF
	ld [ScriptMode], a
	ld hl, ScriptFlags
	res 0, [hl]
	jp StopScript
; 97b8c

Script_return: ; 97b8c
	call ExitScriptSubroutine
	ld hl, ScriptFlags
	res 0, [hl]
	jp StopScript
; 97b9a

ExitScriptSubroutine: ; 97b9a
; Return carry if there's no parent to return to.

	ld hl, wScriptStackSize
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	ld e, [hl]
	ld d, $0
	ld hl, wScriptStack
	add hl,de
	add hl,de
	add hl,de
	ld a, [hli]
	ld b, a
	and " "
	ld [ScriptBank], a
	ld a, [hli]
	ld e, a
	ld [ScriptPos], a
	ld a, [hl]
	ld d, a
	ld [ScriptPos + 1], a
	and a
	ret
.done
	scf
	ret
; 97bc0

Script_end_all: ; 97bc0
	xor a
	ld [wScriptStackSize], a
	ld [ScriptRunning], a
	ld a, SCRIPT_OFF
	ld [ScriptMode], a
	ld hl, ScriptFlags
	res 0, [hl]
	jp StopScript
; 97bd5

Script_halloffame: ; 97bd5
	ld hl, GameTimerPause
	res 0, [hl]
	farcall HallOfFame
	ld hl, GameTimerPause
	set 0, [hl]
	jr ReturnFromCredits
; 97bf3

Script_credits: ; 97bf3
	farcall RedCredits
ReturnFromCredits:
	call Script_end_all
	ld a, $3
	call LoadMapStatus
	jp StopScript
; 97c051

Script_wait: ; 97c05
; parameters:
;     unknown (SingleByteParam)
	push bc
	call GetScriptByte
.loop
	push af
	ld c, 6
	call DelayFrames
	pop af
	dec a
	jr nz, .loop
	pop bc
	ret
; 97c15

Script_check_save: ; 97c15
	farcall CheckSave
	ld a, c
	ld [ScriptVar], a
	ret
; 97c20

Script_divemap:
; parameters:
;     map_group (MapGroupParam)
;     map_id (MapIdParam)
;     delta_x (SingleByteParam)
;     delta_y (SingleByteParam)
	call GetScriptByte
	ld [DiveMapGroup], a
	call GetScriptByte
	ld [DiveMapNumber], a
	call GetScriptByte
	ld [DiveDeltaX], a
	call GetScriptByte
	ld [DiveDeltaY], a
	ret

Script_divewarp:
	ld a, [DiveMapGroup]
	ld [MapGroup], a
	ld a, [DiveMapNumber]
	ld [MapNumber], a
	ld a, [XCoord]
	ld b, a
	ld a, [DiveDeltaX]
	add b
	ld [XCoord], a
	ld a, [YCoord]
	ld b, a
	ld a, [DiveDeltaY]
	add b
	ld [YCoord], a
	ld a, -1
	ld [wd001], a
	ld a, MAPSETUP_WARP
	ld [hMapEntryMethod], a
	ld a, 1
	call LoadMapStatus
	jp StopScript
	
Script_giveshells: ; 97881
; parameters:
;     shells (ShellByteParam)
	call LoadShellAmountToMem
	farcall GiveShells
	ret
; 9788b

Script_checkshells: ; 97895
; parameters:
;     shells (ShellByteParam)
	call LoadShellAmountToMem
	farcall CheckShells
	jr CompareShellAction
; 978a0

CompareShellAction: ; 9784f
	jr c, .two
	jr z, .one
	ld a, 0
	jr .done
.one
	ld a, 1
	jr .done
.two
	ld a, 2
.done
	ld [ScriptVar], a
	ret

LoadShellAmountToMem: ; 978a0
	call GetScriptByte
	ld [hMoneyTemp + 1], a
	call GetScriptByte
	ld [hMoneyTemp], a
	ld bc, hMoneyTemp
	ret
; 978ae

Script_readshells: ; 97747
; parameters:
;     memory (SingleByteParam)
	call ResetStringBuffer1
	ld hl, StringBuffer1
	ld de, Shells
	lb bc, PRINTNUM_RIGHTALIGN | 2, 6
	call PrintNum
	ld de, StringBuffer1
	jp ConvertMemToText
; 9775c
