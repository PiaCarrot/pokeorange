FishGroups: ; 92488
	dbwwww 50 percent + 1, .Shore_Old,          .Shore_Good,          .Shore_Super,          .Shore_Master
	dbwwww 50 percent + 1, .Ocean_Old,          .Ocean_Good,          .Ocean_Super,          .Ocean_Master
	dbwwww 50 percent + 1, .Sewer_Old,          .Sewer_Good,          .Sewer_Super,          .Sewer_Master
	dbwwww 50 percent + 1, .Pond_Old,           .Pond_Good,           .Pond_Super,           .Pond_Master
	dbwwww 50 percent + 1, .Contest_Old,        .Contest_Good,        .Contest_Super,        .Contest_Master
	dbwwww 50 percent + 1, .Rind_Old,           .Rind_Good,           .Rind_Super,           .Rind_Master

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
	db  40 percent,     KRABBY,     30
	db  70 percent,     USE_TIME,    1
	db  90 percent + 1, KRABBY,     30
	db 100 percent,     KINGLER,    30
.Shore_Master: ; 924f8
	db  40 percent,     KRABBY,     40
	db  70 percent,     USE_TIME,    2
	db  90 percent + 1, KINGLER,     40
	db 100 percent,     KRABBY,    40

.Ocean_Old: ; 92504
	db  70 percent + 1, KRABBY,     10
	db  85 percent + 1, SHELLDER,   10
	db 100 percent,     GOLDEEN,    10
.Ocean_Good: ; 9250d
	db  35 percent,     SHELLDER,   20
	db  70 percent,     TENTACOOL,  20
	db  90 percent + 1, CHINCHOU,   20
	db 100 percent,     USE_TIME,    3
.Ocean_Super: ; 92519
	db  40 percent,     CHINCHOU,   30
	db  70 percent,     USE_TIME,    4
	db  90 percent + 1, TENTACRUEL, 30
	db 100 percent,     LANTURN,    30
.Ocean_Master: ; 92519
	db  40 percent,     CHINCHOU,   40
	db  70 percent,     USE_TIME,    5
	db  90 percent + 1, TENTACRUEL, 40
	db 100 percent,     LANTURN,    40

.Sewer_Old: ; 92525
	db  70 percent + 1, GRIMER,     10
	db  85 percent + 1, POLIWAG,    10
	db 100 percent,     GOLDEEN,    10
.Sewer_Good: ; 9252e
	db  70 percent + 1, GRIMER,     20
	db  85 percent + 1, POLIWAG,    20
	db 100 percent,     GOLDEEN,    20
.Sewer_Super: ; 9253a
	db  70 percent + 1, MUK,        30
	db  85 percent + 1, POLIWHIRL,  30
	db 100 percent,     SEAKING,    30
.Sewer_Master: ; 9253a
	db  40 percent,     MUK,        40
	db  70 percent,     USE_TIME,   9
	db  90 percent + 1, GOLDEEN,    40
	db 100 percent,     SEAKING,    40

.Pond_Old: ; 92546
	db  70 percent + 1, GOLDEEN,    10
	db  85 percent + 1, POLIWAG,    10
	db 100 percent,     GOLDEEN,    10
.Pond_Good: ; 9254f
	db  35 percent,     MARILL,     20
	db  70 percent,     GOLDEEN,    20
	db 100 percent,     POLIWAG,    20
.Pond_Super: ; 9255b
	db  70 percent,     POLIWHIRL,  30
	db  90 percent + 1, SEAKING,    30
	db 100 percent,     MARILL,     30
.Pond_Master: ; 9255b
	db  70 percent,     AZUMARILL,  40
	db  90 percent + 1, SEAKING,    40
	db 100 percent,     POLIWHIRL,  40
	
.Contest_Old: ; 92504
	db  70 percent + 1, FINNEON,    10
	db  85 percent + 1, GOLDEEN,    10
	db 100 percent,     REMORAID,   10
.Contest_Good: ; 9250d
	db  35 percent,     USE_TIME,   10
	db  70 percent,     FINNEON,    20
	db  90 percent + 1, GOLDEEN,    20
	db 100 percent,     CHINCHOU,   20
.Contest_Super: ; 92519
	db  40 percent,     USE_TIME,   11
	db  70 percent,     LANTURN,    30
	db  90 percent + 1, LUMINEON,   30
	db 100 percent,     SEAKING,    30
.Contest_Master: ; 92519
	db  40 percent,     USE_TIME,   12
	db  70 percent,     LANTURN,    40
	db  90 percent + 1, LUMINEON,   40
	db 100 percent,     SEAKING,    40
	
.Rind_Old: ; 92504
	db  70 percent + 1, MAGIKARP,   10
	db  85 percent + 1, MAGIKARP,   10
	db 100 percent,     MAGIKARP,   10
.Rind_Good: ; 9250d
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     MAGIKARP,   20
	db  90 percent + 1, MAGIKARP,   20
	db 100 percent,     USE_TIME,    6
.Rind_Super: ; 92519
	db  40 percent,     MAGIKARP,   30
	db  70 percent,     USE_TIME,    7
	db  90 percent + 1, MAGIKARP,   30
	db 100 percent,     MAGIKARP,   30
.Rind_Master: ; 92519
	db  40 percent,     MAGIKARP,   40
	db  70 percent,     USE_TIME,    8
	db  90 percent + 1, MAGIKARP,   40
	db 100 percent,     MAGIKARP,   40

TimeFishGroups: ; 9266f
	;  day              nite
	db CORSOLA,    20,  STARYU,     20 ;Shore Good     0
	db CORSOLA,    30,  STARYU,     30 ;Shore Super    1
	db CORSOLA,    40,  STARYU,     40 ;Shore Master   2
	db MANTINE,    20,  HORSEA,     20 ;Ocean Good     3
	db MANTINE,    30,  SEADRA,     30 ;Ocean Super    4
	db MANTINE,    40,  SEADRA,     40 ;Ocean Master   5
	db GYARADOS,   20,  GYARADOS,   20 ;Rind Good      6
	db GYARADOS,   30,  GYARADOS,   30 ;Rind Super     7
	db GYARADOS,   40,  GYARADOS,   40 ;Rind Master    8
	db STUNFISK,   40,  STUNFISK,   40 ;Sewer Master   9
	db QWILFISH,   20,  QWILFISH,   20 ;Contest Good   10
	db QWILFISH,   30,  QWILFISH,   30 ;Contest Super  11
	db QWILFISH,   40,  QWILFISH,   40 ;Contest Master 12
; 926c7
