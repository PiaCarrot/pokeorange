
INCLUDE "engine/facings.asm"

SpriteMovementData:: ; 4273
INCLUDE "data/map_objects.asm"

; 4357
DeleteMapObject:: ; 4357
	push bc
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld a, [hl]
	push af
	ld h, b
	ld l, c
	ld bc, OBJECT_STRUCT_LENGTH
	xor a
	call ByteFill
	pop af
	cp -1
	jr z, .ok
	bit 7, a
	jr nz, .ok
	call GetMapObject
	ld hl, OBJECT_SPRITE
	add hl, bc
	ld [hl], -1
.ok
	pop bc
	ret
; 437b

HandleCurNPCStep: ; 437b
	call .CheckObjectStillVisible
	ret c
	call .HandleStepType
	jp .HandleObjectAction

.CheckObjectStillVisible:
	ld hl, OBJECT_FLAGS2
	add hl, bc
	res 6, [hl]
	ld a, [hMapObjectIndexBuffer]
	and a
	jr nz, .notPlayer
; hardcode for crossing over connections
	ld a, [YCoord]
	inc a
	jr z, .yes
	ld a, [XCoord]
	inc a
	jr z, .yes
.notPlayer
	ld a, [XCoord]
	ld e, a
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld a, [hl]
	inc a
	sub e
	jr c, .ok
	cp MAPOBJECT_SCREEN_WIDTH
	jr nc, .ok
	ld a, [YCoord]
	ld e, a
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld a, [hl]
	inc a
	sub e
	jr c, .ok
	cp MAPOBJECT_SCREEN_HEIGHT
	jr c, .yes

.ok
	ld hl, OBJECT_FLAGS2
	add hl, bc
	set 6, [hl]
	ld a, [XCoord]
	ld e, a
	ld hl, OBJECT_INIT_X
	add hl, bc
	ld a, [hl]
	inc a
	sub e
	jr c, .ok2
	cp MAPOBJECT_SCREEN_WIDTH
	jr nc, .ok2
	ld a, [YCoord]
	ld e, a
	ld hl, OBJECT_INIT_Y
	add hl, bc
	ld a, [hl]
	inc a
	sub e
	jr c, .ok2
	cp MAPOBJECT_SCREEN_HEIGHT
	jr nc, .ok2
.yes
	and a
	ret

.ok2
	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit 1, [hl]
	jr nz, .yes2
	call DeleteMapObject
	scf
	ret

.yes2
	ld hl, OBJECT_FLAGS2
	add hl, bc
	set 6, [hl]
	and a
	ret

.HandleStepType:
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld a, [hl]
	and a
	jr z, .zero
	ld hl, OBJECT_FLAGS2
	add hl, bc
	bit 5, [hl]
	ret nz
	cp STEP_TYPE_SLEEP
	jr z, .one
	jr .ok3

.zero
	call ObjectMovementReset
	ld hl, OBJECT_FLAGS2
	add hl, bc
	bit 5, [hl]
	ret nz
.one
	call MapObjectMovementPattern
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld a, [hl]
	and a
	ret z
	cp STEP_TYPE_SLEEP
	ret z
.ok3
	ld hl, StepTypesJumptable
	rst JumpTable
	ret

.HandleObjectAction:
	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit INVISIBLE, [hl]
	jp nz, SetFacingStanding
	ld hl, OBJECT_FLAGS2
	add hl, bc
	bit 6, [hl]
	jr nz, SetFacingStanding
	bit 5, [hl]
	jr nz, asm_4448
	ld de, Pointers445f ; use first column
	jr asm_444d
; 4440

Function4440: ; 4440
	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit INVISIBLE, [hl]
	jr nz, SetFacingStanding
asm_4448: ; use second column
	ld de, Pointers445f + 2
; 444d
asm_444d:
; call [4 * ObjectStructs[ObjInd, OBJECT_ACTION] + de]
	ld hl, OBJECT_ACTION
	add hl, bc
	ld a, [hl]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
; 445f

INCLUDE "engine/map_object_action.asm"

CopyNextCoordsTileToStandingCoordsTile: ; 4600
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_MAP_Y
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_NEXT_TILE
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_STANDING_TILE
	add hl, bc
	ld [hl], a
	call SetTallGrassFlags
	ld hl, OBJECT_NEXT_TILE
	add hl, bc
	ld a, [hl]
	ret
; 462a

Function462a: ; 462a
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_MAP_Y
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld [hl], a
	ret
; 463f

UpdateTallGrassFlags: ; 463f
	ld hl, OBJECT_FLAGS2
	add hl, bc
	bit 3, [hl] ; is current tile grass?
	jr z, .ok
	ld hl, OBJECT_NEXT_TILE
	add hl, bc
	ld a, [hl]
	call SetTallGrassFlags
.ok
	ld hl, OBJECT_NEXT_TILE
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_STANDING_TILE
	add hl, bc
	ld a, [hl]
	ret
; 4661

SetTallGrassFlags: ; 4661
	cp COLL_LONG_GRASS
	jr z, .set
	cp COLL_TALL_GRASS
	jr nz, .reset
.set
	ld hl, OBJECT_FLAGS2
	add hl, bc
	set 3, [hl]
	ret

.reset
	ld hl, OBJECT_FLAGS2
	add hl, bc
	res 3, [hl]
	ret
; 4679

EndSpriteMovement: ; 467b
	xor a
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_MOVEMENT_BYTE_INDEX
	add hl, bc
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a ; OBJECT_30
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ret
; 4690

InitStep: ; 4690
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit FIXED_FACING, [hl]
	jr nz, GetNextTile
	add a
	add a
	and %00001100
	ld hl, OBJECT_FACING
	add hl, bc
	ld [hl], a
