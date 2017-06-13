; Pic animation arrangement.

POKEANIM: MACRO
	rept _NARG

; Workaround for a bug where macro args can't come after the start of a symbol
if !def(\1_POKEANIM)
\1_POKEANIM equs "PokeAnim_\1_"
endc

	db (\1_POKEANIM - PokeAnim_SetupCommands) / 2
	shift
	endr

	db (PokeAnim_Finish_ - PokeAnim_SetupCommands) / 2
ENDM


PokeAnims: ; d0042
	dw .Slow
	dw .Normal
	dw .Menu
	dw .Trade
	dw .Evolve
	dw .Hatch
	dw .Menu
	dw .Egg1
	dw .Egg2

.Slow:   POKEANIM StereoCry, Setup2, Play
.Normal: POKEANIM StereoCry, Setup, Play
.Menu:   POKEANIM CryNoWait, Setup, Play
.Trade:  POKEANIM Cry, Setup, Play
.Evolve: POKEANIM CryNoWait, Setup, Play
.Hatch:  POKEANIM CryNoWait, Setup, Play
.Egg1:   POKEANIM Setup, Play
.Egg2:   POKEANIM Extra, Play


AnimateFrontpic: ; d008e
	call AnimateMon_CheckIfPokemon
	ret c
	call LoadMonAnimation
.loop
	call SetUpPokeAnim
	push af
	farcall HDMATransferTileMapToWRAMBank3
	pop af
	jr nc, .loop
	ret
; d00a3

LoadMonAnimation: ; d00a3
	push hl
	ld c, e
	ld b, 0
	ld hl, PokeAnims
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
	pop hl
	call PokeAnim_InitPicAttributes
	ret
; d00b4

SetUpPokeAnim: ; d00b4
	ld a, [rSVBK]
	push af
	ld a, $2
	ld [rSVBK], a
	ld a, [wPokeAnimSceneIndex]
	ld c, a
	ld b, 0
	ld hl, wPokeAnimPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, bc
	ld a, [hl]
	ld hl, PokeAnim_SetupCommands
	rst JumpTable
	ld a, [wPokeAnimSceneIndex]
	ld c, a
	pop af
	ld [rSVBK], a
	ld a, c
	and $80
	ret z
	scf
	ret
; d00da

PokeAnim_SetupCommands: ; d00da
setup_command: macro
\1_: dw \1
endm
	setup_command PokeAnim_Finish
	setup_command PokeAnim_BasePic
	setup_command PokeAnim_SetWait
	setup_command PokeAnim_Wait
	setup_command PokeAnim_Setup
	setup_command PokeAnim_Setup2
	setup_command PokeAnim_Extra
	setup_command PokeAnim_Play
	setup_command PokeAnim_Play2
	setup_command PokeAnim_Cry
	setup_command PokeAnim_CryNoWait
	setup_command PokeAnim_StereoCry
; d00f2

PokeAnim_SetWait: ; d00f2
	ld a, 18
	ld [wPokeAnimWaitCounter], a
	ld a, [wPokeAnimSceneIndex]
	inc a
	ld [wPokeAnimSceneIndex], a

PokeAnim_Wait: ; d00fe
	ld hl, wPokeAnimWaitCounter
	dec [hl]
	ret nz
	ld a, [wPokeAnimSceneIndex]
	inc a
	ld [wPokeAnimSceneIndex], a
	ret
; d010b

PokeAnim_Setup: ; d010b
	ld c, FALSE
	ld b, 0
	call PokeAnim_InitAnim
	call PokeAnim_SetVBank1
	ld a, [wPokeAnimSceneIndex]
	inc a
	ld [wPokeAnimSceneIndex], a
	ret
; d011d

PokeAnim_Setup2: ; d011d
	ld c, FALSE
	ld b, 4
	call PokeAnim_InitAnim
	call PokeAnim_SetVBank1
	ld a, [wPokeAnimSceneIndex]
	inc a
	ld [wPokeAnimSceneIndex], a
	ret
; d012f

PokeAnim_Extra: ; d012f
	ld c, TRUE
	ld b, 0
	call PokeAnim_InitAnim
	call PokeAnim_SetVBank1
	ld a, [wPokeAnimSceneIndex]
	inc a
	ld [wPokeAnimSceneIndex], a
	ret
; d0141

PokeAnim_Play: ; d0141
	call PokeAnim_DoAnimScript
	ld a, [wPokeAnimJumptableIndex]
	bit 7, a
	ret z
	call PokeAnim_PlaceGraphic
	ld a, [wPokeAnimSceneIndex]
	inc a
	ld [wPokeAnimSceneIndex], a
	ret
