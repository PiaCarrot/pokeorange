GROUP_N_A EQU -1
MAP_N_A EQU -1
GROUP_NONE EQU 0
MAP_NONE EQU 0

; map group ids
	const_def
	newgroup ; 1

	mapgroup SUNBURST_ISLAND, 24, 20
	mapgroup ROUTE_33, 9, 31
	mapgroup ROUTE54, 24, 11
	mapgroup MANDARINNORTH, 18, 18
	mapgroup MANDARIN_NORTH_POKECENTER, 4, 5
	mapgroup MANDARIN_NORTH_NAME_RATER, 4, 4
	mapgroup MANDARIN_NORTH_SMALL_HOUSE, 4, 4
	mapgroup MANDARIN_NORTH_LARGE_HOUSE, 4, 4
	mapgroup MANDARIN_UNDERGROUND, 12, 20
	mapgroup MANDARIN_NORTH_MART, 4, 6
	mapgroup SUNBURST_POKECENTER, 4, 5
	mapgroup SUNBURST_SMALL_HOUSE, 4, 4
	mapgroup SUNBURST_LARGE_HOUSE, 4, 4
	mapgroup SUNBURST_SOUTH_HOUSE, 4, 4
	mapgroup SUNBURST_CRYSTAL_SHOP, 4, 4

	newgroup ; 2

	mapgroup NATIONAL_PARK, 27, 20
	mapgroup NATIONAL_PARK_BUG_CONTEST, 27, 20
	mapgroup ILEX_FOREST, 27, 15
	mapgroup WAREHOUSE_ENTRANCE, 18, 15
	mapgroup UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES, 18, 15
	mapgroup ICE_PATH_1F, 18, 20
	mapgroup ICE_PATH_B1F, 18, 10
	mapgroup ICE_PATH_B2F_MAHOGANY_SIDE, 9, 10
	mapgroup ICE_PATH_B2F_BLACKTHORN_SIDE, 9, 5
	mapgroup ICE_PATH_B3F, 9, 10

	newgroup ; 3

	mapgroup CINNABAR_POKECENTER_1F, 4, 5

	newgroup ; 4

	mapgroup CRYSTAL_CAVE_1F, 16, 20
	mapgroup CRYSTAL_CAVE_B1, 16, 20
	mapgroup ROUTE_55, 25, 25
	mapgroup PINKAN_ISLAND, 17, 21
	mapgroup ROUTE_56_WEST, 17, 35
	mapgroup ROUTE_56_EAST, 17, 35
	mapgroup ROUTE_55_QUEST_HOUSE, 4, 4
	mapgroup ROUTE_56_POKE_CENTER, 4, 5
	mapgroup KINNOW_ISLAND, 18, 20

	newgroup ; 5

	mapgroup ROUTE_34_ILEX_FOREST_GATE, 4, 5
	mapgroup ROUTE_32, 45, 11
	mapgroup VIOLET_CITY, 18, 17
	mapgroup VIOLET_MART, 4, 6
	mapgroup VIOLET_GYM, 9, 5
	mapgroup VIOLET_NICKNAME_SPEECH_HOUSE, 4, 4
	mapgroup VIOLET_POKECENTER_1F, 4, 5
	mapgroup VIOLET_ONIX_TRADE_HOUSE, 4, 4
	mapgroup ROUTE_32_RUINS_OF_ALPH_GATE, 4, 5
	mapgroup ROUTE_32_POKECENTER_1F, 4, 5

	newgroup ; 6

	mapgroup DAYCARE, 4, 5

	newgroup ; 7

	mapgroup REDS_HOUSE_1F, 4, 4
	mapgroup REDS_HOUSE_2F, 4, 4
	mapgroup BLUES_HOUSE, 4, 4
	mapgroup OAKS_LAB, 6, 5

	newgroup ; 8

	mapgroup VALENCIA_PORT, 16, 10
	mapgroup TANGELO_PORT, 16, 10
	mapgroup OLIVINE_PORT_PASSAGE, 9, 11
	mapgroup VERMILION_PORT_PASSAGE, 9, 10

	newgroup ; 9

	mapgroup HALL_OF_FAME, 7, 5

	newgroup ; 10

	mapgroup POKECENTER_2F, 4, 8
	mapgroup TRADE_CENTER, 4, 5
	mapgroup COLOSSEUM, 4, 5
	mapgroup TIME_CAPSULE, 4, 5
	mapgroup MOBILE_TRADE_ROOM_MOBILE, 4, 5
	mapgroup MOBILE_BATTLE_ROOM, 4, 5

	newgroup ; 11

	mapgroup ROUTE_29, 11, 20
	mapgroup NEW_BARK_TOWN, 12, 14
	mapgroup ELMS_LAB, 6, 5
	mapgroup KRISS_HOUSE_1F, 4, 5
	mapgroup KRISS_HOUSE_2F, 3, 4
	mapgroup KRISS_NEIGHBORS_HOUSE, 4, 4
	mapgroup ELMS_HOUSE, 4, 4

	newgroup ; 12

	mapgroup ROUTE_30, 27, 10
	mapgroup ROUTE_31, 15, 20
	mapgroup ROUTE_31_VIOLET_GATE, 4, 5
	mapgroup CHERRYGROVE_CITY, 15, 20
	mapgroup CHERRYGROVE_MART, 4, 6
	mapgroup CHERRYGROVE_POKECENTER_1F, 4, 5
	mapgroup CHERRYGROVE_GYM_SPEECH_HOUSE, 4, 4
	mapgroup CHERRYGROVE_EVOLUTION_SPEECH_HOUSE, 4, 4


