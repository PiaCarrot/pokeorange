MapTriggers:: ; 4d01e
; Map triggers

trigger_def: MACRO
; db group, map
; dw address
	map \1
	dw \2
ENDM

	trigger_def POKECENTER_2F,               wPokecenter2FTrigger
	trigger_def TRADE_CENTER,                wTradeCenterTrigger
	trigger_def COLOSSEUM,                   wColosseumTrigger
	trigger_def TIME_CAPSULE,                wTimeCapsuleTrigger
	trigger_def HALL_OF_FAME,                wHallOfFameTrigger
	trigger_def NEW_BARK_TOWN,               wNewBarkTownTrigger
	trigger_def ELMS_LAB,                    wElmsLabTrigger
	trigger_def KRISS_HOUSE_1F,              wKrissHouse1FTrigger
	trigger_def ROUTE_29,                    wRoute29Trigger
	trigger_def ROUTE_32_RUINS_OF_ALPH_GATE, wRoute32RuinsOfAlphGateTrigger
	trigger_def VALENCIA_PORT,               wOlivinePortTrigger
	trigger_def TANGELO_PORT,                wVermilionPortTrigger
	trigger_def MANDARIN_UNDERGROUND,        wMandarinUndergroundTrigger
	trigger_def ROUTE_56_WEST,               wRoute56WestTrigger

	db -1
; 4d15b
