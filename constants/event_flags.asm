	const_def

;01:d952 EventFlags

;These first eight flags are reset upon reloading the map.
	const EVENT_TEMPORARY_1											;byte $D952, bit 0
	const EVENT_TEMPORARY_2											;byte $D952, bit 1
	const EVENT_TEMPORARY_3											;byte $D952, bit 2
	const EVENT_TEMPORARY_4											;byte $D952, bit 3
	const EVENT_TEMPORARY_5											;byte $D952, bit 4
	const EVENT_TEMPORARY_6											;byte $D952, bit 5
	const EVENT_TEMPORARY_7											;byte $D952, bit 6
	const EVENT_TEMPORARY_8											;byte $D952, bit 7

;Story events
	const EVENT_INITIALIZED_EVENTS									;byte $D953, bit 0
	const EVENT_LISTENED_TO_INITIAL_RADIO							;byte $D953, bit 1
	const EVENT_TOWN_MAP_OBTAINED									;byte $D953, bit 2
	const EVENT_GOT_A_POKEMON_FROM_IVY								;byte $D953, bit 3
	const EVENT_GOT_BULBASAUR_FROM_IVY								;byte $D953, bit 4
	const EVENT_GOT_CHARMANDER_FROM_IVY								;byte $D953, bit 5
	const EVENT_GOT_SQUIRTLE_FROM_IVY								;byte $D953, bit 6
	const EVENT_GOT_GS_BALL_FROM_TRACEY								;byte $D953, bit 7
	const EVENT_SHOWED_GS_BALL_TO_IVY								;byte $D954, bit 0


	const EVENT_GOT_OLD_ROD											;byte $D954, bit 1
	const EVENT_GOT_TM_BUBBLEBEAM									;byte $D954, bit 2
	const EVENT_GOT_SHARP_BEAK										;byte $D954, bit 3
	const EVENT_EXPLODING_TRAP_1									;byte $D954, bit 4
	const EVENT_EXPLODING_TRAP_2									;byte $D954, bit 5
	const EVENT_EXPLODING_TRAP_3									;byte $D954, bit 6
	const EVENT_EXPLODING_TRAP_4									;byte $D954, bit 7

	const EVENT_EXPLODING_TRAP_5									;byte $D955, bit 0
	const EVENT_EXPLODING_TRAP_6									;byte $D955, bit 1
	const EVENT_EXPLODING_TRAP_7									;byte $D955, bit 2
	const EVENT_EXPLODING_TRAP_8									;byte $D955, bit 3
	const EVENT_EXPLODING_TRAP_9									;byte $D955, bit 4
	const EVENT_GOT_CHARCOAL										;byte $D955, bit 5
	const EVENT_GOT_SKATEBOARD										;byte $D955, bit 6
	const EVENT_GOT_TM_HAIL											;byte $D955, bit 7
	
	const EVENT_SEVEN_GRAPEFRUITS_SNORLAX							;byte $D956, bit 0
	const EVENT_HEADBUTT_GUY										;byte $D956, bit 1
	const EVENT_ROUTE_60_ROCKET										;byte $D956, bit 2
	const EVENT_TEAM_ROCKET_GOLDEN_ISLAND							;byte $D956, bit 3
	const EVENT_SAVED_CAT_ELDER										;byte $D956, bit 4
	const EVENT_CAT_BATTLE_HOUSE_CLEARED							;byte $D956, bit 5
	const EVENT_GOT_CAT_STATUE										;byte $D956, bit 6
	const EVENT_MIMIKYU_FOUGHT										;byte $D956, bit 7
	
	const EVENT_TROVITOPOLIS_SAVED									;byte $D957, bit 0
	const EVENT_GOT_SUPER_ROD										;byte $D957, bit 1
	const EVENT_GOT_TM_FLASH										;byte $D957, bit 2
	const EVENT_GOT_EEVEE											;byte $D957, bit 3
	const EVENT_RECEIVED_SEWER_STARTER								;byte $D957, bit 4
	const EVENT_TROVITOPOLIS_CAN_GO_IN_MAYORS_OFFICE				;byte $D957, bit 5
	const EVENT_ROUTE_62_TRACEY										;byte $D957, bit 6
	const EVENT_TANGELO_JUNGLE_CROSS								;byte $D957, bit 7
	
	const EVENT_MT_NAVEL_CROSS										;byte $D958, bit 0
	const EVENT_MURCOTT_ISLAND_CROSS								;byte $D958, bit 1
	const EVENT_MAYORS_RECEPTIONIST_LEAVES							;byte $D958, bit 2
	const EVENT_TANGELO_HEAL_BALL									;byte $D958, bit 3
	const EVENT_GOT_TM_DOUBLE_TEAM									;byte $D958, bit 4
	const EVENT_GOT_HM_ROCK_SMASH									;byte $D958, bit 5
	const EVENT_RECEIVED_HM_STRENGTH								;byte $D958, bit 6
	const EVENT_CHARITY_LUCKY_EGG									;byte $D958, bit 7
	
	const EVENT_MURCOTT_LUCKY_EGG									;byte $D959, bit 0
	const EVENT_CROSS_MET_ON_CLEOPATRA								;byte $D959, bit 1
	const EVENT_FUKUHARA_BF1_EVENT									;byte $D959, bit 2
	const EVENT_FUKUHARA_BF2_BUTCH_1								;byte $D959, bit 3
	const EVENT_BEAT_BUTCH_FUKUHARA_4								;byte $D959, bit 4
	const EVENT_FUKUHARA_BF3_ROCKETS_DEFEATED						;byte $D959, bit 5
	const EVENT_FUKUHARA_BF3_AERODACTYL_FOUGHT						;byte $D959, bit 6
	const EVENT_GOT_TM_19_FROM_FAN_CLUB								;byte $D959, bit 7
	
	const EVENT_GOT_ILLUSTRATOR_PIKACHU								;byte $D95A, bit 0
	const EVENT_CROSS_DEFEATED_BUTWAL								;byte $D95A, bit 1
	const EVENT_GOT_COIN_CASE										;byte $D95A, bit 2
	const EVENT_ASCORBIA_GOT_METAL_POWDER							;byte $D95A, bit 3
	const EVENT_KUMQUAT_COOLTRAINER_DRAGON_FANG						;byte $D95A, bit 4
	const EVENT_POOL_MASTER_DEFEATED								;byte $D95A, bit 5
	const EVENT_SUITE_MASTER_DEFEATED								;byte $D95A, bit 6
	const EVENT_GOT_TM_PSYCHIC										;byte $D95A, bit 7
	
	const EVENT_GOT_MIRACLE_SEED									;byte $D95B, bit 0
	const EVENT_RECEIVED_KUMQUAT_STARTER							;byte $D95B, bit 1
	const EVENT_BOUGHT_SHINY_MAGIKARP								;byte $D95B, bit 2
	const EVENT_VICTORY_ROAD_TRACEY									;byte $D95B, bit 3
	const EVENT_ELDER_GOT_MEOWTH									;byte $D95B, bit 4
	const EVENT_GOT_ITEMFINDER										;byte $D95B, bit 5
	const EVENT_GOT_PROTECTOR										;byte $D95B, bit 6
	const EVENT_GOT_SHINY_CHARM										;byte $D95B, bit 7
	
	const EVENT_LAPRAS_FAMILY										;byte $D95C, bit 0
	const EVENT_RAYMOND_DEFEATED									;byte $D95C, bit 1
	const EVENT_EON_DUO_WILD										;byte $D95C, bit 2
	const EVENT_SHAMOUTI_QUEST_STARTED								;byte $D95C, bit 3
	const EVENT_MET_LAWRENCE_AT_LIGHTNING_ISLAND					;byte $D95C, bit 4
	const EVENT_OBTAINED_ELECTRIC_ORB								;byte $D95C, bit 5
	const EVENT_OBTAINED_FIRE_ORB									;byte $D95C, bit 6
	const EVENT_OBTAINED_ICE_ORB									;byte $D95C, bit 7
	
	const EVENT_ZAPDOS_FOUGHT										;byte $D95D, bit 0
	const EVENT_ARTICUNO_FOUGHT										;byte $D95D, bit 1
	const EVENT_MOLTRES_FOUGHT										;byte $D95D, bit 2
	const EVENT_LUGIA_FOUGHT										;byte $D95D, bit 3
	const EVENT_MELODY_SENDS_YOU_TO_SHRINE							;byte $D95D, bit 4
	const EVENT_MOLTRES_ESCAPES_AIRSHIP								;byte $D95D, bit 5
	const EVENT_PLAYER_CAPTURE_RING									;byte $D95D, bit 6
	const EVENT_ENTERED_KANTO										;byte $D95D, bit 7
	
	const EVENT_ENTERED_ONCE_ALREADY								;byte $D95E, bit 0
	const EVENT_RECEIVED_ROCK_CLIMB									;byte $D95E, bit 1

																	;Not yet used
	const EVENT_WELCOMED_TO_POKECOM_CENTER							;byte $D95E, bit 2
	const EVENT_GOLDENROD_SALE_OFF									;byte $D95E, bit 3
	const EVENT_GOLDENROD_SALE_ON									;byte $D95E, bit 4
	const EVENT_WAREHOUSE_ENTRANCE_GRAMPS							;byte $D95E, bit 5
	const EVENT_WAREHOUSE_ENTRANCE_GRANNY							;byte $D95E, bit 6
	const EVENT_WAREHOUSE_ENTRANCE_OLDER_HAIRCUT_BROTHER			;byte $D95E, bit 7
	
	const EVENT_WAREHOUSE_ENTRANCE_YOUNGER_HAIRCUT_BROTHER			;byte $D95F, bit 0
	const EVENT_WAREHOUSE_LAYOUT_1									;byte $D95F, bit 1
	const EVENT_WAREHOUSE_LAYOUT_2									;byte $D95F, bit 2
	const EVENT_WAREHOUSE_LAYOUT_3									;byte $D95F, bit 3
	const EVENT_WAREHOUSE_BLOCKED_OFF								;byte $D95F, bit 4

																	;Switch puzzles
	const EVENT_SWITCH_1											;byte $D95F, bit 5
	const EVENT_SWITCH_2											;byte $D95F, bit 6
	const EVENT_SWITCH_3											;byte $D95F, bit 7
	
	const EVENT_SWITCH_4											;byte $D960, bit 0
	const EVENT_SWITCH_5											;byte $D960, bit 1
	const EVENT_SWITCH_6											;byte $D960, bit 2
	const EVENT_SWITCH_7											;byte $D960, bit 3
	const EVENT_SWITCH_8											;byte $D960, bit 4
	const EVENT_SWITCH_9											;byte $D960, bit 5
	const EVENT_SWITCH_10											;byte $D960, bit 6
	const EVENT_SWITCH_11											;byte $D960, bit 7
	
	const EVENT_SWITCH_12											;byte $D961, bit 0
	const EVENT_SWITCH_13											;byte $D961, bit 1
	const EVENT_SWITCH_14											;byte $D961, bit 2
	const EVENT_EMERGENCY_SWITCH									;byte $D961, bit 3

																	;Boulder puzzles
	const EVENT_BOULDER_IN_ICE_PATH_1								;byte $D961, bit 4
	const EVENT_BOULDER_IN_ICE_PATH_1A								;byte $D961, bit 5
	const EVENT_BOULDER_IN_ICE_PATH_2								;byte $D961, bit 6
	const EVENT_BOULDER_IN_ICE_PATH_2A								;byte $D961, bit 7
	
	const EVENT_BOULDER_IN_ICE_PATH_3								;byte $D962, bit 0
	const EVENT_BOULDER_IN_ICE_PATH_3A								;byte $D962, bit 1
	const EVENT_BOULDER_IN_ICE_PATH_4								;byte $D962, bit 2
	const EVENT_BOULDER_IN_ICE_PATH_4A								;byte $D962, bit 3

																	;Bug-Catching Contest
	const EVENT_ROUTE_35_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY		;byte $D962, bit 4
	const EVENT_ROUTE_35_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY	;byte $D962, bit 5
	const EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY		;byte $D962, bit 6
	const EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY	;byte $D962, bit 7
	
	const EVENT_LEFT_MONS_WITH_CONTEST_OFFICER						;byte $D963, bit 0
	const EVENT_CONTEST_OFFICER_HAS_BERRY							;byte $D963, bit 1
	const EVENT_CONTEST_OFFICER_HAS_EVERSTONE						;byte $D963, bit 2
	const EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY						;byte $D963, bit 3
	const EVENT_CONTEST_OFFICER_HAS_SUN_STONE						;byte $D963, bit 4
	const EVENT_WARPED_FROM_ROUTE_35_NATIONAL_PARK_GATE				;byte $D963, bit 5
	const EVENT_BUG_CATCHING_CONTESTANT_1A							;byte $D963, bit 6
	const EVENT_BUG_CATCHING_CONTESTANT_1B							;byte $D963, bit 7
	
	const EVENT_BUG_CATCHING_CONTESTANT_2A							;byte $D964, bit 0
	const EVENT_BUG_CATCHING_CONTESTANT_2B							;byte $D964, bit 1
	const EVENT_BUG_CATCHING_CONTESTANT_3A							;byte $D964, bit 2
	const EVENT_BUG_CATCHING_CONTESTANT_3B							;byte $D964, bit 3
	const EVENT_BUG_CATCHING_CONTESTANT_4A							;byte $D964, bit 4
	const EVENT_BUG_CATCHING_CONTESTANT_4B							;byte $D964, bit 5
	const EVENT_BUG_CATCHING_CONTESTANT_5A							;byte $D964, bit 6
	const EVENT_BUG_CATCHING_CONTESTANT_5B							;byte $D964, bit 7
	
	const EVENT_BUG_CATCHING_CONTESTANT_6A							;byte $D965, bit 0
	const EVENT_BUG_CATCHING_CONTESTANT_6B							;byte $D965, bit 1
	const EVENT_BUG_CATCHING_CONTESTANT_7A							;byte $D965, bit 2
	const EVENT_BUG_CATCHING_CONTESTANT_7B							;byte $D965, bit 3
	const EVENT_BUG_CATCHING_CONTESTANT_8A							;byte $D965, bit 4
	const EVENT_BUG_CATCHING_CONTESTANT_8B							;byte $D965, bit 5
	const EVENT_BUG_CATCHING_CONTESTANT_9A							;byte $D965, bit 6
	const EVENT_BUG_CATCHING_CONTESTANT_9B							;byte $D965, bit 7
	
	const EVENT_BUG_CATCHING_CONTESTANT_10A							;byte $D966, bit 0
	const EVENT_BUG_CATCHING_CONTESTANT_10B							;byte $D966, bit 1

