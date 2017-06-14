InitCrystalData: ; 48000
	xor a
	ld [PlayerGender], a
	ld [wd002], a
	ld [wd003], a
	ret
; 4802f

InitGender: ; 48dcb (12:4dcb)
	call InitGenderScreen
	call LoadGenderScreenPal
	call LoadGenderScreenLightBlueTile
	call WaitBGMap2
	call SetPalettes
	ld hl, TextJump_AreYouABoyOrAreYouAGirl
	call PrintText
	ld hl, .MenuDataHeader
	call LoadMenuDataHeader
	call WaitBGMap2
	call VerticalMenu
	call CloseWindow
	ld a, [wMenuCursorY]
	dec a
	ld [PlayerGender], a
	ld c, 10
	jp DelayFrames
; 48dfc (12:4dfc)

.MenuDataHeader: ; 0x48dfc
	db $40 ; flags
	db 04, 06 ; start coords
	db 09, 12 ; end coords
	dw .MenuData2
	db 1 ; default option
; 0x48e04

.MenuData2: ; 0x48e04
	db $a1 ; flags
	db 2 ; items
	db "Boy@"
	db "Girl@"
; 0x48e0f

TextJump_AreYouABoyOrAreYouAGirl: ; 0x48e0f
	; Are you a boy? Or are you a girl?
	text_jump Text_AreYouABoyOrAreYouAGirl
	db "@"
; 0x48e14

InitGenderScreen: ; 48e14 (12:4e14)
	ld a, $10
	ld [MusicFade], a
	ld a, MUSIC_NONE
	ld [MusicFadeIDLo], a
	ld a, $0
	ld [MusicFadeIDHi], a
	ld c, 8
	call DelayFrames
	call ClearBGPalettes
	call InitCrystalData
	call LoadFontsExtra
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, $0
	call ByteFill
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	xor a
	jp ByteFill

LoadGenderScreenPal: ; 48e47 (12:4e47)
	ld hl, .Palette
	ld de, UnknBGPals
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	farcall ApplyPals
	ret
; 48e5c (12:4e5c)

.Palette: ; 48e5c
	RGB 31, 31, 31
	RGB 31, 16, 08
	RGB 20, 08, 04
	RGB 00, 00, 00
; 48e64

LoadGenderScreenLightBlueTile: ; 48e64 (12:4e64)
	ld de, .LightBlueTile
	ld hl, VTiles2 tile $00
	lb bc, BANK(.LightBlueTile), 1
	jp Get2bpp
; 48e71 (12:4e71)

.LightBlueTile: ; 48e71
INCBIN "gfx/intro/gender_screen.2bpp"