GetNextTile: ; 46a6
	call GetStepVector
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a
	ld a, d
	call GetStepVectorSign
	ld hl, OBJECT_MAP_X
	add hl, bc
	add [hl]
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld [hl], a
	ld d, a
	ld a, e
	call GetStepVectorSign
	ld hl, OBJECT_MAP_Y
	add hl, bc
	add [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld [hl], a
	ld e, a
	push bc
	call GetCoordTile
	pop bc
	ld hl, OBJECT_NEXT_TILE
	add hl, bc
	ld [hl], a
	ret
; 46d7

AddStepVector: ; 46d7
	call GetStepVector
	jr nc, .okay
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld a, [hl]
	and %1
	jr nz, .okay
	lb de, 0, 0
.okay
	ld hl, OBJECT_SPRITE_X
	add hl, bc
	ld a, [hl]
	add d
	ld [hl], a
	ld hl, OBJECT_SPRITE_Y
	add hl, bc
	ld a, [hl]
	add e
	ld [hl], a
	ret
; 46e9

GetStepVector: ; 46e9
; Return (x, y, duration, speed) in (d, e, a, h).
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld a, [hl]
	and %00001111
	add a
	add a
	ld l, a
	ld h, 0
	ld de, StepVectors
	add hl, de
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld h, [hl]
	push af
	push hl
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld a, [hl]
	cp (STEP_SLOW << 2 | RIGHT) + 1
	jr c, .slowStep
	pop hl
	pop af
	and a
	ret
.slowStep
	pop hl
	pop af
	scf
	ret
; 4700

StepVectors: ; 4700
; x,  y, duration, speed
	; slow
	db  0,  1, 32, 1
	db  0, -1, 32, 1
	db -1,  0, 32, 1
	db  1,  0, 32, 1
	; normal
	db  0,  1, 16, 1
	db  0, -1, 16, 1
	db -1,  0, 16, 1
	db  1,  0, 16, 1
	; fast
	db  0,  4,  4, 4
	db  0, -4,  4, 4
	db -4,  0,  4, 4
	db  4,  0,  4, 4
	; running shoes
	db  0,  2,  8, 2
	db  0, -2,  8, 2
	db -2,  0,  8, 2
	db  2,  0,  8, 2
; 4730
GetStepVectorSign: ; 4730
	add a
	ret z  ; 0 or 128
	ld a, 1
	ret nc ; 1 - 127
	ld a, -1
	ret    ; 129 - 255
; 4738
UpdatePlayerStep: ; 4738
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld a, [hl]
	and %00000011
	ld [wPlayerStepDirection], a
	call AddStepVector
	ld a, [wPlayerStepVectorX]
	add d
	ld [wPlayerStepVectorX], a
	ld a, [wPlayerStepVectorY]
	add e
	ld [wPlayerStepVectorY], a
	ld hl, wPlayerStepFlags
	set 5, [hl]
	ret
; 4759

RestoreDefaultMovement: ; 4769
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld a, [hl]
	cp -1
	jr z, .ok
	push bc
	call GetMapObject
	ld hl, MAPOBJECT_MOVEMENT
	add hl, bc
	ld a, [hl]
	pop bc
	ret

.ok
	ld a, SPRITEMOVEFN_STANDING
	ret
; 4780

IncrementObjectMovementByteIndex: ; 4787
	ld hl, OBJECT_MOVEMENT_BYTE_INDEX
	add hl, bc
	inc [hl]
	ret
; 478d

DecrementObjectMovementByteIndex: ; 478d
	ld hl, OBJECT_MOVEMENT_BYTE_INDEX
	add hl, bc
	dec [hl]
	ret
; 4793

MovementAnonymousJumptable: ; 4793
	ld hl, OBJECT_MOVEMENT_BYTE_INDEX
	add hl, bc
	ld a, [hl]
	pop hl
	rst JumpTable
	ret
; 479b

ClearObjectStructField28: ; 479b
	ld hl, OBJECT_28
	add hl, bc
	ld [hl], 0
	ret
; 47a2

IncrementObjectStructField28: ; 47a2
	ld hl, OBJECT_28
	add hl, bc
	inc [hl]
	ret
; 47a8

Object28AnonymousJumptable: ; 47a8
	ld hl, OBJECT_28
	add hl, bc
	ld a, [hl]
	pop hl
	rst JumpTable
	ret
; 47b0

ObjectMovementReset: ; 47bc
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld e, [hl]
	push bc
	call GetCoordTile
	pop bc
	ld hl, OBJECT_NEXT_TILE
	add hl, bc
	ld [hl], a
	call CopyNextCoordsTileToStandingCoordsTile
	call EndSpriteMovement
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret
; 47dd

MapObjectMovementPattern: ; 47dd
	call ClearObjectStructField28
	call GetSpriteMovementFunction
	ld a, [hl]
	ld hl, .Pointers
	rst JumpTable
	ret

.Pointers: ; 47e9
	dw .Null_00 ; 00
	dw .RandomWalkY ; 01
	dw .RandomWalkX ; 02
	dw .RandomWalkXY ; 03
	dw .RandomSpin1 ; 04
	dw .RandomSpin2 ; 05
	dw .Standing ; 06
	dw .ObeyDPad ; 07
	dw .Follow ; 08
	dw .Script ; 09
	dw .Strength ; 0a
	dw .FollowNotExact ; 0b
	dw .MovementShadow ; 0c
	dw .MovementEmote ; 0d
	dw .MovementBigStanding ; 0e
	dw .MovementBouncing ; 0f
	dw .MovementScreenShake ; 10
	dw .MovementSpinClockwise ; 11
	dw .MovementSpinCounterclockwise ; 12
	dw .MovementBoulderDust ; 13
	dw .MovementShakingGrass ; 14
	dw .MovementSailboatTop ; 15
	dw .MovementSailboatBottom ; 16
	dw .MovementUmbrellaLeft ; 17
	dw .MovementUmbrellaRight ; 18
	dw .MovementSplashingPuddle ; 19

.RandomWalkY:
	call Random
	ld a, [hRandomAdd]
	and %00000001
	jp .RandomWalkContinue

.RandomWalkX:
	call Random
	ld a, [hRandomAdd]
	and %00000001
	or  %00000010
	jp .RandomWalkContinue

.RandomWalkXY:
	call Random
	ld a, [hRandomAdd]
	and %00000011
	jp .RandomWalkContinue

.RandomSpin1:
	call Random
	ld a, [hRandomAdd]
	and %00001100
	ld hl, OBJECT_FACING
	add hl, bc
	ld [hl], a
	jp RandomStepDuration_Slow

.RandomSpin2:
	ld hl, OBJECT_FACING
	add hl, bc
	ld a, [hl]
	and %00001100
	ld d, a
	call Random
	ld a, [hRandomAdd]
	and %00001100
	cp d
	jr nz, .keep
	xor %00001100
.keep
	ld [hl], a
	jp RandomStepDuration_Fast

.Standing:
	call Function462a
	call EndSpriteMovement
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_STAND
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_05
.Null_00: ; no-optimize stub function
	ret

.ObeyDPad:
	ld hl, Function5000
	jp HandleMovementData

.Follow:
	ld hl, GetFollowerNextMovementByte
	jp HandleMovementData

.Script:
	ld hl, GetMovementByte
	jp HandleMovementData

.Strength:
	call MovementAnonymousJumptable
	dw .Strength_Start
	dw .Strength_Stop

.Strength_Start:
	ld hl, OBJECT_NEXT_TILE
	add hl, bc
	ld a, [hl]
	cp COLL_HOLE
	jr z, .on_pit
	ld hl, OBJECT_FLAGS2
	add hl, bc
	bit 2, [hl]
	res 2, [hl]
	jr z, .ok
	ld hl, OBJECT_RANGE
	add hl, bc
	ld a, [hl]
	and %00000011
	call InitStep
	call Function6ec1
	jr c, .ok2
	ld de, SFX_STRENGTH
	call PlaySFX
	call SpawnStrengthBoulderDust
	call UpdateTallGrassFlags
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_0F
	ret

.ok2
	call Function462a
.ok
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ret

.on_pit
	call IncrementObjectMovementByteIndex
.Strength_Stop:
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ret

.FollowNotExact:
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld e, [hl]
	ld hl, OBJECT_RANGE
	add hl, bc
	ld a, [hl]
	push bc
	call GetObjectStruct
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld a, [hl]
	cp STANDING
	jr z, .standing
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld a, [hl]
	cp d
	jr z, .equal
	; a = carry ? 2 : 3
	sbc a
	add 3
	jr .done

.equal
	ld hl, OBJECT_MAP_Y
	add hl, bc
	ld a, [hl]
	cp e
	jr z, .standing
	; a = carry ? 1 : 0
	sbc a
	and 1
.done
	ld d, a
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld a, [hl]
	and %00001100
	or d
	pop bc
	jp NormalStep

.standing
	pop bc
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_STAND
	ret

.MovementBigStanding:
	call EndSpriteMovement
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_BIG_SNORLAX
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_04
	ret

.MovementBouncing:
	call EndSpriteMovement
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_BOUNCE
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_04
	ret

.MovementSpinCounterclockwise:
	call MovementAnonymousJumptable
	dw .MovementSpinInit
	dw .MovementSpinRepeat
	dw .MovementSpinTurnLeft

.MovementSpinClockwise:
	call MovementAnonymousJumptable
	dw .MovementSpinInit
	dw .MovementSpinRepeat
	dw .MovementSpinTurnRight

.MovementSpinInit:
	call EndSpriteMovement
	call IncrementObjectMovementByteIndex
.MovementSpinRepeat:
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_STAND
	ld a, $20
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_03
	jp IncrementObjectMovementByteIndex

.MovementSpinTurnLeft:
	ld de, .DirectionData_Counterclockwise
	call .MovementSpinNextFacing
	jr .MovementSpinCounterclockwise

.DirectionData_Counterclockwise: ; 49c0
	db OW_RIGHT, OW_LEFT, OW_DOWN, OW_UP

.MovementSpinTurnRight:
	ld de, .DirectionData_Clockwise
	call .MovementSpinNextFacing
	jr .MovementSpinClockwise

.DirectionData_Clockwise: ; 49cc
	db OW_LEFT, OW_RIGHT, OW_UP, OW_DOWN

.MovementSpinNextFacing:
	ld hl, OBJECT_FACING
	add hl, bc
	ld a, [hl]
	and %00001100
	rrca
	rrca
	push hl
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	pop hl
	ld [hl], a
	jp DecrementObjectMovementByteIndex

.MovementShadow:
	call ._MovementShadow_Grass_Emote_BoulderDust
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_SHADOW
	ld hl, OBJECT_STEP_DURATION
	add hl, de
	ld a, [hl]
	inc a
	add a
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, de
	ld a, [hl]
	and 3
	ld d, 1 * 8 + 6
	cp DOWN
	jr z, .ok_13
	cp UP
	jr z, .ok_13
	ld d, 1 * 8 + 4
.ok_13
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], d
	ld hl, OBJECT_SPRITE_X_OFFSET
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_TRACKING_OBJECT
	ret

