
; pokemon
const_value = 1
	const BULBASAUR
	const IVYSAUR
	const VENUSAUR
	const CHARMANDER
	const CHARMELEON
	const CHARIZARD
	const SQUIRTLE
	const WARTORTLE
	const BLASTOISE
	const CATERPIE
	const METAPOD
	const BUTTERFREE
	const WEEDLE
	const KAKUNA
	const BEEDRILL
	const PIDGEY
	const PIDGEOTTO
	const PIDGEOT
	const RATTATA
	const RATICATE
	const SPEAROW
	const FEAROW
	const EKANS
	const ARBOK
	const PIKACHU
	const RAICHU
	const SANDSHREW
	const SANDSLASH
	const NIDORAN_F
	const NIDORINA
	const NIDOQUEEN
	const NIDORAN_M
	const NIDORINO
	const NIDOKING
	const CLEFAIRY
	const CLEFABLE
	const VULPIX
	const NINETALES
	const JIGGLYPUFF
	const WIGGLYTUFF
	const ZUBAT
	const GOLBAT
	const ODDISH
	const GLOOM
	const VILEPLUME
	const PARAS
	const PARASECT
	const VENONAT
	const VENOMOTH
	const DIGLETT
	const DUGTRIO
	const MEOWTH
	const PERSIAN
	const PSYDUCK
	const GOLDUCK
	const MANKEY
	const PRIMEAPE
	const GROWLITHE
	const ARCANINE
	const POLIWAG
	const POLIWHIRL
	const POLIWRATH
	const ABRA
	const KADABRA
	const ALAKAZAM
	const MACHOP
	const MACHOKE
	const MACHAMP
	const BELLSPROUT
	const WEEPINBELL
	const VICTREEBEL
	const TENTACOOL
	const TENTACRUEL
	const GEODUDE
	const GRAVELER
	const GOLEM
	const PONYTA
	const RAPIDASH
	const SLOWPOKE
	const SLOWBRO
	const MAGNEMITE
	const MAGNETON
	const FARFETCH_D
	const DODUO
	const DODRIO
	const SEEL
	const DEWGONG
	const GRIMER
	const MUK
	const SHELLDER
	const CLOYSTER
	const GASTLY
	const HAUNTER
	const GENGAR
	const ONIX
	const DROWZEE
	const HYPNO
	const KRABBY
	const KINGLER
	const VOLTORB
	const ELECTRODE
	const EXEGGCUTE
	const EXEGGUTOR
	const CUBONE
	const MAROWAK
	const HITMONLEE
	const HITMONCHAN
	const LICKITUNG
	const KOFFING
	const WEEZING
	const RHYHORN
	const RHYDON
	const CHANSEY
	const TANGELA
	const KANGASKHAN
	const HORSEA
	const SEADRA
	const GOLDEEN
	const SEAKING
	const STARYU
	const STARMIE
	const MR__MIME
	const SCYTHER
	const JYNX
	const ELECTABUZZ
	const MAGMAR
	const PINSIR
	const TAUROS
	const MAGIKARP
	const GYARADOS
	const LAPRAS
	const DITTO
	const EEVEE
	const VAPOREON
	const JOLTEON
	const FLAREON
	const PORYGON
	const OMANYTE
	const OMASTAR
	const KABUTO
	const KABUTOPS
	const AERODACTYL
	const SNORLAX
	const ARTICUNO
	const ZAPDOS
	const MOLTRES
	const DRATINI
	const DRAGONAIR
	const DRAGONITE
	const MEWTWO
	const MEW
	const TROPIUS
	const KECLEON
	const CHATOT
	const PIKIPEK
	const TRUMBEAK
	const TOUCANNON
	const MUNCHLAX
	const ROCKRUFF
	const LYCANROC
	const WINGULL
	const PELIPPER
	const CHINGLING
	const CHIMECHO
	const SALANDIT
	const SALAZZLE
	const FINNEON
	const LUMINEON
	const CROBAT
	const CHINCHOU
	const LANTURN
	const PICHU
	const CLEFFA
	const IGGLYBUFF
	const TOGEPI
	const TOGETIC
	const TOGEKISS
	const AZURILL
	const MAREEP
	const FLAAFFY
	const AMPHAROS
	const BELLOSSOM
	const MARILL
	const AZUMARILL
	const MIME__JR
	const POLITOED
	const HOPPIP
	const SKIPLOOM
	const JUMPLUFF
	const STUNFISK
	const SUNKERN
	const SUNFLORA
	const LEAFEON
	const GLACEON
	const SYLVEON
	const ESPEON
	const UMBREON
	const RELICANTH
	const SLOWKING
	const MIMIKYU
	const SPINDA
	const SKRELP
	const DRAGALGE
	const TRAPINCH
	const VIBRAVA
	const FLYGON
	const TURTONATOR
	const STEELIX
	const WAILMER
	const WAILORD
	const QWILFISH
	const SCIZOR
	const SHUCKLE
	const MAREANIE
	const TOXAPEX
	const SANDYGAST
	const PALOSSAND
	const SLUGMA
	const MAGCARGO
	const CARVANHA
	const SHARPEDO
	const CORSOLA
	const REMORAID
	const OCTILLERY
	const MANTYKE
	const MANTINE
	const SKARMORY
	const MAGMORTAR
	const ELECTIVIRE
	const KINGDRA
	const PHANPY
	const DONPHAN
	const PORYGON2
	const PORYGON_Z
	const LICKILICKY
	const TYROGUE
	const HITMONTOP
	const SMOOCHUM
	const ELEKID
	const MAGBY
	const HAPPINY
	const BLISSEY
	const CUTIEFLY
	const RIBOMBEE
	const TANGROWTH
	const RHYPERIOR
	const MAGNEZONE
	const MARSHADOW
	const LUGIA
	const HO_OH
	const CELEBI
	const LATIAS
	const LATIOS

