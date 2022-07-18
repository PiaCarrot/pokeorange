
_AnimateTileset:: ; fc000
; Iterate over a given pointer array of
; animation functions (one per frame).

; Typically in wra1, vra0

	ld a, [TilesetAnim]
	ld e, a
	ld a, [TilesetAnim + 1]
	ld d, a

	ld a, [hTileAnimFrame]
	ld l, a
	inc a
	ld [hTileAnimFrame], a

	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de

; 2-byte parameter
; All functions take input de.
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl

; Function address
	ld a, [hli]
	ld h, [hl]
	ld l, a

	jp hl
; fc01b

Tileset00Anim: ; 0xfc01b
Tileset31Anim: ; 0xfc073
	dw VTiles2 tile $14, AnimateWaterTile
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateFlowerTile
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation
; 0xfc047

Tileset01Anim: ; 0xfc0a3
Tileset34Anim:
Tileset36Anim:
Tileset37Anim:
	dw VTiles2 tile $7e, WriteTileToBuffer
	dw RSEWaterFrames, AnimateRSEWaterTiles
	dw ShoreWaterFrames, AnimateShoreWaterTiles
	dw DiveWaterFrames, AnimateDiveWaterTiles
	dw RockTopsFrames, AnimateRockTopsTiles
	dw RockLeftFrames, AnimateRockLeftTiles
	dw RockBotLeftFrames, AnimateRockBotLeftTiles
	dw RockBotRightFrames, AnimateRockBotRightTiles
	dw RockRightFrames, AnimateRockRightTiles
	dw wTileAnimBuffer, ScrollTileDown
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateFlowerTile
	dw WhirlpoolFramesTop, AnimateWhirlpoolTiles
	dw WhirlpoolFramesBottom, AnimateWhirlpoolTiles
	dw wTileAnimBuffer, ScrollTileDown
	dw NULL,  WaitTileAnimation
	dw VTiles2 tile $7e, WriteTileFromBuffer
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation
; 0xfc0d7

Tileset02Anim:
	dw VTiles2 tile $7e, WriteTileToBuffer
	dw RSEWaterFrames, AnimateRSEWaterTiles
	dw DiveWaterFrames, AnimateDiveWaterTiles
	dw wTileAnimBuffer, ScrollTileDown
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateFlowerTile
	dw WhirlpoolFramesTop, AnimateWhirlpoolTiles
	dw WhirlpoolFramesBottom, AnimateWhirlpoolTiles
	dw wTileAnimBuffer, ScrollTileDown
	dw NULL,  WaitTileAnimation
	dw VTiles2 tile $7e, WriteTileFromBuffer
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation
; 0xfc0d7

Tileset03Anim: ; 0xfc01b
	dw RSEWaterFrames, AnimateRSEWaterTiles
	dw DiveWaterFrames, AnimateDiveWaterTiles
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateKantoFlowerTile
	dw WhirlpoolFramesTop, AnimateWhirlpoolTiles
	dw WhirlpoolFramesBottom, AnimateWhirlpoolTiles
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation
; 0xfc073

Tileset19Anim: ; 0xfc2e7
	dw RSEWaterFrames, AnimateRSEWaterTiles
	dw DiveWaterFrames, AnimateDiveWaterTiles
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation
	
Tileset09Anim: ; 0xfc12f
Tileset32Anim:
	dw VTiles2 tile $14, AnimateWaterTile
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation
; 0xfc15f

Tileset15Anim: ; 0xfc15f
	dw NULL,  SafariFountainAnim2
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  SafariFountainAnim1
	dw NULL,  WaitTileAnimation
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation
; 0xfc17f

Tileset24Anim: ; 0xfc1e7
	dw VTiles2 tile $14, WriteTileToBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw NULL,  FlickeringCaveEntrancePalette
	dw VTiles2 tile $14, WriteTileFromBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw NULL,  WaitTileAnimation
	dw NULL,  FlickeringCaveEntrancePalette
	dw VTiles2 tile $40, WriteTileToBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw wTileAnimBuffer, ScrollTileDown
	dw NULL,  FlickeringCaveEntrancePalette
	dw wTileAnimBuffer, ScrollTileDown
	dw NULL,  FlickeringCaveEntrancePalette
	dw wTileAnimBuffer, ScrollTileDown
	dw NULL,  FlickeringCaveEntrancePalette
	dw VTiles2 tile $40, WriteTileFromBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw VTiles2 tile $75, WriteTileToBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw NULL,  FlickeringCaveEntrancePalette
	dw VTiles2 tile $75, WriteTileFromBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw NULL,  WaitTileAnimation
	dw NULL,  FlickeringCaveEntrancePalette
	dw NULL,  DoneTileAnimation
