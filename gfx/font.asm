Font:
INCBIN "gfx/font/font.2bpp"

FontBattleExtra:
INCBIN "gfx/font/battle_extra.2bpp"

Frames: ; f8800
INCBIN "gfx/frames/1.1bpp"
INCBIN "gfx/frames/2.1bpp"
INCBIN "gfx/frames/3.1bpp"
INCBIN "gfx/frames/4.1bpp"
INCBIN "gfx/frames/5.1bpp"
INCBIN "gfx/frames/6.1bpp"
INCBIN "gfx/frames/7.1bpp"
INCBIN "gfx/frames/8.1bpp"
INCBIN "gfx/frames/9.1bpp"
; f89b0

StatsScreenPageTilesGFX: ; f89b0
INCBIN "gfx/stats/stats.2bpp"
; f8a90

ShinyIcon: ; f8a90
; also part of StatsScreenPageTilesGFX
INCBIN "gfx/stats/shiny.2bpp"

; StatsScreenPageTilesGFX_Part2: ; f8aa0
; not referenced on its own, but part of StatsScreenPageTilesGFX
INCBIN "gfx/stats/exp_bar_ends.2bpp"
; f8ac0

EnemyHPBarBorderGFX: ; f8ac0
INCBIN "gfx/battle/enemy_hp_bar_border.1bpp"
; f8ae0

HPExpBarBorderGFX: ; f8ae0
INCBIN "gfx/battle/hp_exp_bar_border.1bpp"
; f8b10

ExpBarGFX: ; f8b10
INCBIN "gfx/battle/expbar.2bpp"
; f8ba0

TextBoxSpaceGFX: ; f9204
INCBIN "gfx/frames/space.2bpp"
; f9214

MapEntryFrameGFX: ; f9344
INCBIN "gfx/frames/map_entry_sign.2bpp"
; f9424

_LoadStandardFont:: ; fb449
    ld de, Font
    ld hl, VTiles1
    lb bc, BANK(Font), $70
    ld a, [rLCDC]
    bit 7, a
    jp z, Copy2bpp     ; Load font as 2bpp

    ld de, Font
    ld hl, VTiles1
    lb bc, BANK(Font), $70
    jp Get2bpp     ; Load font as 2bpp
; fb48a

_LoadFontsBattleExtra:: ; fb4be
	ld de, FontBattleExtra
	ld hl, VTiles2 tile $60
	lb bc, BANK(FontBattleExtra), $19
	call Get2bpp
LoadFrame:: ; fb4cc
	ld a, [TextBoxFrame]
	ld bc, TILES_PER_FRAME * LEN_1BPP_TILE
	ld hl, Frames
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, VTiles1 tile $7a
	lb bc, BANK(Frames), TILES_PER_FRAME
	call Get1bpp
	ld hl, VTiles2 tile $7f
	ld de, TextBoxSpaceGFX
	lb bc, BANK(TextBoxSpaceGFX), 1
	jp Get1bpp
; fb4f2

LoadBattleFontsHPBar: ; fb4f2
	ld de, FontBattleExtra
	ld hl, VTiles2 tile $60
	lb bc, BANK(FontBattleExtra), $c
	call Get2bpp
	ld hl, VTiles2 tile $70
	ld de, FontBattleExtra + $10 * LEN_2BPP_TILE
	lb bc, BANK(FontBattleExtra), 3
	call Get2bpp
	call LoadFrame

LoadHPBar: ; fb50d
	ld de, EnemyHPBarBorderGFX
	ld hl, VTiles2 tile $6c
	lb bc, BANK(EnemyHPBarBorderGFX), 4
	call Get1bpp
	ld de, HPExpBarBorderGFX
	ld hl, VTiles2 tile $73
	lb bc, BANK(HPExpBarBorderGFX), 6
	call Get1bpp
	ld de, ExpBarGFX
	ld hl, VTiles2 tile $55
	lb bc, BANK(ExpBarGFX), 9
	jp Get2bpp
; fb53e

StatsScreen_LoadFont: ; fb53e
	call _LoadFontsBattleExtra
	ld de, EnemyHPBarBorderGFX
	ld hl, VTiles2 tile $6c
	lb bc, BANK(EnemyHPBarBorderGFX), 4
	call Get1bpp
	ld de, HPExpBarBorderGFX
	ld hl, VTiles2 tile $78
	lb bc, BANK(HPExpBarBorderGFX), 1
	call Get1bpp
	ld de, HPExpBarBorderGFX + 3 * LEN_1BPP_TILE
	ld hl, VTiles2 tile $76
	lb bc, BANK(HPExpBarBorderGFX), 2
	call Get1bpp
	ld de, ExpBarGFX
	ld hl, VTiles2 tile $55
	lb bc, BANK(ExpBarGFX), 8
	call Get2bpp
LoadStatsScreenPageTilesGFX: ; fb571
	ld de, StatsScreenPageTilesGFX
	ld hl, VTiles2 tile $31
	lb bc, BANK(StatsScreenPageTilesGFX), $11
	jp Get2bpp
; fb57e