.MovementEmote:
	call EndSpriteMovement
	call ._MovementShadow_Grass_Emote_BoulderDust
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_EMOTE
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], -2 * 8
	ld hl, OBJECT_SPRITE_X_OFFSET
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_TRACKING_OBJECT
	ret

.MovementBoulderDust:
	call EndSpriteMovement
	call ._MovementShadow_Grass_Emote_BoulderDust
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_BOULDER_DUST
	ld hl, OBJECT_STEP_DURATION
	add hl, de
	ld a, [hl]
	inc a
	add a
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, de
	ld a, [hl]
	and %00000011
	ld e, a
	ld d, 0
	ld hl, .data_4a81
	add hl, de
	add hl, de
	ld d, [hl]
	inc hl
	ld e, [hl]
	ld hl, OBJECT_SPRITE_X_OFFSET
	add hl, bc
	ld [hl], d
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], e
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_TRACKING_OBJECT
	ret

.data_4a81  ; 4a81
	;   x,  y
	db  0, -4
	db  0,  8
	db  6,  2
	db -6,  2

.MovementShakingGrass:
	call EndSpriteMovement
	call ._MovementShadow_Grass_Emote_BoulderDust
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_GRASS_SHAKE
._MovementGrass_Puddle_End:
	ld hl, OBJECT_STEP_DURATION
	add hl, de
	ld a, [hl]
	add -1
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_TRACKING_OBJECT
	ret
	
.MovementSplashingPuddle:
	call EndSpriteMovement
	call ._MovementShadow_Grass_Emote_BoulderDust
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_PUDDLE_SPLASH
	jr ._MovementGrass_Puddle_End

._MovementShadow_Grass_Emote_BoulderDust:
	ld hl, OBJECT_RANGE
	add hl, bc
	ld a, [hl]
	push bc
	call GetObjectStruct
	ld d, b
	ld e, c
	pop bc
	ld hl, OBJECT_29
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret

.MovementSailboatTop:
	call EndSpriteMovement
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_SAILBOAT_TOP
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_04
	ret

.MovementSailboatBottom:
	call EndSpriteMovement
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_SAILBOAT_BOTTOM
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_04
	ret

.MovementUmbrellaLeft:
	call EndSpriteMovement
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_UMBRELLA_LEFT
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_04
	ret

.MovementUmbrellaRight:
	call EndSpriteMovement
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_UMBRELLA_RIGHT
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_04
	ret

.MovementScreenShake:
	call EndSpriteMovement
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_00
	ld hl, OBJECT_RANGE
	add hl, bc
	ld a, [hl]
	call ._MovementScreenShake
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], e
	ld hl, OBJECT_30
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_14
	ret

._MovementScreenShake:
	ld d, a
	and %00111111
	add a
	ld e, a
	ld a, d
	rlca
	rlca
	and %00000011
	ld d, a
	inc d
	ld a, 1
.loop
	dec d
	ret z
	add a
	jr .loop

.RandomWalkContinue:
	call InitStep
	call Function6ec1 ; check whether the object can move in that direction
	jr c, .NewDuration
	call UpdateTallGrassFlags
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_STEP
	ld hl, wCenteredObject
	ld a, [hMapObjectIndexBuffer]
	cp [hl]
	jr z, .load_6
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_07
	ret

.load_6
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_PLAYER_WALK
	ret

.NewDuration:
	call EndSpriteMovement
	call Function462a
RandomStepDuration_Slow: ; 4b1d
	call Random
	ld a, [hRandomAdd]
	and %11111110
	jr z, RandomStepDuration_Slow
	jr SetRandomStepDuration
; 4b26

RandomStepDuration_Fast: ; 4b26
	call Random
	ld a, [hRandomAdd]
	and %00111110
	jr z, RandomStepDuration_Fast
SetRandomStepDuration: ; 4b2d
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_STAND
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_03
	ret
; 4b45