; 0xfc233

Tileset29Anim: ; 0xfc233
	dw VTiles2 tile $35, WriteTileToBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw wTileAnimBuffer, ScrollTileRightLeft
	dw NULL,  FlickeringCaveEntrancePalette
	dw VTiles2 tile $35, WriteTileFromBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw NULL,  WaitTileAnimation
	dw NULL,  FlickeringCaveEntrancePalette
	dw VTiles2 tile $31, WriteTileToBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw wTileAnimBuffer, ScrollTileDown
	dw NULL,  FlickeringCaveEntrancePalette
	dw wTileAnimBuffer, ScrollTileDown
	dw NULL,  FlickeringCaveEntrancePalette
	dw wTileAnimBuffer, ScrollTileDown
	dw NULL,  FlickeringCaveEntrancePalette
	dw VTiles2 tile $31, WriteTileFromBuffer
	dw NULL,  FlickeringCaveEntrancePalette
	dw NULL,  DoneTileAnimation
; 0xfc27f

Tileset30Anim: ; 0xfc1e7
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateRSEBubbleTile
	dw NULL,  WaitTileAnimation
	dw NULL,  AnimateSeaweedTile1
	dw NULL,  AnimateSeaweedTile2
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  StandingTileFrame8
	dw NULL,  DoneTileAnimation

Tileset04Anim: ; 0xfc2e7
Tileset05Anim: ; 0xfc2e7
Tileset06Anim: ; 0xfc2e7
Tileset07Anim: ; 0xfc2e7
Tileset08Anim: ; 0xfc2e7
Tileset10Anim: ; 0xfc2e7
Tileset11Anim: ; 0xfc2e7
Tileset12Anim: ; 0xfc2e7
Tileset13Anim: ; 0xfc2e7
Tileset14Anim: ; 0xfc2e7
Tileset16Anim: ; 0xfc2e7
Tileset17Anim: ; 0xfc2e7
Tileset18Anim: ; 0xfc2e7
Tileset20Anim: ; 0xfc2e7
Tileset21Anim: ; 0xfc2e7
Tileset22Anim: ; 0xfc2e7
Tileset23Anim: ; 0xfc2bf
Tileset25Anim: ; 0xfc047
Tileset26Anim: ; 0xfc2e7
Tileset27Anim: ; 0xfc2e7
Tileset28Anim: ; 0xfc2e7
Tileset33Anim: ; 0xfc2e7
Tileset35Anim: ; 0xfc2e7
Tileset38Anim: ; 0xfc2e7
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  WaitTileAnimation
	dw NULL,  DoneTileAnimation
; 0xfc2fb

DoneTileAnimation: ; fc2fb
; Reset the animation command loop.
	xor a
	ld [hTileAnimFrame], a

WaitTileAnimation: ; fc2fe
; Do nothing this frame.
	ret ; no-optimize stub function
; fc2ff


StandingTileFrame8: ; fc2ff
	ld a, [TileAnimationTimer]
	inc a
	and 7
	ld [TileAnimationTimer], a
	ret
; fc309


ScrollTileRightLeft: ; fc309
; Scroll right for 4 ticks, then left for 4 ticks.
	ld a, [TileAnimationTimer]
	inc a
	and 7
	ld [TileAnimationTimer], a
	and 4
	jr z, ScrollTileRight
	; fallthrough
; fc318

ScrollTileLeft: ; fc327
	ld h, d
	ld l, e
	ld c, 4
.loop
	rept 4
	ld a, [hl]
	rlca
	ld [hli], a
	endr
	dec c
	jr nz, .loop
	ret
; fc33b

ScrollTileRight: ; fc33b
	ld h, d
	ld l, e
	ld c, 4
.loop
	rept 4
	ld a, [hl]
	rrca
	ld [hli], a
	endr
	dec c
	jr nz, .loop
	ret
; fc34f