;Trainer flags
	;CISSY
	const EVENT_BEAT_CISSY											;byte $D966, bit 2
	;DANNY
	const EVENT_BEAT_DANNY											;byte $D966, bit 3
	;RUDY
	const EVENT_BEAT_RUDY											;byte $D966, bit 4
	;LUANA
	const EVENT_BEAT_LUANA											;byte $D966, bit 5
	;DRAKE
	const EVENT_BEAT_ORANGE_LEAGUE									;byte $D966, bit 6
	;TRACEY
	;BROCK
	const EVENT_BEAT_BROCK											;byte $D966, bit 7

	;;;;;;;;;;;;;;;;;;;;;

	;MISTY
	;LT_SURGE
	;ERIKA
	;KOGA
	;SABRINA
	;BLAINE
	;GIOVANNI
	;LORELEI
	const EVENT_BEAT_LORELEI										;byte $D967, bit 0
	;BRUNO
	;AGATHA
	;LANCE
	;RED
	const EVENT_BEAT_RED											;byte $D967, bit 1
	;BLUE
	;GREEN
	;YELLOW
	;CAL
	;BUTCH
	;CASSIDY
	;CASSIDY_BUTCH
	;JAMES
	;JESSIE
	;JESSIE_JAMES
	;MOM
	;BILL
	;IMAKUNI
	;LAWRENCE
	const EVENT_BEAT_LAWRENCE_ICE_ISLAND							;byte $D967, bit 2
	const EVENT_BEAT_LAWRENCE										;byte $D967, bit 3
	;PROF_IVY
	;PROF_AIDE
	;NURSE
	;OFFICER
	const EVENT_BEAT_JENNY_1										;byte $D967, bit 4
	const EVENT_BEAT_JENNY_2										;byte $D967, bit 5
	const EVENT_BEAT_JENNY_3										;byte $D967, bit 6
	const EVENT_BEAT_JENNY_4										;byte $D967, bit 7

	;;;;;;;;;;;;;;;;;;;;;

	;YOUNGSTER
	const EVENT_BEAT_YOUNGSTER_KOJI									;byte $D968, bit 0
	const EVENT_BEAT_YOUNGSTER_TOUYA								;byte $D968, bit 1
	const EVENT_BEAT_YOUNGSTER_KOUTA								;byte $D968, bit 2
	const EVENT_BEAT_YOUNGSTER_NESS									;byte $D968, bit 3
	const EVENT_BEAT_YOUNGSTER_HIRUMA								;byte $D968, bit 4
	const EVENT_BEAT_YOUNGSTER_ORO									;byte $D968, bit 5
	const EVENT_BEAT_YOUNGSTER_EVE									;byte $D968, bit 6
	;LASS
	const EVENT_BEAT_LASS_NICOLE									;byte $D968, bit 7

	;;;;;;;;;;;;;;;;;;;;;

	const EVENT_BEAT_LASS_FUYUMI									;byte $D969, bit 0
	const EVENT_BEAT_LASS_RILEY										;byte $D969, bit 1
	const EVENT_BEAT_LASS_LOLA										;byte $D969, bit 2
	const EVENT_BEAT_LASS_TORI										;byte $D969, bit 3
	;BEAUTY
	;BUG_CATCHER
	const EVENT_BEAT_BUG_CATCHER_KATTA								;byte $D969, bit 4
	const EVENT_BEAT_BUG_CATCHER_SAM								;byte $D969, bit 5
	const EVENT_BEAT_BUG_CATCHER_MIKE								;byte $D969, bit 6
	const EVENT_BEAT_BUG_CATCHER_MUSHI								;byte $D969, bit 7

	;;;;;;;;;;;;;;;;;;;;;
	
	const EVENT_BEAT_BUG_CATCHER_ALEX								;byte $D96A, bit 0
	;BUG_CATCHER_F
	const EVENT_BEAT_BUG_CATCHERF_ALIA								;byte $D96A, bit 1
	;SWIMMERM
	const EVENT_BEAT_SWIMMERM_KOJURO								;byte $D96A, bit 2
	const EVENT_BEAT_SWIMMERM_YOUTA									;byte $D96A, bit 3
	const EVENT_BEAT_SWIMMERM_HAIRO									;byte $D96A, bit 4
	const EVENT_BEAT_SWIMMERM_DAISUKE								;byte $D96A, bit 5
	const EVENT_BEAT_SWIMMERM_JUNPEI								;byte $D96A, bit 6
	const EVENT_BEAT_SWIMMERM_KOSUKE								;byte $D96A, bit 7

	;;;;;;;;;;;;;;;;;;;;;

	const EVENT_BEAT_SWIMMERM_NAOYA									;byte $D96B, bit 0
	const EVENT_BEAT_SWIMMERM_ATECAIN								;byte $D96B, bit 1
	const EVENT_BEAT_SWIMMERM_THEO									;byte $D96B, bit 2
	const EVENT_BEAT_SWIMMERM_KAZUMA								;byte $D96B, bit 3
	const EVENT_BEAT_SWIMMERM_TAKAO									;byte $D96B, bit 4
	;SWIMMERF
	const EVENT_BEAT_SWIMMERF_MARIA									;byte $D96B, bit 5
	const EVENT_BEAT_SWIMMERF_REINA									;byte $D96B, bit 6
	const EVENT_BEAT_SWIMMERF_UMIKO									;byte $D96B, bit 7
	
	;;;;;;;;;;;;;;;;;;;;;

	const EVENT_BEAT_SWIMMERF_MAYUMI								;byte $D96C, bit 0
	const EVENT_BEAT_SWIMMERF_YAEKO									;byte $D96C, bit 1
	const EVENT_BEAT_SWIMMERF_SAKAKO								;byte $D96C, bit 2
	const EVENT_BEAT_SWIMMERF_YUKA									;byte $D96C, bit 3
	const EVENT_BEAT_SWIMMERF_LULU									;byte $D96C, bit 4
	const EVENT_BEAT_SWIMMERF_MELLY									;byte $D96C, bit 5
	const EVENT_BEAT_SWIMMERF_SALLY									;byte $D96C, bit 6
	const EVENT_BEAT_SWIMMERF_RUE									;byte $D96C, bit 7

	;;;;;;;;;;;;;;;;;;;;;

	;CAMPER
	const EVENT_BEAT_CAMPER_SAMM									;byte $D96D, bit 0
	const EVENT_BEAT_CAMPER_NEB										;byte $D96D, bit 1
	const EVENT_BEAT_CAMPER_SNYD									;byte $D96D, bit 2
	;POKEMANIAC
	const EVENT_BEAT_POKEMANIAC_SHAWN								;byte $D96D, bit 3
	const EVENT_BEAT_POKEMANIAC_KUSATO								;byte $D96D, bit 4
	const EVENT_BEAT_POKEMANIAC_MATT								;byte $D96D, bit 5
	;FISHER
	const EVENT_BEAT_FISHER_SOJIRO									;byte $D96D, bit 6
	const EVENT_BEAT_FISHER_FUGU									;byte $D96D, bit 7

	;;;;;;;;;;;;;;;;;;;;;

	const EVENT_BEAT_FISHER_NAT_PAGLE								;byte $D96E, bit 0
	const EVENT_BEAT_FISHER_NOBU									;byte $D96E, bit 1
	const EVENT_BEAT_FISHER_ISAO									;byte $D96E, bit 2
	const EVENT_BEAT_FISHER_YUUTA									;byte $D96E, bit 3
	const EVENT_BEAT_FISHER_SHINJI									;byte $D96E, bit 4
	const EVENT_BEAT_FISHER_MIYAGI									;byte $D96E, bit 5
	const EVENT_BEAT_FISHER_KUNAI									;byte $D96E, bit 6
	const EVENT_BEAT_FISHER_YAMATO									;byte $D96E, bit 7

	;;;;;;;;;;;;;;;;;;;;;

	const EVENT_BEAT_FISHER_SHO										;byte $D96F, bit 0
	const EVENT_BEAT_FISHER_GIN										;byte $D96F, bit 1
	const EVENT_BEAT_FISHER_STEPHEN									;byte $D96F, bit 2
	;HIKER
	const EVENT_BEAT_HIKER_TEPPEI									;byte $D96F, bit 3
	const EVENT_BEAT_HIKER_SOUR										;byte $D96F, bit 4
	;ATHLETE
	const EVENT_BEAT_ATHLETE_HIDEKI									;byte $D96F, bit 5
	const EVENT_BEAT_ATHLETE_KAITO									;byte $D96F, bit 6
	const EVENT_BEAT_ATHLETE_JIMBO									;byte $D96F, bit 7

	;;;;;;;;;;;;;;;;;;;;;

	const EVENT_BEAT_ATHLETE_BARNEY									;byte $D970, bit 0
	const EVENT_BEAT_ATHLETE_BRUCE									;byte $D970, bit 1
	const EVENT_BEAT_ATHLETE_JACK									;byte $D970, bit 2
	const EVENT_BEAT_ATHLETE_LARS									;byte $D970, bit 3
	const EVENT_BEAT_ATHLETE_ED										;byte $D970, bit 4
	const EVENT_BEAT_ATHLETE_JUAN									;byte $D970, bit 5
	;SIGHTSEERM
	const EVENT_BEAT_SIGHTSEERM_MICHIO								;byte $D970, bit 6
	const EVENT_BEAT_SIGHTSEERM_KENTA								;byte $D970, bit 7

	;;;;;;;;;;;;;;;;;;;;;

	const EVENT_BEAT_SIGHTSEERM_HYOU								;byte $D971, bit 0
	const EVENT_BEAT_SIGHTSEERM_CORAL								;byte $D971, bit 1
	;SIGHTSEERF
	const EVENT_BEAT_SIGHTSEERF_ASAMI								;byte $D971, bit 2
	const EVENT_BEAT_SIGHTSEERF_ARASHI								;byte $D971, bit 3
	const EVENT_BEAT_SIGHTSEERF_LANA								;byte $D971, bit 4
	const EVENT_BEAT_SIGHTSEERF_FLORA								;byte $D971, bit 5
	;WAITRESS
	const EVENT_BEAT_WAITRESS_SATOMI								;byte $D971, bit 6
	const EVENT_BEAT_WAITRESS_SAORI									;byte $D971, bit 7

	;;;;;;;;;;;;;;;;;;;;;

	const EVENT_BEAT_WAITRESS_NAOMI									;byte $D972, bit 0
	const EVENT_BEAT_WAITRESS_JUN									;byte $D972, bit 1
	;COOLTRAINERM
	const EVENT_BEAT_COOLTRAINERM_AKIRA								;byte $D972, bit 2
	const EVENT_BEAT_COOLTRAINERM_KATSUO							;byte $D972, bit 3
	const EVENT_BEAT_COOLTRAINERM_SON								;byte $D972, bit 4
	const EVENT_BEAT_COOLTRAINERM_TAD								;byte $D972, bit 5
	const EVENT_BEAT_COOLTRAINERM_YUUJI								;byte $D972, bit 6
	const EVENT_BEAT_COOLTRAINERM_SEI								;byte $D972, bit 7

	;;;;;;;;;;;;;;;;;;;;;

	const EVENT_BEAT_COOLTRAINER_M_KUBO								;byte $D973, bit 0
	const EVENT_BEAT_COOLTRAINER_M_NAGI								;byte $D973, bit 1
	const EVENT_BEAT_COOLTRAINER_M_TRAD								;byte $D973, bit 2
	const EVENT_BEAT_COOLTRAINER_M_DAVID							;byte $D973, bit 3
	const EVENT_BEAT_COOLTRAINERM_FABIO								;byte $D973, bit 4
	const EVENT_BEAT_COOLTRAINERM_MIKE								;byte $D973, bit 5
	const EVENT_BEAT_COOLTRAINERM_MAKO								;byte $D973, bit 6
	;COOLTRAINERF
	const EVENT_BEAT_COOLTRAINERF_KEIKO								;byte $D973, bit 7

	;;;;;;;;;;;;;;;;;;;;;

	const EVENT_BEAT_COOLTRAINERF_MORIKO							;byte $D974, bit 0
	const EVENT_BEAT_COOLTRAINERF_AIRI								;byte $D974, bit 1
	const EVENT_BEAT_COOLTRAINERF_REIKA								;byte $D974, bit 2
	const EVENT_BEAT_COOLTRAINERF_MARY								;byte $D974, bit 3
	const EVENT_BEAT_COOLTRAINERF_LIZ								;byte $D974, bit 4
	const EVENT_BEAT_COOLTRAINERF_GRANNY							;byte $D974, bit 5
	const EVENT_BEAT_COOLTRAINERF_NUUK								;byte $D974, bit 6
	;CATMAN
	const EVENT_BEAT_CATMAN_MAYO									;byte $D974, bit 7

	;;;;;;;;;;;;;;;;;;;;;

	;BIRDKEEPER
	const EVENT_BEAT_BIRDKEEPER_TATSUYA								;byte $D975, bit 0
	const EVENT_BEAT_BIRDKEEPER_DWIGHT								;byte $D975, bit 1
	const EVENT_BEAT_BIRDKEEPER_CID									;byte $D975, bit 2
	;OTAKU
	const EVENT_BEAT_OTAKU_NIRO										;byte $D975, bit 3
	const EVENT_BEAT_OTAKU_GODO										;byte $D975, bit 4
	const EVENT_BEAT_OTAKU_JAKE										;byte $D975, bit 5
	const EVENT_BEAT_OTAKU_DOC										;byte $D975, bit 6
	const EVENT_BEAT_OTAKU_ABE										;byte $D975, bit 7

	;;;;;;;;;;;;;;;;;;;;;

	const EVENT_BEAT_OTAKU_RWNE										;byte $D976, bit 0
	;GENTLEMAN
	;TEACHER
	;SAILOR
	;SUPER_NERD
	;GUITARIST
	;BIKER
	;FIREBREATHER
	;JUGGLER
	;BLACKBELT_T
	const EVENT_BEAT_BLACKBELT_KEN									;byte $D976, bit 1
	const EVENT_BEAT_BLACKBELT_STEPPO								;byte $D976, bit 2
	;PSYCHIC_T
	;PICNICKER
	;SAGE
	;MEDIUM
	;POKEFANM
	;POKEFANF
	;DIVER_M
	const EVENT_BEAT_DIVER_OKABE									;byte $D976, bit 3
	const EVENT_BEAT_DIVER_HIROSHI									;byte $D976, bit 4
	const EVENT_BEAT_DIVERM_CAOS									;byte $D976, bit 5
	const EVENT_BEAT_DIVERM_MONSTA									;byte $D976, bit 6
	;DIVER_F
	const EVENT_BEAT_DIVER_MAYURI									;byte $D976, bit 7

	;;;;;;;;;;;;;;;;;;;;;

	const EVENT_BEAT_DIVER_AMI										;byte $D977, bit 0
	;ENGINEER
	const EVENT_BEAT_ENGINEER_TAKE									;byte $D977, bit 1
	const EVENT_BEAT_ENGINEER_MURA									;byte $D977, bit 2
	const EVENT_BEAT_ENGINEER_KOBE									;byte $D977, bit 3
	const EVENT_BEAT_ENGINEER_KALARIE								;byte $D977, bit 4
	;RAYMOND
	;CROOK
	;SCUZ
	const EVENT_BEAT_PIRATE_LACKEY_1								;byte $D977, bit 5
		