; d0155

PokeAnim_Play2: ; d0155
	call PokeAnim_DoAnimScript
	ld a, [wPokeAnimJumptableIndex]
	bit 7, a
	ret z
	ld a, [wPokeAnimSceneIndex]
	inc a
	ld [wPokeAnimSceneIndex], a
	ret
; d0166

PokeAnim_BasePic: ; d0166
	call PokeAnim_DeinitFrames
	ld a, [wPokeAnimSceneIndex]
	inc a
	ld [wPokeAnimSceneIndex], a
	ret
; d0171

PokeAnim_Finish: ; d0171
	call PokeAnim_DeinitFrames
	ld hl, wPokeAnimSceneIndex
	set 7, [hl]
	ret
; d017a

PokeAnim_Cry: ; d017a
	ld a, [wPokeAnimSpecies]
	call _PlayCry
	ld a, [wPokeAnimSceneIndex]
	inc a
	ld [wPokeAnimSceneIndex], a
	ret
; d0188

PokeAnim_CryNoWait: ; d0188
	ld a, [wPokeAnimSpecies]
	call PlayCry2
	ld a, [wPokeAnimSceneIndex]
	inc a
	ld [wPokeAnimSceneIndex], a
	ret
; d0196

PokeAnim_StereoCry: ; d0196
	ld a, $f
	ld [CryTracks], a
	ld a, [wPokeAnimSpecies]
	call PlayStereoCry2
	ld a, [wPokeAnimSceneIndex]
	inc a
	ld [wPokeAnimSceneIndex], a
	ret
; d01a9

PokeAnim_DeinitFrames: ; d01a9
	ld a, [rSVBK]
	push af
	ld a, $2
	ld [rSVBK], a
	call PokeAnim_PlaceGraphic
	farcall HDMATransferTileMapToWRAMBank3
	call PokeAnim_SetVBank0
	farcall HDMATransferAttrMapToWRAMBank3
	pop af
	ld [rSVBK], a
	ret
; d01c6

AnimateMon_CheckIfPokemon: ; d01c6
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .fail
	call IsAPokemon
	jr c, .fail
	and a
	ret

.fail
	scf
	ret
; d01d6

PokeAnim_InitPicAttributes: ; d01d6
	ld a, [rSVBK]
	push af
	ld a, $2
	ld [rSVBK], a

	push bc
	push de
	push hl
	ld hl, wPokeAnimSceneIndex
	ld bc, wPokeAnimStructEnd - wPokeAnimSceneIndex
	xor a
	call ByteFill
	pop hl
	pop de
	pop bc

; bc contains anim pointer
	ld a, c
	ld [wPokeAnimPointer], a
	ld a, b
	ld [wPokeAnimPointer + 1], a
; hl contains TileMap coords
	ld a, l
	ld [wPokeAnimCoord], a
	ld a, h
	ld [wPokeAnimCoord + 1], a
; d = start tile
	ld a, d
	ld [wPokeAnimGraphicStartTile], a

	ld a, $1
	ld hl, CurPartySpecies
	call GetFarWRAMByte
	ld [wPokeAnimSpecies], a

	ld a, $1
	ld hl, SpindaPattern
	call GetFarWRAMByte
	ld [wPokeAnimSpindaPattern], a

	call PokeAnim_GetSpeciesOrSpindaPattern
	ld [wPokeAnimSpeciesOrSpindaPattern], a

	pop af
	ld [rSVBK], a
	ret
; d0228

PokeAnim_InitAnim: ; d0228
	ld a, [rSVBK]
	push af
	ld a, $2
	ld [rSVBK], a
	push bc
	ld hl, wPokeAnimExtraFlag
	ld bc, wPokeAnimStructEnd - wPokeAnimExtraFlag
	xor a
	call ByteFill
	pop bc

	ld a, b
	ld [wPokeAnimSpeed], a
	ld a, c
	ld [wPokeAnimExtraFlag], a

	pop af
	ld [rSVBK], a
	ret
; d0250

PokeAnim_DoAnimScript: ; d0250
	xor a
	ld [hBGMapMode], a
.loop
	ld a, [wPokeAnimJumptableIndex]
	and $7f
	ld hl, .Jumptable
	rst JumpTable
	ret
; d025d

.Jumptable: ; d025d
	dw .EndAnim
	dw .WaitAnim