const_value = const_value + -1

NUM_POKEMON EQU const_value

EGG EQU 254


; pokemon structure in RAM
MON_SPECIES              EQUS "(PartyMon1Species - PartyMon1)"
MON_ITEM                 EQUS "(PartyMon1Item - PartyMon1)"
MON_MOVES                EQUS "(PartyMon1Moves - PartyMon1)"
MON_ID                   EQUS "(PartyMon1ID - PartyMon1)"
MON_EXP                  EQUS "(PartyMon1Exp - PartyMon1)"
MON_STAT_EXP             EQUS "(PartyMon1StatExp - PartyMon1)"
MON_HP_EXP               EQUS "(PartyMon1HPExp - PartyMon1)"
MON_ATK_EXP              EQUS "(PartyMon1AtkExp - PartyMon1)"
MON_DEF_EXP              EQUS "(PartyMon1DefExp - PartyMon1)"
MON_SPD_EXP              EQUS "(PartyMon1SpdExp - PartyMon1)"
MON_SPC_EXP              EQUS "(PartyMon1SpcExp - PartyMon1)"
MON_DVS                  EQUS "(PartyMon1DVs - PartyMon1)"
MON_PP                   EQUS "(PartyMon1PP - PartyMon1)"
MON_HAPPINESS            EQUS "(PartyMon1Happiness - PartyMon1)"
MON_PKRUS                EQUS "(PartyMon1PokerusStatus - PartyMon1)"
MON_PERSONALITY          EQUS "(PartyMon1Personality - PartyMon1)"
MON_GENDER               EQUS "(PartyMon1Gender - PartyMon1)"
MON_SHINY                EQUS "(PartyMon1Shiny - PartyMon1)"
MON_PINK                 EQUS "(PartyMon1Pink - PartyMon1)"
MON_FORM                 EQUS "(PartyMon1Form - PartyMon1)"
MON_CAUGHTDATA           EQUS "(PartyMon1CaughtData - PartyMon1)"
MON_CAUGHTGENDER         EQUS "(PartyMon1CaughtGender - PartyMon1)"
MON_CAUGHTLOCATION       EQUS "(PartyMon1CaughtLocation - PartyMon1)"
MON_LEVEL                EQUS "(PartyMon1Level - PartyMon1)"
MON_STATUS               EQUS "(PartyMon1Status - PartyMon1)"
MON_HP                   EQUS "(PartyMon1HP - PartyMon1)"
MON_MAXHP                EQUS "(PartyMon1MaxHP - PartyMon1)"
MON_ATK                  EQUS "(PartyMon1Attack - PartyMon1)"
MON_DEF                  EQUS "(PartyMon1Defense - PartyMon1)"
MON_SPD                  EQUS "(PartyMon1Speed - PartyMon1)"
MON_SAT                  EQUS "(PartyMon1SpclAtk - PartyMon1)"
MON_SDF                  EQUS "(PartyMon1SpclDef - PartyMon1)"
BOXMON_STRUCT_LENGTH     EQUS "(PartyMon1End - PartyMon1)"
PARTYMON_STRUCT_LENGTH   EQUS "(PartyMon1StatsEnd - PartyMon1)"

