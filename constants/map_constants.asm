GROUP_N_A EQU -1
MAP_N_A EQU -1
GROUP_NONE EQU 0
MAP_NONE EQU 0

; map group ids
	const_def
	newgroup ; 1

	mapgroup SUNBURST_ISLAND, 24, 20
	mapgroup ROUTE_53, 9, 31
	mapgroup ROUTE_54, 24, 11
	mapgroup MANDARIN_NORTH, 18, 18
	mapgroup MANDARIN_NORTH_POKECENTER, 4, 5
	mapgroup MANDARIN_NORTH_NAME_RATER, 4, 4
	mapgroup MANDARIN_NORTH_SMALL_HOUSE, 4, 4
	mapgroup MANDARIN_NORTH_LARGE_HOUSE, 4, 4
	mapgroup MANDARIN_UNDERGROUND, 10, 16
	mapgroup MANDARIN_NORTH_MART, 4, 6
	mapgroup SUNBURST_POKECENTER, 4, 5
	mapgroup SUNBURST_SMALL_HOUSE, 4, 4
	mapgroup SUNBURST_LARGE_HOUSE, 4, 4
	mapgroup SUNBURST_SOUTH_HOUSE, 4, 4
	mapgroup SUNBURST_CRYSTAL_SHOP, 3, 4

	newgroup ; 2

	mapgroup TANGELO_JUNGLE, 27, 15
	mapgroup NATIONAL_PARK, 27, 20
	mapgroup NATIONAL_PARK_BUG_CONTEST, 27, 20

	newgroup ; 3
	
	mapgroup ROUTE_57, 16, 10
	mapgroup KINNOW_ISLAND_ROUTE_57_GATE, 4, 5
	mapgroup UNNAMED_ISLAND_1, 12, 12
	mapgroup UNNAMED_ISLAND_1_POKE_CENTER, 4, 5
	mapgroup ROUTE_58, 10, 18
	mapgroup NAVEL_ISLAND, 18, 18
	mapgroup MT_NAVEL_1F, 14, 14
	mapgroup MT_NAVEL_2F, 12, 12
	mapgroup MT_NAVEL_PEAK, 10, 10
	mapgroup MT_NAVEL_ICE_ROCK, 4, 4
	mapgroup SEVEN_GRAPEFRUITS, 22, 22

	newgroup ; 4

	mapgroup CRYSTAL_CAVE_1F, 14, 17
	mapgroup CRYSTAL_CAVE_B1, 14, 18
	mapgroup ROUTE_55, 25, 25
	mapgroup PINKAN_ISLAND, 17, 21
	mapgroup ROUTE_56_WEST, 17, 35
	mapgroup ROUTE_56_EAST, 17, 35
	mapgroup ROUTE_55_QUEST_HOUSE, 4, 4
	mapgroup ROUTE_56_POKE_CENTER, 4, 5
	mapgroup KINNOW_ISLAND, 18, 20
	mapgroup KINNOW_TRADE_HOUSE, 4, 4
	mapgroup KINNOW_LORE_HOUSE, 4, 4
	mapgroup KINNOW_CHARCOAL_HOUSE, 4, 4
	mapgroup KINNOW_POKE_CENTER, 4, 5
	mapgroup KINNOW_MART, 4, 6
	mapgroup KINNOW_CAFE, 5, 5
	mapgroup KINNOW_SKATE_SHOP, 4, 5

	newgroup ; 5

	mapgroup ROUTE_52_TANGELO_JUNGLE_GATE, 4, 5
	mapgroup ROUTE_52, 45, 11
	mapgroup MIKAN_ISLAND, 18, 17
	mapgroup MIKAN_MART, 4, 6
	mapgroup MIKAN_GYM, 9, 5
	mapgroup MIKAN_NICKNAME_SPEECH_HOUSE, 4, 4
	mapgroup MIKAN_POKECENTER_1F, 4, 5
	mapgroup MIKAN_ONIX_TRADE_HOUSE, 4, 4
	mapgroup MIKAN_ISLAND_ROUTE_53_GATE, 4, 5
	mapgroup ROUTE_52_POKECENTER_1F, 4, 5

	newgroup ; 6

	mapgroup DAYCARE, 4, 4

	newgroup ; 7

	mapgroup REDS_HOUSE_1F, 4, 4
	mapgroup REDS_HOUSE_2F, 4, 4
	mapgroup BLUES_HOUSE, 4, 4
	mapgroup OAKS_LAB, 6, 5

	newgroup ; 8

	mapgroup VALENCIA_PORT, 12, 12
	mapgroup TANGELO_PORT, 12, 12

	newgroup ; 9

	mapgroup HALL_OF_FAME, 7, 5

	newgroup ; 10

	mapgroup POKECENTER_2F, 4, 8
	mapgroup TRADE_CENTER, 4, 5
	mapgroup COLOSSEUM, 4, 5

	newgroup ; 11

	mapgroup ROUTE_49, 11, 20
	mapgroup VALENCIA_ISLAND, 12, 14
	mapgroup IVYS_LAB, 6, 5
	mapgroup KRISS_HOUSE_1F, 4, 5
	mapgroup KRISS_HOUSE_2F, 3, 4
	mapgroup KRISS_NEIGHBORS_HOUSE, 4, 4
	mapgroup IVYS_HOUSE, 4, 3

	newgroup ; 12

	mapgroup ROUTE_50, 27, 10
	mapgroup ROUTE_51, 15, 20
	mapgroup ROUTE_51_TANGELO_JUNGLE_GATE, 4, 5
	mapgroup TANGELO_ISLAND, 15, 20
	mapgroup TANGELO_MART, 4, 6
	mapgroup TANGELO_POKECENTER_1F, 4, 5
	mapgroup TANGELO_GYM_SPEECH_HOUSE, 4, 4
	mapgroup TANGELO_EVOLUTION_SPEECH_HOUSE, 4, 4


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

	const SPAWN_VALENCIA
	const SPAWN_TANGELO
	const SPAWN_MIKAN
	const SPAWN_MANDARIN_NORTH
	const SPAWN_SUNBURST
	const SPAWN_KINNOW
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
	const FRUITTREE_ROUTE_49
	const FRUITTREE_ROUTE_50_1
	const FRUITTREE_ROUTE_50_2
	const FRUITTREE_ROUTE_51
	const FRUITTREE_ROUTE_53
	const FRUITTREE_MIKAN_ISLAND
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
