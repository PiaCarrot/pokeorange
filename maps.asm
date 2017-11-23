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

INCLUDE "maps/PokeCenter2F.asm"
INCLUDE "maps/TradeCenter.asm"
INCLUDE "maps/Colosseum.asm"
INCLUDE "maps/ValenciaIsland.asm"
INCLUDE "maps/ValenciaPort.asm"
INCLUDE "maps/KrissHouse1F.asm"
INCLUDE "maps/KrissHouse2F.asm"
INCLUDE "maps/KrissNeighborsHouse.asm"
INCLUDE "maps/IvysHouse.asm"
INCLUDE "maps/IvysLab.asm"
INCLUDE "maps/Route49.asm"
INCLUDE "maps/ValenciaTangeloRoute49.asm"


SECTION "Map Scripts 2", ROMX, BANK[MAP_SCRIPTS_2]

INCLUDE "maps/TangeloPokeCenter1F.asm"
INCLUDE "maps/TangeloIsland.asm"
INCLUDE "maps/TangeloMart.asm"
INCLUDE "maps/TangeloPort.asm"
INCLUDE "maps/TangeloEvolutionSpeechHouse.asm"
INCLUDE "maps/TangeloGymSpeechHouse.asm"
INCLUDE "maps/TangeloJungle.asm"
INCLUDE "maps/Route50.asm"
INCLUDE "maps/Route51.asm"
INCLUDE "maps/Route52.asm"
INCLUDE "maps/Route51TangeloJungleGate.asm"
INCLUDE "maps/Route52TangeloJungleGate.asm"
INCLUDE "maps/Route51GateUpstairs.asm"


SECTION "Map Scripts 3", ROMX, BANK[MAP_SCRIPTS_3]

INCLUDE "maps/MikanPokeCenter1F.asm"
INCLUDE "maps/MikanIsland.asm"
INCLUDE "maps/MikanMart.asm"
INCLUDE "maps/MikanGym.asm"
INCLUDE "maps/MikanNicknameSpeechHouse.asm"
INCLUDE "maps/MikanOnixTradeHouse.asm"
INCLUDE "maps/MikanIslandRoute53Gate.asm"
INCLUDE "maps/Route53.asm"
INCLUDE "maps/Route54.asm"
INCLUDE "maps/Route53GateUpstairs.asm"


SECTION "Map Scripts 4", ROMX, BANK[MAP_SCRIPTS_4]

INCLUDE "maps/MandarinNorthPokeCenter.asm"
INCLUDE "maps/MandarinNorth.asm"
INCLUDE "maps/MandarinNorthMart.asm"
INCLUDE "maps/MandarinNorthNameRater.asm"
INCLUDE "maps/MandarinNorthLargeHouse.asm"
INCLUDE "maps/MandarinNorthSmallHouse.asm"
INCLUDE "maps/MandarinUnderground.asm"


SECTION "Map Scripts 5", ROMX, BANK[MAP_SCRIPTS_5]

INCLUDE "maps/SunburstPokeCenter.asm"
INCLUDE "maps/SunburstIsland.asm"
INCLUDE "maps/SunburstCrystalShop.asm"
INCLUDE "maps/SunburstLargeHouse.asm"
INCLUDE "maps/SunburstSmallHouse.asm"
INCLUDE "maps/SunburstSouthHouse.asm"
INCLUDE "maps/CrystalCave1F.asm"
INCLUDE "maps/CrystalCaveB1.asm"
INCLUDE "maps/Route55.asm"
INCLUDE "maps/Route55Underwater.asm"
INCLUDE "maps/Route55QuestHouse.asm"
INCLUDE "maps/PinkanIsland.asm"


SECTION "Map Scripts 6", ROMX, BANK[MAP_SCRIPTS_6]

INCLUDE "maps/Route56PokeCenter.asm"
INCLUDE "maps/Route56East.asm"
INCLUDE "maps/Route56West.asm"
INCLUDE "maps/KinnowIsland.asm"
INCLUDE "maps/KinnowTradeHouse.asm"
INCLUDE "maps/KinnowLoreHouse.asm"
INCLUDE "maps/KinnowCharcoalHouse.asm"
INCLUDE "maps/KinnowPokeCenter.asm"
INCLUDE "maps/KinnowMart.asm"
INCLUDE "maps/KinnowCafe.asm"
INCLUDE "maps/KinnowSkateShop.asm"


SECTION "Map Scripts 7", ROMX, BANK[MAP_SCRIPTS_7]

INCLUDE "maps/Route52PokeCenter1F.asm"
INCLUDE "maps/DayCare.asm"
INCLUDE "maps/HallOfFame.asm"
INCLUDE "maps/UnnamedIsland1PokeCenter.asm"
INCLUDE "maps/MtNavel1F.asm"
INCLUDE "maps/MtNavel2F.asm"
INCLUDE "maps/MtNavelPeak.asm"
INCLUDE "maps/MtNavelIceRock.asm"


SECTION "Map Scripts 8", ROMX, BANK[MAP_SCRIPTS_8]

INCLUDE "maps/NationalPark.asm"
INCLUDE "maps/NationalParkBugContest.asm"
INCLUDE "maps/OaksLab.asm"
INCLUDE "maps/RedsHouse1F.asm"
INCLUDE "maps/RedsHouse2F.asm"
INCLUDE "maps/BluesHouse.asm"