StepTypesJumptable: ; 4b45
; These pointers use OBJECT_STEP_TYPE.  See constants/sprite_constants.asm
	dw ObjectMovementReset ; 00
	dw MapObjectMovementPattern ; unused
	dw NPCStep ; 02 npc walk
	dw StepType03 ; 03
	dw StepType04 ; 04
	dw StepType05 ; 05
	dw PlayerStep ; 06 player walk
	dw StepType07 ; 07
	dw NPCJump ; 08 npc jump step
	dw PlayerJump ; 09 player jump step
	dw PlayerOrNPCTurnStep ; 0a half step
	dw StepTypeBump ; 0b
	dw TeleportFrom ; 0c teleport from
	dw TeleportTo ; 0d teleport to
	dw Skyfall ; 0e skyfall
	dw StepType0f ; 0f
	dw GotBiteStep ; 10
	dw RockSmashStep ; 11
	dw ReturnDigStep ; 12
	dw StepTypeTrackingObject ; 13
	dw StepType14 ; 14
	dw SkyfallTop ; 15
; 4b79

WaitStep_InPlace: ; 4b79
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret
; 4b86

NPCJump: ; 4b86
	call Object28AnonymousJumptable
; anonymous dw
	dw .Jump
	dw .Land

.Jump:
	call AddStepVector
	call UpdateJumpPosition
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	call CopyNextCoordsTileToStandingCoordsTile
	call GetNextTile
	ld hl, OBJECT_FLAGS2
	add hl, bc
	res 3, [hl]
	jp IncrementObjectStructField28

.Land:
	call AddStepVector
	call UpdateJumpPosition
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	call CopyNextCoordsTileToStandingCoordsTile
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret
; 4bbf

PlayerJump: ; 4bbf
	call Object28AnonymousJumptable
; anonymous dw
	dw .initjump
	dw .stepjump
	dw .initland
	dw .stepland

.initjump
	ld hl, wPlayerStepFlags
	set 7, [hl]
	call IncrementObjectStructField28
.stepjump
	call UpdateJumpPosition
	call UpdatePlayerStep
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	call CopyNextCoordsTileToStandingCoordsTile
	ld hl, OBJECT_FLAGS2
	add hl, bc
	res 3, [hl]
	ld hl, wPlayerStepFlags
	set 6, [hl]
	set 4, [hl]
	jp IncrementObjectStructField28

.initland
	call GetNextTile
	ld hl, wPlayerStepFlags
	set 7, [hl]
	call IncrementObjectStructField28
.stepland
	call UpdateJumpPosition
	call UpdatePlayerStep
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	ld hl, wPlayerStepFlags
	set 6, [hl]
	call CopyNextCoordsTileToStandingCoordsTile
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret
; 4c18

TeleportFrom: ; 4c18
	call Object28AnonymousJumptable
; anonymous dw
	dw .InitSpin
	dw .DoSpin
	dw .InitSpinRise
	dw .DoSpinRise
; 4c23

.InitSpin:
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 32
	call IncrementObjectStructField28
.DoSpin:
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_SPIN
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	jp IncrementObjectStructField28

.InitSpinRise:
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_31
	add hl, bc
	ld [hl], $20
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 32
	ld hl, OBJECT_FLAGS2
	add hl, bc
	res 3, [hl]
	call IncrementObjectStructField28
.DoSpinRise:
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_SPIN
	ld hl, OBJECT_31
	add hl, bc
	inc [hl]
	ld a, [hl]
	ld d, $60
	call Sine
	ld a, h
	sub $60
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret
; 4c89

TeleportTo: ; 4c89
	call Object28AnonymousJumptable
; anonymous dw
	dw .InitWait
	dw .DoWait
	dw .InitDescent
	dw .DoDescent
	dw .InitFinalSpin
	dw .DoFinalSpin
	dw .FinishStep
; 4c9a

.InitWait:
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_00
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 32
	jp IncrementObjectStructField28
; 4caa

.DoWait:
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	call IncrementObjectStructField28
.InitDescent:
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_31
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 32
	jp IncrementObjectStructField28
; 4cc9

.DoDescent:
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_SPIN
	ld hl, OBJECT_31
	add hl, bc
	inc [hl]
	ld a, [hl]
	ld d, $60
	call Sine
	ld a, h
	sub $60
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	call IncrementObjectStructField28
.InitFinalSpin:
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 32
	jp IncrementObjectStructField28
; 4cf5

.DoFinalSpin:
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_SPIN
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
.FinishStep:
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret
; 4d14

Skyfall: ; 4d14
	call Object28AnonymousJumptable
; anonymous dw
	dw .Init
	dw .Step
	dw .Fall
	dw .Finish
; 4d1f

.Init:
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_00
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 16
	call IncrementObjectStructField28
.Step:
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_STEP
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_31
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 16
	call IncrementObjectStructField28
.Fall:
	ld hl, OBJECT_31
	add hl, bc
	inc [hl]
	ld a, [hl]
	ld d, $60
	call Sine
	ld a, h
	sub $60
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	call IncrementObjectStructField28
.Finish:
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret
; 4d7e

GotBiteStep: ; 4d7e
	call Object28AnonymousJumptable
; anonymous dw
	dw .Init
	dw .Run
; 4d85

.Init:
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 8
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], 0
	call IncrementObjectStructField28
.Run:
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld a, [hl]
	xor 1
	ld [hl], a
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret
; 4daf

RockSmashStep: ; 4daf
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld a, [hl]
	and %00000001
	ld a, PERSON_ACTION_STAND
	jr z, .yes
	ld a, PERSON_ACTION_00
.yes
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], a
	jp WaitStep_InPlace
; 4db5

ReturnDigStep: ; 4dc8
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld a, [hl]
	and %00000001
	ld a, PERSON_ACTION_SPIN
	jr z, .yes
	ld a, PERSON_ACTION_SPIN_FLICKER
.yes
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], a
	jp WaitStep_InPlace
; 4ddd

StepType03: ; 4ddd
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret
; 4df0

StepTypeBump: ; 4dff
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret
; 4e0c

StepType05: ; 4e0c
	call Object28AnonymousJumptable
; anonymous dw
	dw .Reset
	dw StepType04

.Reset:
	call RestoreDefaultMovement
	call GetInitialFacing
	ld hl, OBJECT_FACING
	add hl, bc
	ld [hl], a
	call IncrementObjectStructField28
StepType04: ; 4e21
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ret
; 4e2b

NPCStep: ; 4e2b
	call AddStepVector
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	call CopyNextCoordsTileToStandingCoordsTile
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret
; 4e47

StepType07: ; 4e47
	call AddStepVector
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	call CopyNextCoordsTileToStandingCoordsTile
	jp RandomStepDuration_Slow
; 4e56

PlayerStep: ; 4e56
; AnimateStep?
	call Object28AnonymousJumptable
; anonymous dw
	dw .init
	dw .step

.init
	ld hl, wPlayerStepFlags
	set 7, [hl]
	call IncrementObjectStructField28
.step
	call UpdatePlayerStep
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	ld hl, wPlayerStepFlags
	set 6, [hl]
	call CopyNextCoordsTileToStandingCoordsTile
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret
; 4e83

