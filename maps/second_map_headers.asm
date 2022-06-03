	map_header_2 ValenciaIsland, VALENCIA_ISLAND, 53, WEST
	connection west, ROUTE_49, Route49, 0, 2, 9, VALENCIA_ISLAND

	map_header_2 Route49, ROUTE_49, 32, NORTH | EAST
	connection north, VALENCIA_TANGELO_ROUTE_49, ValenciaTangeloRoute49, -1, 0, 12, ROUTE_49
	connection east, VALENCIA_ISLAND, ValenciaIsland, 2, 0, 9, ROUTE_49

	map_header_2 ValenciaTangeloRoute49, VALENCIA_TANGELO_ROUTE_49, 53, NORTH | SOUTH | WEST
	connection north, ROUTE_51, Route51, 0, 0, 20, VALENCIA_TANGELO_ROUTE_49
	connection south, ROUTE_49, Route49, 1, 0, 12, VALENCIA_TANGELO_ROUTE_49
	connection west, TANGELO_ISLAND, TangeloIsland, -1, 0, 12, VALENCIA_TANGELO_ROUTE_49

	map_header_2 TangeloIsland, TANGELO_ISLAND, 53, NORTH | EAST
	connection north, ROUTE_50, Route50, 9, 0, 11, TANGELO_ISLAND
	connection east, VALENCIA_TANGELO_ROUTE_49, ValenciaTangeloRoute49, 1, 0, 12, TANGELO_ISLAND

	map_header_2 Route50, ROUTE_50, 32, SOUTH | EAST
	connection south, TANGELO_ISLAND, TangeloIsland, -2, 7, 11, ROUTE_50
	connection east, ROUTE_51, Route51, 8, 0, 14, ROUTE_50

	map_header_2 Route51, ROUTE_51, 32, SOUTH | WEST
	connection south, VALENCIA_TANGELO_ROUTE_49, ValenciaTangeloRoute49, 0, 0, 20, ROUTE_51
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
	connection north, ROUTE_53, Route53, 10, 20, 11, SUNBURST_ISLAND

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
	connection east, SEVEN_GRAPEFRUITS, SevenGrapefruits, 0, 0, 22, ROUTE_57

	map_header_2 UnnamedIsland1, UNNAMED_ISLAND_1, 53, SOUTH | EAST | NORTH
	connection north, ROUTE_57_NORTH, Route57North, 0, 0, 12, UNNAMED_ISLAND_1
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
	connection west, ROUTE_57, Route57, 0, 0, 22, SEVEN_GRAPEFRUITS

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

	map_header_2 UnnamedIsland2, UNNAMED_ISLAND_2, 53, NORTH | EAST
	connection north, ROUTE_61, Route61, 0, 7, 8, UNNAMED_ISLAND_2
	connection east, FISHING_CONTEST, FishingContest, 1, 0, 40, UNNAMED_ISLAND_2

	map_header_2 FishingContest, FISHING_CONTEST, 53, WEST
	connection west, UNNAMED_ISLAND_2, UnnamedIsland2, -1, 0, 40, FISHING_CONTEST
	
	map_header_2 Route57North, ROUTE_57_NORTH, 53, NORTH | SOUTH
	connection north, CLEOPATRA_ISLAND, CleopatraIsland, -2, 1, 16, ROUTE_57_NORTH
	connection south, UNNAMED_ISLAND_1, UnnamedIsland1, 0, 0, 12, ROUTE_57_NORTH

	map_header_2 CleopatraIsland, CLEOPATRA_ISLAND, 53, NORTH | SOUTH
	connection north, ROUTE_63_EAST_WEST, Route63EastWest, 0, 0, 20, CLEOPATRA_ISLAND
	connection south, ROUTE_57_NORTH, Route57North, 3, 0, 12, CLEOPATRA_ISLAND
	
	map_header_2 Route63EastWest, ROUTE_63_EAST_WEST, 53, SOUTH | EAST
	connection south, CLEOPATRA_ISLAND, CleopatraIsland, 0, 0, 20, ROUTE_63_EAST_WEST
	connection east, ROUTE_63_NORTH_SOUTH, Route63NorthSouth, 0, 23, 12, ROUTE_63_EAST_WEST
		
	map_header_2 Route63NorthSouth, ROUTE_63_NORTH_SOUTH, 53, WEST
	connection west, ROUTE_63_EAST_WEST, Route63EastWest, 23, 0, 12, ROUTE_63_NORTH_SOUTH
	
	map_header_2 AscorbiaIsland, ASCORBIA_ISLAND, 32, WEST
	connection west, ROUTE_64, Route64, 0, 0, 14, ASCORBIA_ISLAND
	
	map_header_2 Route64, ROUTE_64, 53, WEST | EAST
	connection west, ROUTE_65, Route65, 0, 0, 14, ROUTE_64
	connection east, ASCORBIA_ISLAND, AscorbiaIsland, 0, 0, 14, ROUTE_64

	map_header_2 Route65, ROUTE_65, 53, WEST | EAST
	connection west, BUTWAL_ISLAND_EAST, ButwalIslandEast, -4, 2, 18, ROUTE_65
	connection east, ROUTE_64, Route64, 0, 0, 14, ROUTE_65
	
	map_header_2 ButwalIslandEast, BUTWAL_ISLAND_EAST, 53, WEST | EAST
	connection west, BUTWAL_ISLAND_WEST, ButwalIslandWest, 0, 0, 22, BUTWAL_ISLAND_EAST
	connection east, ROUTE_65, Route65, 6, 0, 18, BUTWAL_ISLAND_EAST
		
	map_header_2 ButwalIslandWest, BUTWAL_ISLAND_WEST, 32, WEST | EAST
	connection west, ROUTE_66_EAST_WEST, Route66EastWest, 10, 0, 12, BUTWAL_ISLAND_WEST
	connection east, BUTWAL_ISLAND_EAST, ButwalIslandEast, 0, 0, 22, BUTWAL_ISLAND_WEST
	
	map_header_2 Route66EastWest, ROUTE_66_EAST_WEST, 53, SOUTH | EAST
	connection south, ROUTE_66_NORTH_SOUTH, Route66NorthSouth, -3, 0, 12, ROUTE_66_EAST_WEST
	connection east, BUTWAL_ISLAND_WEST, ButwalIslandWest, 0, 10, 12, ROUTE_66_EAST_WEST
	
	map_header_2 Route66NorthSouth, ROUTE_66_NORTH_SOUTH, 53, NORTH | SOUTH
	connection north, ROUTE_66_EAST_WEST, Route66EastWest, 3, 0, 12, ROUTE_66_NORTH_SOUTH
	connection south, KUMQUAT_ISLAND_EAST, KumquatIslandEast, 0, 5, 12, ROUTE_66_NORTH_SOUTH
	
	map_header_2 KumquatIslandEast, KUMQUAT_ISLAND_EAST, 53, NORTH | WEST
	connection north, ROUTE_66_NORTH_SOUTH, Route66NorthSouth, 5, 0, 12, KUMQUAT_ISLAND_EAST
	connection west, KUMQUAT_ISLAND_WEST, KumquatIslandWest, 0, 0, 16, KUMQUAT_ISLAND_EAST
	
	map_header_2 KumquatIslandWest, KUMQUAT_ISLAND_WEST, 53, WEST | EAST
	connection west, ROUTE_67, Route67, 1, 0, 15, KUMQUAT_ISLAND_WEST
	connection east, KUMQUAT_ISLAND_EAST, KumquatIslandEast, 0, 0, 16, KUMQUAT_ISLAND_WEST
	
	map_header_2 Route67, ROUTE_67, 53, WEST | EAST
	connection west, RIND_ISLAND, RindIsland, 0, 7, 15, ROUTE_67
	connection east, KUMQUAT_ISLAND_WEST, KumquatIslandWest, -1, 0, 16, ROUTE_67
	
	map_header_2 RindIsland, RIND_ISLAND, 53, WEST | EAST
	connection west, ROUTE_68, Route68, 3, 0, 10, RIND_ISLAND
	connection east, ROUTE_67, Route67, 7, 0, 15, RIND_ISLAND
	
	map_header_2 Route68, ROUTE_68, 53, WEST | EAST
	connection west, UNNAMED_ISLAND_3, UnnamedIsland3, -2, 9, 10, ROUTE_68
	connection east, RIND_ISLAND, RindIsland, -1, 2, 13, ROUTE_68
	
	map_header_2 UnnamedIsland3, UNNAMED_ISLAND_3, 53, NORTH | EAST
	connection north, ROUTE_69_SOUTH, Route69South, 7, 7, 8, UNNAMED_ISLAND_3
	connection east, ROUTE_68, Route68, 11, 0, 9, UNNAMED_ISLAND_3
	
	map_header_2 Route69South, ROUTE_69_SOUTH, 53, SOUTH
	connection south, UNNAMED_ISLAND_3, UnnamedIsland3, 7, 7, 8, ROUTE_69_SOUTH
	
	map_header_2 Route69North, ROUTE_69_NORTH, 53, EAST
	connection east, PUMMELO_ISLAND, PummeloIsland, -1, 13, 12, ROUTE_69_NORTH
	
	map_header_2 PummeloIsland, PUMMELO_ISLAND, 53, WEST | EAST
	connection west, ROUTE_69_NORTH, Route69North, 14, 0, 13, PUMMELO_ISLAND
	connection east, ROUTE_70, Route70, 13, 5, 6, PUMMELO_ISLAND
	
	map_header_2 VermilionCity, VERMILION_CITY, 6, EAST
	connection east, ROUTE_11, Route11, 1, 0, 11, VERMILION_CITY
	
	map_header_2 FuchsiaCity, FUCHSIA_CITY, 6, EAST
	connection east, ROUTE_15, Route15, 8, 0, 6, FUCHSIA_CITY
	
	map_header_2 Route15, ROUTE_15, 6, WEST | EAST
	connection west, FUCHSIA_CITY, FuchsiaCity, 0, 8, 6, ROUTE_15
	connection east, ROUTE_14, Route14, -2, 18, 9, ROUTE_15
	
	map_header_2 Route14, ROUTE_14, 65, WEST | EAST
	connection west, ROUTE_15, Route15, 20, 0, 6, ROUTE_14
	connection east, ROUTE_13, Route13, 0, 0, 9, ROUTE_14
	
	map_header_2 Route13, ROUTE_13, 65, NORTH | WEST
	connection north, ROUTE_12, Route12, 18, 0, 12, ROUTE_13
	connection west, ROUTE_14, Route14, 0, 0, 9, ROUTE_13
	
	map_header_2 Route12, ROUTE_12, 65, SOUTH | WEST
	connection south, ROUTE_13, Route13, 0, 18, 12, ROUTE_12
	connection west, ROUTE_11, Route11, 0, 3, 8, ROUTE_12
	
	map_header_2 Route11, ROUTE_11, 13, WEST | EAST
	connection west, VERMILION_CITY, VermilionCity, -1, 0, 14, ROUTE_11
	connection east, ROUTE_12, Route12, 3, 0, 6, ROUTE_11
	
	map_header_2 CinnabarIsland, CINNABAR_ISLAND, 65, 0
	
	map_header_2 ButwalIslandUnderwaterEast, BUTWAL_ISLAND_UNDERWATER_EAST, 9, WEST
	connection west, BUTWAL_ISLAND_UNDERWATER_WEST, ButwalIslandUnderwaterWest, 0, 0, 12, BUTWAL_ISLAND_UNDERWATER_EAST
	
	map_header_2 ButwalIslandUnderwaterWest, BUTWAL_ISLAND_UNDERWATER_WEST, 9, EAST
	connection east, BUTWAL_ISLAND_UNDERWATER_EAST, ButwalIslandUnderwaterEast, 0, 0, 12, BUTWAL_ISLAND_UNDERWATER_WEST
	
	map_header_2 Route70, ROUTE_70, 53, WEST | EAST
	connection west, PUMMELO_ISLAND, PummeloIsland, 5, 13, 6, ROUTE_70
	connection east, TARROCO_ISLAND, TarrocoIsland, -2, 9, 11, ROUTE_70
	
	map_header_2 TarrocoIsland, TARROCO_ISLAND, 53, WEST | EAST
	connection west, ROUTE_70, Route70, 9, -2, 11, TARROCO_ISLAND
	connection east, ROUTE_71, Route71, 10, 10, 10, TARROCO_ISLAND
	
	map_header_2 Route71, ROUTE_71, 53, WEST | EAST
	connection west, TARROCO_ISLAND, TarrocoIsland, 10, 10, 10, ROUTE_71
	connection east, ROUTE_71_EAST, Route71East, 6, 6, 14, ROUTE_71
	
	map_header_2 Route71East, ROUTE_71_EAST, 53, WEST
	connection west, ROUTE_71, Route71, 6, 6, 14, ROUTE_71_EAST
	
	map_header_2 ShamoutiIsland, SHAMOUTI_ISLAND, 53, NORTH | EAST
	connection north, SHAMOUTI_NORTH_BEACH, ShamoutiNorthBeach, 8, 4, 7, SHAMOUTI_ISLAND
	connection east, SHAMOUTI_BAY, ShamoutiBay, 2, 0, 15, SHAMOUTI_ISLAND
	
	map_header_2 ShamoutiNorthBeach, SHAMOUTI_NORTH_BEACH, 53, NORTH | SOUTH
	connection north, LIGHTNING_ISLAND, LightningIsland, 0, 10, 15, SHAMOUTI_NORTH_BEACH
	connection south, SHAMOUTI_ISLAND, ShamoutiIsland, 4, 8, 7, SHAMOUTI_NORTH_BEACH
	
	map_header_2 ShamoutiBay, SHAMOUTI_BAY, 53, WEST
	connection west, SHAMOUTI_ISLAND, ShamoutiIsland, -2, 0, 15, SHAMOUTI_BAY
	
	map_header_2 LightningIsland, LIGHTNING_ISLAND, 53, SOUTH | WEST
	connection south, SHAMOUTI_NORTH_BEACH, ShamoutiNorthBeach, 10, 0, 15, LIGHTNING_ISLAND
	connection west, ICE_ISLAND, IceIsland, 0, 4, 14, LIGHTNING_ISLAND

	map_header_2 IceIsland, ICE_ISLAND, 53, EAST
	connection east, LIGHTNING_ISLAND, LightningIsland, 4, 0, 15, ICE_ISLAND
	
	map_header_2 HamlinIsland, HAMLIN_ISLAND, 19, 0
	map_header_2 HamlinBridge, HAMLIN_BRIDGE, 19, 0

	map_header_2 PokeCenter2F, POKECENTER_2F, 0, 0
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
	map_header_2 DayCare, DAYCARE, 0, 0
	map_header_2 MandarinDesert, MANDARIN_DESERT, 21, 0
	map_header_2 Trovitopolis, TROVITOPOLIS, 53, 0
	map_header_2 TrovitopolisSewer, TROVITOPOLIS_SEWER, 0, 0
	map_header_2 TrovitaIsland, TROVITA_ISLAND, 53, 0
	map_header_2 TrovitopolisDeptStore1F, TROVITOPOLIS_DEPT_STORE_1F, 0, 0
	map_header_2 TrovitopolisDeptStore2F, TROVITOPOLIS_DEPT_STORE_2F, $0, 0
	map_header_2 TrovitopolisDeptStore3F, TROVITOPOLIS_DEPT_STORE_3F, $0, 0
	map_header_2 TrovitopolisDeptStore4F, TROVITOPOLIS_DEPT_STORE_4F, $0, 0
	map_header_2 TrovitopolisDeptStore5F, TROVITOPOLIS_DEPT_STORE_5F, $0, 0
	map_header_2 TrovitopolisDeptStore6F, TROVITOPOLIS_DEPT_STORE_6F, 0, 0
	map_header_2 TrovitopolisDeptStoreElevator, TROVITOPOLIS_DEPT_STORE_ELEVATOR, $0, 0
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
	map_header_2 KinnowShowboatGate, KINNOW_SHOWBOAT_GATE, $0, 0
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
	map_header_2 Route69Gate, ROUTE_69_GATE, $0, 0
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


	map_header_2 PalletTown, PALLET_TOWN, 6, 0
	map_header_2 RedsHouse1F, REDS_HOUSE_1F, $0, 0
	map_header_2 RedsHouse2F, REDS_HOUSE_2F, $0, 0
	map_header_2 BluesHouse, BLUES_HOUSE, $0, 0
	map_header_2 OaksLab, OAKS_LAB, $0, 0
	map_header_2 SafariZone, SAFARI_ZONE, 44, 0
	map_header_2 CyberSpace, CYBER_SPACE, 0, 0