;ScrollTileUpDown: ; fc318
;; Scroll up for 4 ticks, then down for 4 ticks.
;	ld a, [TileAnimationTimer]
;	inc a
;	and 7
;	ld [TileAnimationTimer], a
;	and 4
;	jr nz, ScrollTileDown
;	; fallthrough
;; fc327

ScrollTileUp: ; fc34f
	ld h, d
	ld l, e
	ld d, [hl]
	inc hl
	ld e, [hl]
	ld bc, $e
	add hl, bc
	ld a, 4
.loop
	ld c, [hl]
	ld [hl], e
	dec hl
	ld b, [hl]
	ld [hl], d
	dec hl
	ld e, [hl]
	ld [hl], c
	dec hl
	ld d, [hl]
	ld [hl], b
	dec hl
	dec a
	jr nz, .loop
	ret
; fc36a

ScrollTileDown: ; fc36a
	ld h, d
	ld l, e
	ld de, $e
	push hl
	add hl, de
	ld d, [hl]
	inc hl
	ld e, [hl]
	pop hl
	ld a, 4
.loop
	ld b, [hl]
	ld [hl], d
	inc hl
	ld c, [hl]
	ld [hl], e
	inc hl
	ld d, [hl]
	ld [hl], b
	inc hl
	ld e, [hl]
	ld [hl], c
	inc hl
	dec a
	jr nz, .loop
	ret
; fc387


AnimateFountain: ; fc387
	ld hl, sp+$0
	ld b, h
	ld c, l
	ld hl, .frames
	ld a, [TileAnimationTimer]
	and 7
	add a
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.frames
	dw .frame1
	dw .frame2
	dw .frame3
	dw .frame4
	dw .frame3
	dw .frame4
	dw .frame5
	dw .frame1

.frame1 INCBIN "gfx/tilesets/fountain/1.2bpp"
.frame2 INCBIN "gfx/tilesets/fountain/2.2bpp"
.frame3 INCBIN "gfx/tilesets/fountain/3.2bpp"
.frame4 INCBIN "gfx/tilesets/fountain/4.2bpp"
.frame5 INCBIN "gfx/tilesets/fountain/5.2bpp"
; fc402


AnimateWaterTile: ; fc402
; Draw a water tile for the current frame in VRAM tile at de.

; Save sp in bc (see WriteTile).
	ld hl, sp+$0
	ld b, h
	ld c, l

	ld a, [TileAnimationTimer]

; 4 tile graphics, updated every other frame.
	and 3 << 1

; 2 x 8 = 16 bytes per tile
	add a
	add a
	add a

	add WaterTileFrames % $100
	ld l, a
	adc WaterTileFrames / $100
	sub l
	ld h, a

; Stack now points to the start of the tile for this frame.
	ld sp, hl

	ld l, e
	ld h, d

	jp WriteTile
; fc41c

WaterTileFrames: ; fc41c
	INCBIN "gfx/tilesets/water/johto.2bpp"
; fc45c

AnimateRSEWaterTiles:
AnimateDiveWaterTiles:
AnimateShoreWaterTiles:
AnimateRockTopsTiles:
AnimateRockLeftTiles:
AnimateRockBotLeftTiles:
AnimateRockBotRightTiles:
AnimateRockRightTiles:
; Draw two RSE water tiles for the current frame in VRAM tile at de.
; based on AnimateWhirlpoolTiles, but with 8 frames

; Struct:
;     VRAM address
;    Address of the first tile

; Does two tiles at a time.

; Save sp in bc (see WriteTile).
    ld hl, sp+$0
    ld b, h
    ld c, l

; de = VRAM address
    ld l, e
    ld h, d
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
; Tile address is now at hl.

; Get the tile for this frame.
    ld a, [TileAnimationTimer]
    and %111 ; 8 frames x2
    swap a  ; * 16 bytes per tile
    sla a   ; * 2 tiles

    add [hl]
    inc hl
    ld h, [hl]
    ld l, a
    adc h
    sub l
    ld h, a

; Stack now points to the desired frame.
    ld sp, hl

    ld l, e
    ld h, d

    jp WriteTwoTiles

RSEWaterFrames: dw VTiles2 tile $14, RSEWaterTiles

RSEWaterTiles: INCBIN "gfx/tilesets/water/rse.2bpp"

DiveWaterFrames: dw VTiles2 tile $24, DiveWaterTiles