; apply to MON_PERSONALITY
GENDER_MASK  EQU %11110000 ;Actually PV_MASK, but only used for gender?
SHINY_MASK   EQU %00001000
PINK_MASK    EQU %00000100
FORM_MASK    EQU %00000011

MALE_MASK    EQU %11000000 ;//enforce male
FEMALE_MASK  EQU %00000000 ;//enforce female

const_value = 1
	const SPINDA_A_FORM
	const SPINDA_B_FORM
	const SPINDA_C_FORM
	const SPINDA_D_FORM
	const SPINDA_E_FORM
	const SPINDA_F_FORM
	const SPINDA_G_FORM
	const SPINDA_H_FORM
	const SPINDA_I_FORM
	const SPINDA_J_FORM
	const SPINDA_K_FORM
	const SPINDA_L_FORM
	const SPINDA_M_FORM
	const SPINDA_N_FORM
	const SPINDA_O_FORM
	const SPINDA_P_FORM
	const SPINDA_Q_FORM
	const SPINDA_R_FORM
	const SPINDA_S_FORM
	const SPINDA_T_FORM
	const SPINDA_U_FORM
	const SPINDA_V_FORM
	const SPINDA_W_FORM
	const SPINDA_X_FORM
	const SPINDA_Y_FORM
	const SPINDA_Z_FORM
NUM_SPINDA EQU const_value +- 1

SPINDA_A_DVS EQUS "$99, $db"
SPINDA_B_DVS EQUS "$9b, $9f"
SPINDA_C_DVS EQUS "$9b, $fb"
SPINDA_D_DVS EQUS "$9d, $bf"
SPINDA_E_DVS EQUS "$9f, $9b"
SPINDA_F_DVS EQUS "$9f, $df"
SPINDA_G_DVS EQUS "$b9, $bb"
SPINDA_H_DVS EQUS "$b9, $fe"
SPINDA_I_DVS EQUS "$bb, $db"
SPINDA_J_DVS EQUS "$bd, $9f"
SPINDA_K_DVS EQUS "$bd, $fb"
SPINDA_L_DVS EQUS "$bf, $bf"
SPINDA_M_DVS EQUS "$d9, $9b"
SPINDA_N_DVS EQUS "$d9, $df"
SPINDA_O_DVS EQUS "$db, $bb"
SPINDA_P_DVS EQUS "$db, $fe"
SPINDA_Q_DVS EQUS "$dd, $db"
SPINDA_R_DVS EQUS "$df, $9f"
SPINDA_S_DVS EQUS "$df, $fb"
SPINDA_T_DVS EQUS "$f9, $bf"
SPINDA_U_DVS EQUS "$fb, $9b"
SPINDA_V_DVS EQUS "$fb, $df"
SPINDA_W_DVS EQUS "$fd, $bb"
SPINDA_X_DVS EQUS "$fd, $fe"
SPINDA_Y_DVS EQUS "$fe, $db"
SPINDA_Z_DVS EQUS "$fe, $fe"

const_value = 1
	const MAGIKARP_PLAIN_FORM
	const MAGIKARP_SKELLY_FORM
	const MAGIKARP_CALICO1_FORM
	const MAGIKARP_CALICO2_FORM
	const MAGIKARP_CALICO3_FORM
	const MAGIKARP_TWO_TONE_FORM
	const MAGIKARP_ORCA_FORM
	const MAGIKARP_DAPPLES_FORM
	const MAGIKARP_TIGER_FORM
	const MAGIKARP_ZEBRA_FORM
	const MAGIKARP_STRIPE_FORM
	const MAGIKARP_BUBBLES_FORM
	const MAGIKARP_FOREHEAD_FORM
	const MAGIKARP_MASK_FORM
NUM_MAGIKARP EQU const_value +- 1

MAGIKARP_PLAIN_DVS    EQUS "$9b, $9d"
MAGIKARP_SKELLY_DVS   EQUS "$9d, $bb"
MAGIKARP_CALICO1_DVS  EQUS "$9f, $d9"
MAGIKARP_CALICO2_DVS  EQUS "$b9, $df"
MAGIKARP_CALICO3_DVS  EQUS "$bb, $fd"
MAGIKARP_TWO_TONE_DVS EQUS "$bf, $9b"
MAGIKARP_ORCA_DVS     EQUS "$d9, $b9"
MAGIKARP_DAPPLES_DVS  EQUS "$db, $bf"
MAGIKARP_TIGER_DVS    EQUS "$dd, $dd"
MAGIKARP_ZEBRA_DVS    EQUS "$df, $fb"
MAGIKARP_STRIPE_DVS   EQUS "$fb, $99"
MAGIKARP_BUBBLES_DVS  EQUS "$fd, $9f"
MAGIKARP_FOREHEAD_DVS EQUS "$fe, $bd"
MAGIKARP_MASK_DVS     EQUS "$fe, $fe"

