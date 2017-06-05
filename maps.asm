INCLUDE "includes.asm"


SECTION "Map Headers", ROMX, BANK[MAP_HEADERS]

INCLUDE "maps/map_headers.asm"
INCLUDE "maps/second_map_headers.asm"



SECTION "Map Blockdata 1", ROMX, BANK[MAPS_1]

INCLUDE "maps/blockdata_1.asm"


SECTION "Map Blockdata 2", ROMX, BANK[MAPS_2]

INCLUDE "maps/blockdata_2.asm"


SECTION "Map Blockdata 3", ROMX, BANK[MAPS_3]

INCLUDE "maps/blockdata_3.asm"



SECTION "Map Scripts 1", ROMX, BANK[MAP_SCRIPTS_1]

INCLUDE "maps/GoldenrodGameCorner.asm"
INCLUDE "maps/Route54.asm"
INCLUDE "maps/MandarinNorth.asm"
INCLUDE "maps/CrystalCave1F.asm"
INCLUDE "maps/SunburstPokeCenter.asm"
INCLUDE "maps/CrystalCaveB1.asm"
INCLUDE "maps/SunburstSmallHouse.asm"
INCLUDE "maps/SunburstLargeHouse.asm"
INCLUDE "maps/SunburstSouthHouse.asm"
INCLUDE "maps/SunburstCrystalShop.asm"

SECTION "Map Scripts 2", ROMX, BANK[MAP_SCRIPTS_2]

INCLUDE "maps/SunburstIsland.asm"


SECTION "Map Scripts 3", ROMX, BANK[MAP_SCRIPTS_3]

INCLUDE "maps/NationalPark.asm"
INCLUDE "maps/NationalParkBugContest.asm"


SECTION "Map Scripts 4", ROMX, BANK[MAP_SCRIPTS_4]

INCLUDE "maps/GoldenrodPokeCenter1F.asm"
INCLUDE "maps/GoldenrodPokeComCenter2FMobile.asm"
INCLUDE "maps/Route34IlexForestGate.asm"
INCLUDE "maps/DayCare.asm"


SECTION "Map Scripts 5", ROMX, BANK[MAP_SCRIPTS_5]

INCLUDE "maps/Route11.asm"
INCLUDE "maps/VioletMart.asm"
INCLUDE "maps/VioletGym.asm"
INCLUDE "maps/VioletNicknameSpeechHouse.asm"
INCLUDE "maps/VioletPokeCenter1F.asm"
INCLUDE "maps/VioletOnixTradeHouse.asm"
INCLUDE "maps/Route32RuinsofAlphGate.asm"
INCLUDE "maps/Route32PokeCenter1F.asm"
INCLUDE "maps/Route35Goldenrodgate.asm"
INCLUDE "maps/Route35NationalParkgate.asm"
INCLUDE "maps/Route36RuinsofAlphgate.asm"
INCLUDE "maps/Route36NationalParkgate.asm"


SECTION "Map Scripts 6", ROMX, BANK[MAP_SCRIPTS_6]

INCLUDE "maps/IlexForest.asm"
INCLUDE "maps/Route55.asm"
INCLUDE "maps/Route55QuestHouse.asm"
INCLUDE "maps/Route56PokeCenter.asm"

SECTION "Map Scripts 7", ROMX, BANK[MAP_SCRIPTS_7]

SECTION "Map Scripts 8", ROMX, BANK[MAP_SCRIPTS_8]

INCLUDE "maps/ValenciaPort.asm"
INCLUDE "maps/TangeloPort.asm"
INCLUDE "maps/OlivinePortPassage.asm"
INCLUDE "maps/VermilionPortPassage.asm"


SECTION "Map Scripts 9", ROMX, BANK[MAP_SCRIPTS_9]

INCLUDE "maps/ElmsLab.asm"
INCLUDE "maps/KrissHouse1F.asm"
INCLUDE "maps/KrissHouse2F.asm"
INCLUDE "maps/KrissNeighborsHouse.asm"
INCLUDE "maps/ElmsHouse.asm"


