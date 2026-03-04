GetVariant: ; 51040
; Return MonVariant based on DVs at hl
	ld a, [CurPartySpecies]
	cp SQUIRTLE
	jr z, .GetSquirtleVariant
	cp WARTORTLE
	jr z, .GetSquirtleVariant
	cp BLASTOISE
	jr z, .GetSquirtleVariant
	cp SPINDA
	jr z, .GetSpindaVariant
	cp MAGIKARP
	jr z, .GetMagikarpVariant

; (Lycanroc, Meowth, Poliwrath)
; Get the form from party_struct TempMon or battle_struct
	push bc
	ld bc, TempMonDVs
	ld a, b
	cp h
	jr nz, .not_tempmon_form
	ld a, c
	cp l
	jr nz, .not_tempmon_form
	ld bc, (TempMonForm - TempMonDVs) - (BattleMonForm - BattleMonDVs)
	add hl, bc
.not_tempmon_form
	ld bc, BattleMonForm - BattleMonDVs
	add hl, bc
	pop bc
	ld a, [hl]
	and FORM_MASK ; 0, 1, 2, or 3
	jr nz, .ok_form
	ld a, 1 ; default
.ok_form
	ld [MonVariant], a
	ret

.GetSquirtleVariant:
; Get the item from party_struct TempMon or battle_struct
	push bc
	ld bc, TempMonDVs
	ld a, b
	cp h
	jr nz, .not_tempmon_squirtle
	ld a, c
	cp l
	jr nz, .not_tempmon_squirtle
	ld bc, (TempMonItem - TempMonDVs) - (BattleMonItem - BattleMonDVs)
	add hl, bc
.not_tempmon_squirtle
	ld bc, BattleMonItem - BattleMonDVs
	add hl, bc
	pop bc

; Sunglasses form
	ld a, SQUIRTLE_GLASSES_FORM
	ld [MonVariant], a
	ld a, [hl]
	cp BLACKGLASSES
	ret z

; Normal form
	ld a, SQUIRTLE_NORMAL_FORM
	ld [MonVariant], a
	ret

.GetMagikarpVariant:
	ld a, $ff / NUM_MAGIKARP + 1
	jr GetVariantFromMiddleDVBits

.GetSpindaVariant:
	ld a, $ff / NUM_SPINDA + 1
GetVariantFromMiddleDVBits:
	push af
; Take the middle 2 bits of each DV and place them in order:
;	atk  def  spd  spc
;	.ww..xx.  .yy..zz.

	; atk
	ld a, [hl]
	and %01100000
	sla a
	ld b, a
	; def
	ld a, [hli]
	and %00000110
	swap a
	srl a
	or b
	ld b, a

	; spd
	ld a, [hl]
	and %01100000
	swap a
	sla a
	or b
	ld b, a
	; spc
	ld a, [hl]
	and %00000110
	srl a
	or b

	; divide by routine argument (pushed a)
	ld [hDividend + 3], a
	xor a
	ld [hDividend], a
	ld [hDividend + 1], a
	ld [hDividend + 2], a
	pop af
	ld [hDivisor], a
	ld b, 4
	call Divide

	; increment
	ld a, [hQuotient + 2]
	inc a
	ld [MonVariant], a
	ret

GetFrontpic: ; 51077
	ld a, [CurPartySpecies]
	ld [CurSpecies], a
	call IsAPokemon
	ret c
	ld a, [rSVBK]
	push af
	call _GetFrontpic
	pop af
	ld [rSVBK], a
	ret

FrontpicPredef: ; 5108b
	ld a, [CurPartySpecies]
	ld [CurSpecies], a
	call IsAPokemon
	ret c
	ld a, [rSVBK]
	push af
	xor a
	ld [hBGMapMode], a
	call _GetFrontpic
	call GetAnimatedEnemyFrontpic
	pop af
	ld [rSVBK], a
	ret