const_value = 1
	const ONIX_NORMAL_FORM
	const ONIX_CRYSTAL_FORM

const_value = 1
	const STEELIX_NORMAL_FORM
	const STEELIX_CRYSTAL_FORM
	
const_value = 1
	const EXEGGUTOR_NORMAL_FORM
	const EXEGGUTOR_KANTONESE_FORM

const_value = 1
	const GRIMER_NORMAL_FORM
	const GRIMER_KANTONESE_FORM

const_value = 1
	const MUK_NORMAL_FORM
	const MUK_KANTONESE_FORM

const_value = 1
	const PERSIAN_NORMAL_FORM
	const PERSIAN_ALOLAN_FORM

const_value = 1
	const VULPIX_NORMAL_FORM
	const VULPIX_KANTONESE_FORM

const_value = 1
	const NINETALES_NORMAL_FORM
	const NINETALES_KANTONESE_FORM

const_value = 1
	const SANDSHREW_NORMAL_FORM
	const SANDSHREW_ALOLAN_FORM

const_value = 1
	const SANDSLASH_NORMAL_FORM
	const SANDSLASH_ALOLAN_FORM

const_value = 1
	const RATTATA_NORMAL_FORM
	const RATTATA_KANTONESE_FORM

const_value = 1
	const RATICATE_NORMAL_FORM
	const RATICATE_KANTONESE_FORM

const_value = 1
	const DIGLETT_NORMAL_FORM
	const DIGLETT_KANTONESE_FORM

const_value = 1
	const DUGTRIO_NORMAL_FORM
	const DUGTRIO_KANTONESE_FORM

const_value = 1
	const GEODUDE_NORMAL_FORM
	const GEODUDE_KANTONESE_FORM

const_value = 1
	const GRAVELER_NORMAL_FORM
	const GRAVELER_KANTONESE_FORM

const_value = 1
	const GOLEM_NORMAL_FORM
	const GOLEM_KANTONESE_FORM

const_value = 1
	const RAICHU_NORMAL_FORM
	const RAICHU_KANTONESE_FORM

const_value = 1
	const MAROWAK_NORMAL_FORM
	const MAROWAK_KANTONESE_FORM

const_value = 1
	const SQUIRTLE_NORMAL_FORM
	const SQUIRTLE_GLASSES_FORM

const_value = 1
	const MEOWTH_NORMAL_FORM
	const MEOWTH_ALOLAN_FORM
	const MEOWTH_ROCKET_FORM

const_value = 1
	const POLIWRATH_NORMAL_FORM
	const POLIWRATH_TAD_FORM

const_value = 1
	const LYCANROC_MIDDAY_FORM
	const LYCANROC_MIDNIGHT_FORM
	const LYCANROC_DUSK_FORM


; apply to MON_CAUGHTDATA
CAUGHTGENDER_MASK   EQU %10000000
CAUGHTLOCATION_MASK EQU %01111111

const_value = 1
	const MONMENU_CUT        ; 1
	const MONMENU_FLY        ; 2
	const MONMENU_SURF       ; 3
	const MONMENU_STRENGTH   ; 4
	const MONMENU_ROCKSMASH  ; 5
	const MONMENU_DIVE       ; 6
	const MONMENU_WATERFALL  ; 7
	const MONMENU_ROCK_CLIMB ; 8
	const MONMENU_FLASH      ; 9
	const MONMENU_WHIRLPOOL  ; 10
	const MONMENU_DIG        ; 11
	const MONMENU_TELEPORT   ; 12
	const MONMENU_SOFTBOILED ; 13
	const MONMENU_HEADBUTT   ; 14
	const MONMENU_SWEETSCENT ; 15

	const MONMENU_STATS      ; 16
	const MONMENU_SWITCH     ; 17
	const MONMENU_ITEM       ; 18
	const MONMENU_CANCEL     ; 19
	const MONMENU_MOVE       ; 20
	const MONMENU_MAIL       ; 21

MONMENU_FIELD_MOVE EQU 0
MONMENU_MENUOPTION EQU 1
