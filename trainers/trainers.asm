Trainers:

; All trainers follow a basic structure:
	; Name
		; String in format "TEXT@"
	; Type
		; 0: Level, species
		; 1: Level, species, moves
		; 2: Level, species, item
		; 3: Level, species, item, moves
	; Party
		; Up to six monsters following the data type
	; $ff

CissyGroup:
; ================================
; ================

	; CISSY (1)
	db "CISSY@"
	db 1 ; moves

	; party

	db 16, HORSEA
		db BUBBLE
		db WATER_GUN
		db SMOKESCREEN
		db BUBBLEBEAM

	db 17, WARTORTLE
		db RAPID_SPIN
		db WATER_GUN
		db BUBBLEBEAM
		db WITHDRAW

	db 15, TENTACOOL
		db POISON_STING
		db BUBBLEBEAM
		db ACID
		db CONSTRICT

	db $ff ; end

; ================
; ================================


DannyGroup:
; ================================
; ================
; ================================


RudyGroup:
; ================================
; ================
; ================================



LuanaGroup:
; ================================
; ================
; ================================


DrakeGroup:
; ================================
; ================
; ================================


TraceyGroup:
; ================================
; ================

	; TRACEY (1)
	db "TRACEY@"
	db 1 ; moves

	; party

	db 12, VENONAT
		db TACKLE
		db 0
		db 0
		db 0

	db 9, MARILL
		db BUBBLE
		db GROWL
		db TAIL_WHIP
		db 0

	db $ff ; end

; ================

	; TRACEY (2)
	db "TRACEY@"
	db 1 ; moves

	; party

	db 23, VENONAT
		db TACKLE
		db DISABLE
		db CONFUSION
		db POISONPOWDER

	db 24, MARILL
		db WATER_GUN
		db DEFENSE_CURL
		db TAIL_WHIP
		db BUBBLEBEAM

	db 23, DODUO
		db PECK
		db AGILITY
		db 0
		db 0

	db 22, FLAAFFY
		db THUNDERBOLT
		db THUNDER_WAVE
		db QUICK_ATTACK
		db DOUBLE_TEAM

	db $ff ; end

; ================
; ================================


BrockGroup:
; ================================
; ================

	; BROCK (1)
	db "BROCK@"
	db 0 ; moves

	; party

	db 19, GEODUDE
	db 22, VULPIX
	db 22, ONIX
	db 18, ZUBAT

	db $ff ; end

; ================
; ================================


MistyGroup:
; ================================
; ================
; ================================


LtSurgeGroup:
; ================================
; ================
; ================================


ErikaGroup:
; ================================
; ================
; ================================


KogaGroup:
; ================================
; ================
; ================================


SabrinaGroup:
; ================================
; ================
; ================================


BlaineGroup:
; ================================
; ================
; ================================


GiovanniGroup:
; ================================
; ================
; ================================


LoreleiGroup:
; ================================
; ================
; ================================


BrunoGroup:
; ================================
; ================
; ================================


AgathaGroup:
; ================================
; ================
; ================================


LanceGroup:
; ================================
; ================
; ================================


RedGroup:
; ================================
; ================
; ================================


BlueGroup:
; ================================
; ================
; ================================


GreenGroup:
; ================================
; ================
; ================================


YellowGroup:
; ================================
; ================
; ================================


CalGroup:
; ================================
; ================
; ================================


ButchGroup:
; ================================
; ================

	; EXECUTIVEM (1)
	db "BUTCH@"
	db 0 ; moves

	; party

	db 21, SHELLDER
	db 21, MANKEY

	db $ff ; end

; ================
; ================================


CassidyGroup:
; ================================
; ================

	; EXECUTIVEF (1)
	db "CASSIDY@"
	db 0 ; normal

	; party

	db 21, TENTACOOL
	db 20, DROWZEE
	db 20, RATICATE

	db $ff ; end

; ================
; ================================


CassidyButchGroup:
; ================================
; ================
; ================================


JamesGroup:
; ================================
; ================
; ================================


JessieGroup:
; ================================
; ================
; ================================



JessieJamesGroup:
; ================================
; ================
; ================================


MomGroup:
; ================================
; ================
; ================
; ================================


BillGroup:
; ================================
; ================
; ================
; ================================


ImakuniGroup:
; ================================
; ================
; ================
; ================================


LawrenceGroup:
; ================================
; ================
; ================
; ================================


ProfOakGroup:
; ================================
; ================
; ================
; ================================


ProfIvyGroup:
; ================================
; ================
; ================
; ================================


ProfAideGroup:
; ================================
; ================

	; PROF_AIDE (1)
	db "CHARITY@"
	db 0 ; normal

	; party
	db 7, RATTATA

	db $ff ; end

; ================
; ================================


NurseGroup:
; ================================
; ================
; ================================


OfficerGroup:
; ================================
; ================
; ================================


YoungsterGroup:
; ================================
; ================

	; YOUNGSTER (1)
	db "TOM@"
	db 0 ; normal

	; party
	db 8, SPEAROW
	db 7, EKANS

	db $ff ; end

