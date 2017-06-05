

SpecialHoOhChamber: ; 0x8addb
	ld hl, PartySpecies
	ld a, [hl]
	cp HO_OH ; is Ho-oh the first Pokémon in the party?
	jr nz, .done ; if not, we're done
	call GetSecondaryMapHeaderPointer
	ld de, EVENT_WALL_OPENED_IN_HO_OH_CHAMBER
	ld b, SET_FLAG
	call EventFlagAction
.done
	ret
; 0x8adef

SpecialOmanyteChamber: ; 8adef

; 8ae30

SpecialAerodactylChamber: ; 8ae30

; 8ae4e

SpecialKabutoChamber: ; 8ae4e

; 8ae68

Special_DisplayUnownWords: ; 8ae68

; 8aebc

unownwall: MACRO
rept _NARG
if \1 == "-"
x = $64
else
if \1 >= "Y"
x = 2 * (\1 - "Y") + $60
else
if \1 >= "Q"
x = 2 * (\1 - "Q") + $40
else
if \1 >= "I"
x = 2 * (\1 - "I") + $20
else
x = 2 * (\1 - "A")
endc
endc
endc
endc
	db x
shift
endr
	db $ff
endm

.UnownText_Escape:
	; db      $08, $44, $04, $00, $2e, $08, $ff
	unownwall "E", "S", "C", "A", "P", "E"
.UnownText_Light:
	; db      $26, $20, $0c, $0e, $46, $ff
	unownwall "L", "I", "G", "H", "T"
.UnownText_Water:
	; db      $4c, $00, $46, $08, $42, $ff
	unownwall "W", "A", "T", "E", "R"
.UnownText_Ho_Oh:
	; db      $0e, $2c, $64, $2c, $0e, $ff
	unownwall "H", "O", "-", "O", "H"
; 8aed5

.MenuDataHeader_Escape: ; 0x8aed5
	db $40 ; flags
	db 04, 03 ; start coords
	db 09, 16 ; end coords

.MenuDataHeader_Light: ; 0x8aeda
	db $40 ; flags
	db 04, 04 ; start coords
	db 09, 15 ; end coords

.MenuDataHeader_Water: ; 0x8aedf
	db $40 ; flags
	db 04, 04 ; start coords
	db 09, 15 ; end coords

.MenuDataHeader_Ho_Oh: ; 0x8aee4
	db $40 ; flags
	db 04, 04 ; start coords
	db 09, 15 ; end coords
; 8aee9

.FillAttr: ; 8aee9
	ld a, [de]
	cp $ff
	ret z
	cp $60
	ld a, (1 << 3) | PAL_BG_BROWN
	jr c, .got_pal
	ld a, PAL_BG_BROWN

.got_pal
	call .PlaceSquare
	inc hl
	inc hl
	inc de
	jr .FillAttr
; 8aefd

.PlaceSquare: ; 8aefd
	push hl
	ld [hli], a
	ld [hld], a
	ld b, 0
	ld c, SCREEN_WIDTH
	add hl, bc
	ld [hli], a
	ld [hl], a
	pop hl
	ret
; 8af09

.CopyWord: ; 8af09
	push hl
	push de
.word_loop
	ld a, [de]
	cp $ff
	jr z, .word_done
	ld c, a
	call .ConvertChar
	inc hl
	inc hl
	inc de
	jr .word_loop

.word_done
	ret
; 8af1c

.ConvertChar: ; 8af1c
	ret

.Tile60:
	ret

.Tile62:
	ret

.Tile64:
	ret
; 8af6b