PlayerOrNPCTurnStep: ; 4e83
	call Object28AnonymousJumptable
; anonymous dw
	dw .init1
	dw .step1
	dw .init2
	dw .step2

.init1
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld a, [hl]
	ld [hl], 2
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 2
	call IncrementObjectStructField28
.step1
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	call IncrementObjectStructField28
.init2
	ld hl, OBJECT_29 ; new facing
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_FACING
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 2
	call IncrementObjectStructField28
.step2
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret
; 4ecd

StepType0f: ; 4ecd
	call AddStepVector
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	push bc
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld e, [hl]
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld a, [hl]
	ld b, a
	farcall CopyDECoordsToMapObject
	pop bc
	ld hl, OBJECT_FLAGS2
	add hl, bc
	res 2, [hl]
	call CopyNextCoordsTileToStandingCoordsTile
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret
; 4f04

StepTypeTrackingObject: ; 4f04
	ld hl, OBJECT_29
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, OBJECT_SPRITE
	add hl, de
	ld a, [hl]
	and a
	jr z, .nope
	ld hl, OBJECT_SPRITE_X
	add hl, de
	ld a, [hl]
	ld hl, OBJECT_SPRITE_X
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_SPRITE_Y
	add hl, de
	ld a, [hl]
	ld hl, OBJECT_SPRITE_Y
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret nz
.nope
	jp DeleteMapObject
; 4f33

StepType14: ; 4f33
	call Object28AnonymousJumptable
; anonymous dw
	dw .Init
	dw .Run

.Init:
	xor a
	ld hl, OBJECT_29
	add hl, bc
	ld [hl], a
	call IncrementObjectStructField28
.Run:
	ld hl, OBJECT_29
	add hl, bc
	ld d, [hl]
	ld a, [wPlayerStepVectorY]
	sub d
	ld [wPlayerStepVectorY], a
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	jr z, .ok
	ld a, [hl]
	call .GetSign
	ld hl, OBJECT_29
	add hl, bc
	ld [hl], a
	ld d, a
	ld a, [wPlayerStepVectorY]
	add d
	ld [wPlayerStepVectorY], a
	ret

.ok
	jp DeleteMapObject

.GetSign:
	ld hl, OBJECT_30
	add hl, bc
	and 1
	ld a, [hl]
	ret z
	cpl
	inc a
	ret
; 4f77

SkyfallTop: ; 4f83
	call Object28AnonymousJumptable
; anonymous dw
	dw .Init
	dw .Run

.Init:
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_SKYFALL
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 16
	call IncrementObjectStructField28

.Run:
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], $60
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret
; 4fb2

UpdateJumpPosition: ; 4fd5
	call GetStepVector
	ld a, h
	ld hl, OBJECT_31
	add hl, bc
	ld e, [hl]
	add e
	ld [hl], a
	srl e
	ld d, 0
	ld hl, .y
	add hl, de
	ld a, [hl]
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], a
	ret

.y ; 4ff0
	db  -4,  -6,  -8, -10, -11, -12, -12, -12
	db -11, -10,  -9,  -8,  -6,  -4,   0,   0
; 5000
Function5000: ; unscripted?
; copy [wPlayerNextMovement] to [wPlayerMovement]
	ld a, [wPlayerNextMovement]
	ld hl, wPlayerMovement
	ld [hl], a
; load [wPlayerNextMovement] with movement_step_sleep
	ld a, movement_step_sleep
	ld [wPlayerNextMovement], a
; recover the previous value of [wPlayerNextMovement]
	ld a, [hl]
	ret
; 500e

GetMovementByte:
	ld hl, wMovementDataPointer
	jp _GetMovementByte
; 5015

_GetMovementPerson: ; 5037
	ld hl, GetMovementPerson
	jp HandleMovementData
; 503d

GetMovementPerson: ; 503d
	ld a, [wMovementPerson]
	ret
; 5041

HandleMovementData: ; 5041
	call .StorePointer
.loop
	xor a
	ld [wMovementByteWasControlSwitch], a
	call JumpMovementPointer
	call DoMovementFunction
	ld a, [wMovementByteWasControlSwitch]
	and a
	jr nz, .loop
	ret

.StorePointer:
	ld a, l
	ld [wMovementPointer], a
	ld a, h
	ld [wMovementPointer + 1], a
	ret
; 505e

JumpMovementPointer: ; 505e
	ld hl, wMovementPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
; 5065

ContinueReadingMovement: ; 5065
	ld a, 1
	ld [wMovementByteWasControlSwitch], a
	ret
; 506b

DoMovementFunction: ; 506b
	push af
	call ApplyMovementToFollower
	pop af
	ld hl, MovementPointers
	rst JumpTable
	ret
; 5075

INCLUDE "engine/movement.asm"
; 54b8

ApplyMovementToFollower: ; 54b8
	ld e, a
	ld a, [wObjectFollow_Follower]
	cp -1
	ret z
	ld a, [wObjectFollow_Leader]
	ld d, a
	ld a, [hMapObjectIndexBuffer]
	cp d
	ret nz
	ld a, e
	cp movement_step_sleep
	ret z
	cp movement_step_end
	ret z
	cp movement_step_4b
	ret z
	cp movement_step_bump
	ret z
	cp movement_slow_step
	ret c
	push af
	ld hl, wFollowerMovementQueueLength
	inc [hl]
	ld e, [hl]
	ld d, 0
	ld hl, wFollowMovementQueue
	add hl, de
	pop af
	ld [hl], a
	ret
; 54e6

GetFollowerNextMovementByte: ; 54e6
	ld hl, wFollowerMovementQueueLength
	ld a, [hl]
	and a
	jr z, .done
	cp -1
	jr z, .done
	dec [hl]
	ld e, a
	ld d, 0
	ld hl, wFollowMovementQueue
	add hl, de
	inc e
	ld a, -1
.loop
	ld d, [hl]
	ld [hld], a
	ld a, d
	dec e
	jr nz, .loop
	ret

.done
	call .CancelFollowIfLeaderMissing
	ret c
	ld a, movement_step_sleep
	ret

.CancelFollowIfLeaderMissing:
	ld a, [wObjectFollow_Leader]
	cp -1
	jr z, .nope
	push bc
	call GetObjectStruct
	ld hl, OBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	pop bc
	and a
	jr z, .nope
	and a
	ret

.nope
	ld a, -1
	ld [wObjectFollow_Follower], a
	ld a, movement_step_end
	scf
	ret
; 5529

SpawnShadow: ; 5529
	push bc
	ld de, .ShadowObject
	call CopyTempObjectData
	call InitTempObject
	pop bc
	ret

.ShadowObject:
	; vtile, palette, movement
	db $00, PAL_OW_SILVER, SPRITEMOVEDATA_SHADOW
; 5538
SpawnStrengthBoulderDust: ; 5538
	push bc
	ld de, .BoulderDustObject
	call CopyTempObjectData
	call InitTempObject
	pop bc
	ret

.BoulderDustObject:
	db $00, PAL_OW_SILVER, SPRITEMOVEDATA_BOULDERDUST
