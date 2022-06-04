map: MACRO
	db GROUP_\1, MAP_\1
ENDM

roam_map: MACRO
; A map and an arbitrary number of some more maps.

	map \1
	db  \2

	rept \2
	map \3
	shift
	endr

	db 0
ENDM

person_event: macro
	db \1 ; sprite
	db \2 + 4 ; y
	db \3 + 4 ; x
	db \4 ; movement function
	dn \5, \6 ; radius: y, x
	db \7 ; clock_hour
	db \8 ; clock_daytime
	shift
	dn \8, \9 ; color_function
	shift
	db \9 ; sight_range
	shift
	dw \9 ; pointer
	shift
	dw \9 ; event flag
	endm

signpost: macro
	db \1 ; y
	db \2 ; x
	db \3 ; function
	dw \4 ; pointer
	endm

xy_trigger: macro
	db \1 ; number
	db \2 ; y
	db \3 ; x
	dw \4 ; script
	endm

warp_def: macro
	db \1 ; y
	db \2 ; x
	db \3 ; warp_to
	map \4 ; map
	endm


map_header: MACRO
; label, tileset, permission, location, music, phone service flag, time of day, fishing group
\1_MapHeader:
	db BANK(\1_SecondMapHeader), \2, \3
	dw \1_SecondMapHeader
	db \4, \5
	dn \6, \7
	db \8
ENDM


map_header_2: MACRO
; label, map, border block, connections
CURRENT_MAP_WIDTH = \2_WIDTH
CURRENT_MAP_HEIGHT = \2_HEIGHT
\1_SecondMapHeader::
	db \3
	db CURRENT_MAP_HEIGHT, CURRENT_MAP_WIDTH
	db BANK(\1_BlockData)
	dw \1_BlockData
	db BANK(\1_MapScriptHeader)
	dw \1_MapScriptHeader
	dw \1_MapEventHeader
	db \4
ENDM

; Connections go in order: north, south, west, east
connection: MACRO
; direction, map name, map id, sideways offset
_src = 0
_tgt = (\4) + 3
if _tgt < 0
_src = -_tgt
_tgt = 0
endc

if !STRCMP("\1", "north")
_blk = \3_WIDTH * (\3_HEIGHT - 3) + _src
_map = _tgt
_win = (\3_WIDTH + 6) * \3_HEIGHT + 1
_y = \3_HEIGHT * 2 - 1
_x = (\4) * -2
_len = CURRENT_MAP_WIDTH + 3 - (\4)
if _len > \3_WIDTH
_len = \3_WIDTH
endc
endc

if !STRCMP("\1", "south")
_blk = _src
_map = (CURRENT_MAP_WIDTH + 6) * (CURRENT_MAP_HEIGHT + 3) + _tgt
_win = \3_WIDTH + 7
_y = 0
_x = (\4) * -2
_len = CURRENT_MAP_WIDTH + 3 - (\4)
if _len > \3_WIDTH
_len = \3_WIDTH
endc
endc

if !STRCMP("\1", "west")
_blk = (\3_WIDTH * _src) + \3_WIDTH - 3
_map = (CURRENT_MAP_WIDTH + 6) * _tgt
_win = (\3_WIDTH + 6) * 2 - 6
_y = (\4) * -2
_x = \3_WIDTH * 2 - 1
_len = CURRENT_MAP_HEIGHT + 3 - (\4)
if _len > \3_HEIGHT
_len = \3_HEIGHT
endc
endc

if !STRCMP("\1", "east")
_blk = (\3_WIDTH * _src)
_map = (CURRENT_MAP_WIDTH + 6) * _tgt + CURRENT_MAP_WIDTH + 3
_win = \3_WIDTH + 7
_y = (\4) * -2
_x = 0
_len = CURRENT_MAP_HEIGHT + 3 - (\4)
if _len > \3_HEIGHT
_len = \3_HEIGHT
endc
endc

	map \3
	dw \2_BlockData + _blk
	dw OverworldMap + _map
	db _len - _src
	db \3_WIDTH
	db _y, _x
	dw OverworldMap + _win
ENDM

mapgroup: MACRO
GROUP_\1 EQU const_value
	enum MAP_\1
\1_HEIGHT EQU \2
\1_WIDTH EQU \3
ENDM

newgroup: MACRO
const_value = const_value + 1
	enum_start 1
ENDM

elevfloor: MACRO
	db \1, \2
	map \3
ENDM

itemball: MACRO
if _NARG == 2
	db \1, \2
else
	db \1, 1
endc
endm

stonetable: MACRO
	db \1, \2
	dw \3
endm

maptrigger: MACRO
	dw \1
endm

endbridgetrigger: MACRO
	callasm .asm\@
	end
.asm\@
	ld a, \2
	ld [\1], a ; dotrigger a
	jp RefreshScreen_BridgeUpdate ; refreshscreen (optimized)
endm

changebridgeblock: MACRO
	; lb de, \1 + 4, \2 + 4
	; call GetBlockLocation
	ld hl, OverworldMap + (\2 / 2 + 3) * (\4_WIDTH + 6) + \1 / 2 + 3
	; hard-coding the above calculation for efficiency
	ld [hl], \3
ENDM

endbridgeblocks: MACRO
	jp BufferScreen
endm