; d0261

.EndAnim: ; d02a8
	ld hl, wPokeAnimJumptableIndex
	set 7, [hl]
	ret
; d02ae

.WaitAnim: ; d0282
	ld a, [wPokeAnimWaitCounter]
	dec a
	ld [wPokeAnimWaitCounter], a
	ret nz
	call PokeAnim_StopWaitAnim
	ret
; d028e

PokeAnim_GetDuration: ; d02ae
; a * (1 + [wPokeAnimSpeed] / 16)
	ld c, a
	ld b, $0
	ld hl, 0
	ld a, [wPokeAnimSpeed]
	call AddNTimes
	ld a, h
	swap a
	and $f0
	ld h, a
	ld a, l
	swap a
	and $f
	or h
	add c
	ret
; d02c8

PokeAnim_StartWaitAnim: ; d02dc
	ld a, [wPokeAnimJumptableIndex]
	inc a
	ld [wPokeAnimJumptableIndex], a
	ret
; d02e4

PokeAnim_StopWaitAnim: ; d02e4
	ld a, [wPokeAnimJumptableIndex]
	dec a
	ld [wPokeAnimJumptableIndex], a
	ret
; d02ec

PokeAnim_IsSpinda: ; d02ec
	ld a, [wPokeAnimSpecies]
	cp SPINDA
	ret
; d02f2

PokeAnim_PlaceGraphic: ; d04bd
	call .ClearBox
	ld a, [wBoxAlignment]
	and a
	jr nz, .flipped
	ld de, 1
	ld bc, 0
	jr .okay

.flipped
	ld de, -1
	ld bc, 6

.okay
	ld hl, wPokeAnimCoord
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, bc
	ld c, 7
	ld b, 7
	ld a, [wPokeAnimGraphicStartTile]
.loop
	push bc
	push hl
	push de
	ld de, SCREEN_WIDTH
.loop2
	ld [hl], a
	inc a
	add hl, de
	dec b
	jr nz, .loop2
	pop de
	pop hl
	add hl, de
	pop bc
	dec c
	jr nz, .loop
	ret
; d04f6

.ClearBox: ; d04f6
	ld hl, wPokeAnimCoord
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, 7
	ld c, 7
	call ClearBox
	ret
; d0504

PokeAnim_SetVBank1: ; d0504
	ld a, [rSVBK]
	push af
	ld a, $2
	ld [rSVBK], a
	xor a
	ld [hBGMapMode], a
	call .SetFlag
	farcall HDMATransferAttrMapToWRAMBank3
	pop af
	ld [rSVBK], a
	ret
; d051b

.SetFlag: ; d051b
	call PokeAnim_GetAttrMapCoord
	ld b, 7
	ld c, 7
	ld de, SCREEN_WIDTH
.row
	push bc
	push hl
.col
	ld a, [hl]
	or 8
	ld [hl], a
	add hl, de
	dec c
	jr nz, .col
	pop hl
	inc hl
	pop bc
	dec b
	jr nz, .row
	ret
; d0536

PokeAnim_SetVBank0: ; d0536
	call PokeAnim_GetAttrMapCoord
	ld b, 7
	ld c, 7
	ld de, SCREEN_WIDTH
.row
	push bc
	push hl
.col
	ld a, [hl]
	and $f7
	ld [hl], a
	add hl, de
	dec c
	jr nz, .col
	pop hl
	inc hl
	pop bc
	dec b
	jr nz, .row
	ret
; d0551

PokeAnim_GetAttrMapCoord: ; d0551
	ld hl, wPokeAnimCoord
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, AttrMap - TileMap
	add hl, de
	ret
; d055c

PokeAnim_GetSpeciesOrSpindaPattern: ; d065c
	call PokeAnim_IsSpinda
	jr z, .spinda
	ld a, [wPokeAnimSpecies]
	ret

.spinda
	ld a, [wPokeAnimSpindaPattern]
	ret
; d0669

HOF_AnimateFrontpic: ; d066e Predef 49
	call AnimateMon_CheckIfPokemon
	jr c, .fail
	ld h, d
	ld l, e
	push bc
	push hl
	ld de, VTiles2
	predef FrontpicPredef
	pop hl
	pop bc
	ld d, 0
	ld e, c
	call AnimateFrontpic
	xor a
	ld [wBoxAlignment], a
	ret

.fail
	xor a
	ld [wBoxAlignment], a
	inc a
	ld [CurPartySpecies], a
	ret
; d0695