;Hidden items
	const EVENT_VALENCIA_PORT_HIDDEN_SUPER_POTION					;byte $D977, bit 6
	const EVENT_ROUTE_50_HIDDEN_POTION								;byte $D977, bit 7
	
	const EVENT_TANGELO_JUNGLE_HIDDEN_ETHER							;byte $D978, bit 0
	const EVENT_TANGELO_JUNGLE_HIDDEN_SUPER_POTION					;byte $D978, bit 1
	const EVENT_TANGELO_JUNGLE_HIDDEN_FULL_HEAL						;byte $D978, bit 2
	const EVENT_ROUTE_52_HIDDEN_GREAT_BALL							;byte $D978, bit 3
	const EVENT_ROUTE_52_HIDDEN_SUPER_POTION						;byte $D978, bit 4
	const EVENT_MIKAN_ISLAND_HIDDEN_HYPER_POTION					;byte $D978, bit 5
	const EVENT_MANDARIN_NORTH_HIDDEN_SUPER_POTION					;byte $D978, bit 6
	const EVENT_SUNBURST_ISLAND_HIDDEN_IRON							;byte $D978, bit 7
	
	const EVENT_SUNBURST_ISLAND_HIDDEN_MOON_STONE					;byte $D979, bit 0
	const EVENT_ROUTE_55_HIDDEN_SOFT_SAND							;byte $D979, bit 1
	const EVENT_PINKAN_ISLAND_HIDDEN_LOVE_BALL						;byte $D979, bit 2
	const EVENT_PINKAN_ISLAND_HIDDEN_PINKAN_BERRY					;byte $D979, bit 3
	const EVENT_GRAPEFRUIT_RARE_CANDY								;byte $D979, bit 4
	const EVENT_MORO_ISLAND_HIDDEN_NUGGET							;byte $D979, bit 5
	const EVENT_ROUTE_55_HIDDEN_STARDUST							;byte $D979, bit 6
	const EVENT_ROUTE_55_HIDDEN_PEARL								;byte $D979, bit 7
	
	const EVENT_GRAPEFRUIT_LURE_BALL								;byte $D97A, bit 0
	const EVENT_GRAPEFRUIT_STARDUST									;byte $D97A, bit 1
	const EVENT_WRECKED_SHIP_HIDDEN_HYPER_POTION					;byte $D97A, bit 2
	const EVENT_WRECKED_SHIP_HIDDEN_RARE_CANDY						;byte $D97A, bit 3
	const EVENT_ROUTE_56_EAST_HIDDEN_HYPER_POTION					;byte $D97A, bit 4
	const EVENT_ROUTE_56_WEST_HIDDEN_ULTRA_BALL						;byte $D97A, bit 5
	const EVENT_ROUTE_49_HIDDEN_ULTRA_BALL							;byte $D97A, bit 6
	const EVENT_ROUTE_SUNBURST_ISLAND_HIDDEN_NUGGET					;byte $D97A, bit 7
	
	const EVENT_ROUTE_KINNOW_ISLAND_HIDDEN_PP_UP					;byte $D97B, bit 0
	const EVENT_HEART_SCALE_COVE_HIDDEN_HEART_SCALE_1				;byte $D97B, bit 1
	const EVENT_HEART_SCALE_COVE_HIDDEN_HEART_SCALE_2				;byte $D97B, bit 2
	const EVENT_HEART_SCALE_COVE_HIDDEN_HEART_SCALE_3				;byte $D97B, bit 3
	const EVENT_HEART_SCALE_COVE_HIDDEN_HEART_SCALE_4				;byte $D97B, bit 4
	const EVENT_HEART_SCALE_COVE_HIDDEN_HEART_SCALE_5				;byte $D97B, bit 5
	const EVENT_HEART_SCALE_COVE_HIDDEN_HEART_SCALE_6				;byte $D97B, bit 6
	const EVENT_ROUTE_64_HIDDEN_HEART_SCALE_1						;byte $D97B, bit 7
	
	const EVENT_ROUTE_64_HIDDEN_HEART_SCALE_2						;byte $D97C, bit 0
	const EVENT_ROUTE_64_HIDDEN_HEART_SCALE_3						;byte $D97C, bit 1
	const EVENT_ROUTE_64_HIDDEN_HEART_SCALE_4						;byte $D97C, bit 2
	const EVENT_BUTWAL_EAST_HIDDEN_FULL_RESTORE						;byte $D97C, bit 3
	const EVENT_BUTWAL_WEST_HIDDEN_ELIXIR							;byte $D97C, bit 4
	const EVENT_GAME_CORNER_HIDDEN_10_COINS							;byte $D97C, bit 5
	const EVENT_GAME_CORNER_HIDDEN_20_COINS							;byte $D97C, bit 6
	const EVENT_GAME_CORNER_HIDDEN_50_COINS							;byte $D97C, bit 7
	
	const EVENT_GAME_CORNER_HIDDEN_100_COINS						;byte $D97D, bit 0
	const EVENT_ROUTE_67_HIDDEN_GRAPEFRUIT							;byte $D97D, bit 1
	const EVENT_ROUTE_67_HIDDEN_MAX_REVIVE							;byte $D97D, bit 2
	const EVENT_RIND_ISLAND_HIDDEN_ETHER							;byte $D97D, bit 3
	const EVENT_RIND_ISLAND_HIDDEN_NUGGET							;byte $D97D, bit 4
	const EVENT_RIND_ISLAND_HIDDEN_LEFTOVERS						;byte $D97D, bit 5
	const EVENT_UNNAMED_ISLAND_3_HIDDEN_STAR_PIECE					;byte $D97D, bit 6
	const EVENT_UNNAMED_ISLAND_3_HIDDEN_HYPER_POTION				;byte $D97D, bit 7
	
	const EVENT_VICTORY_ROAD_F2_HIDDEN_TRADE_STONE					;byte $D97E, bit 0
	const EVENT_VICTORY_ROAD_EXIT_HIDDEN_NUGGET						;byte $D97E, bit 1
	const EVENT_VICTORY_ROAD_EXIT_HIDDEN_REVIVE						;byte $D97E, bit 2
	const EVENT_ROUTE_70_HIDDEN_PP_MAX								;byte $D97E, bit 3

