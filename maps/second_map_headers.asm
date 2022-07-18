	map_header_2 ValenciaIsland, VALENCIA_ISLAND, 53, WEST
	connection west, Route49, ROUTE_49, -2

	map_header_2 Route49, ROUTE_49, 32, NORTH | EAST
	connection north, ValenciaTangeloRoute49, VALENCIA_TANGELO_ROUTE_49, -1
	connection east, ValenciaIsland, VALENCIA_ISLAND, 2

	map_header_2 ValenciaTangeloRoute49, VALENCIA_TANGELO_ROUTE_49, 53, NORTH | SOUTH | WEST
	connection north, Route51, ROUTE_51, 0
	connection south, Route49, ROUTE_49, 1
	connection west, TangeloIsland, TANGELO_ISLAND, -1

	map_header_2 TangeloIsland, TANGELO_ISLAND, 53, NORTH | EAST
	connection north, Route50, ROUTE_50, 9
	connection east, ValenciaTangeloRoute49, VALENCIA_TANGELO_ROUTE_49, 1

	map_header_2 Route50, ROUTE_50, 32, SOUTH | EAST
	connection south, TangeloIsland, TANGELO_ISLAND, -9
	connection east, Route51, ROUTE_51, 8

	map_header_2 Route51, ROUTE_51, 32, SOUTH | WEST
	connection south, ValenciaTangeloRoute49, VALENCIA_TANGELO_ROUTE_49, 0
	connection west, Route50, ROUTE_50, -8

	map_header_2 Route52, ROUTE_52, 53, NORTH
	connection north, MikanIsland, MIKAN_ISLAND, 0

	map_header_2 MikanIsland, MIKAN_ISLAND, 32, SOUTH
	connection south, Route52, ROUTE_52, 0

	map_header_2 Route53, ROUTE_53, 53, SOUTH | NORTH
	connection north, Route54, ROUTE_54, 20
	connection south, SunburstIsland, SUNBURST_ISLAND, 10

	map_header_2 Route54, ROUTE_54, 53, NORTH | SOUTH
	connection north, MandarinNorth, MANDARIN_NORTH, -4
	connection south, Route53, ROUTE_53, -20

	map_header_2 SunburstIsland, SUNBURST_ISLAND, 53, NORTH
	connection north, Route53, ROUTE_53, -10

	map_header_2 MandarinNorth, MANDARIN_NORTH, 32, SOUTH
	connection south, Route54, ROUTE_54, 4

	map_header_2 Route55, ROUTE_55, 53, EAST
	connection east, PinkanIsland, PINKAN_ISLAND, 10

	map_header_2 PinkanIsland, PINKAN_ISLAND, 53, WEST | EAST
	connection west, Route55, ROUTE_55, -10
	connection east, Route56West, ROUTE_56_WEST, 0

	map_header_2 Route56West, ROUTE_56_WEST, 53, WEST | EAST
	connection west, PinkanIsland, PINKAN_ISLAND, 0
	connection east, Route56East, ROUTE_56_EAST, 0

	map_header_2 Route56East, ROUTE_56_EAST, 53, WEST | NORTH
	connection north, KinnowIsland, KINNOW_ISLAND, 25
	connection west, Route56West, ROUTE_56_WEST, 0

	map_header_2 KinnowIsland, KINNOW_ISLAND, 53, SOUTH
	connection south, Route56East, ROUTE_56_EAST, -25

	map_header_2 Route57, ROUTE_57, 53, NORTH | EAST
	connection north, UnnamedIsland1, UNNAMED_ISLAND_1, 0
	connection east, SevenGrapefruits, SEVEN_GRAPEFRUITS, 0

	map_header_2 UnnamedIsland1, UNNAMED_ISLAND_1, 53, SOUTH | EAST | NORTH
	connection north, Route57North, ROUTE_57_NORTH, 0
	connection south, Route57, ROUTE_57, 0
	connection east, Route58, ROUTE_58, 2

	map_header_2 Route58, ROUTE_58, 53, WEST | EAST | SOUTH
	connection south, SevenGrapefruits, SEVEN_GRAPEFRUITS, 0
	connection west, UnnamedIsland1, UNNAMED_ISLAND_1, -2
	connection east, NavelIsland, NAVEL_ISLAND, -8

	map_header_2 NavelIsland, NAVEL_ISLAND, 53, WEST
	connection west, Route58, ROUTE_58, 8

	map_header_2 SevenGrapefruits, SEVEN_GRAPEFRUITS, 53, WEST | NORTH | SOUTH
	connection north, Route58, ROUTE_58, 0
	connection south, Route59, ROUTE_59, 5
	connection west, Route57, ROUTE_57, 0

	map_header_2 Route59, ROUTE_59, 53, NORTH | SOUTH
	connection north, SevenGrapefruits, SEVEN_GRAPEFRUITS, -5
	connection south, MoroIsland, MORO_ISLAND, -6

	map_header_2 MoroIsland, MORO_ISLAND, 53, NORTH
	connection north, Route59, ROUTE_59, 6

	map_header_2 Route61, ROUTE_61, 53, SOUTH | WEST | EAST
	connection south, UnnamedIsland2, UNNAMED_ISLAND_2, 7
	connection west, Route62, ROUTE_62, 8
	connection east, MurcottIsland, MURCOTT_ISLAND, 15

	map_header_2 Route62, ROUTE_62, 5, EAST
	connection east, Route61, ROUTE_61, -8

	map_header_2 MurcottIsland, MURCOTT_ISLAND, 5, WEST
	connection west, Route61, ROUTE_61, -15

	map_header_2 UnnamedIsland2, UNNAMED_ISLAND_2, 53, NORTH | EAST
	connection north, Route61, ROUTE_61, -7
	connection east, FishingContest, FISHING_CONTEST, 1

	map_header_2 FishingContest, FISHING_CONTEST, 53, WEST
	connection west, UnnamedIsland2, UNNAMED_ISLAND_2, -1

	map_header_2 Route57North, ROUTE_57_NORTH, 53, NORTH | SOUTH
	connection north, CleopatraIsland, CLEOPATRA_ISLAND, -3
	connection south, UnnamedIsland1, UNNAMED_ISLAND_1, 0

	map_header_2 CleopatraIsland, CLEOPATRA_ISLAND, 53, NORTH | SOUTH
	connection north, Route63EastWest, ROUTE_63_EAST_WEST, 0
	connection south, Route57North, ROUTE_57_NORTH, 3

	map_header_2 Route63EastWest, ROUTE_63_EAST_WEST, 53, SOUTH | EAST
	connection south, CleopatraIsland, CLEOPATRA_ISLAND, 0
	connection east, Route63NorthSouth, ROUTE_63_NORTH_SOUTH, -23

	map_header_2 Route63NorthSouth, ROUTE_63_NORTH_SOUTH, 53, WEST
	connection west, Route63EastWest, ROUTE_63_EAST_WEST, 23

	map_header_2 AscorbiaIsland, ASCORBIA_ISLAND, 32, WEST
	connection west, Route64, ROUTE_64, 0

	map_header_2 Route64, ROUTE_64, 53, WEST | EAST
	connection west, Route65, ROUTE_65, 0
	connection east, AscorbiaIsland, ASCORBIA_ISLAND, 0

	map_header_2 Route65, ROUTE_65, 53, WEST | EAST
	connection west, ButwalIslandEast, BUTWAL_ISLAND_EAST, -6
	connection east, Route64, ROUTE_64, 0

	map_header_2 ButwalIslandEast, BUTWAL_ISLAND_EAST, 53, WEST | EAST
	connection west, ButwalIslandWest, BUTWAL_ISLAND_WEST, 0
	connection east, Route65, ROUTE_65, 6

	map_header_2 ButwalIslandWest, BUTWAL_ISLAND_WEST, 32, WEST | EAST
	connection west, Route66EastWest, ROUTE_66_EAST_WEST, 10
	connection east, ButwalIslandEast, BUTWAL_ISLAND_EAST, 0

	map_header_2 Route66EastWest, ROUTE_66_EAST_WEST, 53, SOUTH | EAST
	connection south, Route66NorthSouth, ROUTE_66_NORTH_SOUTH, -3
	connection east, ButwalIslandWest, BUTWAL_ISLAND_WEST, -10

	map_header_2 Route66NorthSouth, ROUTE_66_NORTH_SOUTH, 53, NORTH | SOUTH
	connection north, Route66EastWest, ROUTE_66_EAST_WEST, 3
	connection south, KumquatIslandEast, KUMQUAT_ISLAND_EAST, -5

	map_header_2 KumquatIslandEast, KUMQUAT_ISLAND_EAST, 53, NORTH | WEST
	connection north, Route66NorthSouth, ROUTE_66_NORTH_SOUTH, 5
	connection west, KumquatIslandWest, KUMQUAT_ISLAND_WEST, 0

	map_header_2 KumquatIslandWest, KUMQUAT_ISLAND_WEST, 53, WEST | EAST
	connection west, Route67, ROUTE_67, 1
	connection east, KumquatIslandEast, KUMQUAT_ISLAND_EAST, 0

	map_header_2 Route67, ROUTE_67, 53, WEST | EAST
	connection west, RindIsland, RIND_ISLAND, -7
	connection east, KumquatIslandWest, KUMQUAT_ISLAND_WEST, -1

	map_header_2 RindIsland, RIND_ISLAND, 53, WEST | EAST
	connection west, Route68, ROUTE_68, 3
	connection east, Route67, ROUTE_67, 7

	map_header_2 Route68, ROUTE_68, 53, WEST | EAST
	connection west, UnnamedIsland3, UNNAMED_ISLAND_3, -11
	connection east, RindIsland, RIND_ISLAND, -3

	map_header_2 UnnamedIsland3, UNNAMED_ISLAND_3, 53, NORTH | EAST
	connection north, Route69South, ROUTE_69_SOUTH, 0
	connection east, Route68, ROUTE_68, 11

	map_header_2 Route69South, ROUTE_69_SOUTH, 53, SOUTH
	connection south, UnnamedIsland3, UNNAMED_ISLAND_3, 0

	map_header_2 Route69North, ROUTE_69_NORTH, 53, EAST
	connection east, PummeloIsland, PUMMELO_ISLAND, -14

	map_header_2 PummeloIsland, PUMMELO_ISLAND, 53, WEST | EAST
	connection west, Route69North, ROUTE_69_NORTH, 14
	connection east, Route70, ROUTE_70, 8

	map_header_2 VermilionCity, VERMILION_CITY, 6, EAST
	connection east, Route11, ROUTE_11, 1

	map_header_2 FuchsiaCity, FUCHSIA_CITY, 6, EAST
	connection east, Route15, ROUTE_15, 8

	map_header_2 Route15, ROUTE_15, 6, WEST | EAST
	connection west, FuchsiaCity, FUCHSIA_CITY, -8
	connection east, Route14, ROUTE_14, -20

	map_header_2 Route14, ROUTE_14, 65, WEST | EAST
	connection west, Route15, ROUTE_15, 20
	connection east, Route13, ROUTE_13, 0

	map_header_2 Route13, ROUTE_13, 65, NORTH | WEST
	connection north, Route12, ROUTE_12, 18
	connection west, Route14, ROUTE_14, 0

	map_header_2 Route12, ROUTE_12, 65, SOUTH | WEST
	connection south, Route13, ROUTE_13, -18
	connection west, Route11, ROUTE_11, -3

	map_header_2 Route11, ROUTE_11, 13, WEST | EAST
	connection west, VermilionCity, VERMILION_CITY, -1
	connection east, Route12, ROUTE_12, 3

	map_header_2 CinnabarIsland, CINNABAR_ISLAND, 65, 0

	map_header_2 ButwalIslandUnderwaterEast, BUTWAL_ISLAND_UNDERWATER_EAST, 9, WEST
	connection west, ButwalIslandUnderwaterWest, BUTWAL_ISLAND_UNDERWATER_WEST, 0

	map_header_2 ButwalIslandUnderwaterWest, BUTWAL_ISLAND_UNDERWATER_WEST, 9, EAST
	connection east, ButwalIslandUnderwaterEast, BUTWAL_ISLAND_UNDERWATER_EAST, 0

	map_header_2 Route70, ROUTE_70, 53, WEST | EAST
	connection west, PummeloIsland, PUMMELO_ISLAND, -8
	connection east, TarrocoIsland, TARROCO_ISLAND, -11

	map_header_2 TarrocoIsland, TARROCO_ISLAND, 53, WEST | EAST
	connection west, Route70, ROUTE_70, 11
	connection east, Route71, ROUTE_71, 0

	map_header_2 Route71, ROUTE_71, 53, WEST | EAST
	connection west, TarrocoIsland, TARROCO_ISLAND, 0
	connection east, Route71East, ROUTE_71_EAST, 0

	map_header_2 Route71East, ROUTE_71_EAST, 53, WEST
	connection west, Route71, ROUTE_71, 0

	map_header_2 ShamoutiIsland, SHAMOUTI_ISLAND, 53, NORTH | EAST
	connection north, ShamoutiNorthBeach, SHAMOUTI_NORTH_BEACH, 4
	connection east, ShamoutiBay, SHAMOUTI_BAY, 2

	map_header_2 ShamoutiNorthBeach, SHAMOUTI_NORTH_BEACH, 53, NORTH | SOUTH
	connection north, LightningIsland, LIGHTNING_ISLAND, -10
	connection south, ShamoutiIsland, SHAMOUTI_ISLAND, -4

	map_header_2 ShamoutiBay, SHAMOUTI_BAY, 53, WEST
	connection west, ShamoutiIsland, SHAMOUTI_ISLAND, -2

	map_header_2 LightningIsland, LIGHTNING_ISLAND, 53, SOUTH | WEST
	connection south, ShamoutiNorthBeach, SHAMOUTI_NORTH_BEACH, 10
	connection west, IceIsland, ICE_ISLAND, -4

	map_header_2 IceIsland, ICE_ISLAND, 53, SOUTH | EAST
	connection south, FireIsland, FIRE_ISLAND, -4
	connection east, LightningIsland, LIGHTNING_ISLAND, 4

	map_header_2 FireIsland, FIRE_ISLAND, 53, NORTH
	connection north, IceIsland, ICE_ISLAND, 4

	map_header_2 HamlinIsland, HAMLIN_ISLAND, 19, 0
	map_header_2 HamlinBridge, HAMLIN_BRIDGE, 19, 0

	map_header_2 PokeCenter2F, POKECENTER_2F, 0, 0
	map_header_2 TradeCenter, TRADE_CENTER, 0, 0
	map_header_2 Colosseum, COLOSSEUM, 0, 0
	map_header_2 KrissHouse1F, KRISS_HOUSE_1F, 0, 0
	map_header_2 KrissHouse2F, KRISS_HOUSE_2F, 0, 0
	map_header_2 KrissNeighborsHouse, KRISS_NEIGHBORS_HOUSE, 0, 0
	map_header_2 IvysHouse, IVYS_HOUSE, 0, 0
	map_header_2 IvysLab, IVYS_LAB, 0, 0
	map_header_2 ValenciaPort, VALENCIA_PORT, 10, 0
	map_header_2 TangeloPort, TANGELO_PORT, 10, 0
	map_header_2 TangeloMart, TANGELO_MART, 0, 0
	map_header_2 TangeloPokeCenter1F, TANGELO_POKECENTER_1F, 0, 0
	map_header_2 TangeloGymSpeechHouse, TANGELO_GYM_SPEECH_HOUSE, 0, 0
	map_header_2 TangeloEvolutionSpeechHouse, TANGELO_EVOLUTION_SPEECH_HOUSE, 0, 0
	map_header_2 Route51TangeloJungleGate, ROUTE_51_TANGELO_JUNGLE_GATE, 0, 0
	map_header_2 TangeloJungle, TANGELO_JUNGLE, 0, 0
	map_header_2 Route52TangeloJungleGate, ROUTE_52_TANGELO_JUNGLE_GATE, 0, 0
	map_header_2 Route52PokeCenter1F, ROUTE_52_POKECENTER_1F, 0, 0
	map_header_2 MikanMart, MIKAN_MART, 0, 0
	map_header_2 MikanGym, MIKAN_GYM, 0, 0
	map_header_2 MikanNicknameSpeechHouse, MIKAN_NICKNAME_SPEECH_HOUSE, 0, 0
	map_header_2 MikanPokeCenter1F, MIKAN_POKECENTER_1F, 0, 0
	map_header_2 MikanOnixTradeHouse, MIKAN_ONIX_TRADE_HOUSE, 0, 0
	map_header_2 MikanIslandRoute53Gate, MIKAN_ISLAND_ROUTE_53_GATE, 0, 0
	map_header_2 SunburstPokeCenter, SUNBURST_POKECENTER, 0, 0
	map_header_2 SunburstSmallHouse, SUNBURST_SMALL_HOUSE, 0, 0
	map_header_2 SunburstLargeHouse, SUNBURST_LARGE_HOUSE, 0, 0
	map_header_2 SunburstSouthHouse, SUNBURST_SOUTH_HOUSE, 0, 0
	map_header_2 SunburstCrystalShop, SUNBURST_CRYSTAL_SHOP, 0, 0
	map_header_2 CrystalCave1F, CRYSTAL_CAVE_1F, 9, 0
	map_header_2 CrystalCaveB1, CRYSTAL_CAVE_B1, 9, 0
	map_header_2 MandarinNorthPokeCenter, MANDARIN_NORTH_POKECENTER, 0, 0
	map_header_2 MandarinNorthNameRater, MANDARIN_NORTH_NAME_RATER, 0, 0
	map_header_2 MandarinNorthSmallHouse, MANDARIN_NORTH_SMALL_HOUSE, 0, 0
	map_header_2 MandarinNorthLargeHouse, MANDARIN_NORTH_LARGE_HOUSE, 0, 0
	map_header_2 MandarinUndergroundEntrance, MANDARIN_UNDERGROUND_ENTRANCE, 0, 0
	map_header_2 MandarinUndergroundBF1, MANDARIN_UNDERGROUND_BF1, 0, 0
	map_header_2 MandarinUndergroundBF2, MANDARIN_UNDERGROUND_BF2, 0, 0
	map_header_2 MandarinUndergroundBF3, MANDARIN_UNDERGROUND_BF3, 0, 0
	map_header_2 MandarinNorthMart, MANDARIN_NORTH_MART, 0, 0
	map_header_2 Route55Underwater, ROUTE_55_UNDERWATER, 9, 0
	map_header_2 Route55QuestHouse, ROUTE_55_QUEST_HOUSE, 0, 0
	map_header_2 Route56PokeCenter, ROUTE_56_POKE_CENTER, 0, 0
	map_header_2 KinnowTradeHouse, KINNOW_TRADE_HOUSE, 0, 0
	map_header_2 KinnowLoreHouse, KINNOW_LORE_HOUSE, 0, 0
	map_header_2 KinnowCharcoalHouse, KINNOW_CHARCOAL_HOUSE, 0, 0
	map_header_2 KinnowPokeCenter, KINNOW_POKE_CENTER, 0, 0
	map_header_2 KinnowMart, KINNOW_MART, 0, 0
	map_header_2 KinnowCafe, KINNOW_CAFE, 0, 0
	map_header_2 KinnowSkateShop, KINNOW_SKATE_SHOP, 0, 0
	map_header_2 KinnowIslandRoute57Gate, KINNOW_ISLAND_ROUTE_57_GATE, 0, 0
	map_header_2 Route57GateUpstairs, ROUTE_57_GATE_UPSTAIRS, 0, 0
	map_header_2 Route51GateUpstairs, ROUTE_51_GATE_UPSTAIRS, 0, 0
	map_header_2 Route53GateUpstairs, ROUTE_53_GATE_UPSTAIRS, 0, 0
	map_header_2 UnnamedIsland1PokeCenter, UNNAMED_ISLAND_1_POKE_CENTER, 0, 0
	map_header_2 MtNavel1F, MT_NAVEL_1F, 9, 0
	map_header_2 MtNavel2F, MT_NAVEL_2F, 9, 0
	map_header_2 MtNavelPeak, MT_NAVEL_PEAK, 0, 0
	map_header_2 MtNavelIceRock, MT_NAVEL_ICE_ROCK, 9, 0
	map_header_2 DannysHouse, DANNYS_HOUSE, 0, 0
	map_header_2 SevenGrapefruitsUnderwater, SEVEN_GRAPEFRUITS_UNDERWATER, 9, 0
	map_header_2 GrapefruitStore, GRAPEFRUIT_STORE, 0, 0
	map_header_2 MoroIslandMuseum, MORO_ISLAND_MUSEUM, 0, 0
	map_header_2 MoroFishingHouse, MORO_FISHING_HOUSE, 0, 0
	map_header_2 MoroSouthHouse, MORO_SOUTH_HOUSE, 0, 0
	map_header_2 MoroHouse1, MORO_HOUSE_1, 0, 0
	map_header_2 MoroHouse2, MORO_HOUSE_2, 0, 0
	map_header_2 MoroPokeCenter, MORO_POKE_CENTER, 0, 0
	map_header_2 MoroMart, MORO_MART, 0, 0
	map_header_2 MoroRoute60Gate, MORO_ROUTE_60_GATE, 0, 0
	map_header_2 Route60GateUpstairs, ROUTE_60_GATE_UPSTAIRS, 0, 0
	map_header_2 HallOfFame, HALL_OF_FAME, 0, 0
	map_header_2 GoldenIsland, GOLDEN_ISLAND, 6, 0
	map_header_2 Route60, ROUTE_60, 53, 0
	map_header_2 GoldenIslandHouse1, GOLDEN_ISLAND_HOUSE_1, 0, 0
	map_header_2 GoldenIslandHouse2, GOLDEN_ISLAND_HOUSE_2, 0, 0
	map_header_2 GoldenIslandHouse3, GOLDEN_ISLAND_HOUSE_3, 0, 0
	map_header_2 GoldenIslandElderHouse, GOLDEN_ISLAND_ELDER_HOUSE, 0, 0
	map_header_2 GoldenIslandGateHouse, GOLDEN_ISLAND_GATE_HOUSE, 0, 0
	map_header_2 WreckedShip, WRECKED_SHIP, 9, 0
	map_header_2 WreckedShipUnderwater, WRECKED_SHIP_UNDERWATER, 0, 0
	map_header_2 WreckedShipUnsunk, WRECKED_SHIP_UNSUNK, 0, 0
	map_header_2 MurcottHouse1, MURCOTT_HOUSE_1, 0, 0
	map_header_2 MurcottHouse2, MURCOTT_HOUSE_2, 0, 0
	map_header_2 MurcottHouse3, MURCOTT_HOUSE_3, 0, 0
	map_header_2 MurcottPokeCenter, MURCOTT_POKE_CENTER, 0, 0
	map_header_2 MurcottPokeMart, MURCOTT_POKE_MART, 0, 0
	map_header_2 DayCare, DAYCARE, 0, 0
	map_header_2 MandarinDesert, MANDARIN_DESERT, 21, 0
	map_header_2 Trovitopolis, TROVITOPOLIS, 53, 0
	map_header_2 TrovitopolisSewer, TROVITOPOLIS_SEWER, 0, 0
	map_header_2 TrovitaIsland, TROVITA_ISLAND, 53, 0
	map_header_2 TrovitopolisDeptStore1F, TROVITOPOLIS_DEPT_STORE_1F, 0, 0
	map_header_2 TrovitopolisDeptStore2F, TROVITOPOLIS_DEPT_STORE_2F, 0, 0
	map_header_2 TrovitopolisDeptStore3F, TROVITOPOLIS_DEPT_STORE_3F, 0, 0
	map_header_2 TrovitopolisDeptStore4F, TROVITOPOLIS_DEPT_STORE_4F, 0, 0
	map_header_2 TrovitopolisDeptStore5F, TROVITOPOLIS_DEPT_STORE_5F, 0, 0
	map_header_2 TrovitopolisDeptStore6F, TROVITOPOLIS_DEPT_STORE_6F, 0, 0
	map_header_2 TrovitopolisDeptStoreElevator, TROVITOPOLIS_DEPT_STORE_ELEVATOR, 0, 0
	map_header_2 TrovitopolisDeptStoreRoof, TROVITOPOLIS_DEPT_STORE_ROOF, 36, 0
	map_header_2 TrovitopolisPokeCommCenter, TROVITOPOLIS_POKE_COMM_CENTER, 0, 0
	map_header_2 TrovitopolisMrFlashHouse, TROVITOPOLIS_MR_FLASH_HOUSE, 0, 0
	map_header_2 TrovitopolisMoveDeleterHouse, TROVITOPOLIS_MOVE_DELETER_HOUSE, 0, 0
	map_header_2 TrovitopolisHouse1, TROVITOPOLIS_HOUSE_1, 0, 0
	map_header_2 TrovitopolisHouse2, TROVITOPOLIS_HOUSE_2, 0, 0
	map_header_2 TrovitopolisHouse3, TROVITOPOLIS_HOUSE_3, 0, 0
	map_header_2 TrovitopolisHouse4, TROVITOPOLIS_HOUSE_4, 0, 0
	map_header_2 SewerEntrance, SEWER_ENTRANCE, 0, 0
	map_header_2 Route62MandarinDesertGate, ROUTE_62_MANDARIN_DESERT_GATE, 0, 0
	map_header_2 SunrayCaveMandarinDesert1F, SUNRAY_CAVE_MANDARIN_DESERT_1F, 9, 0
	map_header_2 TrovitopolisPort, TROVITOPOLIS_PORT, 10, 0
	map_header_2 MayorsOffice, MAYORS_OFFICE, 0, 0
	map_header_2 MayorsOfficeMeetingRoom, MAYORS_OFFICE_MEETING_ROOM, 0, 0
	map_header_2 TrovitaPort, TROVITA_PORT, 10, 0
	map_header_2 TrovitaGym, TROVITA_GYM, 0, 0
	map_header_2 TrovitopolisPrimaSchool, TROVITOPOLIS_PRIMA_SCHOOL, 0, 0
	map_header_2 FukuharaNo4BF1, FUKUHARA_NO_4_BF1, 9, 0
	map_header_2 FukuharaNo4BF2, FUKUHARA_NO_4_BF2, 9, 0
	map_header_2 FukuharaNo4BF3, FUKUHARA_NO_4_BF3, 9, 0
	map_header_2 AscorbiaIslandFanClub, ASCORBIA_ISLAND_FAN_CLUB, 0, 0
	map_header_2 AscorbiaIslandMoveRelearner, ASCORBIA_ISLAND_MOVE_RELEARNER, 0, 0
	map_header_2 AscorbiaIslandHouse1, ASCORBIA_ISLAND_HOUSE_1, 0, 0
	map_header_2 AscorbiaIslandHouse2, ASCORBIA_ISLAND_HOUSE_2, 0, 0
	map_header_2 AscorbiaIslandRoute63Gate, ASCORBIA_ISLAND_ROUTE_63_GATE, 0, 0
	map_header_2 AscorbiaIslandMart, ASCORBIA_ISLAND_MART, 0, 0
	map_header_2 AscorbiaIslandCenter, ASCORBIA_ISLAND_CENTER, 0, 0
	map_header_2 KinnowShowboat, KINNOW_SHOWBOAT, 2, 0
	map_header_2 KinnowShowboatGate, KINNOW_SHOWBOAT_GATE, 0, 0
	map_header_2 KinnowShowboatHouse, KINNOW_SHOWBOAT_HOUSE, 0, 0
	map_header_2 KinnowShowboatInside, KINNOW_SHOWBOAT_INSIDE, 0, 0
	map_header_2 HeartScaleCove, HEART_SCALE_COVE, 9, 0
	map_header_2 PummeloStadium, PUMMELO_STADIUM, 0, 0
	map_header_2 ButwalIslandWestGrotto, BUTWAL_ISLAND_WEST_GROTTO, 9, 0
	map_header_2 VictoryRoadF1, VICTORY_ROAD_F1, 105, 0
	map_header_2 VictoryRoadF2, VICTORY_ROAD_F2, 105, 0
	map_header_2 VictoryRoadF3, VICTORY_ROAD_F3, 105, 0
	map_header_2 VictoryRoadEast, VICTORY_ROAD_EAST, 105, 0
	map_header_2 VictoryRoadMysteryRoom, VICTORY_ROAD_MYSTERY_ROOM, 105, 0
	map_header_2 VictoryRoadExitRoom, VICTORY_ROAD_EXIT_ROOM, 105, 0
	map_header_2 KumquatHotelLobby, KUMQUAT_HOTEL_LOBBY, 0, 0
	map_header_2 KumquatHotelPool, KUMQUAT_HOTEL_POOL, 0, 0
	map_header_2 KumquatHotelElevator, KUMQUAT_HOTEL_ELEVATOR, 0, 0
	map_header_2 KumquatHotelSuites, KUMQUAT_HOTEL_SUITES, 0, 0
	map_header_2 KumquatHotelBottomRoom2, KUMQUAT_HOTEL_BOTTOM_ROOM_2, 0, 0
	map_header_2 KumquatHotelBottomRoom3, KUMQUAT_HOTEL_BOTTOM_ROOM_3, 0, 0
	map_header_2 KumquatHotelTopRoom2, KUMQUAT_HOTEL_TOP_ROOM_2, 0, 0
	map_header_2 KumquatHotelTopRoom3, KUMQUAT_HOTEL_TOP_ROOM_3, 0, 0
	map_header_2 KumquatHotelGym, KUMQUAT_HOTEL_GYM, 0, 0
	map_header_2 KumquatHouse1, KUMQUAT_HOUSE_1, 0, 0
	map_header_2 KumquatHouse2, KUMQUAT_HOUSE_2, 0, 0
	map_header_2 KumquatHouse3, KUMQUAT_HOUSE_3, 0, 0
	map_header_2 KumquatHouse4, KUMQUAT_HOUSE_4, 0, 0
	map_header_2 KumquatMart, KUMQUAT_MART, 0, 0
	map_header_2 KumquatCenter, KUMQUAT_CENTER, 0, 0
	map_header_2 GameCorner, GAME_CORNER, 0, 0
	map_header_2 Route67Underwater, ROUTE_67_UNDERWATER, 9, 0
	map_header_2 QuackenpokerLab, QUACKENPOKER_LAB, 0, 0
	map_header_2 UnnamedIsland3House, UNNAMED_ISLAND_3_HOUSE, 0, 0
	map_header_2 Route69Gate, ROUTE_69_GATE, 0, 0
	map_header_2 PummeloIslandHouse1, PUMMELO_ISLAND_HOUSE_1, 0, 0
	map_header_2 PummeloIslandHouse2, PUMMELO_ISLAND_HOUSE_2, 0, 0
	map_header_2 PummeloIslandHouse3, PUMMELO_ISLAND_HOUSE_3, 0, 0
	map_header_2 PummeloIslandHouse4, PUMMELO_ISLAND_HOUSE_4, 0, 0
	map_header_2 PummeloIslandHouse5, PUMMELO_ISLAND_HOUSE_5, 0, 0
	map_header_2 PummeloIslandHouse6, PUMMELO_ISLAND_HOUSE_6, 0, 0
	map_header_2 PummeloCenter, PUMMELO_CENTER, 0, 0
	map_header_2 PummeloMart, PUMMELO_MART, 0, 0
	map_header_2 PummeloRoute70Gate, PUMMELO_ROUTE_70_GATE, 0, 0
	map_header_2 Route70GateUpstairs, ROUTE_70_GATE_UPSTAIRS, 0, 0
	map_header_2 PonchosHouse, PONCHOS_HOUSE, 0, 0
	map_header_2 HamlinRoute71Gate, HAMLIN_ROUTE_71_GATE, 0, 0
	map_header_2 HamlinBridgeGate, HAMLIN_BRIDGE_GATE, 0, 0
	map_header_2 ShamoutiShrine, SHAMOUTI_SHRINE, 53, 0
	map_header_2 AirshipInterior, AIRSHIP_INTERIOR, 3, 0
	map_header_2 ChiefsHouse, CHIEFS_HOUSE, 0, 0
	map_header_2 ShamoutiMart, SHAMOUTI_MART, 0, 0
	map_header_2 ShamoutiCenter, SHAMOUTI_CENTER, 0, 0
	map_header_2 ShamoutiHouse, SHAMOUTI_HOUSE, 0, 0
	map_header_2 ShamoutiBayHouse, SHAMOUTI_BAY_HOUSE, 0, 0
	map_header_2 AirshipOutside, AIRSHIP_OUTSIDE, 0, 0
	map_header_2 AirshipCutscene, AIRSHIP_CUTSCENE, 0, 0
	map_header_2 ShamoutiCave, SHAMOUTI_CAVE, 9, 0
	map_header_2 LightningIslandCave, LIGHTNING_ISLAND_CAVE, 9, 0
	map_header_2 Route71Underwater, ROUTE_71_UNDERWATER, 9, 0
	map_header_2 PiratesCove1F, PIRATES_COVE_1F, 9, 0
	map_header_2 PiratesCove2F, PIRATES_COVE_2F, 9, 0
	map_header_2 PiratesCoveUnderwater, PIRATES_COVE_UNDERWATER, 9, 20

	map_header_2 PalletTown, PALLET_TOWN, 6, 0
	map_header_2 RedsHouse1F, REDS_HOUSE_1F, 0, 0
	map_header_2 RedsHouse2F, REDS_HOUSE_2F, 0, 0
	map_header_2 BluesHouse, BLUES_HOUSE, 0, 0
	map_header_2 OaksLab, OAKS_LAB, 0, 0
	map_header_2 SafariZone, SAFARI_ZONE, 44, 0
	map_header_2 CyberSpace, CYBER_SPACE, 0, 0
