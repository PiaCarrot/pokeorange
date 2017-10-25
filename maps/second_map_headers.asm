	map_header_2 ValenciaIsland, VALENCIA_ISLAND, 32, WEST
	connection west, ROUTE_49, Route49, 0, 2, 9, VALENCIA_ISLAND

	map_header_2 Route49, ROUTE_49, 32, EAST
	connection east, VALENCIA_ISLAND, ValenciaIsland, 2, 0, 9, ROUTE_49

	map_header_2 TangeloIsland, TANGELO_ISLAND, 53, NORTH
	connection north, ROUTE_50, Route50, 5, 0, 10, TANGELO_ISLAND

	map_header_2 Route50, ROUTE_50, 32, EAST | SOUTH
	connection south, TANGELO_ISLAND, TangeloIsland, -3, 2, 10, ROUTE_50
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
	connection north, KINNOW_ISLAND, KinnowIsland, 25, 0, 12, ROUTE_56_EAST
	connection west, ROUTE_56_WEST, Route56West, 0, 0, 17, ROUTE_56_EAST

	map_header_2 KinnowIsland, KINNOW_ISLAND, 53, SOUTH
	connection south, ROUTE_56_EAST, Route56East, 0, 25, 12, KINNOW_ISLAND

	map_header_2 Route57, ROUTE_57, 53, NORTH | EAST
	connection north, UNNAMED_ISLAND_1, UnnamedIsland1, 0, 0, 12, ROUTE_57
	connection east, SEVEN_GRAPEFRUITS, SevenGrapefruits, 0, 6, 16, ROUTE_57

	map_header_2 UnnamedIsland1, UNNAMED_ISLAND_1, 53, SOUTH | EAST
	connection south, ROUTE_57, Route57, 0, 0, 12, UNNAMED_ISLAND_1
	connection east, ROUTE_58, Route58, 2, 0, 10, UNNAMED_ISLAND_1

	map_header_2 Route58, ROUTE_58, 53, WEST | EAST | SOUTH
	connection south, SEVEN_GRAPEFRUITS, SevenGrapefruits, 0, 0, 18, ROUTE_58
	connection west, UNNAMED_ISLAND_1, UnnamedIsland1, -2, 0, 10, ROUTE_58
	connection east, NAVEL_ISLAND, NavelIsland, 0, 8, 10, ROUTE_58

	map_header_2 NavelIsland, NAVEL_ISLAND, 53, WEST
	connection west, ROUTE_58, Route58, 8, 0, 10, NAVEL_ISLAND

	map_header_2 SevenGrapefruits, SEVEN_GRAPEFRUITS, 53, WEST | NORTH | SOUTH
	connection north, ROUTE_58, Route58, 0, 0, 18, SEVEN_GRAPEFRUITS
	connection south, ROUTE_59, Route59, 5, 0, 12, SEVEN_GRAPEFRUITS
	connection west, ROUTE_57, Route57, 6, 0, 16, SEVEN_GRAPEFRUITS

	map_header_2 Route59, ROUTE_59, 53, NORTH | SOUTH
	connection north, SEVEN_GRAPEFRUITS, SevenGrapefruits, -2, 3, 16, ROUTE_59
	connection south, MORO_ISLAND, MoroIsland, 0, 6, 12, ROUTE_59

	map_header_2 MoroIsland, MORO_ISLAND, 53, NORTH
	connection north, ROUTE_59, Route59, 6, 0, 12, MORO_ISLAND

	map_header_2 Route61, ROUTE_61, 53, SOUTH | WEST | EAST
	connection south, UNNAMED_ISLAND_2, UnnamedIsland2, 7, 0, 8, ROUTE_61
	connection west, ROUTE_62, Route62, 8, 0, 8, ROUTE_61
	connection east, MURCOTT_ISLAND, MurcottIsland, 18, 3, 8, ROUTE_61
	
	map_header_2 Route62, ROUTE_62, 5, EAST
	connection east, ROUTE_61, Route61, 0, 8, 8, ROUTE_62
	
	map_header_2 MurcottIsland, MURCOTT_ISLAND, 5, WEST
	connection west, ROUTE_61, Route61, 3, 18, 8, MURCOTT_ISLAND
	
	map_header_2 UnnamedIsland2, UNNAMED_ISLAND_2, 53, NORTH
	connection north, ROUTE_61, Route61, 0, 7, 8, UNNAMED_ISLAND_2

	map_header_2 PokeCenter2F, POKECENTER_2F, $0, 0
	map_header_2 TradeCenter, TRADE_CENTER, $0, 0
	map_header_2 Colosseum, COLOSSEUM, $0, 0
	map_header_2 KrissHouse1F, KRISS_HOUSE_1F, 0, 0
	map_header_2 KrissHouse2F, KRISS_HOUSE_2F, $0, 0
	map_header_2 KrissNeighborsHouse, KRISS_NEIGHBORS_HOUSE, $0, 0
	map_header_2 IvysHouse, IVYS_HOUSE, 0, 0
	map_header_2 IvysLab, IVYS_LAB, 0, 0
	map_header_2 ValenciaPort, VALENCIA_PORT, 10, 0
	map_header_2 TangeloPort, TANGELO_PORT, 10, 0
	map_header_2 TangeloMart, TANGELO_MART, $0, 0
	map_header_2 TangeloPokeCenter1F, TANGELO_POKECENTER_1F, 0, 0
	map_header_2 TangeloGymSpeechHouse, TANGELO_GYM_SPEECH_HOUSE, $0, 0
	map_header_2 TangeloEvolutionSpeechHouse, TANGELO_EVOLUTION_SPEECH_HOUSE, 0, 0
	map_header_2 Route51TangeloJungleGate, ROUTE_51_TANGELO_JUNGLE_GATE, 0, 0
	map_header_2 TangeloJungle, TANGELO_JUNGLE, 0, 0
	map_header_2 Route52TangeloJungleGate, ROUTE_52_TANGELO_JUNGLE_GATE, $0, 0
	map_header_2 Route52PokeCenter1F, ROUTE_52_POKECENTER_1F, 0, 0
	map_header_2 MikanMart, MIKAN_MART, $0, 0
	map_header_2 MikanGym, MIKAN_GYM, 0, 0
	map_header_2 MikanNicknameSpeechHouse, MIKAN_NICKNAME_SPEECH_HOUSE, $0, 0
	map_header_2 MikanPokeCenter1F, MIKAN_POKECENTER_1F, 0, 0
	map_header_2 MikanOnixTradeHouse, MIKAN_ONIX_TRADE_HOUSE, $0, 0
	map_header_2 MikanIslandRoute53Gate, MIKAN_ISLAND_ROUTE_53_GATE, 0, 0
	map_header_2 SunburstPokeCenter, SUNBURST_POKECENTER, 0, 0
	map_header_2 SunburstSmallHouse, SUNBURST_SMALL_HOUSE, 0, 0
	map_header_2 SunburstLargeHouse, SUNBURST_LARGE_HOUSE, 0, 0
	map_header_2 SunburstSouthHouse, SUNBURST_SOUTH_HOUSE, 0, 0
	map_header_2 SunburstCrystalShop, SUNBURST_CRYSTAL_SHOP, 0, 0
	map_header_2 CrystalCave1F, CRYSTAL_CAVE_1F, $9, 0
	map_header_2 CrystalCaveB1, CRYSTAL_CAVE_B1, 9, 0
	map_header_2 MandarinNorthPokeCenter, MANDARIN_NORTH_POKECENTER, 0, 0
	map_header_2 MandarinNorthNameRater, MANDARIN_NORTH_NAME_RATER, 0, 0
	map_header_2 MandarinNorthSmallHouse, MANDARIN_NORTH_SMALL_HOUSE, 0, 0
	map_header_2 MandarinNorthLargeHouse, MANDARIN_NORTH_LARGE_HOUSE, 0, 0
	map_header_2 MandarinUnderground, MANDARIN_UNDERGROUND, 0, 0
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
	map_header_2 HallOfFame, HALL_OF_FAME, $0, 0
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
	map_header_2 Trovitopolis, TROVITOPOLIS, 53, 0

	map_header_2 DayCare, DAYCARE, $0, 0
	map_header_2 RedsHouse1F, REDS_HOUSE_1F, $0, 0
	map_header_2 RedsHouse2F, REDS_HOUSE_2F, $0, 0
	map_header_2 BluesHouse, BLUES_HOUSE, $0, 0
	map_header_2 OaksLab, OAKS_LAB, $0, 0

	map_header_2 NationalPark, NATIONAL_PARK, $0, 0
	map_header_2 NationalParkBugContest, NATIONAL_PARK_BUG_CONTEST, $0, 0