; 5547
SpawnEmote: ; 5547
	push bc
	ld de, .EmoteObject
	call CopyTempObjectData
	call InitTempObject
	pop bc
	ret

.EmoteObject:
	db $00, PAL_OW_SILVER, SPRITEMOVEDATA_EMOTE
; 5556
ShakeGrass: ; 5556
	push bc
	ld de, .data_5562
	call CopyTempObjectData
	call InitTempObject
	pop bc
	ret

.data_5562
	db $00, PAL_OW_TREE, SPRITEMOVEDATA_GRASS
; 5565

SplashPuddle:
	push bc
	ld de, .PuddleObject
	call CopyTempObjectData
	call InitTempObject
	pop bc
	ld de, SFX_PUDDLE
	call PlaySFX
	ret

.PuddleObject
	db $00, PAL_OW_BLUE, SPRITEMOVEDATA_PUDDLE

ShakeScreen: ; 5565
	push bc
	push af
	ld de, .ScreenShakeObject
	call CopyTempObjectData
	pop af
	ld [wTempObjectCopyRange], a
	call InitTempObject
	pop bc
	ret

.ScreenShakeObject:
	db $00, PAL_OW_SILVER, SPRITEMOVEDATA_SCREENSHAKE
; 5579
DespawnEmote: ; 5579
	push bc
	ld a, [hMapObjectIndexBuffer]
	ld c, a
	call .DeleteEmote
	pop bc
	ret

.DeleteEmote:
	ld de, ObjectStructs
	ld a, NUM_OBJECT_STRUCTS
.loop
	push af
	ld hl, OBJECT_FLAGS1
	add hl, de
	bit EMOTE_OBJECT, [hl]
	jr z, .next
	ld hl, OBJECT_SPRITE
	add hl, de
	ld a, [hl]
	and a
	jr z, .next
	push bc
	xor a
	ld bc, OBJECT_STRUCT_LENGTH
	call ByteFill
	pop bc
.next
	ld hl, OBJECT_STRUCT_LENGTH
	add hl, de
	ld d, h
	ld e, l
	pop af
	dec a
	jr nz, .loop
	ret
; 55ac

InitTempObject: ; 55ac
	call FindFirstEmptyObjectStruct
	ret nc
	ld d, h
	ld e, l
	farcall CopyTempObjectToObjectStruct
	ret
; 55b9

CopyTempObjectData: ; 55b9
; load into wTempObjectCopy:
; -1, -1, [de], [de + 1], [de + 2], [hMapObjectIndexBuffer], [NextMapX], [NextMapY], -1
; This spawns the object at the same place as whichever object is loaded into bc.
	ld hl, wTempObjectCopyMapObjectIndex
	ld [hl], -1
	inc hl
	ld [hl], -1
	inc hl
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hli], a
	ld a, [hMapObjectIndexBuffer]
	ld [hli], a
	push hl
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld e, [hl]
	pop hl
	ld [hl], d
	inc hl
	ld [hl], e
	inc hl
	ld [hl], -1
	ret
; 55e0

Function55e0:: ; 55e0
	ld a, [VramState]
	bit 0, a
	ret z
	ld bc, ObjectStructs
	xor a
.loop
	ld [hMapObjectIndexBuffer], a
	call DoesObjectHaveASprite
	jr z, .ok
	call Function565c
.ok
	ld hl, OBJECT_STRUCT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	ld a, [hMapObjectIndexBuffer]
	inc a
	cp NUM_OBJECT_STRUCTS
	jr nz, .loop
	ret
; 5602

Function5602: ; 5602, called at battle start
	call Function5645 ; clear sprites
	ld a, PLAYER
	call Function5629 ; respawn player
	ld a, [wBattleScriptFlags]
	bit 7, a
	jr z, .ok
	ld a, [hLastTalked]
	and a
	jr z, .ok
	call Function5629 ; respawn opponent
.ok
	jp _UpdateSprites
; 561d

Function561d: ; 561d
	call Function5645 ; clear sprites
	ld a, PLAYER
	call Function5629 ; respawn player
	jp _UpdateSprites
; 5629

Function5629: ; 5629
	cp NUM_OBJECTS
	ret nc
	call GetMapObject
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	cp -1
	ret z
	cp NUM_OBJECT_STRUCTS
	ret nc
	call GetObjectStruct
	call DoesObjectHaveASprite
	ret z
	jp Function5673
; 5645

Function5645: ; 5645
	xor a
	ld bc, ObjectStructs
.loop
	ld [hMapObjectIndexBuffer], a
	call SetFacing_Standing
	ld hl, OBJECT_STRUCT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	ld a, [hMapObjectIndexBuffer]
	inc a
	cp NUM_OBJECT_STRUCTS
	jr nz, .loop
	ret
; 565c

Function565c: ; 565c
	push bc
	call Function56cd
	pop bc
	jr c, SetFacing_Standing
	call Function56a3
	jr c, SetFacing_Standing
	call Function5688
	call Function4440
	xor a
	ret
; 5673

Function5673: ; 5673
	call Function56a3
	jr c, SetFacing_Standing
	call Function4440 ; no need to farcall
	xor a
	ret
; 5680

SetFacing_Standing: ; 5680
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], STANDING
	scf
	ret
; 5688

Function5688: ; 5688
	push bc
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld e, [hl]
	call GetCoordTile
	pop bc
	ld hl, OBJECT_NEXT_TILE
	add hl, bc
	ld [hl], a
	farcall UpdateTallGrassFlags ; no need to farcall
	ret
; 56a3

Function56a3: ; 56a3
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld e, [hl]
	inc d
	inc e
	ld a, [XCoord]
	cp d
	jr z, .equal_x
	jr nc, .nope
	add SCREEN_WIDTH / 2 + 1
	cp d
	jr c, .nope
.equal_x
	ld a, [YCoord]
	cp e
	jr z, .equal_y
	jr nc, .nope
	add SCREEN_HEIGHT / 2 + 1
	cp e
	jr c, .nope
.equal_y
	xor a
	ret

.nope
	scf
	ret
; 56cd

Function56cd: ; 56cd
	ld a, [wPlayerBGMapOffsetX]
	ld d, a
	ld hl, OBJECT_SPRITE_X_OFFSET
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_SPRITE_X
	add hl, bc
	add [hl]
	add d
	cp $f0
	jr nc, .ok1
	cp $a0
	jp nc, .nope
.ok1
	and %00000111
	ld d, 2
	cp 4
	jr c, .ok2
	ld d, 3
.ok2
	ld a, [hl]
	rrca
	rrca
	rrca
	and %00011111
	cp SCREEN_WIDTH
	jr c, .ok3
	sub $20
.ok3
	ld [hUsedSpriteIndex], a
	ld a, [wPlayerBGMapOffsetY]
	ld e, a
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_SPRITE_Y
	add hl, bc
	add [hl]
	add e
	cp $f0
	jr nc, .ok4
	cp $90
	jr nc, .nope
