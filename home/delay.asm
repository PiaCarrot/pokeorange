DelayFrame:: ; 45a
; Wait for one frame
	ld a, 1
	ld [wVBlankOccurred], a

; Wait for the next VBlank, halting to conserve battery
.halt
	halt ; rgbasm adds a nop after this instruction by default
	ld a, [wVBlankOccurred]
	and a
	jr nz, .halt
	ret
; 468

ApplyTilemap:: ; 321c
	ld a, [wSpriteUpdatesEnabled]
	and a
	jr z, WaitBGMap

	ld a, 1
	ld [hBGMapMode], a
	jp LoadEDTile

ClearBGPalettes:: ; 31f3
	call ClearPalettes

WaitBGMap:: ; 31f6
; WaitBGMap
	ld a, 1
	ld [hBGMapMode], a

Delay2::
	ld c, 3

DelayFrames:: ; 468
; Wait c frames
	call DelayFrame
	dec c
	jr nz, DelayFrames
	ret
; 46f
