FishGroups: ; 92488
	dbwwww 50 percent + 1, .Shore_Old,          .Shore_Good,          .Shore_Super,          .Shore_Master
	dbwwww 50 percent + 1, .Ocean_Old,          .Ocean_Good,          .Ocean_Super,          .Ocean_Master
	dbwwww 50 percent + 1, .Lake_Old,           .Lake_Good,           .Lake_Super,           .Lake_Master
	dbwwww 50 percent + 1, .Pond_Old,           .Pond_Good,           .Pond_Super,           .Pond_Master
	dbwwww 50 percent + 1, .Qwilfish_Old,       .Qwilfish_Good,       .Qwilfish_Super,       .Qwilfish_Master
	dbwwww 50 percent + 1, .Qwilfish_Swarm_Old, .Qwilfish_Swarm_Good, .Qwilfish_Swarm_Super, .Qwilfish_Swarm_Master

.Shore_Old: ; 924e3
	db  70 percent + 1, KRABBY,     10
	db  85 percent + 1, TENTACOOL,  10
	db 100 percent,     GOLDEEN,    10
.Shore_Good: ; 924ec
	db  35 percent,     TENTACOOL,  20
	db  70 percent,     KRABBY,     20
	db  90 percent + 1, KRABBY,     20
	db 100 percent,     USE_TIME,    0
.Shore_Super: ; 924f8
	db  40 percent,     KRABBY,     40
	db  70 percent,     USE_TIME,    1
	db  90 percent + 1, KRABBY,     40
	db 100 percent,     KINGLER,    40
.Shore_Master: ; 924f8
	db  40 percent,     KRABBY,     50
	db  70 percent,     USE_TIME,   12
	db  90 percent + 1, KRABBY,     50
	db 100 percent,     KINGLER,    50

.Ocean_Old: ; 92504
	db  70 percent + 1, KRABBY,     10
	db  85 percent + 1, SHELLDER,   10
	db 100 percent,     GOLDEEN,    10
.Ocean_Good: ; 9250d
	db  35 percent,     SHELLDER,   20
	db  70 percent,     TENTACOOL,  20
	db  90 percent + 1, CHINCHOU,   20
	db 100 percent,     USE_TIME,    2
.Ocean_Super: ; 92519
	db  40 percent,     CHINCHOU,   40
	db  70 percent,     USE_TIME,    3
	db  90 percent + 1, TENTACRUEL, 40
	db 100 percent,     LANTURN,    40
.Ocean_Master: ; 92519
	db  40 percent,     CHINCHOU,   40
	db  70 percent,     USE_TIME,    3
	db  90 percent + 1, TENTACRUEL, 40
	db 100 percent,     LANTURN,    40

.Lake_Old: ; 92525
	db  70 percent + 1, PSYDUCK,    10
	db  85 percent + 1, POLIWAG,    10
	db 100 percent,     GOLDEEN,    10
.Lake_Good: ; 9252e
	db  35 percent,     GOLDEEN,    20
	db  70 percent,     GOLDEEN,    20
	db  90 percent + 1, GOLDEEN,    20
	db 100 percent,     USE_TIME,    4
.Lake_Super: ; 9253a
	db  40 percent,     GOLDEEN,    40
	db  70 percent,     USE_TIME,    5
	db  90 percent + 1, GOLDEEN,    40
	db 100 percent,     SEAKING,    40
.Lake_Master: ; 9253a
	db  40 percent,     GOLDEEN,    40
	db  70 percent,     USE_TIME,    5
	db  90 percent + 1, GOLDEEN,    40
	db 100 percent,     SEAKING,    40

.Pond_Old: ; 92546
	db  70 percent + 1, GOLDEEN,    10
	db  85 percent + 1, POLIWAG,    10
	db 100 percent,     GOLDEEN,    10
.Pond_Good: ; 9254f
	db  35 percent,     MARILL,     20
	db  70 percent,     GOLDEEN,    20
	db  90 percent + 1, POLIWAG,    20
	db 100 percent,     USE_TIME,    6
.Pond_Super: ; 9255b
	db  40 percent,     POLIWAG,    40
	db  70 percent,     USE_TIME,    7
	db  90 percent + 1, GOLDEEN,    40
	db 100 percent,     POLIWAG,    40
.Pond_Master: ; 9255b
	db  40 percent,     POLIWAG,    40
	db  70 percent,     USE_TIME,    7
	db  90 percent + 1, GOLDEEN,    40
	db 100 percent,     POLIWAG,    40

.Qwilfish_Old: ; 9262d
	db  70 percent + 1, KRABBY,     10
	db  85 percent + 1, GOLDEEN,    10
	db 100 percent,     TENTACOOL,  10
.Qwilfish_Good: ; 92636
	db  35 percent,     GOLDEEN,    20
	db  70 percent,     TENTACOOL,  20
	db  90 percent + 1, TENTACOOL,  20
	db 100 percent,     USE_TIME,   10
.Qwilfish_Super: ; 92642
	db  40 percent,     TENTACOOL,  40
	db  70 percent,     USE_TIME,   11
	db  90 percent + 1, GOLDEEN,    40
	db 100 percent,     QWILFISH,   40
.Qwilfish_Master: ; 92642
	db  40 percent,     TENTACOOL,  40
	db  70 percent,     USE_TIME,   11
	db  90 percent + 1, GOLDEEN,    40
	db 100 percent,     QWILFISH,   40

.Qwilfish_Swarm_Old: ; 92588
	db  70 percent + 1, TENTACOOL,   5
	db  85 percent + 1, KRABBY,      5
	db 100 percent,     QWILFISH,    5
.Qwilfish_Swarm_Good: ; 92591
	db  35 percent,     GOLDEEN,    20
	db  70 percent,     QWILFISH,   20
	db  90 percent + 1, QWILFISH,   20
	db 100 percent,     USE_TIME,    8
.Qwilfish_Swarm_Super: ; 9259d
	db  40 percent,     QWILFISH,   40
	db  70 percent,     USE_TIME,    9
	db  90 percent + 1, QWILFISH,   40
	db 100 percent,     QWILFISH,   40
.Qwilfish_Swarm_Master: ; 9259d
	db  40 percent,     QWILFISH,   40
	db  70 percent,     USE_TIME,    9
	db  90 percent + 1, QWILFISH,   40
	db 100 percent,     QWILFISH,   40


TimeFishGroups: ; 9266f
	;  day              nite
	db CORSOLA,    20,  STARYU,     20
	db CORSOLA,    40,  STARYU,     40
	db SHELLDER,   20,  SHELLDER,   20
	db SHELLDER,   40,  SHELLDER,   40
	db GOLDEEN,    20,  GOLDEEN,    20
	db GOLDEEN,    40,  GOLDEEN,    40
	db POLIWAG,    20,  POLIWAG,    20
	db POLIWAG,    40,  POLIWAG,    40
	db QWILFISH,   20,  QWILFISH,   20
	db QWILFISH,   40,  QWILFISH,   40
	db TENTACOOL,  20,  TENTACOOL,  20
	db TENTACOOL,  40,  TENTACOOL,  40
	db CORSOLA,    50,  STARYU,     50
; 926c7