; ================

	; YOUNGSTER (2)
	db "SAWYER@"
	db 0 ; normal

	; party
	db 8, POLIWAG
	db 8, PIDGEY

	db $ff ; end

; ================

	; YOUNGSTER (3)
	db "BOWIE@"
	db 0 ; normal

	; party
	db 9, TANGELA
	db 9, MEOWTH

	db $ff ; end

; ================

; YOUNGSTER (4)
	db "NESS@"
	db 0 ; normal

	; party
	db 9, WINGULL
	db 9, RATTATA
	db 9, PIKACHU

	db $ff ; end

; ================
; ================================


LassGroup:
; ================================
; ================

	; LASS (1)
	db "NICOLE@"
	db 0 ; normal

	; party
	db 11, MARILL
	db 11, STARYU

	db $ff ; end

; ================
; ================================


BeautyGroup:
; ================================
; ================
; ================
; ================================


BugCatcherGroup:
; ================================
; ================

	; BUG_CATCHER (1)
	db "EUGENE@"
	db 0 ; normal

	; party
	db 10, BUTTERFREE

	db $ff ; end

; ================

	; BUG_CATCHER (2)
	db "SAM@"
	db 0 ; normal

	; party
	db 10, BEEDRILL

	db $ff ; end

; ================

	; BUG_CATCHER (3)
	db "MIKE@"
	db 0 ; normal

	; party
	db 10, CATERPIE
	db 10, PARAS

	db $ff ; end

; ================

	; BUG_CATCHER (4)
	db "MUSHI@"
	db 0 ; normal

	; party
	db 11, PINSIR

	db $ff ; end

; ================

	; BUG_CATCHER (5)
	db "ALEX@"
	db 0 ; normal

	; party
	db 8, CATERPIE
	db 8, VENONAT
	db 8, WEEDLE
	db 8, PARAS

	db $ff ; end

; ================
; ================================


BugCatcherFGroup:
; ================================
; ================
; ================
; ================================


SwimmerMGroup:
; ================================
; ================

	; SWIMMERM (1)
	db "KOJURO@"
	db 0

	db 14, POLIWAG
	db 14, HORSEA

	db $ff ; end

; ================

	; SWIMMERM (2)
	db "YOUTA@"
	db 0 ; normal

	; party
	db 17, SHELLDER

	db $ff ; end

; ================

	; SWIMMERM (3)
	db "HAIRO@"
	db 0 ; normal

	; party
	db 16, WINGULL
	db 16, GOLDEEN

	db $ff ; end

; ================

	; SWIMMERM (4)
	db "DAISUKE@"
	db 0 ; normal

	; party
	db 18, CHINCHOU

	db $ff ; end

; ================

	; SWIMMERM (5)
	db "JUNPEI@"
	db 0 ; normal

	; party
	db 15, CORSOLA
	db 15, SQUIRTLE
	db 16, SLOWPOKE

	db $ff ; end

; ================

	; SWIMMERM (6)
	db "KOSUKE@"
	db 0 ; normal

	; party
	db 23, WAILMER
	db 23, WAILMER

	db $ff ; end

; ================

	; SWIMMERM (7)
	db "NAOYA@"
	db 0 ; normal

	; party
	db 25, CLOYSTER

	db $ff ; end

; ================

	; SWIMMERM (8)
	db "ATECAIN@"
	db 0 ; normal

	db 6, MAGIKARP
	db 6, MAGIKARP
	db 6, MAGIKARP
	db 6, MAGIKARP
	db 6, MAGIKARP
	db 6, MAGIKARP

	db $ff

; ================

	; SWIMMERM (9)
	db "THEO@"
	db 0 ; normal

	db 10, STARYU

	db $ff

; =================
; ================================


SwimmerFGroup:
; ================================
; ================

	; SWIMMERF (1)
	db "MARIA@"
	db 0 ; normal

	; party
	db 13, CORSOLA

	db $ff ; end

; ================

	; SWIMMERF (2)
	db "REINA@"
	db 0 ; normal

	; party
	db 18, STARYU

	db $ff ; end

; ================

	; SWIMMERF (3)
	db "UMIKO@"
	db 0 ; normal

	; party
	db 16, GOLDEEN
	db 16, GOLDEEN
	db 16, QWILFISH

	db $ff ; end

; ================

	; SWIMMERF (4)
	db "MAYUMI@"
	db 0

	db 22, CORSOLA
	db 22, SQUIRTLE
	db 22, POLIWAG

	db $ff ; end

; ================

	; SWIMMERF (5)
	db "YAEKO@"
	db 0 ; normal

	; party
	db 22, CHINCHOU
	db 22, CORSOLA
	db 22, STUNFISK
	db 22, CHINCHOU

	db $ff ; end

; ================

	; SWIMMERF (6)
	db "SAKAKO@"
	db 0 ; normal

	; party
	db 24, SHELLDER
	db 24, STARYU

	db $ff ; end

; ================

	; SWIMMERF (7)
	db "YUKA@"
	db 0 ; normal

	; party
	db 9, SHELLDER
	db 9, PSYDUCK

	db $ff ; end