SECTION "Map Scripts 9", ROMX, BANK[MAP_SCRIPTS_9]

INCLUDE "maps/Route57.asm"
INCLUDE "maps/KinnowIslandRoute57Gate.asm"
INCLUDE "maps/Route57GateUpstairs.asm"
INCLUDE "maps/UnnamedIsland1.asm"
INCLUDE "maps/Route58.asm"
INCLUDE "maps/NavelIsland.asm"
INCLUDE "maps/SevenGrapefruits.asm"
INCLUDE "maps/SevenGrapefruitsUnderwater.asm"
INCLUDE "maps/Route59.asm"
INCLUDE "Maps/GrapefruitStore.asm"
INCLUDE "maps/MoroIsland.asm"
INCLUDE "maps/MoroIslandMuseum.asm"
INCLUDE "maps/MoroFishingHouse.asm"
INCLUDE "maps/MoroSouthHouse.asm"
INCLUDE "maps/MoroHouse1.asm"
INCLUDE "maps/MoroHouse2.asm"
INCLUDE "maps/MoroPokeCenter.asm"
INCLUDE "maps/MoroMart.asm"

SECTION "Map Scripts 10", ROMX, BANK[MAP_SCRIPTS_10]

INCLUDE "maps/MoroRoute60Gate.asm"
INCLUDE "maps/Route60GateUpstairs.asm"
INCLUDE "maps/Route60.asm"
INCLUDE "maps/Route61.asm"
INCLUDE "maps/WreckedShip.asm"
INCLUDE "maps/MurcottIsland.asm"
INCLUDE "maps/MurcottHouse1.asm"
INCLUDE "maps/MurcottHouse2.asm"
INCLUDE "maps/MurcottHouse3.asm"
INCLUDE "maps/MurcottPokeCenter.asm"
INCLUDE "maps/MurcottPokeMart.asm"
INCLUDE "maps/WreckedShipUnderwater.asm"
INCLUDE "maps/WreckedShipUnsunk.asm"
INCLUDE "maps/UnnamedIsland2.asm"
INCLUDE "maps/Route62.asm"
INCLUDE "maps/MandarinDesert.asm"
INCLUDE "maps/Trovitopolis.asm"
INCLUDE "maps/TrovitopolisSewer.asm"
INCLUDE "maps/TrovitaIsland.asm"

SECTION "Map Scripts 11", ROMX, BANK[MAP_SCRIPTS_11]
INCLUDE "maps/GoldenIsland.asm"
INCLUDE "maps/GoldenIslandHouse1.asm"
INCLUDE "maps/GoldenIslandHouse2.asm"
INCLUDE "maps/GoldenIslandHouse3.asm"
INCLUDE "maps/GoldenIslandElderHouse.asm"
INCLUDE "maps/GoldenIslandGateHouse.asm"
INCLUDE "maps/FishingContest.asm"
INCLUDE "maps/TrovitopolisDeptStore1F.asm"
INCLUDE "maps/TrovitopolisDeptStore2F.asm"
INCLUDE "maps/TrovitopolisDeptStore3F.asm"
INCLUDE "maps/TrovitopolisDeptStore4F.asm"
INCLUDE "maps/TrovitopolisDeptStore5F.asm"
INCLUDE "maps/TrovitopolisDeptStore6F.asm"
INCLUDE "maps/TrovitopolisDeptStoreElevator.asm"
INCLUDE "maps/TrovitopolisDeptStoreRoof.asm"
INCLUDE "maps/TrovitopolisPokeCommCenter.asm"
INCLUDE "maps/FishingContestLobby.asm"
INCLUDE "maps/TrovitopolisMrFlashHouse.asm"
INCLUDE "maps/TrovitopolisMoveDeleterHouse.asm"
INCLUDE "maps/TrovitopolisHouse1.asm"
INCLUDE "maps/TrovitopolisHouse2.asm"
INCLUDE "maps/TrovitopolisHouse3.asm"
INCLUDE "maps/TrovitopolisHouse4.asm"


SECTION "Map Scripts 12", ROMX, BANK[MAP_SCRIPTS_12]


SECTION "Map Scripts 13", ROMX, BANK[MAP_SCRIPTS_13]


SECTION "Map Scripts 14", ROMX, BANK[MAP_SCRIPTS_14]


SECTION "Map Scripts 15", ROMX, BANK[MAP_SCRIPTS_15]


SECTION "Map Scripts 16", ROMX, BANK[MAP_SCRIPTS_16]


SECTION "Map Scripts 17", ROMX, BANK[MAP_SCRIPTS_17]


SECTION "Map Scripts 18", ROMX, BANK[MAP_SCRIPTS_18]


SECTION "Map Scripts 19", ROMX, BANK[MAP_SCRIPTS_19]


SECTION "Map Scripts 20", ROMX, BANK[MAP_SCRIPTS_20]


SECTION "Map Scripts 21", ROMX, BANK[MAP_SCRIPTS_21]


SECTION "Map Scripts 22", ROMX, BANK[MAP_SCRIPTS_22]


SECTION "Map Scripts 23", ROMX, BANK[MAP_SCRIPTS_23]


SECTION "Map Scripts 24", ROMX, BANK[MAP_SCRIPTS_24]


SECTION "Map Scripts 25", ROMX, BANK[MAP_SCRIPTS_25]

INCLUDE "maps/PalletTown.asm"
INCLUDE "maps/VermilionCity.asm"