_GetFrontpic: ; 510a5
	push de
	call GetBaseData
	ld a, [BasePicSize]

if DEF(BACKPICTEST)
	ld a, $66
endc

	and $f
	ld b, a
	push bc
	call GetFrontpicPointer
	ld a, $6
	ld [rSVBK], a
	ld a, b
	ld de, wDecompressScratch + $80 tiles
	call FarDecompress
	pop bc
	ld hl, wDecompressScratch
	ld de, wDecompressScratch + $80 tiles
	call PadFrontpic
	pop hl
	push hl
	ld de, wDecompressScratch
	ld c, 7 * 7
	ld a, [hROMBank]
	ld b, a
	call Get2bpp
	pop hl
	ret

GetFrontpicPointer: ; 510d7
	ld a, [CurPartySpecies]
	call GetRelevantPicPointers
	;TODO Squirtle line isn't handled here, but works nonetheless.
	ld a, [CurPartySpecies]
	cp RATTATA
	jp z, .dual_form
    cp RATICATE
    jp z, .dual_form
	cp ONIX
	jp z, .dual_form
	cp STEELIX
	jp z, .dual_form
	cp EXEGGUTOR
	jp z, .dual_form
	cp GRIMER
	jp z, .dual_form
	cp MUK
	jp z, .dual_form
	cp VULPIX
	jp z, .dual_form
	cp NINETALES
	jp z, .dual_form
	cp SANDSHREW
	jp z, .dual_form
	cp SANDSLASH
	jp z, .dual_form
    cp DIGLETT
    jp z, .dual_form
    cp DUGTRIO
    jp z, .dual_form
    cp GEODUDE
	jp z, .dual_form
	cp GRAVELER
	jp z, .dual_form
    cp GOLEM
	jp z, .dual_form
    cp MAROWAK
    jp z, .dual_form
    cp RAICHU
    jp z, .dual_form
	cp MEOWTH
	jp z, .dual_form
	cp PERSIAN
	jp z, .dual_form
	cp LYCANROC
	jp z, .dual_form
	cp POLIWRATH
	jp z, .dual_form
	cp ARBOK
	jp z, .dual_form
	cp VICTREEBEL
	jp z, .dual_form
	jp .skip
.dual_form
	xor a
	push bc
	ld a, [TempMonGender]
    and FORM_MASK
	ld b, 2
	cp b
	ld a, 2 ;second form
	pop bc
	jr z, .notvariant
	push bc
	ld a, [TempMonGender]
    and FORM_MASK
	ld b, 3
	cp b
	ld a, 3 ;third form
	pop bc
	jr z, .notvariant
	ld a, 1 ;base form
	jr .notvariant
.skip
	ld a, [CurPartySpecies]
	call GetRelevantPicPointers
	ld a, [CurPartySpecies]
	jr nc, .notvariant
	ld a, [MonVariant]
.notvariant
	dec a
	ld bc, 6
	call AddNTimes

if DEF(BACKPICTEST)
	ld bc, 3
	add hl, bc
endc

	ld a, d
	call GetFarByte
	push af
	inc hl
	ld a, d
	call GetFarHalfword
	pop bc
	ret

GetAnimatedEnemyFrontpic: ; 51103
	ld a, $1
	ld [rVBK], a
	push hl
	ld de, wDecompressScratch
	ld c, 7 * 7
	ld a, [hROMBank]
	ld b, a
	call Get2bpp
	pop hl
	ld de, 7 * 7 tiles
	add hl, de
	push hl
	ld a, $1
	ld hl, BasePicSize
	call GetFarWRAMByte
	pop hl
	and $f
	ld de, w6_d800 + 5 * 5 tiles
	ld c, 5 * 5
	cp 5
	jr z, .got_dims
	ld de, w6_d800 + 6 * 6 tiles
	ld c, 6 * 6
	cp 6
	jr z, .got_dims
	ld de, w6_d800 + 7 * 7 tiles
	ld c, 7 * 7
