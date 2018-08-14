INCLUDE "includes.asm"


SECTION "Egg Moves", ROMX


INCLUDE "data/egg_move_pointers.asm"


EggMoves::

BulbasaurEggMoves:
	db LIGHT_SCREEN
	db SAFEGUARD
	db PETAL_DANCE
	db CURSE
	db AMNESIA
	db CHARM
	db GIGA_DRAIN
	db SLUDGE
	db SEED_BOMB
	db $ff

CharmanderEggMoves:
	db BELLY_DRUM
	db ANCIENTPOWER
	db ROCK_SLIDE
	db BITE
	db OUTRAGE
	db CRUNCH
	db DRAGON_PULSE
	db SLAM
	db $ff

SquirtleEggMoves:
	db MIRROR_COAT
	db HAZE
	db MIST
	db CONFUSION
	db FORESIGHT
	db FLAIL
	db DRAGON_PULSE
	db AURORA_BEAM
	db IRON_TAIL
	db $ff

PidgeyEggMoves:
	db PURSUIT
	db FAINT_ATTACK
	db FORESIGHT
	db STEEL_WING
	db AERIAL_ACE
	db PECK
	db WING_ATTACK
	db $ff

RattataEggMoves:
	db SCREECH
	db FLAME_WHEEL
	db FURY_SWIPES
	db BITE
	db COUNTER
	db REVERSAL
	db IRON_TAIL
	db ZEN_HEADBUTT
	db $ff

SpearowEggMoves:
	db FAINT_ATTACK
	db FALSE_SWIPE
	db SCARY_FACE
	db QUICK_ATTACK
	db TRI_ATTACK
	db $ff

EkansEggMoves:
	db PURSUIT
	db SLAM
	db CRUNCH
	db IRON_TAIL
	db SLUDGE
	db SEED_BOMB
	db $ff

SandshrewEggMoves:
	db FLAIL
	db SAFEGUARD
	db COUNTER
	db RAPID_SPIN
	db METAL_CLAW
	db ROCK_CLIMB
	db SUPER_FANG
	db IRON_TAIL
	db $ff

NidoranFEggMoves:
	db SUPERSONIC
	db DISABLE
	db TAKE_DOWN
	db FOCUS_ENERGY
	db CHARM
	db COUNTER
	db IRON_TAIL
	db SUPER_FANG
	db $ff

NidoranMEggMoves:
	db SUPERSONIC
	db DISABLE
	db TAKE_DOWN
	db CONFUSION
	db AMNESIA
	db COUNTER
	db IRON_TAIL
	db SUPER_FANG
	db $ff

VulpixEggMoves:
	db FAINT_ATTACK
	db HYPNOSIS
	db FLAIL
	db DISABLE
	db ICY_WIND
	db CONFUSION
	db $ff

ZubatEggMoves:
	db QUICK_ATTACK
	db PURSUIT
	db FAINT_ATTACK
	db GUST
	db GIGA_DRAIN
	db BUG_BITE
	db WHIRLWIND
	db $ff

OddishEggMoves:
	db SWORDS_DANCE
	db RAZOR_LEAF
	db FLAIL
	db SYNTHESIS
	db SLUDGE
	db SEED_BOMB
	db MOONLIGHT
	db $ff

ParasEggMoves:
	db FALSE_SWIPE
	db SCREECH
	db COUNTER
	db PSYBEAM
	db FLAIL
	db LIGHT_SCREEN
	db PURSUIT
	db BUG_BITE
	db $ff

VenonatEggMoves:
	db BATON_PASS
	db SCREECH
	db GIGA_DRAIN
	db CONFUSION
	db BUG_BITE
	db SLUDGE_BOMB
	db $ff

DiglettEggMoves:
	db FAINT_ATTACK
	db SCREECH
	db ANCIENTPOWER
	db PURSUIT
	db ROCK_SLIDE
	db METAL_CLAW
	db $ff

MeowthEggMoves:
	db CHARM
	db HYPNOSIS
	db AMNESIA
	db CRUNCH
	db SHADOW_CLAW
	db IRON_TAIL
	db WATER_PULSE
	db SEED_BOMB
	db ICY_WIND
	db DOUBLE_KICK
	db $ff

PsyduckEggMoves:
	db ICE_BEAM
	db HYPNOSIS
	db PSYBEAM
	db FORESIGHT
	db LIGHT_SCREEN
	db FUTURE_SIGHT
	db PSYCHIC_M
	db CROSS_CHOP
	db $ff

MankeyEggMoves:
	db ROCK_SLIDE
	db FORESIGHT
	db COUNTER
	db REVERSAL
	db OUTRAGE
	db MACH_PUNCH
	db $ff