;Sprite visibility: When these events are cleared, the sprite becomes visible; when set, the sprite is hidden.
;The map script command macros `disappear` and `appear` set/clear these flags and immediately apply the effect on visibility.
;The map script command macros `setevent` and `clearevent` set/clear these flags, and their effects will be seen when the map is reloaded.

;Items
	const EVENT_ROUTE_49_FRESH_WATER								;byte $D97E, bit 4
	const EVENT_TANGELO_ISLAND_RARE_CANDY							;byte $D97E, bit 5
	const EVENT_ROUTE_50_ANTIDOTE									;byte $D97E, bit 6
	const EVENT_ROUTE_51_POTION										;byte $D97E, bit 7
	
	const EVENT_ROUTE_51_POKE_BALL									;byte $D97F, bit 0
	const EVENT_TANGELO_JUNGLE_POISON_BARB							;byte $D97F, bit 1
	const EVENT_TANGELO_JUNGLE_SUPER_POTION							;byte $D97F, bit 2
	const EVENT_TANGELO_JUNGLE_ANTIDOTE								;byte $D97F, bit 3
	const EVENT_TANGELO_JUNGLE_ETHER								;byte $D97F, bit 4
	const EVENT_ROUTE_52_GREAT_BALL									;byte $D97F, bit 5
	const EVENT_ROUTE_52_REPEL										;byte $D97F, bit 6
	const EVENT_MIKAN_ISLAND_PP_UP									;byte $D97F, bit 7
	
	const EVENT_MIKAN_ISLAND_RARE_CANDY								;byte $D980, bit 0
	const EVENT_MANDARIN_NORTH_RARE_CANDY							;byte $D980, bit 1
	const EVENT_MANDARIN_NORTH_HM_CUT								;byte $D980, bit 2
	const EVENT_MANDARIN_UNDERGROUND_TM_THIEF						;byte $D980, bit 3
	const EVENT_SUNBURST_TM_SUNNY_DAY								;byte $D980, bit 4
	const EVENT_CRYSTAL_SHOP_TRADE_STONE							;byte $D980, bit 5
	const EVENT_CRYSTAL_CAVE_1F_CARBOS								;byte $D980, bit 6
	const EVENT_CRYSTAL_CAVE_1F_MYSTIC_WATER						;byte $D980, bit 7
	
	const EVENT_CRYSTAL_CAVE_B1_TM_DRAGON_TAIL						;byte $D981, bit 0
	const EVENT_ROUTE_55_MAX_REVIVE									;byte $D981, bit 1
	const EVENT_PINKAN_ISLAND_TM_BULLET_SEED						;byte $D981, bit 2
	const EVENT_PINKAN_ISLAND_REVIVE								;byte $D981, bit 3
	const EVENT_ROUTE_56_WEST_HP_UP									;byte $D981, bit 4
	const EVENT_ROUTE_56_WEST_ULTRA_BALL							;byte $D981, bit 5
	const EVENT_ROUTE_56_EAST_TM_DRAGONBREATH						;byte $D981, bit 6
	const EVENT_KINNOW_NUGGET										;byte $D981, bit 7
	
	const EVENT_ROUTE_57_HARD_STONE									;byte $D982, bit 0
	const EVENT_UNNAMED_ISLAND_1_TM_RETURN							;byte $D982, bit 1
	const EVENT_NAVEL_PEAK_ESCAPE_ROPE								;byte $D982, bit 2
	const EVENT_GRAPEFRUIT_ULTRA_BALL								;byte $D982, bit 3
	const EVENT_GRAPEFRUIT_PROTEIN									;byte $D982, bit 4
	const EVENT_ROUTE_53_LIGHT_BALL									;byte $D982, bit 5
	const EVENT_MORO_TM_FACADE										;byte $D982, bit 6
	const EVENT_ROUTE_60_ULTRA_BALL									;byte $D982, bit 7
	
	const EVENT_GOLDEN_ISLAND_AMULET_COIN							;byte $D983, bit 0
	const EVENT_GOLDEN_ISLAND_QUICK_CLAW							;byte $D983, bit 1
	const EVENT_TANGELO_PORT_REPEL									;byte $D983, bit 2
	const EVENT_ROUTE_55_WATER_PULSE								;byte $D983, bit 3
	const EVENT_ROUTE_55_NUGGET										;byte $D983, bit 4
	const EVENT_GRAPEFRUIT_HP_UP									;byte $D983, bit 5
	const EVENT_MURCOTT_ISLAND_RAIN_DANCE							;byte $D983, bit 6
	const EVENT_WRECKED_SHIP_TRADE_STONE							;byte $D983, bit 7
	
	const EVENT_WRECKED_SHIP_DIVE_BALL								;byte $D984, bit 0
	const EVENT_WRECKED_SHIP_TM_SHADOW_BALL							;byte $D984, bit 1
	const EVENT_ROUTE_62_X_SPCL_ATK									;byte $D984, bit 2
	const EVENT_ROUTE_62_TM_EARTHQUAKE								;byte $D984, bit 3
	const EVENT_ROUTE_62_BLACKGLASSES								;byte $D984, bit 4
	const EVENT_ROUTE_62_PP_UP										;byte $D984, bit 5
	const EVENT_TROVITOPOLIS_SEWER_SLUDGE_BOMB						;byte $D984, bit 6
	const EVENT_TROVITOPOLIS_SEWER_TRADE_STONE						;byte $D984, bit 7
	
	const EVENT_TROVITOPOLIS_SEWER_PROTEIN							;byte $D985, bit 0
	const EVENT_TROVITOPOLIS_SEWER_ESCAPE_ROPE						;byte $D985, bit 1
	const EVENT_ROUTE_60_SUPER_REPEL								;byte $D985, bit 2
	const EVENT_ROUTE_61_RARE_CANDY									;byte $D985, bit 3
	const EVENT_ROUTE_61_MAX_POTION									;byte $D985, bit 4
	const EVENT_ROUTE_61_MAX_ELIXER									;byte $D985, bit 5
	const EVENT_TROVITOPOLIS_MAX_REVIVE								;byte $D985, bit 6
	const EVENT_TROVITOPOLIS_RARE_CANDY								;byte $D985, bit 7
	
	const EVENT_TROVITOPOLIS_NUGGET									;byte $D986, bit 0
	const EVENT_TROVITOPOLIS_WATER_STONE							;byte $D986, bit 1
	const EVENT_MANDARIN_DESERT_SANDSTORM							;byte $D986, bit 2
	const EVENT_MANDARIN_DESERT_IRON								;byte $D986, bit 3
	const EVENT_MANDARIN_DESERT_SMOKE_BALL							;byte $D986, bit 4
	const EVENT_TROVITA_RARE_CANDY									;byte $D986, bit 5
	const EVENT_TROVITA_MAX_REVIVE									;byte $D986, bit 6
	const EVENT_TROVITA_FULL_RESTORE								;byte $D986, bit 7
	
	const EVENT_UNNAMED_ISLAND_2_FAST_BALL							;byte $D987, bit 0
	const EVENT_UNNAMED_ISLAND_2_PP_UP								;byte $D987, bit 1
	const EVENT_UNNAMED_ISLAND_2_TRADE_STONE						;byte $D987, bit 2
	const EVENT_VALENCIA_ISLAND_MAGNET								;byte $D987, bit 3
	const EVENT_ROUTE_49_POKEBALL									;byte $D987, bit 4
	const EVENT_ROUTE_49_POTION										;byte $D987, bit 5
	const EVENT_ROUTE_57_NORTH_MAX_REVIVE							;byte $D987, bit 6
	const EVENT_CLEOPATRA_ISLAND_HYPER_POTION						;byte $D987, bit 7
	
	const EVENT_CLEOPATRA_ISLAND_MAX_REPEL							;byte $D988, bit 0
	const EVENT_CLEOPATRA_ISLAND_ELIXER								;byte $D988, bit 1
	const EVENT_FUKUHARA_BF1_ULTRA_BALL								;byte $D988, bit 2
	const EVENT_FUKUHARA_BF1_MAX_ETHER								;byte $D988, bit 3
	const EVENT_FUKUHARA_BF1_REVIVE									;byte $D988, bit 4
	const EVENT_FUKUHARA_BF1_CARBOS									;byte $D988, bit 5
	const EVENT_FUKUHARA_BF2_SUPER_REPEL							;byte $D988, bit 6
	const EVENT_FUKUHARA_BF2_RARE_CANDY								;byte $D988, bit 7
	
	const EVENT_FUKUHARA_BF2_TRADE_STONE							;byte $D989, bit 0
	const EVENT_ROUTE_63_EAST_WEST_TM_IRON_TAIL						;byte $D989, bit 1
	const EVENT_ROUTE_63_EAST_WEST_FULL_HEAL						;byte $D989, bit 2
	const EVENT_ROUTE_63_NORTH_SOUTH_NUGGET							;byte $D989, bit 3
	const EVENT_ROUTE_63_NORTH_SOUTH_LEAF_STONE						;byte $D989, bit 4
	const EVENT_ASCORBIA_TM_DRAGON_PULSE							;byte $D989, bit 5
	const EVENT_ASCORBIA_MAX_REPEL									;byte $D989, bit 6
	const EVENT_ASCORBIA_POLKADOT_BOW								;byte $D989, bit 7
	
	const EVENT_HEART_SCALE_COVE_HEART_SCALE_1						;byte $D98A, bit 0
	const EVENT_HEART_SCALE_COVE_HEART_SCALE_2						;byte $D98A, bit 1
	const EVENT_ROUTE_64_ULTRA_BALL									;byte $D98A, bit 2
	const EVENT_ROUTE_65_PP_UP										;byte $D98A, bit 3
	const EVENT_BUTWAL_EAST_HYPER_POTION							;byte $D98A, bit 4
	const EVENT_BUTWAL_EAST_ZINC									;byte $D98A, bit 5
	const EVENT_BUTWAL_EAST_DIVE_BALL								;byte $D98A, bit 6
	const EVENT_MANDARIN_UNDERGROUND_SUPER_POTION					;byte $D98A, bit 7
	
	const EVENT_BUTWAL_WEST_PROTECT									;byte $D98B, bit 0
	const EVENT_BUTWAL_WEST_REVIVE									;byte $D98B, bit 1
	const EVENT_BUTWAL_WEST_MAX_POTION								;byte $D98B, bit 2
	const EVENT_ROUTE_66_EAST_WEST_PINK_BOW							;byte $D98B, bit 3
	const EVENT_ROUTE_66_EAST_WEST_LOCK_ON							;byte $D98B, bit 4
	const EVENT_ROUTE_66_NORTH_SOUTH_MAX_POTION						;byte $D98B, bit 5
	const EVENT_ROUTE_67_SEED_BOMB									;byte $D98B, bit 6
	const EVENT_ROUTE_67_PP_UP										;byte $D98B, bit 7
	
	const EVENT_ROUTE_67_FULL_RESTORE								;byte $D98C, bit 0
	const EVENT_ROUTE_67_UNDERWATER_DRAGON_FANG						;byte $D98C, bit 1
	const EVENT_ROUTE_67_UNDERWATER_ULTRA_BALL						;byte $D98C, bit 2
	const EVENT_ROUTE_67_UNDERWATER_MAX_POTION						;byte $D98C, bit 3
	const EVENT_ROUTE_67_UNDERWATER_ELIXIR							;byte $D98C, bit 4
	const EVENT_ROUTE_67_UNDERWATER_KINGS_ROCK						;byte $D98C, bit 5
	const EVENT_RIND_ISLAND_LURE_BALL								;byte $D98C, bit 6
	const EVENT_UNNAMED_ISLAND_AERIAL_ACE							;byte $D98C, bit 7
	
	const EVENT_UNNAMED_ISLAND_MAX_REVIVE							;byte $D98D, bit 0
	const EVENT_ROUTE_69_SOUTH_ULTRA_BALL							;byte $D98D, bit 1
	const EVENT_ROUTE_69_SOUTH_FULL_RESTORE							;byte $D98D, bit 2
	const EVENT_ROUTE_69_SOUTH_MAX_ETHER							;byte $D98D, bit 3
	const EVENT_ROUTE_69_DRAGON_PULSE								;byte $D98D, bit 4
	const EVENT_VICTORY_ROAD_F1_TRI_ATTACK							;byte $D98D, bit 5
	const EVENT_VICTORY_ROAD_F1_NUGGET								;byte $D98D, bit 6
	const EVENT_VICTORY_ROAD_F2_ELIXER								;byte $D98D, bit 7
	
	const EVENT_VICTORY_ROAD_F2_EVERSTONE							;byte $D98E, bit 0
	const EVENT_VICTORY_ROAD_F3_SHADOW_CLAW							;byte $D98E, bit 1
	const EVENT_VICTORY_ROAD_F3_ETHER								;byte $D98E, bit 2
	const EVENT_VICTORY_ROAD_F3_FULL_RESTORE						;byte $D98E, bit 3
	const EVENT_VICTORY_ROAD_EXIT_RARE_CANDY						;byte $D98E, bit 4
	const EVENT_VICTORY_ROAD_EXIT_PP_MAX							;byte $D98E, bit 5
	const EVENT_PUMMELO_ISLAND_PROTEIN								;byte $D98E, bit 6
	const EVENT_PUMMELO_ISLAND_RARE_CANDY							;byte $D98E, bit 7
	
	const EVENT_HALL_OF_FAME_MASTER_BALL							;byte $D98F, bit 0
	const EVENT_ROUTE_70_MAX_REPEL									;byte $D98F, bit 1
	const EVENT_ROUTE_70_MAX_REVIVE									;byte $D98F, bit 2
	const EVENT_ROUTE_71_TRADE_STONE								;byte $D98F, bit 3
	const EVENT_LIGHTNING_ISLAND_ELECTIRIZER						;byte $D98F, bit 4
	const EVENT_LIGHTNING_ISLAND_THUNDERSTONE						;byte $D98F, bit 5
	const EVENT_ICE_ISLAND_NEVERMELTICE								;byte $D98F, bit 6
	const EVENT_ICE_ISLAND_ICE_STONE								;byte $D98F, bit 7
	
	const EVENT_FIRE_ISLAND_FIRE_STONE								;byte $D990, bit 0
	const EVENT_FIRE_ISLAND_TRADE_STONE								;byte $D990, bit 1
	const EVENT_SHAMOUTI_BAY_TRADE_STONE							;byte $D990, bit 2
		