.got_dims

	push hl
	push bc
	call LoadFrontpicTiles
	pop bc
	pop hl
	ld de, wDecompressScratch
	ld a, [hROMBank]
	ld b, a
	call Get2bpp
	xor a
	ld [rVBK], a
	ret

LoadFrontpicTiles: ; 5114f
	ld hl, wDecompressScratch
	swap c
	ld a, c
	and $f
	ld b, a
	ld a, c
	and $f0
	ld c, a
	push bc
	call LoadFrontpic
	pop bc
.asm_51161
	push bc
	ld c, $0
	call LoadFrontpic
	pop bc
	dec b
	jr nz, .asm_51161
	ret

GetBackpic: ; 5116c
	ld a, [BattleMonSpecies]
	call IsAPokemon
	ret c
	ld a, [BattleMonSpecies]
	ld b, a
	ld a, [MonVariant]
	ld c, a ;store MonVariant in c before switching wram banks
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a
	push de
	ld a, b
	push bc
	call GetRelevantPicPointers
	pop bc
	ld a, [BattleMonSpecies]
	cp RATTATA
	jp z, .dual_form
    cp RATICATE
    jp z, .dual_form
	cp ONIX
	jp z, .dual_form
	cp STEELIX
	jp z, .dual_form
	cp EXEGGUTOR
	jp z, .dual_form
	cp GRIMER
	jp z, .dual_form
	cp MUK
	jp z, .dual_form
	cp VULPIX
	jp z, .dual_form
	cp NINETALES
	jp z, .dual_form
	cp SANDSHREW
	jp z, .dual_form
	cp SANDSLASH
	jp z, .dual_form
    cp DIGLETT
    jp z, .dual_form
    cp DUGTRIO
    jp z, .dual_form
    cp GEODUDE
	jp z, .dual_form
	cp GRAVELER
	jp z, .dual_form
    cp GOLEM
	jp z, .dual_form
    cp MAROWAK
    jp z, .dual_form
    cp RAICHU
    jp z, .dual_form
	cp MEOWTH
	jp z, .dual_form
	cp PERSIAN
	jp z, .dual_form
	cp LYCANROC
	jp z, .dual_form
	cp POLIWRATH
	jp z, .dual_form
	cp SQUIRTLE
	jp z, .squirtle_magikarp_spinda_form
	cp WARTORTLE
	jp z, .squirtle_magikarp_spinda_form
	cp BLASTOISE
	jp z, .squirtle_magikarp_spinda_form
	cp MAGIKARP
	jp z, .squirtle_magikarp_spinda_form
	cp SPINDA
	jp z, .squirtle_magikarp_spinda_form
	
	jp .skip
	
.squirtle_magikarp_spinda_form
	ld a, c ;restore MonVariant previously stored in c
	jr .notvariant

.dual_form
	xor a
	push bc
	ld a, [BattleMonGender]
    and FORM_MASK
	ld b, 2
	cp b
	ld a, 2 ;second form
	pop bc
	jr z, .notvariant
	push bc
	ld a, [BattleMonGender]
    and FORM_MASK
	ld b, 3
	cp b
	ld a, 3 ;third form
	pop bc
	jr z, .notvariant
	ld a, 1 ;base form
	jr .notvariant

.skip
	ld a, [BattleMonSpecies]
.notvariant
	dec a
	ld bc, 6
	call AddNTimes
	ld bc, 3
	add hl, bc
	ld a, d
	call GetFarByte
	push af
	inc hl
	ld a, d
	call GetFarHalfword
	ld de, wDecompressScratch
	pop af
	call FarDecompress
	ld hl, wDecompressScratch
	ld c, 6 * 6
	call FixBackpicAlignment
	pop hl
	ld de, wDecompressScratch
	ld a, [hROMBank]
	ld b, a
	call Get2bpp
	pop af
	ld [rSVBK], a
	ret