GrowlitheEggMoves:
	db BODY_SLAM
	db SAFEGUARD
	db CRUNCH
	db THRASH
	db FIRE_SPIN
	db DOUBLE_KICK
	db IRON_TAIL
	db $ff

PoliwagEggMoves:
	db MIST
	db SPLASH
	db BUBBLEBEAM
	db HAZE
	db LOCK_ON ; MIND_READER
	db MUD_SLAP
	db ICY_WIND
	db ROLLOUT
	db $ff

AbraEggMoves:
	db LIGHT_SCREEN
	db ENCORE
	db BARRIER
	db CONFUSION
	db PSYBEAM
	db ICE_PUNCH
	db FIRE_PUNCH
	db THUNDERPUNCH
	db CONFUSE_RAY
	db $ff

MachopEggMoves:
	db LIGHT_SCREEN
	db ENCORE
	db FIRE_PUNCH
	db ICE_PUNCH
	db THUNDERPUNCH
	db MACH_PUNCH
	db KARATE_CHOP
	db POWERUPPUNCH
	db $ff

BellsproutEggMoves:
	db SWORDS_DANCE
	db ENCORE
	db REFLECT
	db SYNTHESIS
	db LEECH_LIFE
	db GIGA_DRAIN
	db BULLET_SEED
	db $ff

TentacoolEggMoves:
	db AURORA_BEAM
	db MIRROR_COAT
	db RAPID_SPIN
	db HAZE
	db SAFEGUARD
	db RECOVER
	db GIGA_DRAIN
	db CONFUSE_RAY
	db $ff

GeodudeEggMoves:
	db ROCK_SLIDE
	db SPARK
	db ROCK_CLIMB
	db DIG
	db FIRE_PUNCH
	db THUNDERPUNCH
	db $ff

PonytaEggMoves:
	db FLAME_WHEEL
	db THRASH
	db DOUBLE_KICK
	db HYPNOSIS
	db CHARM
	db MORNING_SUN
	db QUICK_ATTACK
	db $ff

SlowpokeEggMoves:
	db SAFEGUARD
	db BELLY_DRUM
	db FUTURE_SIGHT
	db STOMP
	db SLEEP_TALK
	db REST
	db PSYBEAM
	db $ff

FarfetchDEggMoves:
	db FORESIGHT
	db MIRROR_MOVE
	db GUST
	db QUICK_ATTACK
	db FLAIL
	db $ff

DoduoEggMoves:
	db QUICK_ATTACK
	db SUPERSONIC
	db HAZE
	db FAINT_ATTACK
	db FLAIL
	db STEEL_WING
	db $ff

SeelEggMoves:
	db LICK
	db PERISH_SONG
	db DISABLE
	db PECK
	db SLAM
	db ENCORE
	db IRON_TAIL
	db SIGNAL_BEAM
	db HORN_DRILL
	db WATER_PULSE
	db SLEEP_TALK
	db $ff

GrimerEggMoves:
	db HAZE
	db MEAN_LOOK
	db LICK
	db POWERUPPUNCH
	db CURSE
	db SHADOW_SNEAK
	db SHADOW_CLAW
	db CRUNCH
	db THIEF
	db $ff

ShellderEggMoves:
	db BUBBLEBEAM
	db TAKE_DOWN
	db BARRIER
	db ICY_WIND
	db RAPID_SPIN
	db CLAMP
	db AURORA_BEAM
	db SPIKE_CANNON
	db ROCK_BLAST
	db TWINEEDLE
	db OCTAZOOKA
	db $ff

GastlyEggMoves:
	db PERISH_SONG
	db HAZE
	db $ff

OnixEggMoves:
	db ROCK_SLIDE
	db FLAIL
	db $ff

DrowzeeEggMoves:
	db LIGHT_SCREEN
	db BARRIER
	db $ff

KrabbyEggMoves:
	db DIG
	db HAZE
	db AMNESIA
	db FLAIL
	db SLAM
	db $ff

ExeggcuteEggMoves:
	db SYNTHESIS
	db MOONLIGHT
	db REFLECT
	db ANCIENTPOWER
	db $ff

CuboneEggMoves:
	db ROCK_SLIDE
	db ANCIENTPOWER
	db BELLY_DRUM
	db SCREECH
	db PERISH_SONG
	db SWORDS_DANCE
	db $ff

LickitungEggMoves:
	db BELLY_DRUM
	db MAGNITUDE
	db BODY_SLAM
	db $ff

KoffingEggMoves:
	db SCREECH
	db PSYBEAM
	db DESTINY_BOND
	db $ff

