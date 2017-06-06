	map_header_2 NewBarkTown, NEW_BARK_TOWN, 32, WEST
	connection west, ROUTE_29, Route29, 0, 2, 9, NEW_BARK_TOWN

	map_header_2 CherrygroveCity, CHERRYGROVE_CITY, 53, NORTH
	connection north, ROUTE_30, Route30, 5, 0, 10, CHERRYGROVE_CITY

	map_header_2 VioletCity, VIOLET_CITY, 32, SOUTH
	connection south, ROUTE_32, Route32, 0, 0, 11, VIOLET_CITY

	map_header_2 Route29, ROUTE_29, 32, EAST
	connection east, NEW_BARK_TOWN, NewBarkTown, 2, 0, 9, ROUTE_29

	map_header_2 Route30, ROUTE_30, 32, EAST | SOUTH
	connection south, CHERRYGROVE_CITY, CherrygroveCity, -3, 2, 16, ROUTE_30
	connection east, ROUTE_31, Route31, 8, 0, 14, ROUTE_30

	map_header_2 Route31, ROUTE_31, 32, WEST
	connection west, ROUTE_30, Route30, -8, 0, 24, ROUTE_31
	
	map_header_2 Route32, ROUTE_32, 53, NORTH
	connection north, VIOLET_CITY, VioletCity, 0, 0, 11, ROUTE_32

	map_header_2 Route33, ROUTE_33, 53, SOUTH | NORTH
	connection north, ROUTE54, Route54, 21, 1, 10, ROUTE_33
	connection south, SUNBURST_ISLAND, SunburstIsland, 21, 11, 9, ROUTE_33
	
	map_header_2 SunburstIsland, SUNBURST_ISLAND, 53, NORTH
	connection north, ROUTE_33, Route33, 10, 20, 9, SUNBURST_ISLAND
	
	map_header_2 Route54, ROUTE54, 53, NORTH | SOUTH
	connection north, MANDARINNORTH, MandarinNorth, 0, 4, 11, ROUTE54
	connection south, ROUTE_33, Route33, 0, 20, 11, ROUTE54
	
	map_header_2 MandarinNorth, MANDARINNORTH, 32, SOUTH
	connection south, ROUTE54, Route54, 4, 0, 10, MANDARINNORTH
	
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

	map_header_2 NationalPark, NATIONAL_PARK, $0, 0
	map_header_2 NationalParkBugContest, NATIONAL_PARK_BUG_CONTEST, $0, 0
	map_header_2 WarehouseEntrance, WAREHOUSE_ENTRANCE, $0, 0
	map_header_2 UndergroundPathSwitchRoomEntrances, UNDERGROUND_PATH_SWITCH_ROOM_ENTRANCES, $0, 0
	map_header_2 IlexForest, ILEX_FOREST, 5, 0
	map_header_2 IcePath1F, ICE_PATH_1F, $9, 0
	map_header_2 IcePathB1F, ICE_PATH_B1F, $19, 0
	map_header_2 IcePathB2FMahoganySide, ICE_PATH_B2F_MAHOGANY_SIDE, $19, 0
	map_header_2 IcePathB2FBlackthornSide, ICE_PATH_B2F_BLACKTHORN_SIDE, $19, 0
	map_header_2 IcePathB3F, ICE_PATH_B3F, $19, 0
	map_header_2 CinnabarPokeCenter1F, CINNABAR_POKECENTER_1F, $0, 0
	map_header_2 VioletMart, VIOLET_MART, $0, 0
	map_header_2 VioletGym, VIOLET_GYM, 0, 0
	map_header_2 VioletNicknameSpeechHouse, VIOLET_NICKNAME_SPEECH_HOUSE, $0, 0
	map_header_2 VioletPokeCenter1F, VIOLET_POKECENTER_1F, $0, 0
	map_header_2 VioletOnixTradeHouse, VIOLET_ONIX_TRADE_HOUSE, $0, 0
	map_header_2 Route32RuinsofAlphGate, ROUTE_32_RUINS_OF_ALPH_GATE, 0, 0
	map_header_2 Route32PokeCenter1F, ROUTE_32_POKECENTER_1F, 0, 0
	map_header_2 Route34IlexForestGate, ROUTE_34_ILEX_FOREST_GATE, $0, 0
	map_header_2 DayCare, DAYCARE, $0, 0
	map_header_2 RedsHouse1F, REDS_HOUSE_1F, $0, 0
	map_header_2 RedsHouse2F, REDS_HOUSE_2F, $0, 0
	map_header_2 BluesHouse, BLUES_HOUSE, $0, 0
	map_header_2 OaksLab, OAKS_LAB, $0, 0
	map_header_2 ValenciaPort, VALENCIA_PORT, 10, 0
	map_header_2 TangeloPort, TANGELO_PORT, $a, 0
	map_header_2 OlivinePortPassage, OLIVINE_PORT_PASSAGE, 0, 0
	map_header_2 VermilionPortPassage, VERMILION_PORT_PASSAGE, $0, 0
	map_header_2 HallOfFame, HALL_OF_FAME, $0, 0
	map_header_2 PokeCenter2F, POKECENTER_2F, $0, 0
	map_header_2 TradeCenter, TRADE_CENTER, $0, 0
	map_header_2 Colosseum, COLOSSEUM, $0, 0
	map_header_2 TimeCapsule, TIME_CAPSULE, $0, 0
	map_header_2 ElmsLab, ELMS_LAB, 0, 0
	map_header_2 KrissHouse1F, KRISS_HOUSE_1F, 0, 0
	map_header_2 KrissHouse2F, KRISS_HOUSE_2F, $0, 0
	map_header_2 KrissNeighborsHouse, KRISS_NEIGHBORS_HOUSE, $0, 0
	map_header_2 ElmsHouse, ELMS_HOUSE, 0, 0
	map_header_2 CherrygroveMart, CHERRYGROVE_MART, $0, 0
	map_header_2 CherrygrovePokeCenter1F, CHERRYGROVE_POKECENTER_1F, $0, 0
	map_header_2 CherrygroveGymSpeechHouse, CHERRYGROVE_GYM_SPEECH_HOUSE, $0, 0
	map_header_2 CherrygroveEvolutionSpeechHouse, CHERRYGROVE_EVOLUTION_SPEECH_HOUSE, 0, 0
	map_header_2 Route31VioletGate, ROUTE_31_VIOLET_GATE, $0, 0
	map_header_2 MandarinNorthPokeCenter, MANDARIN_NORTH_POKECENTER, 0, 0
	map_header_2 MandarinNorthNameRater, MANDARIN_NORTH_NAME_RATER, 0, 0
	map_header_2 MandarinNorthSmallHouse, MANDARIN_NORTH_SMALL_HOUSE, 0, 0
	map_header_2 MandarinNorthLargeHouse, MANDARIN_NORTH_LARGE_HOUSE, 0, 0
	map_header_2 MandarinUnderground, MANDARIN_UNDERGROUND, 0, 0
	map_header_2 MandarinNorthMart, MANDARIN_NORTH_MART, 0, 0
	map_header_2 CrystalCave1F, CRYSTAL_CAVE_1F, 0, 0
	map_header_2 SunburstPokeCenter, SUNBURST_POKECENTER, 0, 0
	map_header_2 CrystalCaveB1, CRYSTAL_CAVE_B1, 0, 0
	map_header_2 SunburstSmallHouse, SUNBURST_SMALL_HOUSE, 0, 0
	map_header_2 SunburstLargeHouse, SUNBURST_LARGE_HOUSE, 0, 0
	map_header_2 SunburstSouthHouse, SUNBURST_SOUTH_HOUSE, 0, 0
	map_header_2 SunburstCrystalShop, SUNBURST_CRYSTAL_SHOP, 0, 0
	map_header_2 Route55QuestHouse, ROUTE_55_QUEST_HOUSE, 0, 0
	map_header_2 Route56PokeCenter, ROUTE_56_POKE_CENTER, 0, 0
