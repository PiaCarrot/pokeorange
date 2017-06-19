; trainer groups
	enum_start
CHRIS EQU __enum__
	trainerclass TRAINER_NONE ; 0

KRIS EQU __enum__
	trainerclass CISSY

	trainerclass DANNY

	trainerclass RUDY

	trainerclass LUANA

	trainerclass DRAKE

	trainerclass TRACEY

	trainerclass BROCK

	trainerclass MISTY

	trainerclass LT_SURGE

	trainerclass ERIKA

	trainerclass KOGA

	trainerclass SABRINA

	trainerclass BLAINE

	trainerclass GIOVANNI

	trainerclass LORELEI

	trainerclass BRUNO

	trainerclass AGATHA

	trainerclass LANCE

	trainerclass RED

	trainerclass BLUE

	trainerclass GREEN

	trainerclass YELLOW

	trainerclass CAL

	trainerclass BUTCH

	trainerclass CASSIDY

	trainerclass CASSIDY_BUTCH

	trainerclass JAMES

	trainerclass JESSIE

	trainerclass JESSIE_JAMES

	trainerclass MOM

	trainerclass BILL

	trainerclass IMAKUNI

	trainerclass LAWRENCE

	trainerclass PROF_OAK

	trainerclass PROF_IVY

	trainerclass PROF_AIDE
	const CHARITY
	const HOPE
	const FAITH

	trainerclass NURSE

	trainerclass OFFICER

	trainerclass YOUNGSTER
	const TOM
	const SAWYER
	const BOWIE
	const NESS

	trainerclass LASS
	const NICOLE

	trainerclass BEAUTY

	trainerclass BUG_CATCHER
	const EUGENE
	const SAM
	const MIKE
	const MUSHI
	const ALEX

	trainerclass BUG_CATCHER_F

	trainerclass SWIMMERM
	const KOJURO
	const YOUTA
	const HAIRO
	const DAISUKE
	const JUNPEI
	const KOSUKE
	const NAOYA
	const ATECAIN
	const THEO

	trainerclass SWIMMERF
	const MARIA
	const REINA
	const UMIKO
	const MAYUMI
	const YAEKO
	const SAKAKO
	const YUKA

	trainerclass CAMPER
	const SAMM

	trainerclass POKEMANIAC
	const SHAWN

	trainerclass FISHER
	const SOJIRO
	const FUGU
	const NAT_PAGLE
	const NOBU
	const ISAO

	trainerclass HIKER
	const TEPPEI

	trainerclass ATHLETE
	const HIDEKI
	const KAITO

	trainerclass SIGHTSEERM
	const MICHIO

	trainerclass SIGHTSEERF
	const ASAMI
	
	trainerclass WAITRESS
	const SATOMI
	const SAORI
	const NAOMI
	const JUN

;	trainerclass SCHOOLBOY

;	trainerclass BIRD_KEEPER

;	trainerclass COOLTRAINERM

;	trainerclass COOLTRAINERF

;	trainerclass GENTLEMAN

;	trainerclass TEACHER

;	trainerclass SAILOR

;	trainerclass SUPER_NERD

;	trainerclass GUITARIST

;	trainerclass BIKER

;	trainerclass FIREBREATHER

;	trainerclass JUGGLER

;	trainerclass BLACKBELT_T

;	trainerclass PSYCHIC_T

;	trainerclass PICNICKER

;	trainerclass SAGE

;	trainerclass MEDIUM

;	trainerclass POKEFANM

;	trainerclass POKEFANF

NUM_TRAINER_CLASSES EQU __enum__

	const_def
	const       NO_AI
const_value = 0
	shift_const AI_BASIC
	shift_const AI_SETUP
	shift_const AI_TYPES
	shift_const AI_OFFENSIVE
	shift_const AI_SMART
	shift_const AI_OPPORTUNIST
	shift_const AI_AGGRESSIVE
	shift_const AI_CAUTIOUS
	shift_const AI_STATUS
	shift_const AI_RISKY
	shift_const AI_10
	shift_const AI_11
	shift_const AI_12
	shift_const AI_13
	shift_const AI_14
	shift_const AI_15

	const_def
	const TRNATTR_ITEM1
	const TRNATTR_ITEM2
	const TRNATTR_BASEMONEY
	const TRNATTR_AI_MOVE_WEIGHTS
	const TRNATTR_AI2
	const TRNATTR_AI_ITEM_SWITCH
	const TRNATTR_AI4
NUM_TRAINER_ATTRIBUTES EQU const_value