RhyhornEggMoves:
	db CRUNCH
	db REVERSAL
	db ROCK_SLIDE
	db THRASH
	db PURSUIT
	db COUNTER
	db MAGNITUDE
	db $ff

ChanseyEggMoves:
	db METRONOME
	db HEAL_BELL
	db $ff

TangelaEggMoves:
	db FLAIL
	db CONFUSION
	db REFLECT
	db AMNESIA
	db $ff

KangaskhanEggMoves:
	db STOMP
	db FORESIGHT
	db FOCUS_ENERGY
	db SAFEGUARD
	db DISABLE
	db $ff

HorseaEggMoves:
	db FLAIL
	db AURORA_BEAM
	db OCTAZOOKA
	db DISABLE
	db SPLASH
	db DRAGON_RAGE
	db $ff

GoldeenEggMoves:
	db PSYBEAM
	db HAZE
	db HYDRO_PUMP
	db $ff

MrMimeEggMoves:
	db FUTURE_SIGHT
	db HYPNOSIS
	db MIMIC
	db $ff

ScytherEggMoves:
	db COUNTER
	db SAFEGUARD
	db BATON_PASS
	db REVERSAL
	db LIGHT_SCREEN
	db $ff

PinsirEggMoves:
	db FURY_ATTACK
	db FLAIL
	db $ff

LaprasEggMoves:
	db AURORA_BEAM
	db FORESIGHT
	db $ff

EeveeEggMoves:
	db FLAIL
	db CHARM
	db $ff

OmanyteEggMoves:
	db BUBBLEBEAM
	db AURORA_BEAM
	db SLAM
	db SUPERSONIC
	db HAZE
	db $ff

KabutoEggMoves:
	db BUBBLEBEAM
	db AURORA_BEAM
	db RAPID_SPIN
	db DIG
	db FLAIL
	db $ff

AerodactylEggMoves:
	db WHIRLWIND
	db PURSUIT
	db FORESIGHT
	db $ff

SnorlaxEggMoves:
	db LICK
	db $ff

DratiniEggMoves:
	db LIGHT_SCREEN
	db MIST
	db HAZE
	db SUPERSONIC
	db $ff

ChikoritaEggMoves:
	db VINE_WHIP
	db LEECH_SEED
	db COUNTER
	db ANCIENTPOWER
	db FLAIL
	db SWORDS_DANCE
	db $ff

CyndaquilEggMoves:
	db FURY_SWIPES
	db QUICK_ATTACK
	db REVERSAL
	db THRASH
	db FORESIGHT
	db SUBMISSION
	db $ff

TotodileEggMoves:
	db CRUNCH
	db THRASH
	db HYDRO_PUMP
	db ANCIENTPOWER
	db ROCK_SLIDE
	db $ff

SentretEggMoves:
	db DOUBLE_EDGE
	db PURSUIT
	db SLASH
	db FOCUS_ENERGY
	db REVERSAL
	db $ff

HoothootEggMoves:
	db MIRROR_MOVE
	db SUPERSONIC
	db FAINT_ATTACK
	db WING_ATTACK
	db WHIRLWIND
	db $ff

LedybaEggMoves:
	db PSYBEAM
	db LIGHT_SCREEN
	db $ff

SpinarakEggMoves:
	db PSYBEAM
	db DISABLE
	db SONICBOOM
	db BATON_PASS
	db PURSUIT
	db $ff

ChinchouEggMoves:
	db FLAIL
	db SUPERSONIC
	db SCREECH
	db $ff

PichuEggMoves:
	db REVERSAL
	db ENCORE
	db DOUBLESLAP
	db $ff

CleffaEggMoves:
	db METRONOME
	db AMNESIA
	db BELLY_DRUM
	db SPLASH
	db MIMIC
	db $ff

IgglybuffEggMoves:
	db PERISH_SONG
	db FAINT_ATTACK
	db $ff

TogepiEggMoves:
	db MIRROR_MOVE
	db PECK
	db FORESIGHT
	db FUTURE_SIGHT
	db $ff

NatuEggMoves:
	db HAZE
	db DRILL_PECK
	db QUICK_ATTACK
	db FAINT_ATTACK
	db STEEL_WING
	db $ff

MareepEggMoves:
	db THUNDERBOLT
	db TAKE_DOWN
	db BODY_SLAM
	db SAFEGUARD
	db SCREECH
	db REFLECT
	db $ff

MarillEggMoves:
	db LIGHT_SCREEN
	db AMNESIA
	db FUTURE_SIGHT
	db BELLY_DRUM
	db PERISH_SONG
	db SUPERSONIC
	db FORESIGHT
	db $ff

