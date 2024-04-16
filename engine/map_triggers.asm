MapTriggers:: ; 4d01e
; Map triggers

trigger_def: MACRO
; db group, map
; dw address
	map \1
	dw \2
ENDM

	trigger_def POKECENTER_2F,                wPokecenter2FTrigger
	trigger_def TRADE_CENTER,                 wTradeCenterTrigger
	trigger_def COLOSSEUM,                    wColosseumTrigger
	trigger_def HALL_OF_FAME,                 wHallOfFameTrigger
	trigger_def KRISS_HOUSE_1F,               wKrissHouse1FTrigger
	trigger_def VALENCIA_ISLAND,              wValenciaIslandTrigger
	trigger_def IVYS_LAB,                     wIvysLabTrigger
	trigger_def ROUTE_49,                     wRoute49Trigger
	trigger_def MIKAN_ISLAND_ROUTE_53_GATE,   wMikanIslandRoute53GateTrigger
	trigger_def VALENCIA_PORT,                wValenciaPortTrigger
	trigger_def TANGELO_PORT,                 wTangeloPortTrigger
	trigger_def MANDARIN_UNDERGROUND_BF2,     wMandarinUndergroundBF2Trigger
	trigger_def MANDARIN_UNDERGROUND_BF3,     wMandarinUndergroundBF3Trigger
	trigger_def ROUTE_56_WEST,                wRoute56WestTrigger
	trigger_def UNNAMED_ISLAND_1_POKE_CENTER, wUnnamedIsland1PokeCenterTrigger
	trigger_def ROUTE_60,                     wRoute60Trigger
	trigger_def ROUTE_61,                     wRoute61Trigger
	trigger_def GOLDEN_ISLAND,                wGoldenIslandTrigger
	trigger_def MURCOTT_ISLAND,				  wMurcottIslandTrigger
	trigger_def TROVITOPOLIS_PORT,			  wTrovitopolisPortTrigger
	trigger_def MAYORS_OFFICE_MEETING_ROOM,   wMayorsOfficeMeetingRoomTrigger
	trigger_def CLEOPATRA_ISLAND,			  wCleopatraIslandTrigger
	trigger_def FUKUHARA_NO_4_BF1,			  wFukuharaNo4BF1Trigger
	trigger_def ROUTE_63_NORTH_SOUTH, 		  wRoute63NorthSouthTrigger
	trigger_def BUTWAL_ISLAND_WEST,			  wButwalIslandWestTrigger
	trigger_def TARROCO_ISLAND,				  wTarrocoIslandTrigger
	trigger_def KUMQUAT_HOTEL_LOBBY,		  wKumquatHotelLobbyTrigger
	trigger_def PUMMELO_ISLAND,		  		  wPummeloIslandTrigger
	trigger_def AIRSHIP_CUTSCENE,		  	  wAirshipCutsceneTrigger
	trigger_def AIRSHIP_INTERIOR,		  	  wAirshipInteriorTrigger
	trigger_def ICE_ISLAND,		  	 		  wIceIslandTrigger
	trigger_def SUNRAY_CAVE_MANDARIN_DESERT_1F, wSunrayCaveTrigger
	trigger_def ROUTE_51,		  	 		  wRoute51Trigger
	trigger_def DAYCARE,		  	 		  wDayCareTrigger

	db -1
; 4d15b