; elevator floors

	const_def
	const _B4F
	const _B3F
	const _B2F
	const _B1F
	const _1F
	const _2F
	const _3F
	const _4F
	const _5F
	const _6F
	const _7F
	const _8F
	const _9F
	const _10F
	const _11F
	const _ROOF

; connection directions
	const_def
	const EAST_F
	const WEST_F
	const SOUTH_F
	const NORTH_F

	const_def
	shift_const EAST
	shift_const WEST
	shift_const SOUTH
	shift_const NORTH

; permissions
const_value SET 1
	const TOWN
	const ROUTE
	const INDOOR
	const CAVE
	const PERM_5
	const GATE
	const DUNGEON

; object struct
	const_def
	const OBJECT_SPRITE ; 00
	const OBJECT_MAP_OBJECT_INDEX ; 01
	const OBJECT_SPRITE_TILE ; 02
	const OBJECT_MOVEMENTTYPE ; 03
	const OBJECT_FLAGS1 ; 04
	const OBJECT_FLAGS2 ; 05
	const OBJECT_PALETTE ; 06
	const OBJECT_DIRECTION_WALKING ; 07
	const OBJECT_FACING ; 08
	const OBJECT_STEP_TYPE ; 09
	const OBJECT_STEP_DURATION ; 0a
	const OBJECT_ACTION ; 0b
	const OBJECT_STEP_FRAME ; 0c
	const OBJECT_FACING_STEP ; 0d
	const OBJECT_NEXT_TILE ; 0e
	const OBJECT_STANDING_TILE ; 0f
	const OBJECT_NEXT_MAP_X ; 10
	const OBJECT_NEXT_MAP_Y ; 11
	const OBJECT_MAP_X ; 12
	const OBJECT_MAP_Y ; 13
	const OBJECT_INIT_X ; 14
	const OBJECT_INIT_Y ; 15
	const OBJECT_RADIUS ; 16
	const OBJECT_SPRITE_X ; 17
	const OBJECT_SPRITE_Y ; 18
	const OBJECT_SPRITE_X_OFFSET ; 19
	const OBJECT_SPRITE_Y_OFFSET ; 1a
	const OBJECT_MOVEMENT_BYTE_INDEX ; 1b
	const OBJECT_28 ; 1c
	const OBJECT_29 ; 1d
	const OBJECT_30 ; 1e
	const OBJECT_31 ; 1f
	const OBJECT_RANGE ; 20
; 33-39 are not used