SudowoodoEggMoves:
	db SELFDESTRUCT
	db $ff

HoppipEggMoves:
	db CONFUSION
	db GROWL
	db ENCORE
	db DOUBLE_EDGE
	db REFLECT
	db AMNESIA
	db PAY_DAY
	db $ff

AipomEggMoves:
	db COUNTER
	db SCREECH
	db PURSUIT
	db AGILITY
	db SLAM
	db DOUBLESLAP
	db $ff

YanmaEggMoves:
	db WHIRLWIND
	db REVERSAL
	db LEECH_LIFE
	db $ff

WooperEggMoves:
	db BODY_SLAM
	db ANCIENTPOWER
	db SAFEGUARD
	db $ff

MurkrowEggMoves:
	db WHIRLWIND
	db DRILL_PECK
	db QUICK_ATTACK
	db MIRROR_MOVE
	db WING_ATTACK
	db $ff

MisdreavusEggMoves:
	db SCREECH
	db DESTINY_BOND
	db $ff

GirafarigEggMoves:
	db TAKE_DOWN
	db AMNESIA
	db FORESIGHT
	db FUTURE_SIGHT
	db $ff

PinecoEggMoves:
	db REFLECT
	db PIN_MISSILE
	db FLAIL
	db SWIFT
	db $ff

DunsparceEggMoves:
	db ANCIENTPOWER
	db ROCK_SLIDE
	db BITE
	db RAGE
	db $ff

GligarEggMoves:
	db METAL_CLAW
	db WING_ATTACK
	db COUNTER
	db $ff

SnubbullEggMoves:
	db METRONOME
	db FAINT_ATTACK
	db REFLECT
	db CRUNCH
	db HEAL_BELL
	db LICK
	db LEER
	db $ff

QwilfishEggMoves:
	db FLAIL
	db HAZE
	db BUBBLEBEAM
	db SUPERSONIC
	db $ff

ShuckleEggMoves:
	db SWEET_SCENT
	db $ff

HeracrossEggMoves:
	db HARDEN
	db FLAIL
	db $ff

SneaselEggMoves:
	db COUNTER
	db FORESIGHT
	db REFLECT
	db BITE
	db $ff

TeddiursaEggMoves:
	db CRUNCH
	db TAKE_DOWN
	db SEISMIC_TOSS
	db FOCUS_ENERGY
	db COUNTER
	db METAL_CLAW
	db $ff

SlugmaEggMoves:
	db ACID_ARMOR
	db $ff

SwinubEggMoves:
	db TAKE_DOWN
	db BITE
	db BODY_SLAM
	db ROCK_SLIDE
	db ANCIENTPOWER
	db $ff

CorsolaEggMoves:
	db ROCK_SLIDE
	db SAFEGUARD
	db SCREECH
	db MIST
	db AMNESIA
	db $ff

RemoraidEggMoves:
	db AURORA_BEAM
	db OCTAZOOKA
	db SUPERSONIC
	db HAZE
	db SCREECH
	db $ff

DelibirdEggMoves:
	db AURORA_BEAM
	db QUICK_ATTACK
	db FUTURE_SIGHT
	db SPLASH
	db RAPID_SPIN
	db $ff

MantineEggMoves:
	db HYDRO_PUMP
	db HAZE
	db SLAM
	db $ff

SkarmoryEggMoves:
	db DRILL_PECK
	db PURSUIT
	db WHIRLWIND
	db $ff

HoundourEggMoves:
	db FIRE_SPIN
	db RAGE
	db PURSUIT
	db COUNTER
	db REVERSAL
	db $ff

PhanpyEggMoves:
	db FOCUS_ENERGY
	db BODY_SLAM
	db ANCIENTPOWER
	db WATER_GUN
	db $ff

StantlerEggMoves:
	db REFLECT
	db DISABLE
	db LIGHT_SCREEN
	db BITE
	db $ff

TyrogueEggMoves:
	db RAPID_SPIN
	db HI_JUMP_KICK
	db MACH_PUNCH
	db $ff

SmoochumEggMoves:
	db NASTY_PLOT
	db $ff

ElekidEggMoves:
	db KARATE_CHOP
	db BARRIER
	db CROSS_CHOP
	db $ff

MagbyEggMoves:
	db KARATE_CHOP
	db BARRIER
	db SCREECH
	db CROSS_CHOP
	db $ff

MiltankEggMoves:
	db REVERSAL
	db SEISMIC_TOSS
	db $ff

LarvitarEggMoves:
	db PURSUIT
	db STOMP
	db OUTRAGE
	db FOCUS_ENERGY
	db ANCIENTPOWER
	db $ff

NoEggMoves:
	db $ff