; ================
; ================================


CamperGroup:
; ================================
; ================

	; CAMPER (1)
	db "SAMM@"
	db 0 ; normal

	; party
	db 10, MANKEY

	db $ff ; end

; ================
; ================================


PokemaniacGroup:
; ================================
; ================

	; POKEMANIAC (1)
	db "SHAWN@"
	db 0 ; normal

	; party
	db 23, RAICHU
	db 23, RHYHORN
	db 23, MACHOP

	db $ff ; end

; ================
; ================================


FisherGroup:
; ================================
; ================

	; FISHER (1)
	db "SOJIRO@"
	db 0 ; normal

	; party
	db 7, CHINCHOU
	db 7, TENTACOOL
	db 7, CORSOLA

	db $ff ; end

; ================

	; FISHER (2)
	db "FUGU@"
	db 0 ; normal

	; party
	db 10, QWILFISH

	db $ff ; end

; ================

	; FISHER (3)
	db "NAT PAGLE@"
	db 0 ; normal

	; party
	db 14, TENTACOOL
	db 14, MAGIKARP
	db 14, CHINCHOU

	db $ff ; end

; ================

	; FISHER (4)
	db "NOBU@"
	db 0 ; normal

	; party
	db 8, POLIWAG
	db 9, REMORAID

	db $ff ; end

; ================

	; FISHER (5)
	db "ISAO@"
	db 0 ; normal

	; party
	db 23, QWILFISH
	db 23, RELICANTH ; RELICANTH
	db 23, CHINCHOU

	db $ff ; end

; ================
; ================================


HikerGroup:
; ================================
; ================

	; HIKER (1)
	db "TEPPEI@"
	db 0 ; normal

	; party
	db 26, KABUTO

	db $ff ; end

; ================
; ================================


AthleteGroup:
; ================================
; ================

	; ATHLETE (1)
	db "HIDEKI@"
	db 0 ; normal

	; party
	db 22, DODUO
	db 22, LICKITUNG
	db 22, PONYTA

	db $ff ; end

; ================

	; ATHLETE (2)
	db "KAITO@"
	db 0 ; normal

	; party
	db 24, DODUO
	db 24, JOLTEON

	db $ff ; end

; ================
; ================================


SightseerMGroup:
; ================================
; ================

	; SIGHTSEERM (1)
	db "MICHIO@"
	db 0 ; normal

	; party
	db 24, KADABRA
	db 24, MACHOP

	db $ff ; end

; ================
; ================================


SightseerFGroup:
; ================================
; ================

	; SIGHTSEERF (1)
	db "ASAMI@"
	db 0 ; normal

	; party
	db 25, JIGGLYPUFF
	db 25, SPINDA
	db 24, SKIPLOOM

	db $ff ; end

; ================
; ================================


SchoolboyGroup:
; ================================
; ================
; ================
; ================================


BirdKeeperGroup:
; ================================
; ================
; ================
; ================================


CooltrainerMGroup:
; ================================
; ================
; ================
; ================================


CooltrainerFGroup:
; ================================
; ================
; ================
; ================================


GentlemanGroup:
; ================================
; ================
; ================
; ================================


TeacherGroup:
; ================================
; ================
; ================
; ================================


SailorGroup:
; ================================
; ================
; ================
; ================================


SuperNerdGroup:
; ================================
; ================
; ================
; ================================


GuitaristGroup:
; ================================
; ================
; ================
; ================================


BikerGroup:
; ================================
; ================
; ================
; ================================


FirebreatherGroup:
; ================================
; ================
; ================
; ================================


JugglerGroup:
; ================================
; ================
; ================
; ================================


BlackbeltGroup:
; ================================
; ================
; ================
; ================================


PsychicGroup:
; ================================
; ================
; ================
; ================================


PicnickerGroup:
; ================================
; ================
; ================
; ================================


SageGroup:
; ================================
; ================
; ================
; ================================


MediumGroup:
; ================================
; ================
; ================
; ================================

WaitressGroup:
; ================================
; ================

	; WAITRESS (1)
	db "SATOMI@"
	db 0 ; normal

	; party
	db 24, CLEFAIRY
	db 24, IVYSAUR
	db 24, POLIWHIRL

	db $ff ; end
	
	; WAITRESS (2)
	db "SAORI@"
	db 0 ; normal

	; party
	db 24, JIGGLYPUFF
	db 24, CHARMELEON
	db 24, PIKACHU

	db $ff ; end

	; WAITRESS (3)
	db "NAOMI@"
	db 0 ; normal

	; party
	db 24, SMOOCHUM
	db 24, WARTORTLE
	db 24, VULPIX

	db $ff ; end
	
	; WAITRESS (4)
	db "JUN@"
	db 0 ; normal

	; party
	db 23, EEVEE
	db 23, MAGBY
	db 23, ELEKID
	db 23, MUNCHLAX

	db $ff ; end
; ================
; ================================

PokefanMGroup:
; ================================
; ================
; ================
; ================================


PokefanFGroup:
; ================================
; ================
; ================
; ================================

