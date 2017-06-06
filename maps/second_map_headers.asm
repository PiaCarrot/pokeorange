	map_header_2 ValenciaIsland, VALENCIA_ISLAND, 32, WEST
	connection west, ROUTE_49, Route49, 0, 2, 9, VALENCIA_ISLAND

	map_header_2 Route49, ROUTE_49, 32, EAST
	connection east, VALENCIA_ISLAND, ValenciaIsland, 2, 0, 9, ROUTE_49

	map_header_2 TangeloIsland, TANGELO_ISLAND, 53, NORTH
	connection north, ROUTE_50, Route50, 5, 0, 10, TANGELO_ISLAND

	map_header_2 Route50, ROUTE_50, 32, EAST | SOUTH
	connection south, TANGELO_ISLAND, TangeloIsland, -3, 2, 16, ROUTE_50
	connection east, ROUTE_51, Route51, 8, 0, 14, ROUTE_50

	map_header_2 Route51, ROUTE_51, 32, WEST
	connection west, ROUTE_50, Route50, -8, 0, 24, ROUTE_51

	map_header_2 Route52, ROUTE_52, 53, NORTH
	connection north, MIKAN_ISLAND, MikanIsland, 0, 0, 11, ROUTE_52

	map_header_2 MikanIsland, MIKAN_ISLAND, 32, SOUTH
	connection south, ROUTE_52, Route52, 0, 0, 11, MIKAN_ISLAND

	map_header_2 Route53, ROUTE_53, 53, SOUTH | NORTH
	connection north, ROUTE_54, Route54, 21, 1, 10, ROUTE_53
	connection south, SUNBURST_ISLAND, SunburstIsland, 21, 11, 9, ROUTE_53

	map_header_2 Route54, ROUTE_54, 53, NORTH | SOUTH
	connection north, MANDARIN_NORTH, MandarinNorth, 0, 4, 11, ROUTE_54
	connection south, ROUTE_53, Route53, 0, 20, 11, ROUTE_54

	map_header_2 SunburstIsland, SUNBURST_ISLAND, 53, NORTH
	connection north, ROUTE_53, Route53, 10, 20, 9, SUNBURST_ISLAND

	map_header_2 MandarinNorth, MANDARIN_NORTH, 32, SOUTH
	connection south, ROUTE_54, Route54, 4, 0, 10, MANDARIN_NORTH

	map_header_2 Route55, ROUTE_55, 53, EAST
	connection east, PINKAN_ISLAND, PinkanIsland, 10, 0, 10, ROUTE_55

	map_header_2 PinkanIsland, PINKAN_ISLAND, 53, WEST | EAST
	connection west, ROUTE_55, Route55, 0, 10, 12, PINKAN_ISLAND
	connection east, ROUTE_56_WEST, Route56West, 0, 0, 17, PINKAN_ISLAND

	map_header_2 Route56West, ROUTE_56_WEST, 53, WEST | EAST
	connection west, PINKAN_ISLAND, PinkanIsland, 0, 0, 17, ROUTE_56_WEST
	connection east, ROUTE_56_EAST, Route56East, 0, 0, 17, ROUTE_56_WEST

	map_header_2 Route56East, ROUTE_56_EAST, 53, WEST | NORTH
	connection north, KINNOW_ISLAND, KinnowIsland, 25, 0, 10, ROUTE_56_EAST
	connection west, ROUTE_56_WEST, Route56West, 0, 0, 17, ROUTE_56_EAST

	map_header_2 KinnowIsland, KINNOW_ISLAND, 53, SOUTH
	connection south, ROUTE_56_EAST, Route56East, 0, 25, 10, KINNOW_ISLAND

	map_header_2 PokeCenter2F, POKECENTER_2F, $0, 0
	map_header_2 TradeCenter, TRADE_CENTER, $0, 0
	map_header_2 Colosseum, COLOSSEUM, $0, 0
	map_header_2 TimeCapsule, TIME_CAPSULE, $0, 0
	map_header_2 KrissHouse1F, KRISS_HOUSE_1F, 0, 0
	map_header_2 KrissHouse2F, KRISS_HOUSE_2F, $0, 0
	map_header_2 KrissNeighborsHouse, KRISS_NEIGHBORS_HOUSE, $0, 0
	map_header_2 IvysHouse, IVYS_HOUSE, 0, 0
	map_header_2 IvysLab, IVYS_LAB, 0, 0
	map_header_2 ValenciaPort, VALENCIA_PORT, 10, 0
	map_header_2 TangeloPort, TANGELO_PORT, $a, 0
	map_header_2 TangeloMart, TANGELO_MART, $0, 0
	map_header_2 TangeloPokeCenter1F, TANGELO_POKECENTER_1F, $0, 0
	map_header_2 TangeloGymSpeechHouse, TANGELO_GYM_SPEECH_HOUSE, $0, 0
	map_header_2 TangeloEvolutionSpeechHouse, TANGELO_EVOLUTION_SPEECH_HOUSE, 0, 0
	map_header_2 Route51TangeloJungleGate, ROUTE_51_TANGELO_JUNGLE_GATE, $0, 0
	map_header_2 TangeloJungle, TANGELO_JUNGLE, 5, 0
	map_header_2 Route52TangeloJungleGate, ROUTE_52_TANGELO_JUNGLE_GATE, $0, 0
	map_header_2 Route52PokeCenter1F, ROUTE_52_POKECENTER_1F, 0, 0
	map_header_2 MikanMart, MIKAN_MART, $0, 0
	map_header_2 MikanGym, MIKAN_GYM, 0, 0
	map_header_2 MikanNicknameSpeechHouse, MIKAN_NICKNAME_SPEECH_HOUSE, $0, 0
	map_header_2 MikanPokeCenter1F, MIKAN_POKECENTER_1F, $0, 0
	map_header_2 MikanOnixTradeHouse, MIKAN_ONIX_TRADE_HOUSE, $0, 0
	map_header_2 MikanIslandRoute53Gate, MIKAN_ISLAND_ROUTE_53_GATE, 0, 0
	map_header_2 SunburstPokeCenter, SUNBURST_POKECENTER, 0, 0
	map_header_2 SunburstSmallHouse, SUNBURST_SMALL_HOUSE, 0, 0
	map_header_2 SunburstLargeHouse, SUNBURST_LARGE_HOUSE, 0, 0
	map_header_2 SunburstSouthHouse, SUNBURST_SOUTH_HOUSE, 0, 0
	map_header_2 SunburstCrystalShop, SUNBURST_CRYSTAL_SHOP, 0, 0
	map_header_2 CrystalCave1F, CRYSTAL_CAVE_1F, 0, 0
	map_header_2 CrystalCaveB1, CRYSTAL_CAVE_B1, 0, 0
	map_header_2 MandarinNorthPokeCenter, MANDARIN_NORTH_POKECENTER, 0, 0
	map_header_2 MandarinNorthNameRater, MANDARIN_NORTH_NAME_RATER, 0, 0
	map_header_2 MandarinNorthSmallHouse, MANDARIN_NORTH_SMALL_HOUSE, 0, 0
	map_header_2 MandarinNorthLargeHouse, MANDARIN_NORTH_LARGE_HOUSE, 0, 0
	map_header_2 MandarinUnderground, MANDARIN_UNDERGROUND, 0, 0
	map_header_2 MandarinNorthMart, MANDARIN_NORTH_MART, 0, 0
	map_header_2 Route55QuestHouse, ROUTE_55_QUEST_HOUSE, 0, 0
	map_header_2 Route56PokeCenter, ROUTE_56_POKE_CENTER, 0, 0
	map_header_2 HallOfFame, HALL_OF_FAME, $0, 0

	map_header_2 DayCare, DAYCARE, $0, 0
	map_header_2 RedsHouse1F, REDS_HOUSE_1F, $0, 0
	map_header_2 RedsHouse2F, REDS_HOUSE_2F, $0, 0
	map_header_2 BluesHouse, BLUES_HOUSE, $0, 0
	map_header_2 OaksLab, OAKS_LAB, $0, 0
	map_header_2 CinnabarPokeCenter1F, CINNABAR_POKECENTER_1F, $0, 0

	map_header_2 NationalPark, NATIONAL_PARK, $0, 0
	map_header_2 NationalParkBugContest, NATIONAL_PARK_BUG_CONTEST, $0, 0