;Seashells
	const EVENT_DANNYS_HOUSE_SHELL_BOX								;byte $D990, bit 3

	const EVENT_NAVEL_ISLAND_SEASHELL								;byte $D990, bit 4
	const EVENT_TROVITA_ISLAND_SEASHELL								;byte $D990, bit 5
	const EVENT_SEVENGRAPEFRUITS_ISLAND_SEASHELL					;byte $D990, bit 6
	const EVENT_ROUTE_60_SEASHELL									;byte $D990, bit 7
	
	const EVENT_ROUTE_60_SEASHELL_2									;byte $D991, bit 0
	const EVENT_WRECKED_SHIP_SEASHELL								;byte $D991, bit 1
	const EVENT_CLEOPATRA_ISLAND_SEASHELL							;byte $D991, bit 2
	const EVENT_ROUTE_55_SEASHELL									;byte $D991, bit 3
	const EVENT_ROUTE_67_SEASHELL									;byte $D991, bit 4
	const EVENT_LIGHTNING_ISLAND_SEASHELL							;byte $D991, bit 5
	const EVENT_SHAMOUTI_BAY_SEASHELL								;byte $D991, bit 6

;People
	const EVENT_BULBASAUR_POKEBALL_IN_IVYS_LAB						;byte $D991, bit 7
	
	const EVENT_CHARMANDER_POKEBALL_IN_IVYS_LAB						;byte $D992, bit 0
	const EVENT_SQUIRTLE_POKEBALL_IN_IVYS_LAB						;byte $D992, bit 1
	const EVENT_DAYCARE_MAN_IN_DAYCARE								;byte $D992, bit 2
	const EVENT_DAYCARE_MAN_OUTSIDE									;byte $D992, bit 3
	const EVENT_DAYCARE_MON_1										;byte $D992, bit 4
	const EVENT_DAYCARE_MON_2										;byte $D992, bit 5
	const EVENT_MANDARIN_UNDERGROUND_BUTCH							;byte $D992, bit 6
	const EVENT_MANDARIN_UNDERGROUND_CASSIDY						;byte $D992, bit 7
	
	const EVENT_TANGELO_ISLAND_TRACEY								;byte $D993, bit 0
	const EVENT_TANGELO_ISLAND_LAPRAS								;byte $D993, bit 1
	const EVENT_ROUTE_56_TRACEY										;byte $D993, bit 2
	const EVENT_CRYSTAL_CAVE_1F_BROCK								;byte $D993, bit 3
	const EVENT_CRYSTAL_CAVE_B1_BROCK								;byte $D993, bit 4
	const EVENT_CRYSTAL_ONIX_DEFEATED								;byte $D993, bit 5
	const EVENT_UNNAMED_POKE_CENTER_MISTY							;byte $D993, bit 6
	const EVENT_MORO_TROPHY_FOUND									;byte $D993, bit 7
	
	const EVENT_MORO_TROPHY_MISSING									;byte $D994, bit 0
	const EVENT_TRACEY_TROVITOPOLIS_PORT							;byte $D994, bit 1
	const EVENT_LORELEI_AT_TRAINER_SCHOOL							;byte $D994, bit 2
	const EVENT_RED_ON_CLEOPATRA									;byte $D994, bit 3
	const EVENT_ROUTE_64_TRACEYCROSS								;byte $D994, bit 4
	const EVENT_BUTWAL_DIVER										;byte $D994, bit 5
	const EVENT_BUTWAL_DIVE_HM										;byte $D994, bit 6
	const EVENT_LUANA_HOTEL_LOBBY									;byte $D994, bit 7
	
	const EVENT_UNNAMED_ISLAND_POLITOED_1							;byte $D995, bit 0
	const EVENT_UNNAMED_ISLAND_POLITOED_2							;byte $D995, bit 1
	const EVENT_UNNAMED_ISLAND_POLITOED_3							;byte $D995, bit 2
	const EVENT_UNNAMED_ISLAND_GAVE_SALVEYO_WEED					;byte $D995, bit 3
	const EVENT_CROSS_ON_PUMMELO									;byte $D995, bit 4
	const EVENT_DRAKE_IN_HALL_OF_FAME								;byte $D995, bit 5
	const EVENT_PUMMELO_ISLAND_DRAKE_GIFT							;byte $D995, bit 6
	const EVENT_KINNOW_SHOWBOAT_JACE								;byte $D995, bit 7
	
	const EVENT_KINNOW_SHOWBOAT_KURT								;byte $D996, bit 0
	const EVENT_KINNOW_SHOWBOAT_KAT									;byte $D996, bit 1
	const EVENT_KINNOW_SHOWBOAT_ALICE								;byte $D996, bit 2
	const EVENT_PIRATES_DEFEATED_LAPRAS_FAMILY						;byte $D996, bit 3
	const EVENT_MELODY_AT_SHRINE									;byte $D996, bit 4
	const EVENT_ZAPDOS_APPEARS										;byte $D996, bit 5
	const EVENT_ARTICUNO_APPEARS									;byte $D996, bit 6
	const EVENT_MOLTRES_APPEARS										;byte $D996, bit 7
	
	const EVENT_LUGIA_APPEARS										;byte $D997, bit 0
	const EVENT_ICE_ISLAND_CAPTURE_RINGS							;byte $D997, bit 1
	const EVENT_AIRSHIP_BIRDS										;byte $D997, bit 2
		
