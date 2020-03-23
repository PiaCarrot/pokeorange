Predef:: ; 2d83
; Call predefined function a.
; Preserves bc, de, hl and f.

	ld [PredefID], a
	ld a, [hROMBank]
	push af

	ld a, BANK(GetPredefPointer)
	rst Bankswitch
	call GetPredefPointer ; stores hl in PredefTemp

; Switch to the new function's bank
	rst Bankswitch

; Instead of directly calling stuff,
; push it to the stack in reverse.

	ld hl, .Return
	push hl

; Call the Predef function
	ld hl, PredefAddress + 1
	ld a, [hld]
	ld h, [hl]
	ld l, a
	push hl

; Get hl back
	ld hl, PredefTemp + 1
	ld a, [hld]
	ld h, [hl]
	ld l, a
	ret

.Return:
; Clean up after the Predef call

	ld a, h
	ld [PredefTemp], a
	ld a, l
	ld [PredefTemp+1], a

	pop hl
	ld a, h
	rst Bankswitch

	ld hl, PredefTemp + 1
	ld a, [hld]
	ld h, [hl]
	ld l, a
	ret
; 2dba
