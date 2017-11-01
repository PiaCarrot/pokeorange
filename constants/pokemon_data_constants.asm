; growth rate
	const_def
	const MEDIUM_FAST
	const SLIGHTLY_FAST
	const SLIGHTLY_SLOW
	const MEDIUM_SLOW
	const FAST
	const SLOW

; gender ratio constants
ALL_MALE    EQU 0
FEMALE_12_5 EQU 31
FEMALE_25   EQU 63
FEMALE_50   EQU 127
FEMALE_75   EQU 191
ALL_FEMALE  EQU 254
GENDERLESS  EQU 255

; egg group constants
const_value SET 1
	const MONSTER      ; 1
	const AMPHIBIAN    ; 2
	const INSECT       ; 3
	const AVIAN        ; 4
	const FIELD        ; 5
	const FAIRYEGG     ; 6
	const PLANT        ; 7
	const HUMANSHAPE   ; 8
	const INVERTEBRATE ; 9
	const INANIMATE    ; a
	const AMORPHOUS    ; b
	const FISH         ; c
	const LADIES_MAN   ; d
	const REPTILE      ; e
	const NO_EGGS      ; f


; menu sprites
const_value SET 1
	const ICON_EGG
	
	const ICON_BULBASAUR
	const ICON_IVYSAUR
	const ICON_VENUSAUR
	const ICON_CHARMANDER
	const ICON_CHARMELEON
	const ICON_CHARIZARD
	const ICON_SQUIRTLE
	const ICON_WARTORTLE
	const ICON_BLASTOISE
	const ICON_CATERPIE
	const ICON_METAPOD
	const ICON_BUTTERFREE
	const ICON_WEEDLE
	const ICON_KAKUNA
	const ICON_BEEDRILL
	const ICON_PIDGEY
	const ICON_PIDGEOTTO
	const ICON_PIDGEOT
	const ICON_RATTATA
	const ICON_RATICATE
	const ICON_SPEAROW
	const ICON_FEAROW
	const ICON_EKANS
	const ICON_ARBOK
	const ICON_PIKACHU
	const ICON_RAICHU
	const ICON_SANDSHREW
	
	const ICON_LAPRAS
	
;gen2 

	const ICON_CROBAT
	const ICON_TOGETIC
	const ICON_QWILFISH
	const ICON_CORSOLA
	const ICON_REMORAID
;	const ICON_OCTILLERY
	const ICON_KINGDRA
	const ICON_SKARMORY
	const ICON_MANTINE
	const ICON_CHINCHOU
	const ICON_LANTURN
	
;gen 3
	const ICON_WINGULL
	const ICON_PELIPPER
	const ICON_AZURILL
	const ICON_CHIMECHO
	const ICON_KECLEON
	const ICON_TROPIUS
	const ICON_RELICANTH
	const ICON_WAILMER
	const ICON_WAILORD
	const ICON_CARVANHA
	const ICON_SHARPEDO

; evolution types
const_value SET 1
	const EVOLVE_LEVEL
	const EVOLVE_ITEM
	const EVOLVE_TRADE
	const EVOLVE_HAPPINESS
	const EVOLVE_STAT
	const EVOLVE_MAP
	const EVOLVE_MOVE
	const EVOLVE_FEMALE
	const EVOLVE_ALONGSIDE


BASE_HAPPINESS        EQU 70
FRIEND_BALL_HAPPINESS EQU 200

; happiness evolution triggers
HAPPINESS_TO_EVOLVE EQU 220
const_value SET 1
	const TR_ANYTIME
	const TR_MORNDAY
	const TR_NITE


; stat evolution triggers
const_value SET 1
	const ATK_GT_DEF
	const ATK_LT_DEF
	const ATK_EQ_DEF

NUM_GRASSMON EQU 7
NUM_WATERMON EQU 3

GRASS_WILDDATA_LENGTH EQU (NUM_GRASSMON * 2 + 1) * 3 + 2
WATER_WILDDATA_LENGTH EQU (NUM_WATERMON * 2 + 1) * 1 + 2