.ok4
	and %00000111
	ld e, 2
	cp 4
	jr c, .ok5
	ld e, 3
.ok5
	ld a, [hl]
	rrca
	rrca
	rrca
	and %00011111
	cp $12
	jr c, .ok6
	sub $20
.ok6
	ld [hUsedSpriteTile], a
	ld hl, OBJECT_PALETTE
	add hl, bc
	bit 7, [hl]
	jr z, .ok7
	ld a, d
	add 2
	ld d, a
	ld a, e
	add 2
	ld e, a
.ok7
	ld a, d
	ld [hFFBF], a
.loop
	ld a, [hFFBF]
	ld d, a
	ld a, [hUsedSpriteTile]
	add e
	dec a
	cp $12
	jr nc, .ok9
	ld b, a
.next
	ld a, [hUsedSpriteIndex]
	add d
	dec a
	cp $14
	jr nc, .ok8
	ld c, a
	push bc
	call Coord2Tile
	pop bc
	ld a, [hl]
	cp $7f
	jr nc, .nope
.ok8
	dec d
	jr nz, .next
.ok9
	dec e
	jr nz, .loop
	and a
	ret

.nope
	scf
	ret
; 576a

HandleNPCStep:: ; 576a
	call .ResetStepVector
	ld bc, ObjectStructs
	xor a
.loop
	ld [hMapObjectIndexBuffer], a
	call DoesObjectHaveASprite
	call nz, HandleCurNPCStep
	ld hl, OBJECT_STRUCT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	ld a, [hMapObjectIndexBuffer]
	inc a
	cp NUM_OBJECT_STRUCTS
	jr nz, .loop
	ret
; 579d

.ResetStepVector
	xor a
	ld [wPlayerStepVectorX], a
	ld [wPlayerStepVectorY], a
	ld a, [wPlayerStepFlags]
	bit 6, a
	ld a, $0
	ld [wPlayerStepFlags], a
	ret nz
	dec a
	ld [wPlayerStepDirection], a
	ret

RefreshPlayerSprite: ; 579d
	ld a, movement_step_sleep
	ld [wPlayerNextMovement], a
	ld [wPlayerMovement], a
	xor a
	ld [wPlayerTurningDirection], a
	ld [PlayerObjectStepFrame], a
	call .TryResetPlayerAction
	farcall CheckWarpFacingDown
	call c, SpawnInFacingDown
	jp .SpawnInCustomFacing
; 57bc

.TryResetPlayerAction: ; 57bc
	ld hl, wPlayerSpriteSetupFlags
	bit 7, [hl]
	ret z
	xor a ; PERSON_ACTION_00
	ld [PlayerAction], a
	ret
; 57ca

.SpawnInCustomFacing: ; 57ca
	ld hl, wPlayerSpriteSetupFlags
	bit 5, [hl]
	ret z
	ld a, [wPlayerSpriteSetupFlags]
	and 3
	add a
	add a
	jr ContinueSpawnFacing
; 57d9

SpawnInFacingDown: ; 57d9
	xor a
ContinueSpawnFacing: ; 57db
	ld bc, PlayerStruct
	jp SetSpriteDirection
; 57e2

SetPlayerPalette: ; 57e2
	ld a, d
	and %10000000
	ret z
	ld a, d
	swap a
	and %00000111
	ld d, a
	ld bc, PlayerStruct
	ld hl, OBJECT_PALETTE
	add hl, bc
	ld a, [hl]
	and %11111000
	or d
	ld [hl], a
	ret
; 5803

StartFollow:: ; 5803
	push bc
	ld a, b
	call SetLeaderIfVisible
	pop bc
	ret c
	ld a, c
	call SetFollowerIfVisible
	farcall QueueFollowerFirstStep
	ret
; 5815

SetLeaderIfVisible: ; 5815
	call CheckObjectVisibility
	ret c
	ld a, [hObjectStructIndexBuffer]
	ld [wObjectFollow_Leader], a
	ret
; 581f

StopFollow:: ; 581f
	call ResetLeader
	jp ResetFollower
; 5826

ResetLeader: ; 5826
	ld a, -1
	ld [wObjectFollow_Leader], a
	ret
; 582c

SetFollowerIfVisible: ; 582c
	push af
	call ResetFollower
	pop af
	call CheckObjectVisibility
	ret c
	ld hl, OBJECT_MOVEMENTTYPE
	add hl, bc
	ld [hl], SPRITEMOVEDATA_FOLLOWING
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_00
	ld a, [hObjectStructIndexBuffer]
	ld [wObjectFollow_Follower], a
	ret
; 5847

ResetFollower: ; 5847
	ld a, [wObjectFollow_Follower]
	cp -1
	ret z
	call GetObjectStruct
	call Function58e3 ; no need to bankswitch
	ld a, -1
	ld [wObjectFollow_Follower], a
	ret
; 585c

SetFlagsForMovement_1:: ; 585c
	ld a, c
	call CheckObjectVisibility
	ret c
	push bc
	call Function587a
	pop bc
	ld hl, OBJECT_FLAGS2
	add hl, bc
	res 5, [hl]
	xor a
	ret
; 586e

Function587a: ; 587a
	ld bc, ObjectStructs
	xor a
.loop
	push af
	call DoesObjectHaveASprite
	jr z, .next
	ld hl, OBJECT_FLAGS2
	add hl, bc
	set 5, [hl]
.next
	ld hl, OBJECT_STRUCT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	pop af
	inc a
	cp NUM_OBJECT_STRUCTS
	jr nz, .loop
	ret
; 5897

_SetFlagsForMovement_2:: ; 5897
	ld a, [wObjectFollow_Leader]
	cp -1
	ret z
	push bc
	call GetObjectStruct
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld a, [hl]
	pop bc
	cp c
	ret nz
	ld a, [wObjectFollow_Follower]
	cp -1
	ret z
	call GetObjectStruct
	ld hl, OBJECT_FLAGS2
	add hl, bc
	res 5, [hl]
	ret
; 58b9

ReleaseAllMapObjects:: ; 58b9
	push bc
	ld bc, ObjectStructs
	xor a
.loop
	push af
	call DoesObjectHaveASprite
	jr z, .next
	ld hl, OBJECT_FLAGS2
	add hl, bc
	res 5, [hl]
.next
	ld hl, OBJECT_STRUCT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	pop af
	inc a
	cp NUM_OBJECT_STRUCTS
	jr nz, .loop
	pop bc
	ret
; 58d8

Function58e3: ; 58e3
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld a, [hl]
	cp -1
	jr z, Function5903
	push bc
	call GetMapObject
	ld hl, MAPOBJECT_MOVEMENT
	add hl, bc
	ld a, [hl]
	pop bc
	ld hl, OBJECT_MOVEMENTTYPE
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_00
	ret
; 5903

Function5903: ; 5903
	call GetSpriteDirection
	rrca
	rrca
	ld e, a
	ld d, 0
	ld hl, .standing_movefns
	add hl, de
	ld a, [hl]
	ld hl, OBJECT_MOVEMENTTYPE
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_00
	ret