GetTrainerPic: ; 5120d
	ld a, [TrainerClass]
	and a
	ret z
	cp NUM_TRAINER_CLASSES
	ret nc
	call WaitBGMap
	xor a
	ld [hBGMapMode], a
	ld hl, TrainerPicPointers
	ld a, [TrainerClass]
	dec a
	ld bc, 3
	call AddNTimes
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a
	push de
	ld a, BANK(TrainerPicPointers)
	call GetFarByte
	push af
	inc hl
	ld a, BANK(TrainerPicPointers)
	call GetFarHalfword
	pop af
	ld de, wDecompressScratch
	call FarDecompress
	pop hl
	ld de, wDecompressScratch
	ld c, 7 * 7
	ld a, [hROMBank]
	ld b, a
	call Get2bpp
	pop af
	ld [rSVBK], a
	call WaitBGMap
	ld a, $1
	ld [hBGMapMode], a
	ret

DecompressPredef: ; 5125d
; Decompress lz data from b:hl to scratch space at 6:d000, then copy it to address de.

	ld a, [rSVBK]
	push af
	ld a, 6
	ld [rSVBK], a

	push de
	push bc
	ld a, b
	ld de, wDecompressScratch
	call FarDecompress
	pop bc
	ld de, wDecompressScratch
	pop hl
	ld a, [hROMBank]
	ld b, a
	call Get2bpp

	pop af
	ld [rSVBK], a
	ret

FixBackpicAlignment: ; 5127c
	push de
	push bc
	ld a, [wBoxAlignment]
	and a
	jr z, .keep_dims
	ld a, c
	cp 7 * 7
	ld de, 7 * 7 tiles
	jr z, .got_dims
	cp 6 * 6
	ld de, 6 * 6 tiles
	jr z, .got_dims
	ld de, 5 * 5 tiles

.got_dims
	ld a, [hl]
	lb bc, $0, $8
.loop
	rra
	rl b
	dec c
	jr nz, .loop
	ld a, b
	ld [hli], a
	dec de
	ld a, e
	or d
	jr nz, .got_dims

.keep_dims
	pop bc
	pop de
	ret

PadFrontpic: ; 512ab
	ld a, b
	cp 6
	jr z, .six
	cp 5
	jr z, .five

.seven_loop
	ld c, 7 tiles
	call LoadFrontpic
	dec b
	jr nz, .seven_loop
	ret

.six
	ld c, 7 tiles
	xor a
	call .Fill
.six_loop
	ld c, 1 tiles
	xor a
	call .Fill
	ld c, 6 tiles
	call LoadFrontpic
	dec b
	jr nz, .six_loop
	ret

.five
	ld c, 7 tiles
	xor a
	call .Fill
.five_loop
	ld c, 2 tiles
	xor a
	call .Fill
	ld c, 5 tiles
	call LoadFrontpic
	dec b
	jr nz, .five_loop
	ld c, 7 tiles
	xor a
	; fallthrough

.Fill:
	ld [hli], a
	dec c
	jr nz, .Fill
	ret

LoadFrontpic: ; 512f2
	ld a, [wBoxAlignment]
	and a
	jr nz, .x_flip
.left_loop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .left_loop
	ret

.x_flip
	push bc
.right_loop
	ld a, [de]
	inc de
	ld b, a
	xor a
	rept 8
	rr b
	rla
	endr
	ld [hli], a
	dec c
	jr nz, .right_loop
	pop bc
	ret

GetRelevantPicPointers:
; given species in a, return *PicPointers in hl and BANK(*PicPointers) in d
; returns c for variants, nc for normal species
	ld hl, .VariantPicPointerTable
	ld de, 4
	call IsInArray
	inc hl
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

.VariantPicPointerTable:
INCLUDE "gfx/pics/variant_pic_pointer_table.asm"