;Adding new events here to mantain savegame compatibility
	const EVENT_MANDARIN_CAVE_KECLEON_FOUGHT						;byte $D997, bit 3
	const EVENT_SUNRAY_CAVE_1F_MARSHADOW_FOUGHT						;byte $D997, bit 4
	const EVENT_SUNRAY_CAVE_1F_CROSS_HS								;byte $D997, bit 5	;cross sprite hide/show flag
	const EVENT_MARSHADOW_HOOH_EVENT_STARTED						;byte $D997, bit 6
	const EVENT_CROSS_AT_ROUTE51									;byte $D997, bit 7
	
	const EVENT_ROUTE51_HO_OH_FOUGHT								;byte $D998, bit 0
	const EVENT_TANGELO_JUNGLE_MEW_FOUGHT							;byte $D998, bit 1
	const EVENT_VICTORY_ROAD_MEWTWO_FOUGHT							;byte $D998, bit 2
	const EVENT_TARROCO_CELEBI_FOUGHT								;byte $D998, bit 3
	const EVENT_SUNRAY_CAVE_1F_MARSHADOW_HS							;byte $D998, bit 4	;marshadow sprite hide/show flag
	const EVENT_GOT_RAINBOW_WING									;byte $D998, bit 5
	const EVENT_SHAMOUTI_QUEST_ENDED								;byte $D998, bit 6
	const EVENT_GOT_MASTER_ROD										;byte $D998, bit 7

	const EVENT_GOT_TYROGUE											;byte $D999, bit 0
	const EVENT_UNLOCKED_HEADBUTT									;byte $D999, bit 1

NUM_EVENTS EQU const_value