.standing_movefns
	db SPRITEMOVEDATA_STANDING_DOWN
	db SPRITEMOVEDATA_STANDING_UP
	db SPRITEMOVEDATA_STANDING_LEFT
	db SPRITEMOVEDATA_STANDING_RIGHT
; 5920
_UpdateSprites:: ; 5920
	ld a, [VramState]
	bit 0, a
	ret z
	xor a
	ld [hUsedSpriteIndex], a
	ld a, [hOAMUpdate]
	push af
	ld a, 1
	ld [hOAMUpdate], a
	call InitSprites
	call .fill
	pop af
	ld [hOAMUpdate], a
	ret

.fill
	ld a, [VramState]
	bit 1, a
	ld b, SpritesEnd % $100
	jr z, .ok
	ld b, 28 * 4
.ok
	ld a, [hUsedSpriteIndex]
	cp b
	ret nc
	ld l, a
	ld h, Sprites / $100
	ld de, 4
	ld a, b
	ld c, SCREEN_HEIGHT_PX + 16
.loop
	ld [hl], c
	add hl, de
	cp l
	jr nz, .loop
	ret
; 5958

ApplyBGMapAnchorToObjects: ; 5958
	push hl
	push de
	push bc
	ld a, [wPlayerBGMapOffsetX]
	ld d, a
	ld a, [wPlayerBGMapOffsetY]
	ld e, a
	ld bc, ObjectStructs
	ld a, NUM_OBJECT_STRUCTS
.loop
	push af
	call DoesObjectHaveASprite
	jr z, .skip
	ld hl, OBJECT_SPRITE_X
	add hl, bc
	ld a, [hl]
	add d
	ld [hl], a
	ld hl, OBJECT_SPRITE_Y
	add hl, bc
	ld a, [hl]
	add e
	ld [hl], a
.skip
	ld hl, OBJECT_STRUCT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	pop af
	dec a
	jr nz, .loop
	xor a
	ld [wPlayerBGMapOffsetX], a
	ld [wPlayerBGMapOffsetY], a
	pop bc
	pop de
	pop hl
	ret
; 5991

InitSprites: ; 5991
PRIORITY_LOW  EQU $10
PRIORITY_NORM EQU $20
PRIORITY_HIGH EQU $30
	call .DeterminePriorities
	ld c, PRIORITY_HIGH
	call .InitSpritesByPriority
	ld c, PRIORITY_NORM
	call .InitSpritesByPriority
	ld c, PRIORITY_LOW
	jp .InitSpritesByPriority

.DeterminePriorities:
	xor a
	ld hl, wMovementPointer
	ld bc, NUM_OBJECT_STRUCTS
	call ByteFill
	ld d, 0
	ld bc, ObjectStructs
	ld hl, wMovementPointer
.loop
	push hl
	call DoesObjectHaveASprite
	jr z, .skip
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld a, [hl]
	cp STANDING
	jr z, .skip
; Define the sprite priority.
	ld e, PRIORITY_LOW
	ld hl, OBJECT_FLAGS2
	add hl, bc
	bit 0, [hl]
	jr nz, .add
	ld e, PRIORITY_NORM
	bit 1, [hl]
	jr z, .add
	ld e, PRIORITY_HIGH
	jr .add

.skip
	ld hl, OBJECT_STRUCT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	pop hl
	jr .next

.add
	ld hl, OBJECT_STRUCT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	pop hl
	ld a, d
	or e
	ld [hli], a
.next
	inc d
	ld a, d
	cp NUM_OBJECT_STRUCTS
	jr nz, .loop
	ret

.InitSpritesByPriority:
	ld hl, wMovementPointer
.next_sprite
	ld a, [hli]
	ld d, a
	and $f0
	ret z
	cp c
	jr nz, .next_sprite
	push bc
	push hl
	ld a, d
	and $f
	call .GetObjectStructPointer
	call .InitSprite
	pop hl
	pop bc
	jr .next_sprite

.InitSprite:
	ld hl, OBJECT_SPRITE_TILE
	add hl, bc
	ld a, [hl]
	and %01111111
	ld [hFFC1], a
	xor a
	bit 7, [hl]
	jr nz, .skip1
	or %00001000
.skip1
	ld hl, OBJECT_FLAGS2
	add hl, bc
	ld e, [hl]
	bit 7, e
	jr z, .skip2
	or %10000000
.skip2
	bit 4, e
	jr z, .skip3
	or %00010000
.skip3
	ld hl, OBJECT_PALETTE
	add hl, bc
	ld d, a
	ld a, [hl]
	and %00000111
	or d
	ld d, a
	xor a
	bit 3, e
	jr z, .skip4
	or %10000000
.skip4
	ld [hFFC2], a
	ld hl, OBJECT_SPRITE_X
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_SPRITE_X_OFFSET
	add hl, bc
	add [hl]
	add 8
	ld e, a
	ld a, [wPlayerBGMapOffsetX]
	add e
	ld [hFFBF], a
	ld hl, OBJECT_SPRITE_Y
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	add [hl]
	add 12
	ld e, a
	ld a, [wPlayerBGMapOffsetY]
	add e
	ld [hFFC0], a
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld a, [hl]
	cp STANDING
	jp z, .done
	cp NUM_FACINGS
	jp nc, .done
	ld l, a
	ld h, 0
	add hl, hl
	ld bc, Facings
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hUsedSpriteIndex]
	ld c, a
	ld b, Sprites / $100
	ld a, [hli]
	ld [hUsedSpriteTile], a
	add c
	cp SpritesEnd % $100
	jr nc, .full
.addsprite
	ld a, [hFFC0]
	add [hl]
	inc hl
	ld [bc], a
	inc c
	ld a, [hFFBF]
	add [hl]
	inc hl
	ld [bc], a
	inc c
	ld e, [hl]
	inc hl
	ld a, [hFFC1]
	bit 2, e
	jr z, .nope1
	xor a
.nope1
	add [hl]
	inc hl
	ld [bc], a
	inc c
	ld a, e
	bit 1, a
	jr z, .nope2
	ld a, [hFFC2]
	or e
.nope2
	and %11110000
	or d
	ld [bc], a
	inc c
	ld a, [hUsedSpriteTile]
	dec a
	ld [hUsedSpriteTile], a
	jr nz, .addsprite
	ld a, c
	ld [hUsedSpriteIndex], a
.done
	xor a
	ret

.full
	scf
	ret

.GetObjectStructPointer:
	ld c, a
	ld b, 0
	ld hl, .Addresses
	add hl, bc
	add hl, bc
	ld c, [hl]
	inc hl
	ld b, [hl]
	ret

.Addresses: ; 5ace
	dw PlayerStruct
	dw Object1Struct
	dw Object2Struct
	dw Object3Struct
	dw Object4Struct
	dw Object5Struct
	dw Object6Struct
	dw Object7Struct
	dw Object8Struct
	dw Object9Struct
	dw Object10Struct
	dw Object11Struct
	dw Object12Struct
; 5ae8