DiveWaterTiles: INCBIN "gfx/tilesets/water/dive.2bpp"

ShoreWaterFrames: dw VTiles2 tile $22, ShoreWaterTiles

ShoreWaterTiles: INCBIN "gfx/tilesets/water/shore.2bpp"

RockTopsFrames: dw VTiles2 tile $39, RockTopsTiles

RockTopsTiles: INCBIN "gfx/tilesets/water/rocktops.2bpp"

RockLeftFrames: dw VTiles2 tile $49, RockLeftTiles

RockLeftTiles: INCBIN "gfx/tilesets/water/rockleft.2bpp"

RockBotLeftFrames: dw VTiles2 tile $56, RockBotLeftTiles

RockBotLeftTiles: INCBIN "gfx/tilesets/water/rockbotleft.2bpp"

RockBotRightFrames: dw VTiles2 tile $66, RockBotRightTiles

RockBotRightTiles: INCBIN "gfx/tilesets/water/rockbotright.2bpp"

RockRightFrames: dw VTiles2 tile $68, RockRightTiles

RockRightTiles: INCBIN "gfx/tilesets/water/rockright.2bpp"

AnimateFlowerTile: ; fc56d
; No parameters.

; Save sp in bc (see WriteTile).
	ld hl, sp+$0
	ld b, h
	ld c, l

; Alternate tile graphic every other frame
	ld a, [TileAnimationTimer]
	and %10
	srl a
	swap a ; << 4 (16 bytes)
	ld e, a
	ld d, 0
	ld hl, FlowerTileFrames
	add hl, de
	ld sp, hl

	ld hl, VTiles2 tile $03

	jp WriteTile
; fc58c

FlowerTileFrames: ; fc58c
	INCBIN "gfx/tilesets/flower/1.2bpp"
	INCBIN "gfx/tilesets/flower/2.2bpp"
; fc5cc


AnimateKantoFlowerTile:
; No parameters.

; Save sp in bc (see WriteTile).
	ld hl, sp+$0
	ld b, h
	ld c, l

; Alternate tile graphic every other frame
	ld a, [TileAnimationTimer]
	and %10
	srl a
	swap a ; << 4 (16 bytes)
	ld e, a
	ld d, 0
	ld hl, KantoFlowerTileFrames
	add hl, de
	ld sp, hl

	ld hl, VTiles2 tile $62

	jp WriteTile

KantoFlowerTileFrames:
	INCBIN "gfx/tilesets/kanto-flower/1.2bpp"
	INCBIN "gfx/tilesets/kanto-flower/2.2bpp"


SafariFountainAnim1: ; fc5cc
; Splash in the bottom-right corner of the fountain.
	ld hl, sp+$0
	ld b, h
	ld c, l
	ld a, [TileAnimationTimer]
	and 6
	srl a
	inc a
	inc a
	and 3
	swap a
	ld e, a
	ld d, 0
	ld hl, SafariFountainFrames
	add hl, de
	ld sp, hl
	ld hl, VTiles2 tile $5b
	jp WriteTile
; fc5eb


SafariFountainAnim2: ; fc5eb
; Splash in the top-left corner of the fountain.
	ld hl, sp+$0
	ld b, h
	ld c, l
	ld a, [TileAnimationTimer]
	and 6
	add a
	add a
	add a
	ld e, a
	ld d, 0
	ld hl, SafariFountainFrames
	add hl, de
	ld sp, hl
	ld hl, VTiles2 tile $38
	jp WriteTile
; fc605


SafariFountainFrames: ; fc605
	INCBIN "gfx/tilesets/safari/1.2bpp"
	INCBIN "gfx/tilesets/safari/2.2bpp"
	INCBIN "gfx/tilesets/safari/3.2bpp"
	INCBIN "gfx/tilesets/safari/4.2bpp"
; fc645


AnimateSproutPillarTile: ; fc645
; Read from struct at de:
; 	Destination (VRAM)
;	Address of the first tile in the frame array

	ld hl, sp+$0
	ld b, h
	ld c, l

	ld a, [TileAnimationTimer]
	and 7

; Get frame index a
	ld hl, .frames
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [hl]

; Destination
	ld l, e
	ld h, d
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl

; Add the frame index to the starting address
	add [hl]
	inc hl
	ld h, [hl]
	ld l, a
	adc h
	sub l
	ld h, a

	ld sp, hl
	ld l, e
	ld h, d
	jp WriteTile