; map object struct
	const_def
	const MAPOBJECT_OBJECT_STRUCT_ID ; 0
	const MAPOBJECT_SPRITE ; 1
	const MAPOBJECT_Y_COORD ; 2
	const MAPOBJECT_X_COORD ; 3
	const MAPOBJECT_MOVEMENT ; 4
	const MAPOBJECT_RADIUS ; 5
	const MAPOBJECT_HOUR ; 6
	const MAPOBJECT_TIMEOFDAY ; 7
	const MAPOBJECT_COLOR ; 8
	const MAPOBJECT_RANGE ; 9
	const MAPOBJECT_SCRIPT_POINTER ; a
	const MAPOBJECT_POINTER_HI ; b
	const MAPOBJECT_EVENT_FLAG ; c
	const MAPOBJECT_FLAG_HI ; d
	const MAPOBJECT_E ; unused
	const MAPOBJECT_F ; unused
OBJECT_LENGTH EQU const_value

MAPOBJECT_SCREEN_HEIGHT EQU 11
MAPOBJECT_SCREEN_WIDTH EQU 12

OW_DOWN EQU DOWN << 2
OW_UP EQU UP << 2
OW_LEFT EQU LEFT << 2
OW_RIGHT EQU RIGHT << 2

	const_def
	const EMOTE_SHOCK
	const EMOTE_QUESTION
	const EMOTE_HAPPY
	const EMOTE_SAD
	const EMOTE_HEART
	const EMOTE_BOLT
	const EMOTE_SLEEP
	const EMOTE_FISH
	const EMOTE_SHADOW
	const EMOTE_ROD
	const EMOTE_BOULDER_DUST
	const EMOTE_0B
EMOTE_MEM EQU -1

	const_def
	const SIGNPOST_READ
	const SIGNPOST_UP
	const SIGNPOST_DOWN
	const SIGNPOST_RIGHT
	const SIGNPOST_LEFT
	const SIGNPOST_IFSET
	const SIGNPOST_IFNOTSET
	const SIGNPOST_ITEM
	const SIGNPOST_COPY

; I'm relocating spawn constants here, so that they can be used anywhere in the disassembly.


const_value = -1
	const SPAWN_N_A

	const SPAWN_HOME
	const SPAWN_DEBUG

	const SPAWN_NEW_BARK
	const SPAWN_CHERRYGROVE
	const SPAWN_VIOLET
	const SPAWN_MANDARINNORTH
	const SPAWN_SUNBURST
NUM_SPAWNS EQU const_value

	const_def
	const PALETTE_AUTO
	const PALETTE_DAY
	const PALETTE_NITE
	const PALETTE_MORN
	const PALETTE_DARK

INVISIBLE EQU 0
FIXED_FACING EQU 2
SLIDING EQU 3
EMOTE_OBJECT EQU 7

	const_def
	const PERSONTYPE_SCRIPT
	const PERSONTYPE_ITEMBALL
	const PERSONTYPE_TRAINER
	const PERSONTYPE_3
	const PERSONTYPE_4
	const PERSONTYPE_5
	const PERSONTYPE_6

; fruit trees
const_value SET 1
	const FRUITTREE_ROUTE_29
	const FRUITTREE_ROUTE_30_1
	const FRUITTREE_ROUTE_30_2
	const FRUITTREE_ROUTE_33
	const FRUITTREE_ROUTE_31
	const FRUITTREE_VIOLET_CITY
	const FRUITTREE_PINKAN_ISLAND_1
	const FRUITTREE_PINKAN_ISLAND_2
	const FRUITTREE_PINKAN_ISLAND_3
	const FRUITTREE_PINKAN_ISLAND_4

NUM_FRUIT_TREES EQU const_value +- 1

CMDQUEUE_TYPE EQU 0
CMDQUEUE_ADDR EQU 1
CMDQUEUE_03 EQU 3
CMDQUEUE_04 EQU 4
CMDQUEUE_05 EQU 5
CMDQUEUE_ENTRY_SIZE EQU 6
CMDQUEUE_CAPACITY EQU 4

CMDQUEUE_STONETABLE EQU 2
