PrintMonTypes: ; 5090d
; Print one or both types of [CurSpecies]
; on the stats screen at hl.

	push hl
	call GetBaseData
	pop hl

	push hl
	ld a, [BaseType1]
	call .Print

	; Single-typed monsters really
	; have two of the same type.
	ld a, [BaseType1]
	ld b, a
	ld a, [BaseType2]
	cp b
	pop hl
	ret z

	ld bc, SCREEN_WIDTH
	add hl, bc

.Print:
	ld b, a
	jr PrintType
; 5093a


PrintMoveType: ; 5093a
; Print the type of move b at hl.

	push hl
	ld a, b
	dec a
	ld bc, MOVE_LENGTH
	ld hl, Moves
	call AddNTimes
	ld de, StringBuffer1
	ld a, BANK(Moves)
	call FarCopyBytes
	ld a, [StringBuffer1 + MOVE_TYPE]
	pop hl

if DEF(PSS)
	and TYPE_MASK
endc
	ld b, a
	; fallthrough


PrintType: ; 50953
; Print type b at hl.

	ld a, b

	push hl
	add a
	ld hl, TypeNames
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl

	jp PlaceString
; 50964


GetTypeName: ; 50964
; Copy the name of type [wd265] to StringBuffer1.

	ld a, [wd265]
	ld hl, TypeNames
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, StringBuffer1
	ld bc, 13
	jp CopyBytes
; 5097b


TypeNames: ; 5097b
	dw Normal
	dw Fighting
	dw Flying
	dw Poison
	dw Ground
	dw Rock
	dw Bug
	dw Dark
	dw Steel
	dw Crystal
	dw Fire
	dw Water
	dw Grass
	dw Electric
	dw Psychic
	dw Ice
	dw Dragon
	dw Ghost
	dw Fairy

Normal:    db "NORMAL@"
Fighting:  db "FIGHTING@"
Flying:    db "FLYING@"
Poison:    db "POISON@"
Ground:    db "GROUND@"
Rock:      db "ROCK@"
Bug:       db "BUG@"
Dark:      db "DARK@"
Steel:     db "STEEL@"
Crystal:   db "CRYSTAL@"
Fire:      db "FIRE@"
Water:     db "WATER@"
Grass:     db "GRASS@"
Electric:  db "ELECTRIC@"
Psychic:   db "PSYCHIC@"
Ice:       db "ICE@"
Dragon:    db "DRAGON@"
Ghost:     db "GHOST@"
Fairy:     db "FAIRY@"

; 50a28