.frames
	db $00, $10, $20, $30, $40, $30, $20, $10
; fc673


StandingTileFrame: ; fc673
	ld hl, TileAnimationTimer
	inc [hl]
	ret
; fc678


AnimateWhirlpoolTiles: ; fc678
; Update both whirlpool tiles using struct at de.

; Struct:
; 	VRAM address
;	Address of the first tile

; Does two tiles at a time.

; Save sp in bc (see WriteTwoTiles).
	ld hl, sp+$0
	ld b, h
	ld c, l

; de = VRAM address
	ld l, e
	ld h, d
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
; Tile address is now at hl.

; Get the tile for this frame.
	ld a, [TileAnimationTimer]
	and %11 ; 4 frames x2
	swap a  ; * 16 bytes per tile
	sla a   ; * 2 tiles

	add [hl]
	inc hl
	ld h, [hl]
	ld l, a
	adc h
	sub l
	ld h, a

; Stack now points to the desired frame.
	ld sp, hl

	ld l, e
	ld h, d

	jp WriteTwoTiles
; fc696


AnimateSeaweedTile1:
; No parameters.

; Save sp in bc (see WriteTile).
	ld hl, sp+$0
	ld b, h
	ld c, l

; Alternate tile graphic every other frame
	ld a, [TileAnimationTimer]
	and %100
	srl a
	srl a
	swap a ; << 4 (16 bytes)
	ld e, a
	ld d, 0
	ld hl, SeaweedTile1Frames
	add hl, de
	ld sp, hl

	ld hl, VTiles2 tile $04

	jp WriteTile

SeaweedTile1Frames:
	INCBIN "gfx/tilesets/seaweed/1.2bpp"
	INCBIN "gfx/tilesets/seaweed/2.2bpp"


AnimateSeaweedTile2:
; No parameters.

; Save sp in bc (see WriteTile).
	ld hl, sp+$0
	ld b, h
	ld c, l

; Alternate tile graphic every other frame
	ld a, [TileAnimationTimer]
	and %100
	srl a
	srl a
	swap a ; << 4 (16 bytes)
	ld e, a
	ld d, 0
	ld hl, SeaweedTile2Frames
	add hl, de
	ld sp, hl

	ld hl, VTiles2 tile $14

	jp WriteTile

SeaweedTile2Frames:
	INCBIN "gfx/tilesets/seaweed/2.2bpp"
	INCBIN "gfx/tilesets/seaweed/1.2bpp"


AnimateRSEBubbleTile:
; No parameters.

; Save sp in bc (see WriteTile).
	ld hl, sp+$0
	ld b, h
	ld c, l

; Alternate tile graphic every frame
	ld a, [TileAnimationTimer]
	and %111
	swap a ; << 4 (16 bytes)
	ld e, a
	ld d, 0
	ld hl, RSEBubbleTileFrames
	add hl, de
	ld sp, hl

	ld hl, VTiles2 tile $03

	jp WriteTile

RSEBubbleTileFrames:
	INCBIN "gfx/tilesets/rse-bubble/1.2bpp"
	INCBIN "gfx/tilesets/rse-bubble/2.2bpp"
	INCBIN "gfx/tilesets/rse-bubble/3.2bpp"
	INCBIN "gfx/tilesets/rse-bubble/4.2bpp"
	INCBIN "gfx/tilesets/rse-bubble/5.2bpp"
	INCBIN "gfx/tilesets/rse-bubble/5.2bpp"
	INCBIN "gfx/tilesets/rse-bubble/5.2bpp"
	INCBIN "gfx/tilesets/rse-bubble/5.2bpp"


WriteTileFromBuffer: ; fc696
; Write tiledata at wTileAnimBuffer to de.
; wTileAnimBuffer is loaded to sp for WriteTile.

	ld hl, sp+$0
	ld b, h
	ld c, l

	ld hl, wTileAnimBuffer
	ld sp, hl

	ld h, d
	ld l, e
	jr WriteTile
; fc6a2


WriteTileToBuffer: ; fc6a2
; Write tiledata de to wTileAnimBuffer.
; de is loaded to sp for WriteTile.

	ld hl, sp+$0
	ld b, h
	ld c, l

	ld h, d
	ld l, e
	ld sp, hl

	ld hl, wTileAnimBuffer

	; fallthrough