SECTION "Map Scripts 10", ROMX, BANK[MAP_SCRIPTS_10]

INCLUDE "maps/WarehouseEntrance.asm"
INCLUDE "maps/UndergroundPathSwitchRoomEntrances.asm"
INCLUDE "maps/IcePath1F.asm"
INCLUDE "maps/IcePathB1F.asm"
INCLUDE "maps/IcePathB2FMahoganySide.asm"
INCLUDE "maps/IcePathB2FBlackthornSide.asm"
INCLUDE "maps/IcePathB3F.asm"


SECTION "Map Scripts 11", ROMX, BANK[MAP_SCRIPTS_11]


SECTION "Map Scripts 12", ROMX, BANK[MAP_SCRIPTS_12]


SECTION "Map Scripts 13", ROMX, BANK[MAP_SCRIPTS_13]

INCLUDE "maps/HallOfFame.asm"


SECTION "Map Scripts 14", ROMX, BANK[MAP_SCRIPTS_14]


SECTION "Map Scripts 15", ROMX, BANK[MAP_SCRIPTS_15]


SECTION "Map Scripts 16", ROMX, BANK[MAP_SCRIPTS_16]


SECTION "Map Scripts 17", ROMX, BANK[MAP_SCRIPTS_17]

INCLUDE "maps/Route32.asm"
INCLUDE "maps/PokeCenter2F.asm"
INCLUDE "maps/TradeCenter.asm"
INCLUDE "maps/Colosseum.asm"
INCLUDE "maps/TimeCapsule.asm"
INCLUDE "maps/MobileTradeRoomMobile.asm"
INCLUDE "maps/MobileBattleRoom.asm"


SECTION "Map Scripts 18", ROMX, BANK[MAP_SCRIPTS_18]

INCLUDE "maps/CherrygroveMart.asm"
INCLUDE "maps/CherrygrovePokeCenter1F.asm"
INCLUDE "maps/CherrygroveGymSpeechHouse.asm"
INCLUDE "maps/CherrygroveEvolutionSpeechHouse.asm"
INCLUDE "maps/Route31VioletGate.asm"


SECTION "Map Scripts 19", ROMX, BANK[MAP_SCRIPTS_19]

INCLUDE "maps/RedsHouse1F.asm"
INCLUDE "maps/RedsHouse2F.asm"
INCLUDE "maps/BluesHouse.asm"
INCLUDE "maps/OaksLab.asm"


SECTION "Map Scripts 20", ROMX, BANK[MAP_SCRIPTS_20]

INCLUDE "maps/CherrygroveCity.asm"
INCLUDE "maps/MandarinNorthPokeCenter.asm"
INCLUDE "maps/MandarinNorthNameRater.asm"
INCLUDE "maps/MandarinNorthSmallHouse.asm"
INCLUDE "maps/MandarinNorthLargeHouse.asm"
INCLUDE "maps/MandarinUnderground.asm"
INCLUDE "maps/MandarinNorthMart.asm"


SECTION "Map Scripts 21", ROMX, BANK[MAP_SCRIPTS_21]

INCLUDE "maps/Route29.asm"
INCLUDE "maps/Route30.asm"


SECTION "Map Scripts 22", ROMX, BANK[MAP_SCRIPTS_22]

INCLUDE "maps/Route31.asm"
INCLUDE "maps/PinkanIsland.asm"
INCLUDE "maps/Route56West.asm"
INCLUDE "maps/Route56East.asm"
INCLUDE "maps/KinnowIsland.asm"

SECTION "Map Scripts 23", ROMX, BANK[MAP_SCRIPTS_23]

INCLUDE "maps/NewBarkTown.asm"
INCLUDE "maps/VioletCity.asm"
INCLUDE "maps/CinnabarPokeCenter1F.asm"
INCLUDE "maps/CinnabarPokeCenter2FBeta.asm"


SECTION "Map Scripts 24", ROMX, BANK[MAP_SCRIPTS_24]

INCLUDE "maps/Route33.asm"

SECTION "Map Scripts 25", ROMX, BANK[MAP_SCRIPTS_25]