WriteTile: ; fc6ac
; Write one 8x8 tile ($10 bytes) from sp to hl.

; Warning: sp is saved in bc so we can abuse pop.
; sp is restored to address bc. Save sp in bc before calling.

	pop de
	ld [hl], e
	inc hl
	ld [hl], d

_FinishWritingSecondTile:
rept 7
	pop de
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
endr

; restore sp
	ld h, b
	ld l, c
	ld sp, hl
	ret
; fc6d7


WriteTwoTiles:
; Write two 8x8 tile ($20 bytes) from sp to hl.

; Warning: sp is saved in bc so we can abuse pop.
; sp is restored to address bc. Save sp in bc before calling.

	pop de
	ld [hl], e
	inc hl
	ld [hl], d

rept 8
	pop de
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
endr
	jr _FinishWritingSecondTile


FlickeringCaveEntrancePalette: ; fc71e
; We don't want to mess with non-standard palettes.
	ld a, [rBGP]
	cp %11100100
	ret nz
; We only want to be here if we're in a dark cave.
	ld a, [wTimeOfDayPalset]
	cp $ff ; 3,3,3,3
	ret nz

	ld a, [rSVBK]
	push af
	ld a, 5 ; wra5: gfx
	ld [rSVBK], a
; Ready for BGPD input...
	ld a, %10100000 ; auto-increment, index $20 (pal 4 color 0)
	ld [rBGPI], a
	ld a, [hVBlankCounter]
	and %00000010
	jr nz, .bit1set
	ld hl, UnknBGPals + $20 ; pal 4 color 0
	jr .okay

.bit1set
	ld hl, UnknBGPals + $22 ; pal 4 color 2

.okay
	ld a, [hli]
	ld [rBGPD], a
	ld a, [hli]
	ld [rBGPD], a

	pop af
	ld [rSVBK], a
	ret
; fc750


SproutPillarTilePointer1:  dw VTiles2 tile $2d, SproutPillarTile1
SproutPillarTilePointer2:  dw VTiles2 tile $2f, SproutPillarTile2
SproutPillarTilePointer3:  dw VTiles2 tile $3d, SproutPillarTile3
SproutPillarTilePointer4:  dw VTiles2 tile $3f, SproutPillarTile4
SproutPillarTilePointer5:  dw VTiles2 tile $3c, SproutPillarTile5
SproutPillarTilePointer6:  dw VTiles2 tile $2c, SproutPillarTile6
SproutPillarTilePointer7:  dw VTiles2 tile $4d, SproutPillarTile7
SproutPillarTilePointer8:  dw VTiles2 tile $4f, SproutPillarTile8
SproutPillarTilePointer9:  dw VTiles2 tile $5d, SproutPillarTile9
SproutPillarTilePointer10: dw VTiles2 tile $5f, SproutPillarTile10

SproutPillarTile1:  INCBIN "gfx/tilesets/sprout-pillar/1.2bpp"
SproutPillarTile2:  INCBIN "gfx/tilesets/sprout-pillar/2.2bpp"
SproutPillarTile3:  INCBIN "gfx/tilesets/sprout-pillar/3.2bpp"
SproutPillarTile4:  INCBIN "gfx/tilesets/sprout-pillar/4.2bpp"
SproutPillarTile5:  INCBIN "gfx/tilesets/sprout-pillar/5.2bpp"
SproutPillarTile6:  INCBIN "gfx/tilesets/sprout-pillar/6.2bpp"
SproutPillarTile7:  INCBIN "gfx/tilesets/sprout-pillar/7.2bpp"
SproutPillarTile8:  INCBIN "gfx/tilesets/sprout-pillar/8.2bpp"
SproutPillarTile9:  INCBIN "gfx/tilesets/sprout-pillar/9.2bpp"
SproutPillarTile10: INCBIN "gfx/tilesets/sprout-pillar/10.2bpp"
; fca98


WhirlpoolFramesTop: dw VTiles2 tile $32, WhirlpoolTilesTop
WhirlpoolFramesBottom: dw VTiles2 tile $42, WhirlpoolTilesBottom
; fcaa8

WhirlpoolTilesTop: INCBIN "gfx/tilesets/whirlpool/top.2bpp"
WhirlpoolTilesBottom: INCBIN "gfx/tilesets/whirlpool/bottom.2bpp"
; fcba8
